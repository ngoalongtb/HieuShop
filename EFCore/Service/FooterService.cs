using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using EFCore.DB;
using PagedList;

namespace EFCore.Service
{
    public class FooterService
    {
        private ShopDB db = null;
        public FooterService()
        {
            db = new ShopDB();
        }
        public List<Footer> GetFooter()
        {
            return db.Footer.Where(x => x.Status == true).ToList();
        }
        public IEnumerable<Footer> listAll(string searchString, int page, int pageSize)
        {

            IQueryable<Footer> model = db.Footer;
            if (!string.IsNullOrEmpty(searchString))
            {
                model = model.Where(x => x.Content.Contains(searchString) || x.Title.Contains(searchString));
            }

            return model.OrderBy(x => x.ID).ToPagedList(page, pageSize);
        }
        public bool Delete(long ID)
        {
            try
            {
                var obj = db.Footer.Where(x => x.ID == ID).FirstOrDefault();
                db.Footer.Remove(obj);
                db.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }
    }
}
