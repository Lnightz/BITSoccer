using BITSoccer.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BITSoccer.Controllers
{
    public class PartialController : Controller
    {
        BITSoccerEntities db = new BITSoccerEntities();
        // GET: Partial
        public PartialViewResult HomeSlide()
        {
            var slide = db.Home_Slide.Where(x => x.IsActive == true).OrderBy(x => x.DisplayOrder).ToList();
            return PartialView(slide);
        }

        public PartialViewResult CoachMoment()
        {
            var coachmoment = db.Coach_Moment.OrderBy(x => x.Coach_Moment_ID).ToList();
            return PartialView(coachmoment);
        }

        public PartialViewResult Stadium()
        {
            var stadium = db.Stadia.OrderBy(x => x.Name).ToList();
            return PartialView(stadium);
        }

        public PartialViewResult Tourament()
        {
            var toura = db.Touraments.OrderByDescending(x => x.Time).First();
            return PartialView(toura);
        }
        public PartialViewResult Archive()
        {
            return PartialView(db.Archives.OrderBy(x => x.Name).ToList());
        }

        public PartialViewResult HotClass()
        {
            DateTime today = DateTime.Today.AddDays(3);

            //Lấy ra danh sách những lớp có ngày bắt đầu lớn hơn ngày hiện tại + 3
            var course = db.Classes.Where(x => x.StartDay > today).ToList();

            foreach (var item in course)
            {
                //Đếm trong danh sách đã lấy ở trên có bao nhiêu học viên tham gia
                var countstudent = db.ClassUsers.Count(x => x.ClassID == item.Class_ID);

                //Tạo ra một list danh sách từ danh sách lớp ở trên cộng với cột dữ liệu có bao nhiêu học sinh tham gia
                if (ViewBag.ListStudent == null)
                {
                    List<HotClasses> hotCourse = new List<HotClasses>
                {
                    new HotClasses(countstudent,db.Classes.Find(item.Class_ID))
                };
                    ViewBag.ListStudent = hotCourse;
                }
                else
                {
                    List<HotClasses> hotCourse = (List<HotClasses>)ViewBag.ListStudent;
                    hotCourse.Add(new HotClasses(countstudent, db.Classes.Find(item.Class_ID)));
                    ViewBag.ListStudent = hotCourse;
                }
            }

            if(ViewBag.ListStudent != null)
            {
                List<HotClasses> listStudent = (List<HotClasses>)ViewBag.ListStudent;
                //Tìm ra những lớp có số lượng học sinh lớn hơn 
                listStudent = listStudent.Where(x => x.NumStudent > 10).ToList();
                ViewBag.ListStudent = listStudent;
            }

            //Nếu như chưa tìm đc HotClass
            ViewBag.AnotherHotCourse = course.Take(5).ToList();

            return PartialView();
        }

        public PartialViewResult Footer()
        {
            return PartialView(db.Footers.First());
        }

        public PartialViewResult About()
        {
            return PartialView(db.Abouts.First());
        }

        public PartialViewResult AboutSlide()
        {
            return PartialView(db.About_Slide.Where(x => x.AboutID == 1).ToList());
        }
    }
}