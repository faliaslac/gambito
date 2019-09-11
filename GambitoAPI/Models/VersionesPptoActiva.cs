namespace GambitoAPI.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class VersionesPptoActiva
    {
        [Key]
        [Column(Order = 0)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int Id_VEPR { get; set; }

        [Key]
        [Column(Order = 1)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int Year { get; set; }

        [Key]
        [Column(Order = 2)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int Version { get; set; }

        [Key]
        [Column(Order = 3)]
        [StringLength(1)]
        public string Estado { get; set; }

        [StringLength(50)]
        public string Tipo { get; set; }

        [StringLength(50)]
        public string Partida { get; set; }

        [Key]
        [Column(Order = 4)]
        [StringLength(1)]
        public string CodigoPAPR { get; set; }

        [Key]
        [Column(Order = 5)]
        [StringLength(1)]
        public string CodigoTIPR { get; set; }
    }
}
