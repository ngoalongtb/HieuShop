using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EFCore.common
{
    public class OrderModel
    {
        public long ID { get; set; }

        public DateTime? CreatedDate { get; set; }

        public long? CustomerID { get; set; }

        public string ShipName { get; set; }

        public string ShipMobile { get; set; }

        public string ShipAddress { get; set; }

        public string ShipEmail { get; set; }

        public long ProductID { get; set; }

        public int? Quantity { get; set; }

        public decimal? Price { get; set; }
        public bool Status { get; set; }
    }
}