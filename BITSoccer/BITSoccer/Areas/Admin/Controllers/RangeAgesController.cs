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
    public class RangeAgesController : Controller
    {
        private BITSoccerEntities db = new BITSoccerEntities();

        // GET: Admin/RangeAges
        public ActionResult Index()
        {
            return View(db.RangeAges.ToList());
        }

        // GET: Admin/RangeAges/Details/5

        // GET: Admin/RangeAges/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Admin/RangeAges/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "RangeAgeID,MinAge,MaxAge")] RangeAge rangeAge)
        {
            if (ModelState.IsValid)
            {
                db.RangeAges.Add(rangeAge);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(rangeAge);
        }

        // GET: Admin/RangeAges/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            RangeAge rangeAge = db.RangeAges.Find(id);
            if (rangeAge == null)
            {
                return HttpNotFound();
            }
            return View(rangeAge);
        }

        // POST: Admin/RangeAges/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "RangeAgeID,MinAge,MaxAge")] RangeAge rangeAge)
        {
            if (ModelState.IsValid)
            {
                db.Entry(rangeAge).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(rangeAge);
        }


        // POST: Admin/RangeAges/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            RangeAge rangeAge = db.RangeAges.Find(id);
            db.RangeAges.Remove(rangeAge);
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
