namespace GambitoAPI.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class TMCENTROS
    {
        [Key]
        public int Id_Centro { get; set; }

        [StringLength(4)]
        public string CodigoCentro { get; set; }

        public int? NEmpleados { get; set; }

        [StringLength(50)]
        public string DirCiudad { get; set; }

        [StringLength(50)]
        public string Zona { get; set; }
    }
}
