namespace GambitoAPI.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("TPNIPR")]
    public partial class TPNIPR
    {
        [Key]
        public int Id_NIPR { get; set; }

        [Required]
        [StringLength(1)]
        public string CodTIPR { get; set; }

        [Required]
        [StringLength(1)]
        public string CodPAPR { get; set; }

        public int Codigo { get; set; }

        public int Padre { get; set; }

        public int Nivel { get; set; }

        [StringLength(50)]
        public string Descripcion { get; set; }

        [StringLength(4)]
        public string CentroReparto { get; set; }

        [StringLength(2)]
        public string CIReparto { get; set; }
    }
}
