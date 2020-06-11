using BITSoccer.BLL;
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
                Authencicate(userdetails);

                return RedirectToAction("Index", "Home");
            }

            else

            {
                ViewBag.Message = "Sai tên tài khoản hoặc mật khẩu. Vui lòng nhập lại";
                return View();
            }
        }

        public void Authencicate (User user)
        {
            ///Setup lưu cookies người dùng
            FormsAuthentication.SetAuthCookie(user.UserName, false);

            var authTicket = new FormsAuthenticationTicket(1,
                user.UserName,
                DateTime.Now,
                DateTime.Now.AddMinutes(30),
                false,
                user.UserType.UserTypeName);

            string encryptedTicket = FormsAuthentication.Encrypt(authTicket);

            var authCookie = new HttpCookie(FormsAuthentication.FormsCookieName, encryptedTicket);

            HttpContext.Response.Cookies.Add(authCookie);
        }

        public ActionResult Register()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Register(UserModel model)
        {
            if (ModelState.IsValid)
            {
                if (!model.IsEqualPass)
                {
                    ViewBag.Message = "Mật khẩu nhập lại không đúng";
                    return View();
                }

                User user = AccountBLL.Instance.CreateAccount(model);

                var userdetails = db.Users.Any(x => x.UserName == model.UserName);

                if (userdetails != null)
                {
                    ViewBag.Message = "Tài khoản đã tồn tại";
                    return View();
                }
                else
                {
                    Authencicate(user);

                    return RedirectToAction("Index", "Home");

                }
            }
            return View();
        }

        public ActionResult Logout()
        {

            FormsAuthentication.SignOut();

            return RedirectToAction("Index", "Home");
        }
    }
}