using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using BITSoccer.Models;

namespace BITSoccer.Areas.Admin.Controllers
{
    public class CoachesController : Controller
    {
        private BITSoccerEntities db = new BITSoccerEntities();

        // GET: Admin/Coaches
        public ActionResult Index()
        {
            var coaches = db.Coaches.Include(c => c.LevelCoach).Include(c => c.User);
            return View(coaches.ToList());
        }

        // GET: Admin/Coaches/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Coach coach = db.Coaches.Find(id);
            if (coach == null)
            {
                return HttpNotFound();
            }
            return View(coach);
        }

        // GET: Admin/Coaches/Create
        public ActionResult Create()
        {
            ViewBag.Level = new SelectList(db.LevelCoaches, "LevelCoachID", "LevelName");
            ViewBag.User_ID = new SelectList(db.Users, "User_ID", "UserName");
            return View();
        }

        // POST: Admin/Coaches/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Coach_ID,Name,CreatedDate,CreatedBy,ModifyDate,ModifyBy,IsActive,Gender,Age,Phone,Email,Passport,Image,Facebook,Insta,Twitter,Level,Description,User_ID,PictureUpload")] Coach coach)
        {
            if (coach.PictureUpload != null)
            {
                string fileName = Path.Combine(Server.MapPath("~/Content/Images"), Path.GetFileName(coach.PictureUpload.FileName));
                coach.PictureUpload.SaveAs(fileName);
                string pathinDB = "/Content/Images/" + Path.GetFileName(coach.PictureUpload.FileName);
                coach.Image = pathinDB;
            }

            if (ModelState.IsValid)
            {
                db.Coaches.Add(coach);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.Level = new SelectList(db.LevelCoaches, "LevelCoachID", "LevelName", coach.Level);
            ViewBag.User_ID = new SelectList(db.Users, "User_ID", "UserName", coach.User_ID);
            return View(coach);
        }

        // GET: Admin/Coaches/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Coach coach = db.Coaches.Find(id);
            if (coach == null)
            {
                return HttpNotFound();
            }
            ViewBag.Level = new SelectList(db.LevelCoaches, "LevelCoachID", "LevelName", coach.Level);
            ViewBag.User_ID = new SelectList(db.Users, "User_ID", "UserName", coach.User_ID);
            return View(coach);
        }

        // POST: Admin/Coaches/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Coach_ID,Name,CreatedDate,CreatedBy,ModifyDate,ModifyBy,IsActive,Gender,Age,Phone,Email,Image,Passport,Facebook,Insta,Twitter,Level,Description,User_ID,PictureUpload")] Coach coach)
        {

            if (coach.PictureUpload != null)
            {
                string fileName = Path.Combine(Server.MapPath("~/Content/Images"), Path.GetFileName(coach.PictureUpload.FileName));
                coach.PictureUpload.SaveAs(fileName);
                string pathinDB = "/Content/Images/" + Path.GetFileName(coach.PictureUpload.FileName);
                coach.Image = pathinDB;
            }

            if (ModelState.IsValid)
            {
                db.Entry(coach).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.Level = new SelectList(db.LevelCoaches, "LevelCoachID", "LevelName", coach.Level);
            ViewBag.User_ID = new SelectList(db.Users, "User_ID", "UserName", coach.User_ID);
            return View(coach);
        }

        // POST: Admin/Coaches/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Coach coach = db.Coaches.Find(id);
            db.Coaches.Remove(coach);
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
