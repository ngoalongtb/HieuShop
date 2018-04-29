using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using EFCore.DB;

namespace DoAn.Controllers
{
    public class DemoController : Controller
    {
        private ShopDB db = new ShopDB();
        // GET: Demo
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult demo()
        {
            var list = db.User.ToList();
            return Json(list, JsonRequestBehavior.AllowGet);
        }
    }
}