using EFCore.Service;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DoAn.Controllers
{
    public class MenuController : Controller
    {
        private MenuService MenuService = new MenuService();
        // GET: Menu
        public ActionResult Index()
        {
            var model = MenuService.getAll();
            return View(model);
        }
    }
}