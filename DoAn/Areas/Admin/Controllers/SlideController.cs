using System.Data.Entity;
using System.Net;
using System.Web;
using System.Web.Mvc;
using EFCore.DB;
using EFCore.Service;

namespace DoAn.Areas.Admin.Controllers
{
    public class  SlideController : BaseController
    {
        private ShopDB db = new ShopDB();
        private SlideService SlideService = new SlideService();

        // GET: Admin/Products
        public ActionResult Index(string searchString, int page = 1, int pageSize = 10)
        {
            var result = SlideService.listAll(searchString, page, pageSize);
            ViewBag.SearchString = searchString;
            return View(result);
        }
        public ActionResult Delete (long ID)
        {
            var reuslt = SlideService.Delete(ID);
            return Index(null, 1, 10);
        }
    }
}
