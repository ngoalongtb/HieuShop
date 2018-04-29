using EFCore.DB;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EFCore.Service
{
   public class FeedbackService
   {
       private ShopDB db = null;
       public FeedbackService()
       {
           db = new ShopDB();
       }
       public long InsertFeedBack(Feedback fb)
       {
           try
           {
               db.Feedback.Add(fb);
               db.SaveChanges();
               return fb.ID;
           }
           catch(Exception ex)
           {
               
           }
           return -1;
       }
    }
}
