using DoAn.Areas.Admin.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using EFCore.Service;
using EFCore.DB;
using EFCore.common;

namespace DoAn.Areas.Admin.Controllers
{
    public class LoginController : Controller
    {
        // GET: Admin/Login
     private   ShopDB db = null;
        public LoginController()
        {
            db = new ShopDB();
        }
        public ActionResult Index()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Login(LoginModel model )
        {
            var dao = new LoginService();
            var result = dao.Login(model.UserName, Encryptor.MD5Hash(model.Password), true);
            if (result == (int)CommonConstants.eloi.thanhcong)
            {
                string pas=Encryptor.MD5Hash(model.Password);
                var userSession = db.User.FirstOrDefault(o => o.UserName == model.UserName && o.Password == pas);
                Session.Add(CommonConstants.USER_SESSION, userSession);
                return RedirectToAction("Index", "Home");
            }
            else if (result == (int)CommonConstants.eloi.user)
                ModelState.AddModelError("", "Tài khoản không tồn tại.");
            else if (result == (int)CommonConstants.eloi.pass)
                ModelState.AddModelError("", "Sai mật khẩu.");
            else if (result == (int)CommonConstants.eloi.role)
                ModelState.AddModelError("", "bạn không có quyền truy cập");
            else if (result == (int)CommonConstants.eloi.clock)
                ModelState.AddModelError("", "Tài khoản của bạn đã bị khóa!");
            return View("Index");
        }
    }
}