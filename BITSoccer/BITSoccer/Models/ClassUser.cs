//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace BITSoccer.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class ClassUser
    {
        public int ClassUsersID { get; set; }
        public Nullable<int> UserID { get; set; }
        public Nullable<int> ClassID { get; set; }
    
        public virtual Class Class { get; set; }
        public virtual User User { get; set; }
    }
}
