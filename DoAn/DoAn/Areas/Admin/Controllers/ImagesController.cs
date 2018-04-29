using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using EFCore.DB;
using System.Drawing;

namespace DoAn.Areas.Admin.Controllers
{
    public class ImagesController : BaseController
    {
        // GET: Admin/Images
        private ShopDB db = null;
        public ImagesController()
        {
            db = new ShopDB();
        }
        public ActionResult Index()
        {
            return View(db.Images.ToList());
        }
        public ActionResult Create()
        {
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(Images img, HttpPostedFileBase file)
        {
            if (ModelState.IsValid)
            {
                if (file != null)
                {
                    file.SaveAs(HttpContext.Server.MapPath("~/assets/Admin/images/")
                                                          + file.FileName);
                    img.Name = file.FileName;
                }
                db.Images.Add(img);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(img);
        }
    }
}