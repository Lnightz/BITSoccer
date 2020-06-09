using BITSoccer.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

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
                //Session["UserID"] = userdetails.User_ID.ToString();
                //Session["UserName"] = userdetails.UserName.ToString();
                //Session["UserTypeID"] = userdetails.UserType_ID.ToString();


                ///Setup lưu cookies người dùng
                FormsAuthentication.SetAuthCookie(userdetails.UserName, false);

                var authTicket = new FormsAuthenticationTicket(1, 
                    userdetails.UserName, 
                    DateTime.Now, 
                    DateTime.Now.AddMinutes(30), 
                    false, 
                    userdetails.UserType.UserTypeName);

                string encryptedTicket = FormsAuthentication.Encrypt(authTicket);

                var authCookie = new HttpCookie(FormsAuthentication.FormsCookieName, encryptedTicket);

                HttpContext.Response.Cookies.Add(authCookie);

                return RedirectToAction("Index", "Home");
            }
            else
            {
                ModelState.AddModelError("Error", "Đăng nhập không thành công");
                return View();
            }
        }
        public ActionResult Logout()
        {
            string username = User.Identity.Name;

            //Session.Clear();

            FormsAuthentication.SignOut();

            return RedirectToAction("Index", "Home");
        }
    }
}