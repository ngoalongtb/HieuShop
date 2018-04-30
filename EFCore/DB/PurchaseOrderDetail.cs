namespace EFCore.DB
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("PurchaseOrderDetail")]
    public partial class PurchaseOrderDetail
    {
        public PurchaseOrderDetail()
        {

        }

        public long ID { get; set; }

        public long? ProductID { get; set; }

        public int? Quantity { get; set; }

        public long? PurchaseOrderID { get; set; }

        public decimal? Price { get; set; }

        public decimal? SumPrice { get; set; }

        public virtual PurchaseOrder PurchaseOrder { get; set; }

        public virtual Product Product { get; set; }
    }
}
