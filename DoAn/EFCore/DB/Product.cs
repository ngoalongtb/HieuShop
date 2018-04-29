namespace EFCore.DB
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Product")]
    public partial class Product
    {
        public long ID { get; set; }

        [StringLength(250)]
        public string Name { get; set; }
        [StringLength(250)]
        public string MetaTitle { get; set; }

        [StringLength(50)]
        public string Description { get; set; }

        [StringLength(250)]
        public string Image { get; set; }

        [StringLength(500)]
        public string MoreImages { get; set; }

        public decimal? Price { get; set; }

        public decimal? PromotionPrice { get; set; }

        public bool? IncludedVAT { get; set; }

        public int Quantity { get; set; }

        public long? CategoryID { get; set; }

        [StringLength(250)]
        public string Detail { get; set; }

        public int? Warranty { get; set; }

        [Column(TypeName = "date")]
        public DateTime? CreatedDate { get; set; }

        [StringLength(50)]
        public string CreatedBy { get; set; }

        [Column(TypeName = "date")]
        public DateTime? ModifiedDate { get; set; }

        [StringLength(50)]
        public string ModifiedBy { get; set; }

        [StringLength(250)]
        public string MetaKeywords { get; set; }

        [StringLength(250)]
        public string MetaDescriptions { get; set; }

        public bool? Status { get; set; }

        [Column(TypeName = "date")]
        public DateTime? TopHot { get; set; }

        public int? ViewCount { get; set; }
    }
}
