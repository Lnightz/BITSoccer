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
            var parentCommentFrommClass = db.Comments.Where(x => x.RootCommentID == null && x.Class_ID == classID).OrderByDescending(x => x.PostDate).ToList();
            var parentCommentFromNews = db.Comments.Where(x => x.RootCommentID == null && x.New_ID == newsID).OrderByDescending(x => x.PostDate).ToList();
            var pageNumber = page ?? 1;

            ViewBag.CmtFromClass = parentCommentFrommClass.ToPagedList(pageNumber,pageSize);
            ViewBag.CmtFromNews = parentCommentFromNews;

            
            //var pageSize = 1;

            //ViewBag.CmtFromClassToPageList = parentCommentFrommClass.ToPagedList(pageNumber, pageSize);

            //ViewBag.ClassID = classID;

            return PartialView();
        }

        //Reply của cha
        public PartialViewResult Reply(int? classID, int? cmtID)
        {
            var repCmt = db.Comments.Where(x => x.RootCommentID == cmtID && x.ReplyToCommentID == cmtID && x.Class_ID == classID).OrderBy(x => x.PostDate).ToList();

            ViewBag.RepCmt = repCmt;

            return PartialView();
        }

        //Reply con của Reply
        public PartialViewResult ChildReply(int? classID, int? cmtID, int? rootCmtID)
        {
            var childrep = db.Comments.Where(x => x.RootCommentID == rootCmtID && x.ReplyToCommentID == cmtID && x.Class_ID == classID).OrderBy(x => x.PostDate).ToList();

            ViewBag.ChildCmt = childrep;

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

    }
}