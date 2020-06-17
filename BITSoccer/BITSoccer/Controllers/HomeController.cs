using BITSoccer.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PagedList;
using System.Net;
using BITSoccer.BLL;
using System.Data.Entity;

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

        [HttpGet]
        public ActionResult Classes(int? page, int? lvlstd , int? lvlcoach , int? rtimeid , int?genderid , int?podid, int? rageid  , string sortOrder = "DateCreateDesc")
        {
            ViewBag.LevelStudent = db.LevelStudents.OrderBy(x => x.LevelStudentID).ToList();
            ViewBag.LevelCoach = db.LevelCoaches.OrderBy(x => x.LevelCoachID).ToList();
            ViewBag.RangeAges = db.RangeAges.OrderBy(x => x.RangeAgeID).ToList();
            ViewBag.Gender = db.Genders.OrderBy(x => x.GenderID).ToList();
            ViewBag.RangeTimes = db.RangeTimes.OrderBy(x => x.StartTime).ToList();
            ViewBag.PartOfDay = db.PartOfDays.OrderBy(x => x.PartOfDayID).ToList();

            var model = db.Classes.AsQueryable();
            var result = db.Classes.Include(c => c.LevelStudent).Include(c => c.Coach.LevelCoach).Include(c => c.RangeAge).Include(c => c.RangeTime).Include(c => c.Gender).Include(c => c.PartOfDay);

            ViewBag.LvlStdID = lvlstd;
            ViewBag.LvlCoachID = lvlcoach;
            ViewBag.RTID = rtimeid;
            ViewBag.RAID = rageid;
            ViewBag.GenderID = genderid;
            ViewBag.PODID = podid;

            if (lvlstd.HasValue)
            {
                model = model.Where(x => x.LevelStudentID == lvlstd);
            }
            if (lvlcoach.HasValue)
            {
                model = model.Where(x => x.Coach.LevelCoach.LevelCoachID == lvlcoach);
            }
            if (rtimeid.HasValue)
            {
                model = model.Where(x => x.RangeTimeID == rtimeid);
            }
            if (rageid.HasValue)
            {
                model = model.Where(x => x.RangeAgeID == rageid);
            }
            if (genderid.HasValue)
            {
                model = model.Where(x => x.GenderID == genderid);
            }
            if (podid.HasValue)
            {
                model = model.Where(x => x.PartOfDayID == podid);
            }

            ViewBag.ClassNameSort = sortOrder == "ClassName";
            ViewBag.ClassDateCreateSort = sortOrder == "DateCreate" ? "DateCreateDesc" : "DateCreate";
            ViewBag.ClassCostSort = sortOrder == "Prices" ? "PricesDesc" : "Prices";

            var pageNumber = page ?? 1;
            var pageSize = 3;

            switch (sortOrder)
            {
                case "ClassName":
                    model = model.OrderBy(x => x.Name);
                    break;
                case "DateCreate":
                    model = model.OrderBy(x => x.CreatedDate);
                    break;
                case "DateCreateDesc":
                    model = model.OrderByDescending(x => x.CreatedDate);
                    break;
                case "Prices":
                    model = model.OrderBy(x => x.PromoPrices);
                    break;
                case "PricesDesc":
                    model = model.OrderByDescending(x => x.PromoPrices);
                    break;
            }

            return View(model.ToPagedList(pageNumber, pageSize));
            
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
    }
}