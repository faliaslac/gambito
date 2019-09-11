namespace GambitoAPI.Models
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class ConexionGambito : DbContext
    {
        public ConexionGambito()
            : base("name=ConexionGambito")
        {
        }

        public virtual DbSet<TPTIPR> TPTIPRs { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<TPTIPR>()
                .Property(e => e.Codigo)
                .IsFixedLength()
                .IsUnicode(false);
        }

        public System.Data.Entity.DbSet<GambitoAPI.Models.TPPAPR> TPPAPRs { get; set; }

        public System.Data.Entity.DbSet<GambitoAPI.Models.TMVEPR> TMVEPRs { get; set; }

        public System.Data.Entity.DbSet<GambitoAPI.Models.TPNIPR> TPNIPRs { get; set; }

        public System.Data.Entity.DbSet<GambitoAPI.Models.CMDB> CMDBs { get; set; }

        public System.Data.Entity.DbSet<GambitoAPI.Models.TMCENTROS> TMCENTROes { get; set; }

        public System.Data.Entity.DbSet<GambitoAPI.Models.VersionesPptoActiva> VersionesPptoActivas { get; set; }

        public System.Data.Entity.DbSet<GambitoAPI.Models.TDMOPR> TDMOPRs { get; set; }

        public System.Data.Entity.DbSet<GambitoAPI.Models.TDMOPR_ACTIVOS> TDMOPR_ACTIVOS { get; set; }

        public System.Data.Entity.DbSet<GambitoAPI.Models.TDMOFA> TDMOFAs { get; set; }

        public System.Data.Entity.DbSet<GambitoAPI.Models.DetalleFactura> DetalleFacturas { get; set; }

        public System.Data.Entity.DbSet<GambitoAPI.Models.TMPROVEEDOR> TMPROVEEDORs { get; set; }

        public System.Data.Entity.DbSet<GambitoAPI.Models.BI_BATCALC> BI_BATCALC { get; set; }
    }
}
