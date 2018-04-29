using System.Data.Entity;
using System.Net;
using System.Web;
using System.Web.Mvc;
using EFCore.DB;
using EFCore.Service;

namespace DoAn.Areas.Admin.Controllers
{
    public class FooterController : BaseController
    {
        private ShopDB db = new ShopDB();
        private FooterService FooterService = new FooterService();
        private TypeFooterService TypeFooterService = new TypeFooterService();

        // GET: Admin/Products
        public ActionResult Index(string searchString, int page = 1, int pageSize = 10)
        {
            var result = FooterService.listAll(searchString, page, pageSize);
            ViewBag.SearchString = searchString;
            ViewBag.ListType = TypeFooterService.getAll();
            return View(result);
        }
        public ActionResult Delete (long ID)
        {
            var reuslt = FooterService.Delete(ID);
            return Index(null, 1, 10);
        }
    }
}
