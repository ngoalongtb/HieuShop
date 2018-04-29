using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using EFCore.Service;
namespace DoAn.Controllers
{
    public class AboutController : Controller
    {
        private AdvertisementService AdvertisementService;
        // GET: About
        public AboutController()
        {
            AdvertisementService = new AdvertisementService();
        }
        public ActionResult Index()
        {
            ViewBag.quangcao = AdvertisementService.GetAll();
            return View();
        }
    }
}