using BITSoccer.BLL;
using BITSoccer.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;

namespace BITSoccer.Controllers
{
    public class StudentController : Controller
    {
        BITSoccerEntities db = new BITSoccerEntities();
        // GET: Student
        //Get Student Profile
        public ActionResult ProFile(string username)
        {
            if (User.Identity.IsAuthenticated)
            {
                if (username == null)
                {
                    return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
                }
                User user = db.Users.Where(x => x.UserName == username).FirstOrDefault();
                if (user == null)
                {
                    return HttpNotFound();
                }
                if (User.IsInRole("Student"))
                {
                    if (User.Identity.Name == user.UserName)
                    {
                        return View(user);
                    }
                    else
                    {
                        return RedirectToAction("Index", "Home");
                    }
                }
            }
            return RedirectToAction("Index", "Home");
        }
        //User thay đổi thông tin
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult ChangeProfile(User model)
        {
            if (ModelState.IsValid)
            {
                db.Users.Add(model);
                db.SaveChanges();
                return View("ProFile",model);
            }
            return View("ProFile",model);
        }

        //Lớp của học viên
        public ActionResult StudentClass(string username)
        {
            if (User.Identity.IsAuthenticated)
            {
                if (username == null)
                {
                    return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
                }
                User user = db.Users.Where(x => x.UserName == username).FirstOrDefault();
                if (user == null)
                {
                    return HttpNotFound();
                }
                if (User.IsInRole("Student"))
                {
                    if (User.Identity.Name == user.UserName)
                    {
                        return View(user);
                    }
                    else
                    {
                        return RedirectToAction("Index", "Home");
                    }
                }
            }
            return RedirectToAction("Index", "Home");
        }

        //Thêm lớp vào tài khoản -> Add to Cart
        public ActionResult AddClass(string username)
        {
            if (User.Identity.IsAuthenticated)
            {
                if (username == null)
                {
                    return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
                }
                User user = db.Users.Where(x => x.UserName == username).FirstOrDefault();
                if (user == null)
                {
                    return HttpNotFound();
                }
                if (User.IsInRole("Student"))
                {
                    if (User.Identity.Name == user.UserName)
                    {
                        return View(user);
                    }
                    else
                    {
                        return RedirectToAction("Index", "Home");
                    }
                }
            }
            return RedirectToAction("Index", "Home");
        }

        //Thanh Toán
        public ActionResult StudentPay(string username)
        {
            if (User.Identity.IsAuthenticated)
            {
                if (username == null)
                {
                    return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
                }
                User user = db.Users.Where(x => x.UserName == username).FirstOrDefault();
                if (user == null)
                {
                    return HttpNotFound();
                }
                if (User.IsInRole("Student"))
                {
                    if (User.Identity.Name == user.UserName)
                    {
                        return View(user);
                    }
                    else
                    {
                        return RedirectToAction("Index", "Home");
                    }
                }
            }
            return RedirectToAction("Index", "Home");
        }
    }
}