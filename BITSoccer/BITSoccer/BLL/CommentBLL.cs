using BITSoccer.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BITSoccer.BLL
{
    public class CommentBLL
    {
        private static CommentBLL instance;

        public static CommentBLL Instance
        {
            get { if (instance == null) instance = new CommentBLL(); return instance; }
            private set => instance = value;
        }

        public Comment AddCmtToClass(CommentModel model)
        {
            Comment cmt = null;

            using (var db = new BITSoccerEntities())
            {
                var userid = db.Users.FirstOrDefault(x => x.UserName == model.UserName);
                cmt = new Comment()
                {
                    User_ID = userid.User_ID,
                    Class_ID = model.ClassID,
                    Content = model.Content,
                    PostDate = DateTime.Now,
                    RootCommentID = model.RootCmtID,
                    ReplyToCommentID = model.RepToCmtID,
                };
                db.Comments.Add(cmt);
                if (db.SaveChanges() > 0)
                {
                    return cmt;
                }
            }
            return null;
        }

        public Comment AddCmtToNews(CommentModel model)
        {
            Comment cmt = null;

            using (var db = new BITSoccerEntities())
            {
                var userid = db.Users.FirstOrDefault(x => x.UserName == model.UserName);
                cmt = new Comment()
                {
                    User_ID = userid.User_ID,
                    New_ID = model.NewsID,
                    Content = model.Content,
                    PostDate = DateTime.Now,
                    RootCommentID = model.RootCmtID,
                    ReplyToCommentID = model.RepToCmtID,
                };
                db.Comments.Add(cmt);
                if (db.SaveChanges() > 0)
                {
                    return cmt;
                }
            }
            return null;
        }

        public Comment AddOriCmtToNews(CommentModel model)
        {
            Comment cmt = null;

            using (var db = new BITSoccerEntities())
            {
                var userid = db.Users.FirstOrDefault(x => x.UserName == model.UserName);
                cmt = new Comment()
                {
                    User_ID = userid.User_ID,
                    New_ID = model.NewsID,
                    Content = model.Content,
                    PostDate = DateTime.Now,
                };
                db.Comments.Add(cmt);
                if (db.SaveChanges() > 0)
                {
                    return cmt;
                }
            }
            return null;
        }

        public Comment AddOriCmtToClass(CommentModel model)
        {
            Comment cmt = null;

            using (var db = new BITSoccerEntities())
            {
                var userid = db.Users.FirstOrDefault(x => x.UserName == model.UserName);
                cmt = new Comment()
                {
                    User_ID = userid.User_ID,
                    Class_ID = model.ClassID,
                    Content = model.Content,
                    PostDate = DateTime.Now,
                };
                db.Comments.Add(cmt);
                if (db.SaveChanges() > 0)
                {
                    return cmt;
                }
            }
            return null;
        }
    }
}