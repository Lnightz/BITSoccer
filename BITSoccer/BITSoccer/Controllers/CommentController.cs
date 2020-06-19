using BITSoccer.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PagedList;
using BITSoccer.BLL;

namespace BITSoccer.Controllers
{
    public class CommentController : Controller
    {
        BITSoccerEntities db = new BITSoccerEntities();
        // GET: Comment

        [HttpGet]
        [ChildActionOnly]
        public PartialViewResult Comment(int? classID, int? newsID, int? page, int pageSize)
        {
            var pageNumber = page ?? 1;
            if (  classID != null)
            {
                var parentCommentFromClass = db.Comments.Where(x => x.RootCommentID == null && x.Class_ID == classID).OrderByDescending(x => x.PostDate).ToList();
                ViewBag.CmtFromClass = parentCommentFromClass.ToPagedList(pageNumber, pageSize);
            }
            else
            {
                var parentCommentFromNews = db.Comments.Where(x => x.RootCommentID == null && x.New_ID == newsID).OrderByDescending(x => x.PostDate).ToList();

                ViewBag.CmtFromNews = parentCommentFromNews.ToPagedList(pageNumber, pageSize);
            }
           
            //var pageSize = 1;

            //ViewBag.CmtFromClassToPageList = parentCommentFrommClass.ToPagedList(pageNumber, pageSize);

            //ViewBag.ClassID = classID;

            return PartialView();
        }
        [HttpGet]
        [ChildActionOnly]
        //Reply của cha
        public PartialViewResult Reply(int? classID, int? newsID, int? cmtID)
        {
            if (classID != null)
            {
                var repCmt = db.Comments.Where(x => x.RootCommentID == cmtID && x.ReplyToCommentID == cmtID && x.Class_ID == classID).OrderBy(x => x.PostDate).ToList();
                ViewBag.RepCmt = repCmt;
            }
            else
            {
                var repCmtToNews = db.Comments.Where(x => x.RootCommentID == cmtID && x.ReplyToCommentID == cmtID && x.New_ID == newsID).OrderBy(x => x.PostDate).ToList();

                ViewBag.RepCmtToNews = repCmtToNews;
            }

            return PartialView();
        }
        [HttpGet]
        [ChildActionOnly]
        //Reply con của Reply
        public PartialViewResult ChildReply(int? classID, int? cmtID, int? rootCmtID, int? newsID)
        {

            if (classID != null)
            {
                var childrep = db.Comments.Where(x => x.RootCommentID == rootCmtID && x.ReplyToCommentID == cmtID && x.Class_ID == classID).OrderBy(x => x.PostDate).ToList();
                ViewBag.ChildCmt = childrep;
            }
            else
            {
                var childrepToNews = db.Comments.Where(x => x.RootCommentID == rootCmtID && x.ReplyToCommentID == cmtID && x.New_ID == newsID).OrderBy(x => x.PostDate).ToList();

                ViewBag.ChildCmtToNews = childrepToNews;

            }

            return PartialView();
        }

        [Authorize]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult PostCmt(CommentModel model)
        {
            if (ModelState.IsValid)
            {
                Comment cmt = CommentBLL.Instance.AddCmtToClass(model);

                if (cmt != null)
                {
                    return RedirectToAction("ClassDetails", "ClassDetails", new { id = model.ClassID });
                }
            }

            ViewBag.CmtError = "Có lỗi khi cmt";

            return RedirectToAction("ClassDetails", "ClassDetails", new { id = model.ClassID });
        }

        [Authorize]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult PostOriCmt(CommentModel model)
        {
            if (ModelState.IsValid)
            {
                Comment cmt = CommentBLL.Instance.AddOriCmtToClass(model);

                if (cmt != null)
                {
                    return RedirectToAction("ClassDetails", "ClassDetails", new { id = model.ClassID });
                }
            }

            ViewBag.CmtError = "Có lỗi khi cmt";

            return RedirectToAction("ClassDetails", "ClassDetails", new { id = model.ClassID });
        }

        [Authorize]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult PostCmtToNews(CommentModel model)
        {
            if (ModelState.IsValid)
            {
                Comment cmt = CommentBLL.Instance.AddCmtToNews(model);

                if (cmt != null)
                {
                    return RedirectToAction("NewsDetails", "Home", new { id = model.NewsID });
                }
            }

            ViewBag.CmtError = "Có lỗi khi cmt";

            return RedirectToAction("NewsDetails", "Home", new { id = model.NewsID });
        }

        [Authorize]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult PostOriCmtToNews(CommentModel model)
        {
            if (ModelState.IsValid)
            {
                Comment cmt = CommentBLL.Instance.AddOriCmtToNews(model);

                if (cmt != null)
                {
                    return RedirectToAction("NewsDetails", "Home", new { id = model.NewsID });
                }
            }

            ViewBag.CmtError = "Có lỗi khi cmt";

            return RedirectToAction("NewsDetails", "Home", new { id = model.NewsID });
        }

    }
}