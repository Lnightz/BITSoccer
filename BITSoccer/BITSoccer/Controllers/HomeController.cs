using BITSoccer.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PagedList;

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
        public ActionResult Classes(int? page)
        {
            var pageNumber = page ?? 1;
            var pageSize = 3;
            var classlist = db.Classes.OrderBy(x => x.CreatedDate).ToPagedList(pageNumber, pageSize);
            return View(classlist);
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