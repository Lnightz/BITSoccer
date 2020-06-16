using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BITSoccer.Models
{
    public class ClassesSearchModel
    {
        public int? levelstudentID { get; set; }

        public int? rangeTimeID { get; set; }

        public int? rangeAgesID { get; set; }

        public int? genderID { get; set; }

        public int? levelcoachID { get; set; }

        public int? partofdayID { get; set; }

        public IEnumerable<Class> classes { get; set; }
    }
}