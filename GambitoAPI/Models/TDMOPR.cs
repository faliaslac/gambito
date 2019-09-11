namespace GambitoAPI.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("TDMOPR")]
    public partial class TDMOPR
    {
        [Key]
        public int Id_MOPR { get; set; }

        public int Id_VEPR { get; set; }

        public int Codigo { get; set; }

        public int Padre { get; set; }

        public int Nivel { get; set; }

        [StringLength(50)]
        public string Descripcion { get; set; }

        public double? ImportePresupuesto { get; set; }

        public double? ImporteFacturado { get; set; }
    }
}
