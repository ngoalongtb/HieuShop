using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using EFCore.DB;
using EFCore.Service;
namespace DoAn.Areas.Admin.Controllers
{
    public class OrdersController : BaseController
    {
        private OrdersService orderService = new OrdersService();
        // GET: Admin/Orders
        public ActionResult Index(string searchString, int page = 1, int pageSize = 4 )
        {
            var result = orderService.getAll(page, pageSize);
            return View(result);
        }
        public ActionResult Edit (long id)
        {
            var model = orderService.getById(id);
            return View(model);
        }
    }
}