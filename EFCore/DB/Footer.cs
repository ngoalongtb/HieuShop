namespace EFCore.DB
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Footer")]
    public partial class Footer
    {
        public long ID { get; set; }

        [StringLength(500)]
        public string Content { get; set; }

        public bool? Status { get; set; }
        public long? Type { get; set; }
        public string Title { get; set; }
    }
}
