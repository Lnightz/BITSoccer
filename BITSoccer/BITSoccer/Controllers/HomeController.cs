using BITSoccer.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

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
        public ActionResult Classes()
        {
            return View(db.Classes.ToList());
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