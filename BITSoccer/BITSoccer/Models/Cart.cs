using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BITSoccer.Models
{
    public class Cart
    {

        
        public Class Class { get; set; }

        public User User { get; set; }

        public Cart(User user, Class classes )
        {
            Class = classes;
            User = user;
        }

    }

}