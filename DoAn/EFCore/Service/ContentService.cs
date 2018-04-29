using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using EFCore.DB;
using PagedList;
namespace EFCore.Service
{
    
   public  class ContentService
    {
          private ShopDB db = null;
          public ContentService()
          {
              db=new ShopDB();
          }
          public IEnumerable<Content> ListAllPaging(int page, int pageSize)
          {
              IQueryable<Content> model = db.Content;
              return model.OrderByDescending(x => x.CreatedDate).ToPagedList(page, pageSize);
          }
          public Content GetByID(long id)
          {
              return db.Content.Find(id);
          }
          public List<Tag> ListTag(long contentId)
          {
              var model = (from a in db.Tag
                           join b in db.ContentTag
                           on a.ID equals b.TagID
                           where b.ContentID == contentId
                           select new Tag()
                           {
                               ID = b.TagID ?? 0,
                               Name = a.Name
                           });
              return model.ToList();
          }
          public IEnumerable<Content> ListAllByTag(long? tag, int page, int pageSize)
          {
              var model = (from a in db.Content
                           join b in db.ContentTag
                           on a.ID equals b.ContentID
                           where b.TagID == tag
                           select new
                           {
                               Name = a.Name,
                               MetaTitle = a.MetaTitle,
                               Image = a.Image,
                               Description = a.Description,
                               CreatedDate = a.CreatedDate,
                               CreatedBy = a.CreatedBy,
                               ID = a.ID

                           }).AsEnumerable().Select(x => new Content()
                           {
                               Name = x.Name,
                               MetaTitle = x.MetaTitle,
                               Image = x.Image,
                               Description = x.Description,
                               CreatedDate = x.CreatedDate,
                               CreatedBy = x.CreatedBy,
                               ID = x.ID
                           });
              return model.OrderByDescending(x => x.CreatedDate).ToPagedList(page, pageSize);
          }
          public Tag GetTag(long? id)
          {
              return db.Tag.Find(id);
          }
    }
}
