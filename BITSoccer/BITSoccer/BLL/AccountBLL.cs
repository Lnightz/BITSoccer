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
                    User_ID = 0,
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
                    return db.Users.Include("UserType").FirstOrDefault(x => x.User_ID == users.User_ID);
                }
            }
            return users;
        }

        public User ChangeProfile (string username, UserModel model)
        {
            User user = null;
            using (var db = new BITSoccerEntities())
            {
                user = db.Users.FirstOrDefault(x => x.UserName == username);

                if (user == null)
                {
                    return null;
                }

                user.CustomerName = model.CustomerName;
                user.Gender = model.Gender;
                user.BirthDay = model.BirthDay;
                user.Email = model.Email;
                user.PhoneNumber = model.PhoneNumber;
                user.Address = model.Address;

                if (db.SaveChanges() > 0)
                {
                    return user;
                }
            }
            return user;
        }

        public User ChangePassword(string username, ChangePasswordModel model)
        {
            User user = null;
            using (var db = new BITSoccerEntities())
            {
                user = db.Users.FirstOrDefault(x => x.UserName == username);

                if (user == null)
                {
                    return null;
                }

                if (user.Password != model.OldPassword)
                {
                    return null;
                }

                user.Password = model.NewPassword;

                if (db.SaveChanges() > 0)
                {
                    return user;
                }
            }
            return null;
        }
    }
}