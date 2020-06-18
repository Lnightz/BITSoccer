using BITSoccer.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BITSoccer.Controllers
{
    public class CommentController : Controller
    {
        BITSoccerEntities db = new BITSoccerEntities();
        // GET: Comment
        [HttpGet]
        public PartialViewResult Comment(int? page , int? classid, int? newsid)
        {
            var parentCommentFrommClass = db.Comments.Where(x => x.RootCommentID == null && x.Class_ID == classid).OrderByDescending(x => x.PostDate).ToList();
            var parentCommentFromNews = db.Comments.Where(x => x.RootCommentID == null && x.New_ID == newsid).OrderByDescending(x => x.PostDate).ToList();


            return PartialView();
        }
    }
}