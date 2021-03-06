﻿using System.Data.Entity;
using System.Net;
using System.Web;
using System.Web.Mvc;
using EFCore.DB;
using EFCore.Service;
using System.Linq;
using System.Collections.Generic;

namespace DoAn.Areas.Admin.Controllers
{
    public class ProductsController : BaseController
    {
        private ShopDB db = new ShopDB();
        private ProductsService productService = new ProductsService();

        // GET: Admin/Products
        public ActionResult Index(string searchString, int page = 1, int pageSize = 3)
        {
            var result = productService.listAll(searchString, page, pageSize);
            ViewBag.SearchString = searchString;
            return View(result);
        }

        // GET: Admin/Products/Details/5
        public ActionResult Details(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Product product = db.Product.Find(id);
            if (product == null)
            {
                return HttpNotFound();
            }
            return View(product);
        }

        // GET: Admin/Products/Create
        public ActionResult Create()
        {
            SetViewBag();
            return View();
        }

        // POST: Admin/Products/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ID,Name,Code,MetaTitle,Description,Image,MoreImages,Price,PromotionPrice,IncludedVAT,Quantity,CategoryID,Detail,Warranty,CreatedDate,CreatedBy,ModifiedDate,ModifiedBy,MetaKeywords,MetaDescriptions,Status,TopHot,ViewCount")] Product product, HttpPostedFileBase file)
        {
            if (file != null)
            {
                file.SaveAs(HttpContext.Server.MapPath("~/assets/Admin/images/")
                                                      + file.FileName);
                product.Image = "/assets/Admin/images/" + file.FileName;
            }
            SetViewBag(product.CategoryID);
            if (ModelState.IsValid)
            {
                db.Product.Add(product);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(product);
        }

        // GET: Admin/Products/Edit/5
        public ActionResult Edit(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Product product = db.Product.Find(id);
            SetViewBag(product.CategoryID);
            if (product == null)
            {
                return HttpNotFound();
            }
            return View(product);
        }

        // POST: Admin/Products/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ID,Name,Code,MetaTitle,Description,Image,MoreImages,Price,PromotionPrice,IncludedVAT,Quantity,CategoryID,Detail,Warranty,CreatedDate,CreatedBy,ModifiedDate,ModifiedBy,MetaKeywords,MetaDescriptions,Status,TopHot,ViewCount")] Product product)
        {
            SetViewBag(product.CategoryID);
            if (ModelState.IsValid)
            {
                db.Entry(product).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(product);
        }

        // GET: Admin/Products/Delete/5
        public ActionResult Delete(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Product product = db.Product.Find(id);
            if (product == null)
            {
                return HttpNotFound();
            }
            return View(product);
        }

        // POST: Admin/Products/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(long id)
        {
            Product product = db.Product.Find(id);
            db.Product.Remove(product);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
        public void SetViewBag(long? selectedId = null)
        {
            var dao = new CategoriesSrvice();
            ViewBag.CategoryID = new SelectList(dao.ListAll(), "ID", "Name", selectedId);
        }

        public ActionResult ProductAPI()
        {
            //.Select(x => new { x.Name, x.ID })
            var products = db.Product.ToList();

            List<string> result = new List<string>();
            foreach (var item in products)
            {
                result.Add(item.Name + "-" + item.ID);
            }
            return Json(result, JsonRequestBehavior.AllowGet);
        }
        public ActionResult ProductDetailAPI(long? id)
        {
            Product product = db.Product.Find(id);
            return Json(new
            {
                Name = product.Name,
                Image = product.Image,
                Price = product.Price,
                Type = product.CategoryID
            }, JsonRequestBehavior.AllowGet);
        }

    }
}
