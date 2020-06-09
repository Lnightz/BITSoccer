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
    public class StadiumsController : Controller
    {
        private BITSoccerEntities db = new BITSoccerEntities();

        // GET: Admin/Stadiums
        public ActionResult Index()
        {
            return View(db.Stadia.ToList());
        }

        // GET: Admin/Stadiums/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Admin/Stadiums/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Stadium_ID,Name,Address,Image,PictureUpload")] Stadium stadium)
        {
            if (stadium.PictureUpload != null)
            {
                string fileName = Path.Combine(Server.MapPath("~/Content/Images"), Path.GetFileName(stadium.PictureUpload.FileName));
                stadium.PictureUpload.SaveAs(fileName);
                string pathinDB = "/Content/Images/" + Path.GetFileName(stadium.PictureUpload.FileName);
                stadium.Image = pathinDB;
            }

            if (ModelState.IsValid)
            {
                db.Stadia.Add(stadium);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(stadium);
        }

        // GET: Admin/Stadiums/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Stadium stadium = db.Stadia.Find(id);
            if (stadium == null)
            {
                return HttpNotFound();
            }
            return View(stadium);
        }

        // POST: Admin/Stadiums/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Stadium_ID,Name,Address,Image,PictureUpload")] Stadium stadium)
        {
            if (stadium.PictureUpload != null)
            {
                string fileName = Path.Combine(Server.MapPath("~/Content/Images"), Path.GetFileName(stadium.PictureUpload.FileName));
                stadium.PictureUpload.SaveAs(fileName);
                string pathinDB = "/Content/Images/" + Path.GetFileName(stadium.PictureUpload.FileName);
                stadium.Image = pathinDB;
            }

            if (ModelState.IsValid)
            {
                db.Entry(stadium).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(stadium);
        }

        // POST: Admin/Stadiums/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Stadium stadium = db.Stadia.Find(id);
            db.Stadia.Remove(stadium);
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
