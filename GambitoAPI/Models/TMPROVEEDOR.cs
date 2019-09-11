namespace GambitoAPI.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("TMPROVEEDOR")]
    public partial class TMPROVEEDOR
    {
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int Id_Prov { get; set; }

        [Key]
        [StringLength(10)]
        public string NIF { get; set; }

        [StringLength(50)]
        public string Nombre { get; set; }

        [StringLength(50)]
        public string Localidad { get; set; }
    }
}
