using BITSoccer.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BITSoccer.Controllers
{
    public class PartialController : Controller
    {
        BITSoccerEntities db = new BITSoccerEntities();
        // GET: Partial
        public PartialViewResult HomeSlide()
        {
            var slide = db.Home_Slide.Where(x=> x.IsActive == true).OrderBy(x => x.DisplayOrder).ToList();
            return PartialView(slide);
        }

        public PartialViewResult CoachMoment()
        {
            var coachmoment = db.Coach_Moment.OrderBy(x => x.Coach_Moment_ID).ToList();
            return PartialView(coachmoment);
        }

        public PartialViewResult Stadium()
        {
            var stadium = db.Stadia.OrderBy(x=>x.Name).ToList();
            return PartialView(stadium);
        }

        public PartialViewResult Tourament()
        {
            var toura = db.Touraments.OrderByDescending(x => x.Time).First();
            return PartialView(toura);
        }
        public PartialViewResult Archive()
        {
            return PartialView(db.Archives.OrderBy(x=>x.Name).ToList());
        }

        public PartialViewResult HotClass()
        {
            return PartialView();
        }

        public PartialViewResult Footer()
        {
            return PartialView(db.Footers.First());
        }

        public PartialViewResult About()
        {
            return PartialView(db.Abouts.First());
        }

        public PartialViewResult AboutSlide()
        {
            return PartialView(db.About_Slide.Where(x=>x.AboutID == 1).ToList());
        }
    }
}