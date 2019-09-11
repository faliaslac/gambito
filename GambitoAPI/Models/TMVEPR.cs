namespace GambitoAPI.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("TMVEPR")]
    public partial class TMVEPR
    {
        [Key]
        public int Id_VEPR { get; set; }

        public int Year { get; set; }

        public int Version { get; set; }

        [Required]
        [StringLength(1)]
        public string Estado { get; set; }

        [Required]
        [StringLength(1)]
        public string CodigoTIPR { get; set; }

        [Required]
        [StringLength(1)]
        public string CodigoPAPR { get; set; }
    }
}
