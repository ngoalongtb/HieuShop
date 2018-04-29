using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using EFCore.DB;
using PagedList;
namespace EFCore.Service
{
   public class AnswerService
    {
       private ShopDB db;
       public AnswerService()
       {
           db = new ShopDB();
       }
       public IEnumerable<Answer> ListAllPaging(int page, int pageSize)
       {
           IQueryable<Answer> model = db.Answer;
           return model.OrderByDescending(x => x.Date).ToPagedList(page, pageSize);
       }
    }
}
