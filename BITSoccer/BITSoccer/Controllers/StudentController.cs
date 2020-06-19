using BITSoccer.BLL;
using BITSoccer.Models;
using PagedList;
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
            ViewBag.CountTotalClass = db.ClassUsers.Count(x => x.User.UserName == User.Identity.Name);

            userLogin = db.Users.Where(x => x.UserName == User.Identity.Name).FirstOrDefault();

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
        public ActionResult StudentClass(int? page, int CurrentFilter = 0)
        {

            if (User.IsInRole("Student"))
            {
                var haveclass = db.ClassUsers.Where(x => x.User.UserName == User.Identity.Name).ToList();
                var pageNumber = page ?? 1;
                var pageSize = 1;
                var today = DateTime.UtcNow;
                switch (CurrentFilter)
                {
                    case 1:
                        haveclass = haveclass.Where(x => x.Class.StartDay <= today && x.Class.EndDay >= today).OrderBy(x => x.Class.StartDay).ToList();
                        break;
                    case 2:
                        haveclass = haveclass.Where(x=> x.Class.StartDay > today).OrderBy(x => x.Class.StartDay).ToList();
                        break;
                    case 3:
                        haveclass = haveclass.Where(x=>x.Class.EndDay < today).OrderBy(x => x.Class.StartDay).ToList();
                        break;
                }

                ViewBag.CurrentFilter = CurrentFilter;

                ViewBag.StudentClass = haveclass.ToPagedList(pageNumber, pageSize);

                return View();
            }
            return RedirectToAction("Index", "Home");
        }
    }
}