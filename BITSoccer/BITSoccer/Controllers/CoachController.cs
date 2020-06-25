using BITSoccer.BLL;
using BITSoccer.Models;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;

namespace BITSoccer.Controllers
{
    [Authorize]
    public class CoachController : Controller
    {
        BITSoccerEntities db = new BITSoccerEntities();
        // GET: Coach
        public ActionResult Index()
        {
            var userlogin = db.Users.Where(x => x.UserName == User.Identity.Name).FirstOrDefault();

            var coachdetails = db.Coaches.Where(x => x.User_ID == userlogin.User_ID).FirstOrDefault();

            ViewBag.CountClass = db.Classes.Count(x => x.Coach_ID == coachdetails.Coach_ID);

            

            if (userlogin == null)
            {
                return HttpNotFound();
            }

            if (User.IsInRole("Teacher"))
            {
                ViewBag.Coach = coachdetails;
                return View();
            }

            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult ChangeCoachProfile(Coach model)
        {
            Coach coach = AccountBLL.Instance.ChangeCoachProfile(model);

            if (coach == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }

            ViewBag.Coach = db.Coaches.FirstOrDefault(x => x.Coach_ID == coach.Coach_ID);

            return View("Index");
        }

        public ActionResult CoachClass(int? page, int CurrentFilter = 0)
        {
            if (User.IsInRole("Teacher"))
            {
                var coachdetails = db.Coaches.FirstOrDefault(x => x.User.UserName == User.Identity.Name);
                var haveclass = db.Classes.Where(x => x.Coach_ID == coachdetails.Coach_ID).ToList();
                var pageNumber = page ?? 1;
                var pageSize = 1;
                var today = DateTime.Now;
                switch (CurrentFilter)
                {
                    case 1:
                        haveclass = haveclass.Where(x => x.StartDay <= today && x.EndDay >= today).OrderBy(x => x.StartDay).ToList();
                        break;
                    case 2:
                        haveclass = haveclass.Where(x => x.StartDay > today).OrderBy(x => x.StartDay).ToList();
                        break;
                    case 3:
                        haveclass = haveclass.Where(x => x.EndDay < today).OrderBy(x => x.StartDay).ToList();
                        break;
                }
                ViewBag.CurrentFilter = CurrentFilter;

                ViewBag.CoachClass = haveclass.ToPagedList(pageNumber, pageSize);

                return View();
            }
            return RedirectToAction("Index", "Home");
        }

        public ActionResult CoachClassDetails(int? id)
        {
            if (id == null)
            {
                return HttpNotFound();
            }
            var havestudent = db.ClassUsers.Where(x => x.ClassID == id).OrderBy(x=>x.User.CustomerName).ToList();   
            return View(havestudent);
        }
    }
}