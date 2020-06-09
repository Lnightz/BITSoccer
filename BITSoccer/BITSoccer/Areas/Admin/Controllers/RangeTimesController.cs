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
    public class RangeTimesController : Controller
    {
        private BITSoccerEntities db = new BITSoccerEntities();

        // GET: Admin/RangeTimes
        public ActionResult Index()
        {
            return View(db.RangeTimes.ToList());
        }

        // GET: Admin/RangeTimes/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Admin/RangeTimes/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "RangeTimeID,StartTime,EndTime")] RangeTime rangeTime)
        {
            if (ModelState.IsValid)
            {
                db.RangeTimes.Add(rangeTime);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(rangeTime);
        }

        // GET: Admin/RangeTimes/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            RangeTime rangeTime = db.RangeTimes.Find(id);
            if (rangeTime == null)
            {
                return HttpNotFound();
            }
            return View(rangeTime);
        }

        // POST: Admin/RangeTimes/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "RangeTimeID,StartTime,EndTime")] RangeTime rangeTime)
        {
            if (ModelState.IsValid)
            {
                db.Entry(rangeTime).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(rangeTime);
        }

        // POST: Admin/RangeTimes/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            RangeTime rangeTime = db.RangeTimes.Find(id);
            db.RangeTimes.Remove(rangeTime);
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
