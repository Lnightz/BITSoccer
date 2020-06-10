using BITSoccer.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BITSoccer.BLL
{
    public class AccountBLL
    {
        private static AccountBLL instance;

        public static AccountBLL Instance
        {
            get { if (instance == null) instance = new AccountBLL(); return instance; }
            private set => instance = value;
        }

        public User CreateAccount(UserModel model)
        {
            User users = null;

            using (var db = new BITSoccerEntities())
            {
                users = new User()
                {
                    UserType_ID = 2,
                    UserName = model.UserName,
                    Password = model.Password,
                    PhoneNumber = model.PhoneNumber,
                    Email = model.Email,
                    BirthDay = model.BirthDay,
                    Address = model.Address,
                    Gender = model.Gender,
                    CustomerName = model.CustomerName,
                    IsActive = true,
                };

                db.Users.Add(users);

                if (db.SaveChanges() > 0)
                {
                    return users;
                }
            }
            return users;
        }
    }
}