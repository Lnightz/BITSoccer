using BITSoccer.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BITSoccer.BLL
{
    public class ClassesBLL
    {
        private static ClassesBLL instance;

        public static ClassesBLL Instance
        {
            get { if (instance == null) instance = new ClassesBLL(); return instance; }
            private set => instance = value;
        }

        BITSoccerEntities db = new BITSoccerEntities();

        public IQueryable<Class> GetClasses (ClassesSearchModel searchModel)
        {

            var result = db.Classes.AsQueryable();
            if (searchModel != null)
            {
                if (searchModel.levelcoachID.HasValue)
                {
                    result = result.Where(x => x.Coach.LevelCoach.LevelCoachID == searchModel.levelcoachID);
                }
                if (searchModel.levelstudentID.HasValue)
                {
                    result = result.Where(x => x.LevelStudentID == searchModel.levelstudentID);
                }
                if (searchModel.genderID.HasValue)
                {
                    result = result.Where(x => x.GenderID == searchModel.genderID);
                }
                if (searchModel.rangeAgesID.HasValue)
                {
                    result = result.Where(x => x.RangeAgeID == searchModel.rangeAgesID);
                }
                if (searchModel.rangeTimeID.HasValue)
                {
                    result = result.Where(x => x.RangeTimeID == searchModel.rangeTimeID);
                }
                if (searchModel.partofdayID.HasValue)
                {
                    result = result.Where(x => x.PartOfDayID == searchModel.partofdayID);
                }
            }
            return result;
        }
    }
}