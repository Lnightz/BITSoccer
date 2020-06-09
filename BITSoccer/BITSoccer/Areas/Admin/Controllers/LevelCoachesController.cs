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
    public class LevelCoachesController : Controller
    {
        private BITSoccerEntities db = new BITSoccerEntities();

        // GET: Admin/LevelCoaches
        public ActionResult Index()
        {
            return View(db.LevelCoaches.ToList());
        }

        // GET: Admin/LevelCoaches/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Admin/LevelCoaches/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "LevelCoachID,LevelName")] LevelCoach levelCoach)
        {
            if (ModelState.IsValid)
            {
                db.LevelCoaches.Add(levelCoach);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(levelCoach);
        }

        // GET: Admin/LevelCoaches/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            LevelCoach levelCoach = db.LevelCoaches.Find(id);
            if (levelCoach == null)
            {
                return HttpNotFound();
            }
            return View(levelCoach);
        }

        // POST: Admin/LevelCoaches/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "LevelCoachID,LevelName")] LevelCoach levelCoach)
        {
            if (ModelState.IsValid)
            {
                db.Entry(levelCoach).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(levelCoach);
        }

        // POST: Admin/LevelCoaches/Delete/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Delete(int id)
        {
            LevelCoach levelCoach = db.LevelCoaches.Find(id);
            db.LevelCoaches.Remove(levelCoach);
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
