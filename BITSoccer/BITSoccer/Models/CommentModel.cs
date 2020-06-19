using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace BITSoccer.Models
{
    public class CommentModel
    {
        public int CommentID { get; set; }
        public int UserID { get; set; }
        public int ClassID { get; set; }
        public int NewsID { get; set; }
        [Required]
        public string Content { get; set; }
        public int RootCmtID { get; set; }
        public int RepToCmtID { get; set; }
        public DateTime PostTime { get; set; }

    }
}