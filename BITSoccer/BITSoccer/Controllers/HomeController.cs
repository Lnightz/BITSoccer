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
        public ActionResult Classes(int? page, int? levelstudentid , string sortOrder = "date_desc")
        {
            ViewBag.LevelStudent = db.LevelStudents.OrderBy(x => x.LevelStudentID).ToList();
            ViewBag.LevelCoach = db.LevelCoaches.OrderBy(x => x.LevelCoachID).ToList();
            ViewBag.RangeAges = db.RangeAges.OrderBy(x => x.RangeAgeID).ToList();
            ViewBag.Gender = db.Genders.OrderBy(x => x.GenderID).ToList();
            ViewBag.RangeTimes = db.RangeTimes.OrderBy(x => x.StartTime).ToList();
            ViewBag.PartOfDay = db.PartOfDays.OrderBy(x => x.PartOfDayID).ToList();
            var pageNumber = page ?? 1;
            var pageSize = 3;
            if (levelstudentid != null)
            {
                ViewBag.levelstudentid = levelstudentid;
                var classlist = db.Classes.OrderByDescending(x => x.CreatedDate)
                                  .Where(x => x.LevelStudentID == levelstudentid)
                                  .ToPagedList(pageNumber, pageSize);
                return View(classlist);
            }
            else
            {
                var classlist = db.Classes.OrderBy(x => x.CreatedDate).ToPagedList(pageNumber, pageSize);
                return View(classlist);
            }
            
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

        //public ActionResult AddToCart()
        //{
        //    return View();
        //}
        



   
    }
}