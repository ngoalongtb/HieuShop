using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using EFCore.DB;
using EFCore.Service;
using System.Net;

namespace DoAn.Areas.Admin.Controllers
{
    public class OrdersController : BaseController
    {
        private OrdersService orderService = new OrdersService();
        private ShopDB db = new ShopDB();
        // GET: Admin/Orders
        public ActionResult Index(string searchString, int page = 1, int pageSize = 4 )
        {
            ViewBag.Message = TempData["Message"];
            var result = orderService.getAll(page, pageSize);
            return View(result);
        }
        public ActionResult Edit (long id)
        {
            var model = orderService.getById(id);
            return View(model);
        }

        // GET: Admin/Orders/Payments/5
        public ActionResult Payments(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Order order = db.Order.Find(id);
            
            if (order == null)
            {
                return HttpNotFound();
            }
            order.Ship = DateTime.Now;
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        // GET: Admin/PurchaseOrders/Ship/5
        public ActionResult Ship(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Order order = db.Order.Find(id);
            order.Ship = DateTime.Now;

            List<OrderDetail> orderDetails = db.OrderDetail.Where(x => x.OrderID == order.ID).ToList();

            foreach (var item in orderDetails)
            {
                var product = db.Product.Find(item.ProductID);

                if(item.Quantity > product.Quantity)
                {
                    TempData["Message"] = "Sản phẩm " + product.Name + " đã hết hàng";
                    return RedirectToAction("Index");
                }

                if (item.Quantity != null)
                {
                    product.Quantity -= item.Quantity.Value;
                }
            }
            
            if (order == null)
            {
                return HttpNotFound();
            }
            db.SaveChanges();
            return RedirectToAction("Index");
        }
    }
}