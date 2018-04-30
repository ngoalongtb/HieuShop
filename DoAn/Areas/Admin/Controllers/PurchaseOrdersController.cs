using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using EFCore.DB;

namespace DoAn.Areas.Admin.Controllers
{
    public class PurchaseOrdersController : BaseController
    {
        private ShopDB db = new ShopDB();

        // GET: Admin/PurchaseOrders
        public ActionResult Index()
        {
            //var model = categories.ListAllPaging(searchString, page, pageSize);
            //ViewBag.SearchString = searchString;
            var model = db.PurchaseOrder.ToList();
            return View(model);
        }

        // GET: Admin/PurchaseOrders/Details/5
        public ActionResult Details(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            PurchaseOrder purchaseOrder = db.PurchaseOrder.Find(id);
            if (purchaseOrder == null)
            {
                return HttpNotFound();
            }
            return View(purchaseOrder);
        }

        // GET: Admin/PurchaseOrders/Payments/5
        public ActionResult Payments(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            PurchaseOrder purchaseOrder = db.PurchaseOrder.Find(id);
            purchaseOrder.Ship = DateTime.Now;
            db.SaveChanges();
            if (purchaseOrder == null)
            {
                return HttpNotFound();
            }
            return RedirectToAction("Index");
        }

        // GET: Admin/PurchaseOrders/Ship/5
        public ActionResult Ship(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            PurchaseOrder purchaseOrder = db.PurchaseOrder.Find(id);
            purchaseOrder.Ship = DateTime.Now;

            foreach (var item in purchaseOrder.PurchaseOrderDetails)
            {
                var product = db.Product.Find(item.ProductID);
                if(item.Quantity != null)
                {
                    product.Quantity += item.Quantity.Value;
                }
            }
            db.SaveChanges();
            if (purchaseOrder == null)
            {
                return HttpNotFound();
            }
            return RedirectToAction("Index");
        }

        // GET: Admin/PurchaseOrders/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Admin/PurchaseOrders/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(PurchaseOrder purchaseOrder)
        {
            if (ModelState.IsValid)
            {
                purchaseOrder.CreatedDate = DateTime.Now;

                foreach (var item in purchaseOrder.PurchaseOrderDetails)
                {
                    item.SumPrice = item.Quantity * item.Price;
                }

                db.PurchaseOrder.Add(purchaseOrder);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(purchaseOrder);
        }

        // GET: Admin/PurchaseOrders/Edit/5
        public ActionResult Edit(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            PurchaseOrder purchaseOrder = db.PurchaseOrder.Find(id);
            if (purchaseOrder == null)
            {
                return HttpNotFound();
            }
            return View(purchaseOrder);
        }

        // POST: Admin/PurchaseOrders/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ID,CreatedDate,Vendor,VendorAddress,Payment,Ship")] PurchaseOrder purchaseOrder)
        {
            if (ModelState.IsValid)
            {
                db.Entry(purchaseOrder).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(purchaseOrder);
        }

        // GET: Admin/PurchaseOrders/Delete/5
        public ActionResult Delete(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            PurchaseOrder purchaseOrder = db.PurchaseOrder.Find(id);
            if (purchaseOrder == null)
            {
                return HttpNotFound();
            }
            return View(purchaseOrder);
        }

        // POST: Admin/PurchaseOrders/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(long id)
        {
            PurchaseOrder purchaseOrder = db.PurchaseOrder.Find(id);
            db.PurchaseOrder.Remove(purchaseOrder);
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
    }
}
