using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using EFCore.DB;
using EFCore.common;
namespace EFCore.Service
{

    public class LoginService
    {
        private ShopDB db = null;
        public LoginService()
        {
            db = new ShopDB();
        }
        public int Login(string userName, string passWord, bool isLoginAdmin = false)
        {
            var result = db.User.SingleOrDefault(o => o.UserName == userName);
            if (result == null)
            {
                return (int)CommonConstants.eloi.user;//sai user
            }
            else
            {
                if (isLoginAdmin == true)
                {
                    var groupID = db.Role.Where(o => (o.Name == CommonConstants.ADMIN_GROUP || o.Name == CommonConstants.MOD_GROUP) && result.roleID==o.ID).AsQueryable();

                    if (groupID.Count()>0)
                    {
                        if (result.Status == false)
                        {
                            return (int)CommonConstants.eloi.clock;//tài khoản đã bị khóa
                        }
                        else
                        {
                            if (result.Password == passWord)
                                return (int)CommonConstants.eloi.thanhcong;//thành công
                            else
                                return (int)CommonConstants.eloi.pass;//sai pass
                        }
                    }
                    else
                    {
                        return (int)CommonConstants.eloi.role;// bạn không có quyền 
                    }
                }
                else
                {
                    if (result.Status == false)
                    {
                        return (int)CommonConstants.eloi.clock;//tài khoản đã bị khóa
                    }
                    else
                    {
                        if (result.Password == passWord)
                            return (int)CommonConstants.eloi.thanhcong;
                        else
                            return (int)CommonConstants.eloi.pass;
                    }
                }
            }

        }
    }
}
