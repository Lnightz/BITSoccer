using BITSoccer.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PagedList;
using System.Net;

namespace BITSoccer.Controllers
{
    public class HomeController : Controller
    {
        BITSoccerEntities db = new BITSoccerEntities();
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult About()
        {
            return View();
        }
        public ActionResult Classes(int? page)
        {
            var pageNumber = page ?? 1;
            var pageSize = 3;
            var classlist = db.Classes.OrderBy(x => x.CreatedDate).ToPagedList(pageNumber, pageSize);
            return View(classlist);
        }
        public ActionResult News()
        {
            return View();
        }
        public ActionResult Tournaments()
        {
            return View();
        }
        public ActionResult Coach()
        {
            return View(db.Coaches.ToList());
        }


        public ActionResult ClassDetails(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Class classes = db.Classes.Find(id);
            if (classes == null)
            {
                return HttpNotFound();
            }
            return View(classes);
        }

        //public ActionResult AddToCart()
        //{
        //    return View();
        //}
        public ActionResult AddToCart(int? id)
        {
            if (User.Identity.IsAuthenticated)
            {
                if (User.IsInRole("Student"))
                {
                    var userdetails = db.Users.Where(x => x.UserName == User.Identity.Name).FirstOrDefault();
                    ViewBag.UserDetails = userdetails;
                    if (id == null)
                    {
                        return View("Index");
                    }
                    var classdetails = db.Classes.Where(x => x.Class_ID == id).FirstOrDefault();
                    if (classdetails == null)
                    {
                        return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
                    }
                    var cart = Session["ClassCart"];

                    if (cart == null)
                    {
                        List<Cart> listcarts = new List<Cart>
                        {
                            new Cart(db.Users.Find(userdetails.User_ID),db.Classes.Find(id))
                        };
                        Session["ClassCart"] = listcarts;
                    }
                    else
                    {
                        List<Cart> listcarts = (List<Cart>)Session["ClassCart"];
                        int check = IsExstingCheck(id);
                        if (check == -1)
                        {
                            listcarts.Add(new Cart(db.Users.Find(userdetails.User_ID), db.Classes.Find(id)));
                        }
                    }
                    return View();
                }
                else
                {
                    return RedirectToAction("Index", "Home");
                }
            }

            return RedirectToAction("Index", "Home");
        }

        //Kiểm tra xem có tồn tại Cart trước đó không
        private int IsExstingCheck (int? id)
        {
            List<Cart> listcarts = (List<Cart>)Session["ClassCart"];
            for (int i = 0; i< listcarts.Count; i++)
            {
                if (listcarts[i].Class.Class_ID == id) return i;
            }
            return -1;
        }

        //Xoá lớp ra khỏi cart

        public ActionResult DeleteCart (int? id)
        {
            var userdetails = db.Users.Where(x => x.UserName == User.Identity.Name).FirstOrDefault();
            ViewBag.UserDetails = userdetails;
            if (id == null)
            {
                return new HttpStatusCodeResult(System.Net.HttpStatusCode.BadRequest);
            }
            int check = IsExstingCheck(id);
            List<Cart> listcarts = (List<Cart>)Session["ClassCart"];
            listcarts.RemoveAt(check);
            return View("AddToCart");
        }
    }
}