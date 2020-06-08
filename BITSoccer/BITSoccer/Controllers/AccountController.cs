using BITSoccer.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BITSoccer.Controllers
{
    public class AccountController : Controller
    {
        BITSoccerEntities db = new BITSoccerEntities();
        // GET: Account
        public ActionResult Login()
        {
            return View();
        }

        //Login
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Login(User user)
        {
            var userdetails = db.Users.Where(x => x.UserName == user.UserName && x.Password == user.Password).FirstOrDefault();

            if(userdetails != null)
            {
                Session["UserID"] = userdetails.User_ID.ToString();
                Session["UserName"] = userdetails.UserName.ToString();
                Session["UserTypeID"] = userdetails.UserType_ID.ToString();
                return RedirectToAction("Index", "Home");
            }
            else
            {
                ViewBag.Message = "Đăng nhập không thành công";
                return View(ViewBag.Message);
            }
        }
        public ActionResult Logout()
        {
            Session.Clear();
            return RedirectToAction("Index", "Home");
        }
    }
}