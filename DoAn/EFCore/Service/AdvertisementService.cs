using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using EFCore.DB;

namespace EFCore.Service
{
   public class AdvertisementService
    {
       private ShopDB db = null;
       public AdvertisementService()
       {
           db = new ShopDB();
       }
      public List<advertisement> GetAll()
       {
           return db.advertisement.ToList();
       }
    }
}
