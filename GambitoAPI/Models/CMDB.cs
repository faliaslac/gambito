namespace GambitoAPI.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("CMDB")]
    public partial class CMDB
    {
        [Key]
        [StringLength(2)]
        public string TipoCI { get; set; }

        [StringLength(50)]
        public string DescripcionCI { get; set; }

        [StringLength(50)]
        public string DetalleCI { get; set; }

        [StringLength(50)]
        public string FabricanteCI { get; set; }

        [StringLength(50)]
        public string Matricula { get; set; }

        [StringLength(4)]
        public string Centro { get; set; }

        [Column(TypeName = "date")]
        public DateTime? FechaInstalacion { get; set; }

        public int? Unidades { get; set; }
    }
}
