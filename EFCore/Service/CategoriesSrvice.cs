using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using EFCore.DB;
using PagedList;
namespace EFCore.Service
{
    public class CategoriesSrvice
    {
        ShopDB db = null;
        public CategoriesSrvice()
        {
            db = new ShopDB();
        }
        public IEnumerable<Category> ListAllPaging(string searchString, int page, int pageSize)
        {
            IQueryable<Category> model = db.Category;
            if (!string.IsNullOrEmpty(searchString))
            {
                model = model.Where(x => x.Name.Contains(searchString) || x.MetaKeywords.Contains(searchString));
            }
            var result = model.OrderByDescending(x => x.ID).ToPagedList(page, pageSize);
            return result;//.OrderByDescending(x => x.ID).ToPagedList(page, pageSize);
            //return model.ToPagedList(page, pageSize);
        }
        public bool? ChangeStatus(long id)
        {
            try
            {
                var user = db.User.Find(id);
                user.Status = !user.Status;
                db.SaveChanges();
                return user.Status;
            }
            catch (Exception ex)
            {

            }
            return null;
        }
        public Category GetByID(long? id)
        {
            return db.Category.Find(id);
        }
        public List<Category> ListAll()
        {
            return db.Category.Where(x => x.Status == true).ToList();
        }
        public long Insert(Category entity)
        {
            try
            {
                db.Category.Add(entity);
                db.SaveChanges();
                return entity.ID;
            }
            catch (Exception ex)
            {

            }
            return -1;
        }
        public Category ViewDetail(long id)
        {
            return db.Category.Where(x=>x.ID==id).FirstOrDefault();
        }
    }
}
