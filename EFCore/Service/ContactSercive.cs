using EFCore.DB;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EFCore.Service
{
  public  class ContactSercive
  {
      private ShopDB db = null;
      public ContactSercive()
      {
          db=new ShopDB();
      }
      public Contact GetActiveContact()
      {
          return db.Contact.FirstOrDefault(o=>o.Status==true) ;
      }
  }
}
