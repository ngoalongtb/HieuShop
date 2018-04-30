namespace EFCore.DB
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("PurchaseOrder")]
    public partial class PurchaseOrder
    {
        public PurchaseOrder()
        {
            PurchaseOrderDetails = new HashSet<PurchaseOrderDetail>();
        }
        public long ID { get; set; }

        [Column(TypeName = "date")]
        [Display(Name = "Ngày tạo")]
        public DateTime? CreatedDate { get; set; }

        [StringLength(255)]
        [Display(Name = "Tên nhà cung cấp")]
        public string Vendor { get; set; }

        [StringLength(255)]
        [Display(Name = "Địa chỉ")]
        public string VendorAddress { get; set; }

        [Display(Name = "Ngày nhập hàng")]
        public DateTime? Payment { get; set; }

        [Display(Name = "Ngày giao hàng")]
        public DateTime? Ship { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PurchaseOrderDetail> PurchaseOrderDetails { get; set; }
    }
}
