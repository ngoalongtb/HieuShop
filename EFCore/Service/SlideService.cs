using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using EFCore.DB;
using PagedList;

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
        public IEnumerable<Slide> listAll(string searchString, int page, int pageSize)
        {

            IQueryable<Slide> model = db.Slide;
            if (!string.IsNullOrEmpty(searchString))
            {
                model = model.Where(x => x.Name.Contains(searchString) || x.Link.Contains(searchString));
            }

            return model.OrderBy(x => x.ID).ToPagedList(page, pageSize);
        }
        public bool Delete(long ID)
        {
            try
            {
                var obj = db.Slide.Where(x => x.ID == ID).FirstOrDefault();
                db.Slide.Remove(obj);
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
