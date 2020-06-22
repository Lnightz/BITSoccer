using BITSoccer.BLL;
using BITSoccer.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;

namespace BITSoccer.Areas.Admin.Controllers
{
    public class GeneralController : Controller
    {
        BITSoccerEntities db = new BITSoccerEntities();
        // GET: Admin/General
        [HttpGet]
        public ActionResult HomePageContent()
        {
            return View(db.HomePage_Content.FirstOrDefault());
        }

        [HttpGet]
        public ActionResult EditHomePageContent(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            HomePage_Content home = db.HomePage_Content.Find(id);
            if (home == null)
            {
                return HttpNotFound();
            }
            return View(home);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult EditHomePageContent(HomePage_Content model)
        {
            if (ModelState.IsValid)
            {
                HomePage_Content home = null;
                home = db.HomePage_Content.FirstOrDefault(x => x.Home_Content_ID == model.Home_Content_ID);

                home.Archive_Content = model.Archive_Content;
                home.Coach_Content = model.Coach_Content;
                home.Stadium_Content = model.Stadium_Content;
                home.HotClass_Content = model.HotClass_Content;
                home.Tour_Content = model.Tour_Content;
                home.Quote1_Content = model.Quote1_Content;
                home.Quote2_Content = model.Quote2_Content;

                db.SaveChanges();

                return RedirectToAction("HomePageContent");
            }

            return View();
        }

        public ActionResult Archive()
        {
            return View(db.Archives.ToList());
        }

        public ActionResult EditArchive(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Archive archive = db.Archives.Find(id);
            if (archive == null)
            {
                return HttpNotFound();
            }
            return View(archive);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult EditArchive(Archive model)
        {
            if (model.PictureUpload != null)
            {
                string fileName = Path.Combine(Server.MapPath("~/Content/Images"), Path.GetFileName(model.PictureUpload.FileName));
                model.PictureUpload.SaveAs(fileName);
                string pathinDB = "/Content/Images/" + Path.GetFileName(model.PictureUpload.FileName);
                model.Image = pathinDB;
            }
            if (ModelState.IsValid)
            {
                Archive archive = null;
                archive = db.Archives.Find(model.Archive_ID);

                archive.Content = model.Content;
                archive.Image = model.Image;
                archive.PictureUpload = model.PictureUpload;
                archive.Name = model.Name;

                db.SaveChanges();

                return RedirectToAction("Archive");
            }
            return View();
        }

        public ActionResult CoachMoment()
        {
            return View(db.Coach_Moment.ToList());
        }

        public ActionResult EditCoachMoment(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Coach_Moment coach = db.Coach_Moment.Find(id);
            if (coach == null)
            {
                return HttpNotFound();
            }
            return View(coach);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult EditCoachMoment(Coach_Moment model)
        {
            if (model.PictureUpload != null)
            {
                string fileName = Path.Combine(Server.MapPath("~/Content/Images"), Path.GetFileName(model.PictureUpload.FileName));
                model.PictureUpload.SaveAs(fileName);
                string pathinDB = "/Content/Images/" + Path.GetFileName(model.PictureUpload.FileName);
                model.Image = pathinDB;
            }
            if (ModelState.IsValid)
            {
                Coach_Moment coach = null;
                coach = db.Coach_Moment.Find(model.Coach_Moment_ID);

                coach.Description = model.Description;
                coach.Image = model.Image;
                coach.PictureUpload = model.PictureUpload;
                coach.Link = model.Link;

                db.SaveChanges();

                return RedirectToAction("CoachMoment");
            }
            return View();
        }

        public ActionResult HomeSlide()
        {
            return View(db.Home_Slide.ToList());
        }

        public ActionResult EditHomeSlide(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Home_Slide slide = db.Home_Slide.Find(id);
            if (slide == null)
            {
                return HttpNotFound();
            }
            return View(slide);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult EditHomeSlide(Home_Slide model)
        {
            if (model.PictureUpload != null)
            {
                string fileName = Path.Combine(Server.MapPath("~/Content/Images"), Path.GetFileName(model.PictureUpload.FileName));
                model.PictureUpload.SaveAs(fileName);
                string pathinDB = "/Content/Images/" + Path.GetFileName(model.PictureUpload.FileName);
                model.Image = pathinDB;
            }
            if (ModelState.IsValid)
            {
                Home_Slide slide = null;
                slide = db.Home_Slide.Find(model.HomeSlide_ID);

                slide.Description = model.Description;
                slide.Image = model.Image;
                slide.PictureUpload = model.PictureUpload;
                slide.Link = model.Link;
                slide.DisplayOrder = model.DisplayOrder;
                slide.ModifyDate = DateTime.Now;
                slide.IsActive = model.IsActive;

                db.SaveChanges();

                return RedirectToAction("HomeSlide");
            }
            return View();
        }
        [HttpGet]
        public ActionResult CreateHomeSlide()
        {
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult CreateHomeSlide(Home_Slide model)
        {
            if (model.PictureUpload != null)
            {
                string fileName = Path.Combine(Server.MapPath("~/Content/Images"), Path.GetFileName(model.PictureUpload.FileName));
                model.PictureUpload.SaveAs(fileName);
                string pathinDB = "/Content/Images/" + Path.GetFileName(model.PictureUpload.FileName);
                model.Image = pathinDB;
            }
            else
            {
                model.Image = "/Assets/img/no-photo.jpg";
            }
            if (ModelState.IsValid)
            {
                Home_Slide slide = null;

                slide.Description = model.Description;
                slide.Image = model.Image;
                slide.PictureUpload = model.PictureUpload;
                slide.Link = model.Link;
                slide.DisplayOrder = model.DisplayOrder;
                slide.CreatedDate = DateTime.Now;
                slide.IsActive = model.IsActive;

                db.Home_Slide.Add(slide);
                db.SaveChanges();

                return RedirectToAction("HomeSlide");
            }
            return View();
        }

        public ActionResult EditFooter(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Footer footer = db.Footers.Find(id);
            if (footer == null)
            {
                return HttpNotFound();
            }
            return View(footer);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult EditFooter(Footer model)
        {
            if (ModelState.IsValid)
            {
                Footer footer = null;
                footer = db.Footers.Find(model.Footer_ID);

                footer.Name = model.Name;
                footer.Address = model.Address;
                footer.Phone = model.Phone;
                footer.Facebook = model.Facebook;
                footer.Insta = model.Insta;

                db.SaveChanges();

                return RedirectToAction("Footer");
            }
            return View();
        }

        public ActionResult Bill()
        {
            return View(db.Bills.ToList());
        }

        public ActionResult BillDetails(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            var billdetails = db.BillDetails.Where(x => x.BillID == id).ToList();
            return View(billdetails);
        }

        public ActionResult AllUserAccount()
        {
            return View(db.Users.Where(x=>x.UserName != "admin").ToList());
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult LockUser(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            User user = null;
            user = db.Users.Find(id);

            user.IsActive = false;

            db.SaveChanges();

            return RedirectToAction("AllUserAccount");
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult UnlockUser (int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            User user = null;
            user = db.Users.Find(id);

            user.IsActive = true;

            db.SaveChanges();

            return RedirectToAction("AllUserAccount");
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult CreateCoachUser(CoachUserModel model)
        {
            if (ModelState.IsValid)
            {
                User user = AccountBLL.Instance.CreateCoachUser(model);

                return RedirectToAction("AllUserAccount");
            }

            return View("Error");
        }

        public ActionResult EditAbout(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }

            var aboutSlides = db.About_Slide.Where(x => x.AboutID == id).ToList();
            var about = db.Abouts.FirstOrDefault(x => x.AboutID == id);

            ViewBag.AboutSlide = aboutSlides;
            ViewBag.About = about;

            return View();
        }
    }
}