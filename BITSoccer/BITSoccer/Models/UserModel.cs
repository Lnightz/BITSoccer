using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace BITSoccer.Models
{
    public class UserModel
    {
        [Required]
        public string UserName { get; set; }
        [Required]
        public string Password { get; set; }
        public string RePassword { get; set; }

        public bool IsEqualPass
        {
            get
            {
                return string.Equals(Password, RePassword);
            }

        }
        [Required]
        public string Email { get; set; }
        [Required]
        public string CustomerName { get; set; }
        [Required]
        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
        public Nullable<System.DateTime> BirthDay { get; set; }
        [Required]
        public string Gender { get; set; }
        [Required]
        public string PhoneNumber { get; set; }
        public string Address { get; set; }

        public bool IsActive { get; set; }
    }
}