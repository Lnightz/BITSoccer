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
    public class ClassesController : Controller
    {
        private BITSoccerEntities db = new BITSoccerEntities();

        // GET: Admin/Classes
        public ActionResult Index()
        {
            var classes = db.Classes.Include(c => c.Coach).Include(c => c.Gender).Include(c => c.LevelStudent).Include(c=> c.PartOfDay).Include(c =>c.RangeAge).Include(c => c.RangeTime).Include(c => c.Stadium);
            return View(classes.ToList());
        }

        // GET: Admin/Classes/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Class @class = db.Classes.Find(id);
            if (@class == null)
            {
                return HttpNotFound();
            }
            return View(@class);
        }

        // GET: Admin/Classes/Create
        public ActionResult Create()
        {
            ViewBag.Coach_ID = new SelectList(db.Coaches, "Coach_ID", "Name");
            ViewBag.GenderID = new SelectList(db.Genders, "GenderID", "Gender1");
            ViewBag.LevelStudentID = new SelectList(db.LevelStudents, "LevelStudentID", "LevelName");
            ViewBag.PartOfDayID = new SelectList(db.PartOfDays, "PartOfDayID", "PartOfDay1");
            ViewBag.RangeAgeID = new SelectList(db.RangeAges, "RangeAgeID", "MinAge");
            ViewBag.RangeTimeID = new SelectList(db.RangeTimes, "RangeTimeID", "StartTime");
            ViewBag.StadiumID = new SelectList(db.Stadia, "Stadium_ID", "Name");
            return View();
        }

        // POST: Admin/Classes/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Class_ID,Name,Quanity,Prices,PromoPrices,Image,StartDay,EndDay,MinQuanity,CreatedDate,CreatedBy,IsActive,Coach_ID,LevelStudentID,RangeAgeID,PartOfDayID,GenderID,RangeTimeID,StadiumID,Description,ShortDescription,GeneralDescription,PictureUpload")] Class @class)
        {
            if (@class.PictureUpload != null)
            {
                string fileName = Path.Combine(Server.MapPath("~/Content/Images"), Path.GetFileName(@class.PictureUpload.FileName));
                @class.PictureUpload.SaveAs(fileName);
                string pathinDB = "/Content/Images/" + Path.GetFileName(@class.PictureUpload.FileName);
                @class.Image = pathinDB;
            }
            else
            {
                @class.Image = "/Assets/img/no-photo.jpg";
            }
            if (ModelState.IsValid)
            {
                db.Classes.Add(@class);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.Coach_ID = new SelectList(db.Coaches, "Coach_ID", "Name", @class.Coach_ID);
            ViewBag.GenderID = new SelectList(db.Genders, "GenderID", "Gender1", @class.GenderID);
            ViewBag.LevelStudentID = new SelectList(db.LevelStudents, "LevelStudentID", "LevelName", @class.LevelStudentID);
            ViewBag.PartOfDayID = new SelectList(db.PartOfDays, "PartOfDayID", "PartOfDay1", @class.PartOfDayID);
            ViewBag.RangeAgeID = new SelectList(db.RangeAges, "RangeAgeID", "MinAge", @class.RangeAgeID);
            ViewBag.RangeTimeID = new SelectList(db.RangeTimes, "RangeTimeID", "StartTime", @class.RangeTimeID);
            ViewBag.StadiumID = new SelectList(db.Stadia, "Stadium_ID", "Name", @class.StadiumID);
            return View(@class);
        }

        // GET: Admin/Classes/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Class @class = db.Classes.Find(id);
            if (@class == null)
            {
                return HttpNotFound();
            }
            ViewBag.Coach_ID = new SelectList(db.Coaches, "Coach_ID", "Name", @class.Coach_ID);
            ViewBag.GenderID = new SelectList(db.Genders, "GenderID", "Gender1", @class.GenderID);
            ViewBag.LevelStudentID = new SelectList(db.LevelStudents, "LevelStudentID", "LevelName", @class.LevelStudentID);
            ViewBag.PartOfDayID = new SelectList(db.PartOfDays, "PartOfDayID", "PartOfDay1", @class.PartOfDayID);
            ViewBag.RangeAgeID = new SelectList(db.RangeAges, "RangeAgeID", "MinAge", @class.RangeAgeID);
            ViewBag.RangeTimeID = new SelectList(db.RangeTimes, "RangeTimeID", "StartTime", @class.RangeTimeID);
            ViewBag.StadiumID = new SelectList(db.Stadia, "Stadium_ID", "Name", @class.StadiumID);
            return View(@class);
        }

        // POST: Admin/Classes/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Class_ID,Name,Quanity,Prices,PromoPrices,Image,StartDay,EndDay,MinQuanity,CreatedBy,ModifyDate,ModifyBy,IsActive,Coach_ID,LevelStudentID,RangeAgeID,PartOfDayID,GenderID,RangeTimeID,StadiumID,Description,ShortDescription,GeneralDescription,PictureUpload")] Class @class)
        {
            if (@class.PictureUpload != null)
            {
                string fileName = Path.Combine(Server.MapPath("~/Content/Images"), Path.GetFileName(@class.PictureUpload.FileName));
                @class.PictureUpload.SaveAs(fileName);
                string pathinDB = "/Content/Images/" + Path.GetFileName(@class.PictureUpload.FileName);
                @class.Image = pathinDB;
            }
            if (ModelState.IsValid)
            {
                //if (DateTime.Compare(@class.StartDay,))
                db.Entry(@class).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.Coach_ID = new SelectList(db.Coaches, "Coach_ID", "Name", @class.Coach_ID);
            ViewBag.GenderID = new SelectList(db.Genders, "GenderID", "Gender1", @class.GenderID);
            ViewBag.LevelStudentID = new SelectList(db.LevelStudents, "LevelStudentID", "LevelName", @class.LevelStudentID);
            ViewBag.PartOfDayID = new SelectList(db.PartOfDays, "PartOfDayID", "PartOfDay1", @class.PartOfDayID);
            ViewBag.RangeAgeID = new SelectList(db.RangeAges, "RangeAgeID", "MinAge", @class.RangeAgeID);
            ViewBag.RangeTimeID = new SelectList(db.RangeTimes, "RangeTimeID", "StartTime", @class.RangeTimeID);
            ViewBag.StadiumID = new SelectList(db.Stadia, "Stadium_ID", "Name", @class.StadiumID);
            return View(@class);
        }

        // POST: Admin/Classes/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Class @class = db.Classes.Find(id);
            db.Classes.Remove(@class);
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
