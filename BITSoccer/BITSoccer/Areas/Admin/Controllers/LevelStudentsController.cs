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
    public class LevelStudentsController : Controller
    {
        private BITSoccerEntities db = new BITSoccerEntities();

        // GET: Admin/LevelStudents
        public ActionResult Index()
        {
            return View(db.LevelStudents.ToList());
        }

        // GET: Admin/LevelStudents/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Admin/LevelStudents/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "LevelStudentID,LevelName")] LevelStudent levelStudent)
        {
            if (ModelState.IsValid)
            {
                db.LevelStudents.Add(levelStudent);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(levelStudent);
        }

        // GET: Admin/LevelStudents/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            LevelStudent levelStudent = db.LevelStudents.Find(id);
            if (levelStudent == null)
            {
                return HttpNotFound();
            }
            return View(levelStudent);
        }

        // POST: Admin/LevelStudents/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "LevelStudentID,LevelName")] LevelStudent levelStudent)
        {
            if (ModelState.IsValid)
            {
                db.Entry(levelStudent).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(levelStudent);
        }

        // POST: Admin/LevelStudents/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            LevelStudent levelStudent = db.LevelStudents.Find(id);
            db.LevelStudents.Remove(levelStudent);
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
