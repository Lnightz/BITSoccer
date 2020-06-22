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
    public class DiscountCodesController : Controller
    {
        private BITSoccerEntities db = new BITSoccerEntities();

        // GET: Admin/DiscountCodes
        public ActionResult Index()
        {
            return View(db.DiscountCodes.ToList());
        }

        // GET: Admin/DiscountCodes/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Admin/DiscountCodes/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "DiscountCodeID,DiscountCode1,Discount")] DiscountCode discountCode)
        {
            if (ModelState.IsValid)
            {
                db.DiscountCodes.Add(discountCode);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(discountCode);
        }

        // GET: Admin/DiscountCodes/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            DiscountCode discountCode = db.DiscountCodes.Find(id);
            if (discountCode == null)
            {
                return HttpNotFound();
            }
            return View(discountCode);
        }

        // POST: Admin/DiscountCodes/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "DiscountCodeID,DiscountCode1,Discount")] DiscountCode discountCode)
        {
            if (ModelState.IsValid)
            {
                db.Entry(discountCode).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(discountCode);
        }

        // POST: Admin/DiscountCodes/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            DiscountCode discountCode = db.DiscountCodes.Find(id);
            db.DiscountCodes.Remove(discountCode);
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
