using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BITSoccer.Models
{
    public class HotClasses
    {
        public int NumStudent { get; set; }
        public Class Course { get; set; }

        public HotClasses(int numStudent, Class course)
        {
            NumStudent = numStudent;
            Course = course;
        }
    }
}