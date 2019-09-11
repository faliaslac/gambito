namespace GambitoAPI.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("TPPAPR")]
    public partial class TPPAPR
    {
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int Id_PAPR { get; set; }

        [Key]
        [StringLength(1)]
        public string Codigo { get; set; }

        [StringLength(50)]
        public string Descripcion { get; set; }
    }
}
