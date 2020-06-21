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
    public class NewsCategoryController : Controller
    {
        private BITSoccerEntities db = new BITSoccerEntities();

        // GET: Admin/NewsCategory
        public ActionResult Index()
        {
            return View(db.News_Category.ToList());
        }

        // GET: Admin/NewsCategory/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Admin/NewsCategory/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "NewCate_ID,Name,CreatedBy,IsActive")] News_Category news_Category)
        {
            if (ModelState.IsValid)
            {
                news_Category.CreatedDate = DateTime.Today;
                db.News_Category.Add(news_Category);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(news_Category);
        }

        // GET: Admin/NewsCategory/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            News_Category news_Category = db.News_Category.Find(id);
            if (news_Category == null)
            {
                return HttpNotFound();
            }
            return View(news_Category);
        }

        // POST: Admin/NewsCategory/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "NewCate_ID,Name,CreatedBy,ModifyBy,IsActive")] News_Category news_Category)
        {
            if (ModelState.IsValid)
            {
                news_Category.ModifyDate = DateTime.Today;
                db.Entry(news_Category).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(news_Category);
        }


        // POST: Admin/NewsCategory/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            News_Category news_Category = db.News_Category.Find(id);
            db.News_Category.Remove(news_Category);
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
