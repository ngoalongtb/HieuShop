﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using EFCore.Service;
namespace DoAn.Controllers
{
    public class ProductController : Controller
    {
        private ProductsService productService = new ProductsService();
        private productCategoryService productCategoryService = new productCategoryService();
        // GET: Product
        public ActionResult Index(long id)
        {
            var product = productService.ViewDetail(id);
            ViewBag.Category = productCategoryService.ViewDetail(product.CategoryID.Value);
            ViewBag.RelatedProducts = productService.ListRelatedProducts(id);
            return View(product);
        }
        public ActionResult Search(string keyword, int page = 1, int pageSize = 1)
        {
            int totalRecord = 0;
            var model = productService.Search(keyword, ref totalRecord, page, pageSize);

            ViewBag.Total = totalRecord;
            ViewBag.Page = page;
            ViewBag.Keyword = keyword;
            int maxPage = 5;
            int totalPage = 0;

            totalPage = (int)Math.Ceiling((double)(totalRecord / pageSize));
            ViewBag.TotalPage = totalPage;
            ViewBag.MaxPage = maxPage;
            ViewBag.First = 1;
            ViewBag.Last = totalPage;
            ViewBag.Next = page + 1;
            ViewBag.Prev = page - 1;

            return View(model);
        }
        public ActionResult Detail(long id)
        {
            var product = productService.ViewDetail(id);
            ViewBag.Category = productCategoryService.ViewDetail(product.CategoryID.Value);
            ViewBag.RelaProducts = productService.ListRelatedProducts(id);
            return View(product);
        }

        public PartialViewResult ProductCategory()
        {
            var model =  productCategoryService.ListAll();
            return PartialView(model);
        }
        public JsonResult ListName(string q)
        {
            var data = productService.ListName(q);
            return Json(new
            {
                data = data,
                status = true
            }, JsonRequestBehavior.AllowGet);
        }
        public ActionResult Category(long cateId, int page = 1, int pageSize = 8)
        {
            var category =  productCategoryService.ViewDetail(cateId);
            ViewBag.Category = category;
            int totalRecord = 0;
            var model = productService.ListByCategoryId(cateId, ref totalRecord, page, pageSize);

            ViewBag.Total = totalRecord;
            ViewBag.Page = page;

            int maxPage = 5;
            int totalPage = 0;

            totalPage = (int)Math.Ceiling((double)(totalRecord / pageSize));
            ViewBag.TotalPage = totalPage;
            ViewBag.MaxPage = maxPage;
            ViewBag.First = 1;
            ViewBag.Last = totalPage;
            ViewBag.Next = page + 1;
            ViewBag.Prev = page - 1;

            return View(model);
        }
    }
}