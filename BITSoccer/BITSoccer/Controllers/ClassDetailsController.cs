using BITSoccer.Models;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;

namespace BITSoccer.Controllers
{
    public class ClassDetailsController : Controller
    {
        BITSoccerEntities db = new BITSoccerEntities();
        // GET: ClassDetails
        public ActionResult ClassDetails(int? page ,int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Class classes = db.Classes.Find(id);
            if (classes == null)
            {
                return HttpNotFound();
            }

            var classdetails = db.Classes.Where(x => x.Class_ID == id).SingleOrDefault();

            ViewBag.ReferenceClass = db.Classes.Where(x => x.LevelStudentID == classdetails.LevelStudentID).OrderBy(x => x.CreatedDate).Take(5).ToList();

            var countRating = db.Ratings.Where(x => x.Class_ID == id).Count();

            ViewBag.UserDetails = db.Users.Where(x => x.UserName == User.Identity.Name).FirstOrDefault();

            var parentCommentFrommClass = db.Comments.Where(x => x.RootCommentID == null && x.Class_ID == id).OrderByDescending(x => x.PostDate).ToList();

            var pageNumber = page ?? 1;

            ViewBag.PageNumber = pageNumber;

            var pageSize = 2;

            ViewBag.PageSize = pageSize;

            //ViewBag.CmtFromClassToPageList = parentCommentFrommClass.ToPagedList(pageNumber, pageSize);

            ViewBag.CountRating = countRating;

            var best = db.Ratings.Where(x => x.Class_ID == id && x.NumberStar > 4).Count();
            var good = db.Ratings.Where(x => x.Class_ID == id && x.NumberStar > 3 && x.NumberStar <=4 ).Count();
            var normal = db.Ratings.Where(x => x.Class_ID == id && x.NumberStar > 2 && x.NumberStar <= 3).Count();
            var bad = db.Ratings.Where(x => x.Class_ID == id && x.NumberStar > 1 && x.NumberStar <= 2).Count();
            var verybad = db.Ratings.Where(x => x.Class_ID == id && x.NumberStar <= 1).Count();
            var sum = db.Ratings.Where(x => x.Class_ID == id).ToList().Sum(x => x.NumberStar);

            if (countRating > 0)
            {
                ViewBag.Best = (best / countRating) * 100;
                ViewBag.Good = (good / countRating) * 100;
                ViewBag.Normal = (normal / countRating) * 100;
                ViewBag.Bad = (bad / countRating) * 100;
                ViewBag.VeryBad = (verybad / countRating) * 100;
                ViewBag.TotalStar = sum / ViewBag.CountRating;
            }
            else
            {
                ViewBag.Best = 0;
                ViewBag.Good = 0;
                ViewBag.Normal = 0;
                ViewBag.Bad = 0;
                ViewBag.VeryBad = 0;
                ViewBag.TotalStar = 0;
            }

            var userratingdetails = db.Ratings.Where(x => x.User.UserName == User.Identity.Name && x.Class_ID ==  id).FirstOrDefault();

            ViewBag.Classes = classes;

            if(userratingdetails != null)
            {
                ViewBag.Error = "RATED";

                return View(parentCommentFrommClass.ToPagedList(pageNumber,pageSize));
            }

            return View(parentCommentFrommClass.ToPagedList(pageNumber, pageSize));
        }

        [Authorize]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Rating(FormCollection frc)
        {
            var userdetails = db.Users.Where(x => x.UserName == User.Identity.Name).FirstOrDefault();

            var classid = (int)Convert.ToDouble(frc["Class_ID"]);

            var userratingdetails = db.Ratings.Where(x => x.User_ID == userdetails.User_ID && x.Class_ID == classid).FirstOrDefault();

            if(userratingdetails == null)
            {
                Rating rating = new Rating()
                {
                    User_ID = userdetails.User_ID,
                    Class_ID = (int)Convert.ToDouble(frc["Class_ID"]),
                    NumberStar = (int)Convert.ToDouble(frc["NumberStar"])
                };
                db.Ratings.Add(rating);
                db.SaveChanges();
                return RedirectToAction("ClassDetails", new { id = classid });
            }


            return RedirectToAction("ClassDetails", new { id = classid });
        }
    }
}