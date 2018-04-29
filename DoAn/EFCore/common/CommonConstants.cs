using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EFCore.common
{
    public class CommonConstants
    {
        public static string USER_SESSION = "USER_SESSION";
        public static string MEMBER_GROUP = "MEMBER";
        public static string ADMIN_GROUP = "ADMIN";
        public static string MOD_GROUP = "MOD";
        public static string SESSION_CREDENTIALS = "SESSION_CREDENTIALS";
        public static string CartSession = "CartSession";
        public static string CurrentCulture { set; get; }
        public enum eloi
        {
            thanhcong=0,
            user = 1,
            pass = 2,
            role=3,
            clock=4
        }
        public readonly static Dictionary<int, string> Erro_login = new Dictionary<int, string>()
        {

            { (int)eloi.user, "Sai tên đăng nhap" },
            { (int)eloi.pass, "Sai mật khẩu"}
        };
    }
}