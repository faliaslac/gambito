namespace GambitoAPI.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class BI_BATCALC
    {
        [Key]
        public int IdCalcBI { get; set; }

        public DateTime FecCalculo { get; set; }
    }
}
