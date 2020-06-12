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

        public ActionResult AddToCart(int? id)
        {
            if (User.Identity.IsAuthenticated)
            {
                if (User.IsInRole("Student"))
                {
                    var classdetails = db.Classes.Where(x => x.Class_ID == id).FirstOrDefault();
                    if (classdetails == null)
                    {
                        return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
                    }
                    var cart = this.Session["CartSession"] as Bill;
                    if (cart == null)
                    {
                        var hoadon = new Bill();
                        hoadon.Status = false;
                    }
                }
                else
                {
                    return RedirectToAction("Index", "Home");
                }
            }

            return RedirectToAction("Index", "Home");

        }
    }
}