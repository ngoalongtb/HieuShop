using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using EFCore.DB;
using EFCore.common;
using PagedList;
namespace EFCore.Service
{
  public  class OrdersService
    {
      private ShopDB db = new ShopDB();
      public IEnumerable<OrderModel> GetJoin(int page, int pageSize)
      {
          var result = (from O in db.Order
                       join D in db.OrderDetail on O.ID equals D.OrderID
                       select new OrderModel { ID = O.ID,
                                               CreatedDate=O.CreatedDate,
                                               CustomerID=O.CustomerID,
                                               ShipName=O.ShipName,
                                               ShipMobile=O.ShipMobile,
                                               ShipAddress=O.ShipAddress,
                                               ShipEmail=O.ShipEmail,
                                               ProductID=D.ProductID,
                                               Quantity=D.Quantity,
                                               Price=D.Price,
                                               Status = O.Status ?? false
                       }).OrderByDescending(o => o.CreatedDate).ToPagedList(page, pageSize);
          return result;

      }
      public long Insert(Order order)
      {
          db.Order.Add(order);
          db.SaveChanges();
          return order.ID;
      }
      public bool InsertDetail(OrderDetail detail)
        {
            try
            {
                db.OrderDetail.Add(detail);
                db.SaveChanges();
                return true;
            }
            catch(Exception e)
            {
                return false;

            }
        }
    }
}
