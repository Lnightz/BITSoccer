using BITSoccer.BLL;
using BITSoccer.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;

namespace BITSoccer.Controllers
{
    [Authorize]
    public class StudentController : Controller
    {
        BITSoccerEntities db = new BITSoccerEntities();
        // GET: Student
        //Get Student Profile

        private static User userLogin;

        public ActionResult ProFile()
        {
            string username = User.Identity.Name;

            userLogin = db.Users.Where(x => x.UserName == username).FirstOrDefault();

            if (userLogin == null)
            {
                return HttpNotFound();
            }

            if (User.IsInRole("Student"))
            {
                return View(userLogin);
            }

            return RedirectToAction("Index", "Home");
        }
        //User thay đổi thông tin
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult ChangeProfile(UserModel model)
        {
            if (ModelState.IsValid)
            {
                User user = AccountBLL.Instance.ChangeProfile(User.Identity.Name, model);

                ViewBag.Message = "PROFILESUCCESS";

                return View("ProFile", userLogin);
            }
            return View("ProFile", userLogin);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult ChangePassword(ChangePasswordModel model)
        {
            if (ModelState.IsValid)
            {
                if (!model.IsMatchNewPass)
                {
                    ViewBag.Message = "ReFAIL";
                    return View("ProFile", userLogin);
                }

                User user = AccountBLL.Instance.ChangePassword(User.Identity.Name, model);

                if (user == null)
                {
                    ViewBag.Message = "FAIL";
                    return View("ProFile", userLogin);
                }
                else
                {
                    ViewBag.Message = "SUCCESS";
                    return View("ProFile", userLogin);
                }
            }
            return View("ProFile", userLogin);
        }

        //Lớp của học viên
        public ActionResult StudentClass()
        {

            if (User.IsInRole("Student"))
            {
                ViewBag.StudentClass = db.ClassUsers.Where(x => x.User.UserName == User.Identity.Name).ToList();
                return View();
            }
            return RedirectToAction("Index", "Home");
        }
    }
}