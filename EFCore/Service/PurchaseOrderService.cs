using EFCore.DB;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EFCore.Service
{
    public class PurchaseOrderService
    {
        ShopDB db = null;
        public PurchaseOrderService()
        {
            db = new ShopDB();
        }
        public IEnumerable<PurchaseOrder> ListAllPaging(string searchString, int page, int pageSize)
        {
            IQueryable<PurchaseOrder> model = db.PurchaseOrder;
            if (!string.IsNullOrEmpty(searchString))
            {
                model = model.Where(x => x.ID.ToString().Contains(searchString));
            }
            //var result = model.OrderByDescending(x => x.ID).ToPagedList(page, pageSize);
            //return result;//.OrderByDescending(x => x.ID).ToPagedList(page, pageSize);

            return null;
        }
    }
}
