
namespace EFCore.DB
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Images")]
    public partial class Images
    {
        //[DatabaseGenerated(DatabaseGeneratedOption.None)]
        public long ID { get; set; }

        [StringLength(maximumLength: 255)]
        public string Name { get; set; }

        [StringLength(100)]
        public string Mota { get; set; }

          [StringLength(50)]
        public string Title { get; set; }
    }
}
