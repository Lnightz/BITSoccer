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
    using System.ComponentModel.DataAnnotations;

    public partial class Coach : UploadImage
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Coach()
        {
            this.Classes = new HashSet<Class>();
        }
    
        public int Coach_ID { get; set; }
        public string Name { get; set; }
        public Nullable<System.DateTime> CreatedDate { get; set; }
        public string CreatedBy { get; set; }
        public Nullable<System.DateTime> ModifyDate { get; set; }
        public string ModifyBy { get; set; }
        public Nullable<bool> IsActive { get; set; }
        public string Gender { get; set; }
        [Range(1,1000)]
        public Nullable<int> Age { get; set; }
        [StringLength(10,MinimumLength =1)]
        [RegularExpression("^[0-9]*$")]
        public string Phone { get; set; }
        public string Email { get; set; }
        public string Passport { get; set; }
        public string Image { get; set; }
        public string Facebook { get; set; }
        public string Insta { get; set; }
        public string Twitter { get; set; }
        public Nullable<int> Level { get; set; }
        public string Description { get; set; }
        public Nullable<int> User_ID { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Class> Classes { get; set; }
        public virtual LevelCoach LevelCoach { get; set; }
        public virtual User User { get; set; }
    }
}
