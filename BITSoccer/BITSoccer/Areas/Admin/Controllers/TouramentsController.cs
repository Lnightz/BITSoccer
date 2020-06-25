using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using BITSoccer.Models;

namespace BITSoccer.Areas.Admin.Controllers
{
    public class TouramentsController : Controller
    {
        private BITSoccerEntities db = new BITSoccerEntities();

        // GET: Admin/Touraments
        public ActionResult Index()
        {
            var touraments = db.Touraments.Include(t => t.Stadium);
            return View(touraments.ToList());
        }

        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Tourament tourament = db.Touraments.Find(id);
            if (tourament == null)
            {
                return HttpNotFound();
            }
            return View(tourament);
        }

        // GET: Admin/Touraments/Create
        public ActionResult Create()
        {
            ViewBag.Stadium_ID = new SelectList(db.Stadia, "Stadium_ID", "Name");
            return View();
        }

        // POST: Admin/Touraments/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Tour_ID,CreatedDate,CreaedBy,IsActive,Team_A,Team_B,Team_A_Score,Team_B_Score,Time,Stadium_ID,Team_A_Player,Team_B_Player,TeamARedCard,TeamAYellowCart,TeamAFouls_Conceded,TeamBRedCard,TeamBYellowCart,TeamBFouls_Conceded,TeamAFormation,TeamBFormation")] Tourament tourament)
        {
            if (ModelState.IsValid)
            {
                db.Touraments.Add(tourament);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.Stadium_ID = new SelectList(db.Stadia, "Stadium_ID", "Name", tourament.Stadium_ID);
            return View(tourament);
        }

        [HttpGet]
        // GET: Admin/Touraments/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Tourament tourament = db.Touraments.Find(id);
            if (tourament == null)
            {
                return HttpNotFound();
            }
            ViewBag.Stadium_ID = new SelectList(db.Stadia, "Stadium_ID", "Name", tourament.Stadium_ID);
            return View(tourament);
        }

        // POST: Admin/Touraments/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Tour_ID,CreatedDate,CreaedBy,ModifyDate,ModifyBy,IsActive,Team_A,Team_B,Team_A_Score,Team_B_Score,Time,Stadium_ID,Team_A_Player,Team_B_Player,TeamARedCard,TeamAYellowCart,TeamAFouls_Conceded,TeamBRedCard,TeamBYellowCart,TeamBFouls_Conceded,TeamAFormation,TeamBFormation")] Tourament tourament)
        {
            if (ModelState.IsValid)
            {
                db.Entry(tourament).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.Stadium_ID = new SelectList(db.Stadia, "Stadium_ID", "Name", tourament.Stadium_ID);
            return View(tourament);
        }

        // POST: Admin/Touraments/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Tourament tourament = db.Touraments.Find(id);
            db.Touraments.Remove(tourament);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
