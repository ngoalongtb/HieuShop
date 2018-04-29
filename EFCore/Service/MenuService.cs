using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using EFCore.DB;
using PagedList;

namespace EFCore.Service
{
    public class MenuService
    {
        ShopDB db = null;
        public MenuService()
        {
            db = new ShopDB();
        }

        public List<Menu> ListByGroupId(int groupId)
        {
            return db.Menu.Where(x => x.TypeID == groupId && x.Status == true).OrderBy(x => x.DisplayOrder).ToList();
        }
        public List<Menu> getAll()
        {
            return db.Menu.ToList();
        }
        public IEnumerable<Menu> listAll(string searchString, int page, int pageSize)
        {

            IQueryable<Menu> model = db.Menu;
            if (!string.IsNullOrEmpty(searchString))
            {
                model = model.Where(x => x.Text.Contains(searchString) || x.Link.Contains(searchString));
            }

            return model.OrderBy(x => x.ID).ToPagedList(page, pageSize);
        }
        public bool Delete(long ID)
        {
            try
            {
                var obj = db.Menu.Where(x => x.ID == ID).FirstOrDefault();
                db.Menu.Remove(obj);
                db.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }
        public Menu getById(long ID)
        {
            return db.Menu.Where(x => x.ID == ID).FirstOrDefault();
        }
    }
}