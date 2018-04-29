using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using EFCore.Service;
using EFCore.DB;

namespace DoAn.Controllers
{
    public class AnswerController : Controller
    {
        private AnswerService _AnswerService;
        public AnswerController()
        {
            _AnswerService = new AnswerService();
        }
        // GET: Answer
        public ActionResult Index(int page = 1, int pageSize = 10)
        {
            var model = _AnswerService.ListAllPaging(page, pageSize);
            int totalRecord = 0;

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