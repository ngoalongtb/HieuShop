using EFCore.DB;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EFCore.Service
{
   public class TypeFooterService
    {
       private ShopDB db = null;
       public TypeFooterService()
        {
            db = new ShopDB();
        }
       public List<TypeFooter> getAll()
       {
           return db.TypeFooter.Where(o=>o.Status==true).ToList();
       }
    }
}
