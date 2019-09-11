namespace GambitoAPI.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class DetalleFactura
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int IdMOFA { get; set; }

        [StringLength(50)]
        public string Nivel { get; set; }

        public double? ImportePresupuesto { get; set; }

        [StringLength(50)]
        public string Proveedor { get; set; }

        [Column(TypeName = "smalldatetime")]
        public DateTime? FecFactura { get; set; }

        [Column(TypeName = "smalldatetime")]
        public DateTime? FecPago { get; set; }

        public double? ImpBruto { get; set; }

        public double? Impuesto { get; set; }

        public double? ImpNeto { get; set; }

        [StringLength(100)]
        public string Concepto { get; set; }
    }
}
