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
            var userdetails = db.Users.Where(x => x.UserName == user.UserName && x.Password == user.Password && x.IsActive == true).FirstOrDefault();

            if (userdetails != null)
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

        public void Authencicate(User user)
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

                var isExistUserName = db.Users.FirstOrDefault(x => x.UserName == model.UserName);

                var isExistEmail = db.Users.FirstOrDefault(x => x.Email == model.Email);

                if (isExistUserName != null)
                {
                    ViewBag.Message = "Tên tài khoản đã tồn tại";
                    return View();
                }
                if (isExistEmail != null)
                {
                    ViewBag.Message = "Email này đã tồn tại";
                    return View();
                }


                User user = AccountBLL.Instance.CreateAccount(model);

                Authencicate(user);

                return RedirectToAction("RegisterSuccess");
            }
            return View();
        }

        public ActionResult Logout()
        {
            FormsAuthentication.SignOut();

            return RedirectToAction("Index", "Home");
        }

        public ActionResult RegisterSuccess()
        {
            return View();
        }
    }
}