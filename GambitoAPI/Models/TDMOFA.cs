namespace GambitoAPI.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("TDMOFA")]
    public partial class TDMOFA
    {
        [Key]
        public int IdMOFA { get; set; }

        public int IdMOPR { get; set; }

        public int IdProveedor { get; set; }

        [StringLength(10)]
        public string NIFProveedor { get; set; }

        [Column(TypeName = "smalldatetime")]
        public DateTime? FecPago { get; set; }

        [Column(TypeName = "smalldatetime")]
        public DateTime? FecFactura { get; set; }

        public double? ImpBruto { get; set; }

        public double? Impuesto { get; set; }

        public double? ImpNeto { get; set; }

        [StringLength(100)]
        public string Concepto { get; set; }
    }
}
