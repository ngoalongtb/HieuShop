using System;
using System.Data.Entity;
using System.Net;
using System.Web;
using System.Web.Mvc;
using EFCore.DB;
using EFCore.Service;

namespace DoAn.Areas.Admin.Controllers
{
    public class MenuController : BaseController
    {
        private ShopDB db = new ShopDB();
        private MenuService MenuService = new MenuService();

        // GET: Admin/Products
        public ActionResult Index(string searchString, int page = 1, int pageSize = 10)
        {
            var result = MenuService.listAll(searchString, page, pageSize);
            ViewBag.SearchString = searchString;
            return View(result);
        }
        public ActionResult Delete (long ID)
        {
            var reuslt = MenuService.Delete(ID);
            if (reuslt) return Json("1", JsonRequestBehavior.AllowGet);
            return Json("0", JsonRequestBehavior.AllowGet);
        }
        public ActionResult Create()
        {
            return View();
        }
        public ActionResult CreateModel(Menu Model)
        {
            try
            {
                db.Menu.Add(Model);
                db.SaveChanges();
            }
            catch (Exception ex)
            {
                throw;
            }
            return RedirectToAction("Index");
        }
        public ActionResult Edit(long? ID)
        {
            var model = MenuService.getById(ID ?? 0);
            return View(model);
        }
        public ActionResult EditModel([Bind(Include = "ID,Text,Link,DisplayOder,Target,Tatus,TypeID")]Menu Model)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    db.Entry(Model).State = EntityState.Modified;
                    db.SaveChanges();
                }
            }
            catch (Exception ex)
            {
                throw;
            }
            return RedirectToAction("Index");
        }
    }
}
