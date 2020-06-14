using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BITSoccer.Models
{
    public class Cart
    {

        
        public Class Class { get; set; }

        public Cart(Class classes )
        {
            Class = classes;
        }

    }

}