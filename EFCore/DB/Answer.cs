using System;
namespace EFCore.DB
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Answer")]
   public partial class Answer
    {
        [Key]
        public long ID { get; set; }

        public long? Username { get; set; }
        public DateTime? Date { get; set; }
        public string Detail { get; set; }
        public string Title { get; set; }
        public bool? Status { get; set; }
        public long? CountView { get; set; }

    }
}
