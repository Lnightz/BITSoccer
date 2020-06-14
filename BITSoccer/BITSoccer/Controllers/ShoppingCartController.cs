using BITSoccer.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;

namespace BITSoccer.Controllers
{
    public class ShoppingCartController : Controller
    {
        BITSoccerEntities db = new BITSoccerEntities();

        [Authorize]
        // GET: ShoppingCart
        public ActionResult Index()
        {
            ViewBag.UserDetails = db.Users.Where(x => x.UserName == User.Identity.Name).FirstOrDefault();
            return View();
        }
        public ActionResult AddToCart(int? id)
        {
            if (User.IsInRole("Student"))
            {
                ViewBag.UserDetails = db.Users.Where(x => x.UserName == User.Identity.Name).FirstOrDefault();
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
                            new Cart(db.Classes.Find(id))
                        };
                    Session["ClassCart"] = listcarts;
                }
                else
                {
                    List<Cart> listcarts = (List<Cart>)Session["ClassCart"];
                    int check = IsExstingCheck(id);
                    if (check == -1)
                    {
                        listcarts.Add(new Cart(db.Classes.Find(id)));
                    }
                }
                return View("Index");
            }
            else
            {
                return RedirectToAction("Index", "Home");
            }
        }

        //Kiểm tra xem có tồn tại Cart trước đó không
        private int IsExstingCheck(int? id)
        {
            List<Cart> listcarts = (List<Cart>)Session["ClassCart"];
            for (int i = 0; i < listcarts.Count; i++)
            {
                if (listcarts[i].Class.Class_ID == id) return i;
            }
            return -1;
        }

        //Xoá lớp ra khỏi cart

        public ActionResult DeleteCart(int? id)
        {
            ViewBag.UserDetails = db.Users.Where(x => x.UserName == User.Identity.Name).FirstOrDefault();
            if (id == null)
            {
                return new HttpStatusCodeResult(System.Net.HttpStatusCode.BadRequest);
            }
            int check = IsExstingCheck(id);
            List<Cart> listcarts = (List<Cart>)Session["ClassCart"];
            listcarts.RemoveAt(check);
            return View("Index");
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult CheckOut(FormCollection model)
        {
            float discount = (float)Convert.ToDouble(model["Discount"]);
            float discountvalue = 1 - discount;
            var userdetails = db.Users.Where(x => x.UserName == User.Identity.Name).FirstOrDefault();
            List<Cart> listcarts = (List<Cart>)Session["ClassCart"];

            Bill bill = new Bill()
            {
                User_ID = userdetails.User_ID,
                Status = true,
                CreateDate = DateTime.Now,
                Total = Convert.ToDecimal(model["Total"]),
                Discount = Convert.ToDouble(discount),
                TotalPaid = Convert.ToDecimal(Convert.ToDouble(model["Total"]) * discountvalue),
                PayMethodID = (int)Convert.ToDouble(model["PayMethodID"])
            };
            db.Bills.Add(bill);
            if (db.SaveChanges() > 0)
            {
                foreach (Cart item in listcarts)
                {
                    BillDetail billDetail = new BillDetail()
                    {
                        BillID = bill.Bill_ID,
                        ClassID = item.Class.Class_ID,
                    };
                    db.BillDetails.Add(billDetail);
                    db.SaveChanges();

                    ClassUser classUser = new ClassUser()
                    {
                        ClassID = item.Class.Class_ID,
                        UserID =userdetails.User_ID,
                    };
                    db.ClassUsers.Add(classUser);
                    db.SaveChanges();
                }

                Session.Remove("ClassCart");
                return View("PaySuccess");
            }
            ViewBag.Message = "FAIL";
            return View("Index");
        }
    }
}