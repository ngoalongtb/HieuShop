namespace EFCore.DB
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Credential")]
    public partial class Credential
    {
        [Key]
        public long UserGroupID { get; set; }

        [StringLength(50)]
        public string RoleID { get; set; }
    }
}
