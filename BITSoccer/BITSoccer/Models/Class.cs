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
    using System.Web.Mvc;

    public partial class Class : UploadImage
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Class()
        {
            this.BillDetails = new HashSet<BillDetail>();
            this.ClassUsers = new HashSet<ClassUser>();
            this.Ratings = new HashSet<Rating>();
            this.Comments = new HashSet<Comment>();
        }
    
        public int Class_ID { get; set; }
        public string Name { get; set; }
        public string MetaTitle { get; set; }
        public Nullable<int> Quanity { get; set; }
        public Nullable<decimal> Prices { get; set; }
        public Nullable<decimal> PromoPrices { get; set; }
        public string Image { get; set; }
        public Nullable<System.DateTime> StartDay { get; set; }
        public Nullable<System.DateTime> EndDay { get; set; }
        public Nullable<int> MinQuanity { get; set; }
        public Nullable<System.DateTime> CreatedDate { get; set; }
        public string CreatedBy { get; set; }
        public Nullable<System.DateTime> ModifyDate { get; set; }
        public string ModifyBy { get; set; }
        public Nullable<bool> IsActive { get; set; }
        public Nullable<int> ViewCount { get; set; }
        public int Coach_ID { get; set; }
        public Nullable<int> LevelStudentID { get; set; }
        public Nullable<int> RangeAgeID { get; set; }
        public Nullable<int> PartOfDayID { get; set; }
        public Nullable<int> GenderID { get; set; }
        public Nullable<int> RangeTimeID { get; set; }
        public Nullable<int> StadiumID { get; set; }
        [AllowHtml]
        public string Description { get; set; }
        public string GeneralDescription { get; set; }
        public string ShortDescription { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<BillDetail> BillDetails { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ClassUser> ClassUsers { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Rating> Ratings { get; set; }
        public virtual Coach Coach { get; set; }
        public virtual Gender Gender { get; set; }
        public virtual LevelStudent LevelStudent { get; set; }
        public virtual PartOfDay PartOfDay { get; set; }
        public virtual RangeAge RangeAge { get; set; }
        public virtual RangeTime RangeTime { get; set; }
        public virtual Stadium Stadium { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Comment> Comments { get; set; }
    }
}
