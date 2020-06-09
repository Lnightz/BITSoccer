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
    public class PartOfDaysController : Controller
    {
        private BITSoccerEntities db = new BITSoccerEntities();

        // GET: Admin/PartOfDays
        public ActionResult Index()
        {
            return View(db.PartOfDays.ToList());
        }


        // GET: Admin/PartOfDays/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Admin/PartOfDays/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "PartOfDayID,PartOfDay1")] PartOfDay partOfDay)
        {
            if (ModelState.IsValid)
            {
                db.PartOfDays.Add(partOfDay);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(partOfDay);
        }

        // GET: Admin/PartOfDays/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            PartOfDay partOfDay = db.PartOfDays.Find(id);
            if (partOfDay == null)
            {
                return HttpNotFound();
            }
            return View(partOfDay);
        }

        // POST: Admin/PartOfDays/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "PartOfDayID,PartOfDay1")] PartOfDay partOfDay)
        {
            if (ModelState.IsValid)
            {
                db.Entry(partOfDay).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(partOfDay);
        }

        // POST: Admin/PartOfDays/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            PartOfDay partOfDay = db.PartOfDays.Find(id);
            db.PartOfDays.Remove(partOfDay);
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
