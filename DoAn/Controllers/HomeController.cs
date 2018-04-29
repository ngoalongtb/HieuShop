using DoAn.Models;
using EFCore.common;
using EFCore.Service;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DoAn.Controllers
{
    public class HomeController : Controller
    {
        private ProductsService productService = null;
        private TypeFooterService TypeFooterService = null;
        private TagesService TagesService = null;
        public HomeController()
        {
            productService = new ProductsService();
            TypeFooterService=new TypeFooterService();
            TagesService = new TagesService();
        }
        public ActionResult Index()
        {
            ViewBag.Slides = new SlideService().ListAll();
            ViewBag.NewProducts = productService.ListNewProduct(8);
            ViewBag.ListFeatureProducts = productService.ListFeatureProduct(8);
            return View();
        }

        [ChildActionOnly]
        [OutputCache(Duration = 3600 * 24)]
        public ActionResult MainMenu()
        {
            var model = new MenuService().ListByGroupId(2);
            return PartialView(model);
        }
        [ChildActionOnly]
        [OutputCache(Duration = 3600 * 24)]
        public ActionResult TopMenu()
        {
            var model = new MenuService().ListByGroupId(1);
            return PartialView(model);
        }
        [ChildActionOnly]
        public PartialViewResult HeaderCart()
        {
            var cart = Session[CommonConstants.CartSession];
            var list = new List<CartItem>();
            if (cart != null)
            {
                list = (List<CartItem>)cart;
            }

            return PartialView(list);
        }
        //[ChildActionOnly]
        //[OutputCache(Duration = 3600 * 24)]
        public ActionResult Footer()
        {
            var model = new FooterService().GetFooter();
            ViewBag.TypeFooter = TypeFooterService.getAll();
            ViewBag.tages = TagesService.getAll();
            return PartialView(model);
        }
    }
}