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

            model = model.Where(x => x.IsActive == true);

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

            //ViewBag.ClassNameSort = sortOrder == "ClassName";
            //ViewBag.ClassDateCreateSort = sortOrder == "DateCreate" ? "DateCreateDesc" : "DateCreate";
            //ViewBag.ClassCostSort = sortOrder == "Prices" ? "PricesDesc" : "Prices";

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
        [HttpGet]
        public ActionResult News(int? page, int? newscateid, int? tagid , int? currentfilter, string sortOrder = "DateCreateDesc")
        {
            ViewBag.Category = db.News_Category.OrderBy(x=>x.NewCate_ID).ToList();
            ViewBag.Tag = db.Tags.OrderBy(x => x.TagName).ToList();

            ViewBag.NewsCateID = newscateid;

            var news = db.News.Where(x=> x.IsActive == true);

            if(newscateid == 0)
            {
                newscateid = null;
            }

            if (newscateid.HasValue)
            {
                news = news.Where(x => x.NewCate_ID == newscateid);
            }
            var pageNumber = page ?? 1;
            var pageSize = 3;

            //ViewBag.NewsNameSort = sortOrder == "NewsName";
            //ViewBag.NewsDateCreateSort = sortOrder == "DateCreate" ? "DateCreateDesc" : "DateCreate";

            switch (sortOrder)
            {
                case "NewsName":
                    news = news.OrderBy(x => x.Name);
                    break;
                case "DateCreate":
                    news = news.OrderBy(x => x.CreatedDate);
                    break;
                case "DateCreateDesc":
                    news = news.OrderByDescending(x => x.CreatedDate);
                    break;
            }

            return View(news.ToPagedList(pageNumber,pageSize));
        }

        public ActionResult NewsDetails(int? id, int? page)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            News news = db.News.Find(id);

            ViewBag.NewsDetails = news;

            ViewBag.UserDetails = db.Users.Where(x => x.UserName == User.Identity.Name).FirstOrDefault();

            var parentCommentFromNews = db.Comments.Where(x => x.RootCommentID == null && x.New_ID == id).OrderByDescending(x => x.PostDate).ToList();

            var pageNumber = page ?? 1;

            ViewBag.PageNumber = pageNumber;

            var pageSize = 2;

            ViewBag.PageSize = pageSize;

            ViewBag.AnotherNews = db.News.OrderByDescending(x => x.CreatedDate).Take(4).ToList();

            if (news == null)
            {
                return HttpNotFound();
            }

            return View(parentCommentFromNews.ToPagedList(pageNumber,pageSize));
        }

        [HttpGet]
        public ActionResult Tournaments(int? page, int? stadiumid, int? currentFilter = 0, string sortOrder = "DateCreateDesc")
        {
            ViewBag.ListStadium = db.Stadia.OrderBy(x => x.Stadium_ID).ToList();

            var tournaments = db.Touraments.AsQueryable();

            ViewBag.Stadium = stadiumid;
            ViewBag.CurrentFilter = currentFilter;

            DateTime today = DateTime.Today;

            switch (currentFilter)
            {
                case 1:
                    tournaments = tournaments.Where(x => x.Time == today);
                    break;
                case 2:
                    tournaments = tournaments.Where(x => x.Time > today);
                    break;
                case 3:
                    tournaments = tournaments.Where(x => x.Time < today);
                    break;
            }

            if (tournaments.Count() == 0)
            {
                ViewBag.Message = "Không có trận đấu nào trong thời gian này";
                return View();
            }

            if (stadiumid.HasValue)
            {
                tournaments = tournaments.Where(x => x.Stadium_ID == stadiumid);
            }


            //ViewBag.NewsDateCreateSort = sortOrder == "DateCreate" ? "DateCreateDesc" : "DateCreate";

            var pageNumber = page ?? 1;
            var pageSize = 3;

            switch (sortOrder)
            {
                case "DateCreate":
                    tournaments = tournaments.OrderBy(x => x.CreatedDate);
                    break;
                case "DateCreateDesc":
                    tournaments = tournaments.OrderByDescending(x => x.CreatedDate);
                    break;
            }

            return View(tournaments.ToPagedList(pageNumber,pageSize));
        }

        public ActionResult TournamentsDetails(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Tourament tourament = db.Touraments.Find(id);

            ViewBag.Tournament = tourament;

            if (tourament == null)
            {
                return HttpNotFound();
            }

            if (tourament.Time >= DateTime.Today)
            {
                ViewBag.Message = "Chưa có thông tin gì của trận đấu";
                return View();
            }

            return View(tourament);
        }

        public ActionResult Coach()
        {
            return View(db.Coaches.ToList());
        }
    }
}