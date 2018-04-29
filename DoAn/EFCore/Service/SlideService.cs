using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using EFCore.DB;

namespace EFCore.Service
{
   public class SlideService
    {
       private ShopDB db = null;
       public SlideService()
       {
           db = new ShopDB();
       }
       public List<Slide> ListAll()
       {
           return db.Slide.Where(x => x.Status == true).OrderBy(y => y.DisplayOrder).ToList();
       }
    }
}
