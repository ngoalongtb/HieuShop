
namespace EFCore.DB
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("TypeFooter")]
    public partial class TypeFooter
    {
        public long ID { get; set; }
        [StringLength(50)]
        public string Name { get; set; }
        public bool? Status { get; set; }
    }
}
