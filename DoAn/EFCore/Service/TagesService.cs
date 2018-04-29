using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using EFCore.DB;

namespace EFCore.Service
{
   public class TagesService
    {
       private ShopDB db = null;
       public TagesService()
       {
           db = new ShopDB();
       }
       public List<Tag> getAll()
       {
           return db.Tag.ToList();
       }
    }
}
