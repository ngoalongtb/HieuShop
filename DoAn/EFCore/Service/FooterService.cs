using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using EFCore.DB;

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

    }
}
