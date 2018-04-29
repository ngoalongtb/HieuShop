﻿using EFCore.DB;
using EFCore.Service;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DoAn.Controllers
{
    public class ContactController : Controller
    {
        private ShopDB db = new ShopDB();
        private ContactSercive productService = new ContactSercive();
        private FeedbackService FeedbackService = new FeedbackService();
        // GET: Contact
        public ActionResult Index()
        {
            var model = productService.GetActiveContact();
            return View(model);
        }
        public JsonResult Send(string name, string mobile, string address, string email, string content)
        {
            var feedback = new Feedback();
            feedback.Name = name;
            feedback.Email = email;
            feedback.CreatedDate = DateTime.Now;
            feedback.Phone = mobile;
            feedback.Content = content;
            feedback.Address = address;

            var id = FeedbackService.InsertFeedBack(feedback);
            if (id > 0)
            {
                return Json(new
                {
                    status = true
                });
                //send mail
            }

            else
                return Json(new
                {
                    status = false
                });

        }
    }
}