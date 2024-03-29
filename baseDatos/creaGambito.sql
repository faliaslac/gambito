USE [master]
GO
/****** Object:  Database [Gambito]    Script Date: 12/09/2019 6:57:19 ******/
CREATE DATABASE [Gambito]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Gambito', FILENAME = N'/var/opt/mssql/data/Gambito.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Gambito_log', FILENAME = N'/var/opt/mssql/data/Gambito_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Gambito] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Gambito].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Gambito] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Gambito] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Gambito] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Gambito] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Gambito] SET ARITHABORT OFF 
GO
ALTER DATABASE [Gambito] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Gambito] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Gambito] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Gambito] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Gambito] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Gambito] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Gambito] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Gambito] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Gambito] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Gambito] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Gambito] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Gambito] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Gambito] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Gambito] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Gambito] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Gambito] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Gambito] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Gambito] SET RECOVERY FULL 
GO
ALTER DATABASE [Gambito] SET  MULTI_USER 
GO
ALTER DATABASE [Gambito] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Gambito] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Gambito] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Gambito] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Gambito] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Gambito] SET QUERY_STORE = OFF
GO
USE [Gambito]
GO
/****** Object:  Table [dbo].[TDMOPR]    Script Date: 12/09/2019 6:57:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TDMOPR](
	[Id_MOPR] [int] IDENTITY(1,1) NOT NULL,
	[Id_VEPR] [int] NOT NULL,
	[Codigo] [int] NOT NULL,
	[Year] [int] NULL,
	[Padre] [int] NOT NULL,
	[Nivel] [int] NOT NULL,
	[Descripcion] [varchar](50) NULL,
	[PadreDescrip] [varchar](50) NULL,
	[ImportePresupuesto] [float] NULL,
	[ImporteFacturado] [float] NULL,
	[CentroReparto] [char](4) NULL,
	[CIReparto] [char](2) NULL,
 CONSTRAINT [PK_TDMOPR] PRIMARY KEY CLUSTERED 
(
	[Id_MOPR] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TMPROVEEDOR]    Script Date: 12/09/2019 6:57:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TMPROVEEDOR](
	[Id_Prov] [int] IDENTITY(1,1) NOT NULL,
	[NIF] [varchar](10) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Localidad] [varchar](50) NULL,
 CONSTRAINT [PK_TMPROVEEDOR] PRIMARY KEY CLUSTERED 
(
	[NIF] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TDMOFA]    Script Date: 12/09/2019 6:57:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TDMOFA](
	[IdMOFA] [int] IDENTITY(1,1) NOT NULL,
	[IdMOPR] [int] NOT NULL,
	[IdProveedor] [int] NOT NULL,
	[NIFProveedor] [nchar](10) NULL,
	[FecPago] [smalldatetime] NULL,
	[FecFactura] [smalldatetime] NULL,
	[ImpBruto] [float] NULL,
	[Impuesto] [float] NULL,
	[ImpNeto] [float] NULL,
	[Concepto] [varchar](100) NULL,
 CONSTRAINT [PK_TDMOFA] PRIMARY KEY CLUSTERED 
(
	[IdMOFA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[CargaFACPROV]    Script Date: 12/09/2019 6:57:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CargaFACPROV]
AS
SELECT        dbo.TDMOFA.NIFProveedor AS [NIF Proveedor], dbo.TDMOFA.FecPago, dbo.TDMOFA.FecFactura, dbo.TDMOFA.ImpBruto, dbo.TDMOFA.Impuesto, dbo.TDMOFA.ImpNeto, dbo.TDMOFA.Concepto AS [Concepto Factura], 
                         dbo.TDMOPR.Id_VEPR, dbo.TDMOPR.Codigo, dbo.TDMOPR.Padre, dbo.TDMOPR.Nivel, dbo.TMPROVEEDOR.Nombre, dbo.TDMOPR.Year, dbo.TMPROVEEDOR.Localidad
FROM            dbo.TDMOFA INNER JOIN
                         dbo.TDMOPR ON dbo.TDMOFA.IdMOPR = dbo.TDMOPR.Id_MOPR INNER JOIN
                         dbo.TMPROVEEDOR ON dbo.TDMOFA.IdProveedor = dbo.TMPROVEEDOR.Id_Prov
GO
/****** Object:  Table [dbo].[TPNIPR]    Script Date: 12/09/2019 6:57:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TPNIPR](
	[Id_NIPR] [int] IDENTITY(1,1) NOT NULL,
	[CodTIPR] [char](1) NOT NULL,
	[CodPAPR] [char](1) NOT NULL,
	[Codigo] [int] NOT NULL,
	[Padre] [int] NOT NULL,
	[Nivel] [int] NOT NULL,
	[Descripcion] [nvarchar](50) NULL,
	[CentroReparto] [char](4) NULL,
	[CIReparto] [char](2) NULL,
 CONSTRAINT [PK_TPNIPR] PRIMARY KEY CLUSTERED 
(
	[Id_NIPR] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[NIPR_CODPAPA]    Script Date: 12/09/2019 6:57:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[NIPR_CODPAPA]
AS
SELECT        dbo.TPNIPR.Id_NIPR, dbo.TPNIPR.CodTIPR, dbo.TPNIPR.CodPAPR, dbo.TPNIPR.Codigo, dbo.TPNIPR.Padre, dbo.TPNIPR.Nivel, dbo.TPNIPR.Descripcion, dbo.TPNIPR.CentroReparto, dbo.TPNIPR.CIReparto, 
                         PAPA.Descripcion AS CODPAPA
FROM            dbo.TPNIPR LEFT OUTER JOIN
                         dbo.TPNIPR AS PAPA ON dbo.TPNIPR.Padre = PAPA.Codigo AND dbo.TPNIPR.CodTIPR = PAPA.CodTIPR AND dbo.TPNIPR.CodPAPR = PAPA.CodPAPR
WHERE        (dbo.TPNIPR.Nivel = 99)
GO
/****** Object:  Table [dbo].[TMVEPR]    Script Date: 12/09/2019 6:57:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TMVEPR](
	[Id_VEPR] [int] IDENTITY(1,1) NOT NULL,
	[Year] [int] NOT NULL,
	[Version] [int] NOT NULL,
	[Estado] [char](1) NOT NULL,
	[CodigoTIPR] [char](1) NOT NULL,
	[CodigoPAPR] [char](1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_VEPR] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VistaSeguimiento]    Script Date: 12/09/2019 6:57:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VistaSeguimiento]
AS
SELECT        dbo.TDMOPR.Descripcion, dbo.TDMOPR.ImportePresupuesto, dbo.TDMOFA.NIFProveedor, dbo.TDMOFA.FecFactura, dbo.TDMOFA.ImpNeto, dbo.TDMOFA.Concepto, dbo.TDMOPR.Year, dbo.TMPROVEEDOR.Nombre, 
                         dbo.TMVEPR.CodigoTIPR, dbo.TMVEPR.CodigoPAPR, dbo.TDMOPR.PadreDescrip
FROM            dbo.TMVEPR INNER JOIN
                         dbo.TDMOPR ON dbo.TMVEPR.Id_VEPR = dbo.TDMOPR.Id_VEPR LEFT OUTER JOIN
                         dbo.TMPROVEEDOR INNER JOIN
                         dbo.TDMOFA ON dbo.TMPROVEEDOR.Id_Prov = dbo.TDMOFA.IdProveedor ON dbo.TDMOPR.Id_MOPR = dbo.TDMOFA.IdMOPR
GO
/****** Object:  Table [dbo].[TDCMDB]    Script Date: 12/09/2019 6:57:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TDCMDB](
	[IdCIIN] [int] IDENTITY(1,1) NOT NULL,
	[TipoCI] [char](2) NULL,
	[Matricula] [nvarchar](50) NULL,
	[Centro] [char](4) NULL,
	[Unidades] [int] NULL,
	[FechaInstalacion] [date] NULL,
 CONSTRAINT [PK_TDCIIN] PRIMARY KEY CLUSTERED 
(
	[IdCIIN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TMCITI]    Script Date: 12/09/2019 6:57:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TMCITI](
	[IdCITI] [int] IDENTITY(1,1) NOT NULL,
	[TipoCI] [char](2) NOT NULL,
	[DescripcionCI] [varchar](50) NULL,
	[DetalleCI] [varchar](50) NULL,
	[FabricanteCI] [varchar](50) NULL,
 CONSTRAINT [PK_TMCITI] PRIMARY KEY CLUSTERED 
(
	[IdCITI] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[CMDB]    Script Date: 12/09/2019 6:57:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CMDB]
AS
SELECT DISTINCT dbo.TMCITI.TipoCI, dbo.TMCITI.DescripcionCI, dbo.TMCITI.DetalleCI, dbo.TMCITI.FabricanteCI, dbo.TDCMDB.Matricula, dbo.TDCMDB.Centro, dbo.TDCMDB.FechaInstalacion, dbo.TDCMDB.Unidades
FROM            dbo.TMCITI INNER JOIN
                         dbo.TDCMDB ON dbo.TMCITI.TipoCI = dbo.TDCMDB.TipoCI
GO
/****** Object:  View [dbo].[DetalleFacturas]    Script Date: 12/09/2019 6:57:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[DetalleFacturas]
AS
SELECT        dbo.TDMOFA.IdMOFA, dbo.TDMOPR.Descripcion AS Nivel, dbo.TDMOPR.ImportePresupuesto, dbo.TMPROVEEDOR.Nombre AS Proveedor, dbo.TDMOFA.FecFactura, dbo.TDMOFA.FecPago, dbo.TDMOFA.ImpBruto, 
                         dbo.TDMOFA.Impuesto, dbo.TDMOFA.ImpNeto, dbo.TDMOFA.Concepto
FROM            dbo.TDMOFA INNER JOIN
                         dbo.TDMOPR ON dbo.TDMOFA.IdMOPR = dbo.TDMOPR.Id_MOPR INNER JOIN
                         dbo.TMPROVEEDOR ON dbo.TDMOFA.IdProveedor = dbo.TMPROVEEDOR.Id_Prov
GO
/****** Object:  Table [dbo].[TPTIPR]    Script Date: 12/09/2019 6:57:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TPTIPR](
	[Id_TIPR] [int] IDENTITY(1,1) NOT NULL,
	[Codigo] [char](1) NOT NULL,
	[Descripcion] [nvarchar](50) NULL,
 CONSTRAINT [PK_TPTIPR] PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TPPAPR]    Script Date: 12/09/2019 6:57:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TPPAPR](
	[Id_PAPR] [int] IDENTITY(1,1) NOT NULL,
	[Codigo] [char](1) NOT NULL,
	[Descripcion] [nvarchar](50) NULL,
 CONSTRAINT [PK_TPPAPR] PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VersionesPptoActivas]    Script Date: 12/09/2019 6:57:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VersionesPptoActivas]
AS
SELECT        TOP (100) PERCENT dbo.TMVEPR.Id_VEPR, dbo.TMVEPR.Year, dbo.TMVEPR.Version, dbo.TMVEPR.Estado, dbo.TPTIPR.Descripcion AS Tipo, dbo.TPPAPR.Descripcion AS Partida, dbo.TMVEPR.CodigoPAPR, 
                         dbo.TMVEPR.CodigoTIPR
FROM            dbo.TPTIPR INNER JOIN
                         dbo.TMVEPR ON dbo.TPTIPR.Codigo = dbo.TMVEPR.CodigoTIPR INNER JOIN
                         dbo.TPPAPR ON dbo.TMVEPR.CodigoPAPR = dbo.TPPAPR.Codigo
WHERE        (dbo.TMVEPR.Estado = 'A')
ORDER BY dbo.TMVEPR.Year, Tipo, Partida
GO
/****** Object:  View [dbo].[TDMOPR_ACTIVOS]    Script Date: 12/09/2019 6:57:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[TDMOPR_ACTIVOS]
AS
SELECT        dbo.TDMOPR.Id_MOPR, dbo.TDMOPR.Id_VEPR, dbo.TDMOPR.Codigo, dbo.TDMOPR.Padre, dbo.TDMOPR.Nivel, dbo.TDMOPR.Descripcion, dbo.TDMOPR.ImportePresupuesto, dbo.TDMOPR.ImporteFacturado, 
                         dbo.TPPAPR.Descripcion AS DESPAPR, dbo.TPTIPR.Descripcion AS DESTIPR, dbo.TMVEPR.Year
FROM            dbo.TDMOPR INNER JOIN
                         dbo.TMVEPR ON dbo.TDMOPR.Id_VEPR = dbo.TMVEPR.Id_VEPR INNER JOIN
                         dbo.TPPAPR ON dbo.TMVEPR.CodigoPAPR = dbo.TPPAPR.Codigo INNER JOIN
                         dbo.TPTIPR ON dbo.TMVEPR.CodigoTIPR = dbo.TPTIPR.Codigo
WHERE        (dbo.TMVEPR.Estado = 'A')
GO
/****** Object:  Table [dbo].[BI_BATCALC]    Script Date: 12/09/2019 6:57:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BI_BATCALC](
	[IdCalcBI] [int] IDENTITY(1,1) NOT NULL,
	[FecCalculo] [datetime] NOT NULL,
 CONSTRAINT [PK_BI_BATCOPIA] PRIMARY KEY CLUSTERED 
(
	[IdCalcBI] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BI_FACPROV]    Script Date: 12/09/2019 6:57:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BI_FACPROV](
	[Id_FacPro] [int] IDENTITY(1,1) NOT NULL,
	[Year] [char](4) NULL,
	[TIPR] [char](1) NULL,
	[PAPR] [char](1) NULL,
	[NivelPadre] [int] NULL,
	[NivelDetalle] [int] NULL,
	[DescPadre] [varchar](50) NULL,
	[DescHijo] [varchar](50) NULL,
	[Presupuesto] [float] NULL,
	[NIF] [char](10) NULL,
	[Nombre] [varchar](50) NULL,
	[ImporteBruto] [float] NULL,
	[Impuesto] [float] NULL,
	[ImporteNeto] [float] NULL,
	[TipoImpuesto] [float] NULL,
	[FecFactura] [date] NULL,
	[FecPago] [date] NULL,
	[Concepto] [varchar](50) NULL,
	[FecCalculo] [datetime] NULL,
 CONSTRAINT [PK_BI_FACPROV] PRIMARY KEY CLUSTERED 
(
	[Id_FacPro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BI_REFACEN]    Script Date: 12/09/2019 6:57:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BI_REFACEN](
	[IdBI_REFACEN] [int] IDENTITY(1,1) NOT NULL,
	[IdMOFA] [int] NULL,
	[CodigoCentro] [char](4) NULL,
	[ImpRepercutido] [float] NULL,
	[FecFactura] [date] NULL,
	[Year] [int] NULL,
	[TIPR] [char](1) NULL,
	[PAPR] [char](1) NULL,
	[FecCalculo] [datetime] NULL,
 CONSTRAINT [PK_BI_REFACEN] PRIMARY KEY CLUSTERED 
(
	[IdBI_REFACEN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TDCOPR]    Script Date: 12/09/2019 6:57:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TDCOPR](
	[Id_COPR] [int] IDENTITY(1,1) NOT NULL,
	[Id_MOPR] [int] NOT NULL,
	[Comentario] [nvarchar](200) NULL,
	[FecComentario] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TDPRUEBA]    Script Date: 12/09/2019 6:57:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TDPRUEBA](
	[IDPRUEBA] [int] IDENTITY(1,1) NOT NULL,
	[OTRO] [nchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TMCENTROS]    Script Date: 12/09/2019 6:57:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TMCENTROS](
	[Id_Centro] [int] IDENTITY(1,1) NOT NULL,
	[CodigoCentro] [char](4) NULL,
	[NEmpleados] [int] NULL,
	[DirCiudad] [varchar](50) NULL,
	[Zona] [varchar](50) NULL,
 CONSTRAINT [PK_TMCENTROS] PRIMARY KEY CLUSTERED 
(
	[Id_Centro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [IX_TMPROVEEDOR_1]    Script Date: 12/09/2019 6:57:21 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_TMPROVEEDOR_1] ON [dbo].[TMPROVEEDOR]
(
	[Id_Prov] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TDMOPR]  WITH CHECK ADD  CONSTRAINT [FK_TDMOPR_TMVEPR] FOREIGN KEY([Id_VEPR])
REFERENCES [dbo].[TMVEPR] ([Id_VEPR])
GO
ALTER TABLE [dbo].[TDMOPR] CHECK CONSTRAINT [FK_TDMOPR_TMVEPR]
GO
ALTER TABLE [dbo].[TMVEPR]  WITH CHECK ADD  CONSTRAINT [FK_TMVEPR_TPPAPR] FOREIGN KEY([CodigoPAPR])
REFERENCES [dbo].[TPPAPR] ([Codigo])
GO
ALTER TABLE [dbo].[TMVEPR] CHECK CONSTRAINT [FK_TMVEPR_TPPAPR]
GO
ALTER TABLE [dbo].[TMVEPR]  WITH CHECK ADD  CONSTRAINT [FK_TMVEPR_TPTIPR] FOREIGN KEY([CodigoTIPR])
REFERENCES [dbo].[TPTIPR] ([Codigo])
GO
ALTER TABLE [dbo].[TMVEPR] CHECK CONSTRAINT [FK_TMVEPR_TPTIPR]
GO
ALTER TABLE [dbo].[TPNIPR]  WITH CHECK ADD  CONSTRAINT [FK_TPNIPR_TPPAPR] FOREIGN KEY([CodPAPR])
REFERENCES [dbo].[TPPAPR] ([Codigo])
GO
ALTER TABLE [dbo].[TPNIPR] CHECK CONSTRAINT [FK_TPNIPR_TPPAPR]
GO
ALTER TABLE [dbo].[TPNIPR]  WITH CHECK ADD  CONSTRAINT [FK_TPNIPR_TPTIPR] FOREIGN KEY([CodTIPR])
REFERENCES [dbo].[TPTIPR] ([Codigo])
GO
ALTER TABLE [dbo].[TPNIPR] CHECK CONSTRAINT [FK_TPNIPR_TPTIPR]
GO
/****** Object:  StoredProcedure [dbo].[NIPRseleccion]    Script Date: 12/09/2019 6:57:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NIPRseleccion]   
    @CodTIPR char(1),   
    @CodPAPR char(1)   
AS   

    SET NOCOUNT ON;  

	SELECT  [Id_NIPR]
      ,[CodTIPR]
      ,[CodPAPR]
      ,[Codigo]
      ,[Padre]
      ,[Nivel]
      ,[Descripcion]
  FROM [Gambito].[dbo].[TPNIPR]
    WHERE [CodTIPR] = @CodTIPR AND [CodPAPR] = @CodPAPR;  
    
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Matrícula o licencia' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TDCMDB', @level2type=N'COLUMN',@level2name=N'Matricula'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Importe sin IVA' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TDMOFA', @level2type=N'COLUMN',@level2name=N'ImpBruto'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Importe bruto + IVA' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TDMOFA', @level2type=N'COLUMN',@level2name=N'ImpNeto'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[58] 4[4] 2[4] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "TDMOFA"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 221
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TDMOPR"
            Begin Extent = 
               Top = 6
               Left = 590
               Bottom = 266
               Right = 786
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TMPROVEEDOR"
            Begin Extent = 
               Top = 292
               Left = 348
               Bottom = 422
               Right = 518
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 17
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'CargaFACPROV'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'CargaFACPROV'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[3] 2[23] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "TMCITI"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "TDCMDB"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 423
            End
            DisplayFlags = 280
            TopColumn = 2
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'CMDB'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'CMDB'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[55] 4[6] 2[13] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "TDMOFA"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TDMOPR"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 442
            End
            DisplayFlags = 280
            TopColumn = 7
         End
         Begin Table = "TMPROVEEDOR"
            Begin Extent = 
               Top = 193
               Left = 256
               Bottom = 323
               Right = 426
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 10
         Width = 284
         Width = 2040
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'DetalleFacturas'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'DetalleFacturas'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[30] 4[4] 2[18] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "TPNIPR"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "PAPA"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 12
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'NIPR_CODPAPA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'NIPR_CODPAPA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[12] 2[26] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "TDMOPR"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 234
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TMVEPR"
            Begin Extent = 
               Top = 6
               Left = 272
               Bottom = 136
               Right = 442
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "TPPAPR"
            Begin Extent = 
               Top = 150
               Left = 495
               Bottom = 263
               Right = 665
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TPTIPR"
            Begin Extent = 
               Top = 6
               Left = 688
               Bottom = 119
               Right = 858
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 12
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
        ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'TDMOPR_ACTIVOS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N' Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'TDMOPR_ACTIVOS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'TDMOPR_ACTIVOS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "TPTIPR"
            Begin Extent = 
               Top = 7
               Left = 555
               Bottom = 120
               Right = 725
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TMVEPR"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "TPPAPR"
            Begin Extent = 
               Top = 132
               Left = 347
               Bottom = 245
               Right = 517
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VersionesPptoActivas'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VersionesPptoActivas'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[42] 4[4] 2[12] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "TMVEPR"
            Begin Extent = 
               Top = 141
               Left = 264
               Bottom = 271
               Right = 434
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "TDMOPR"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 234
            End
            DisplayFlags = 280
            TopColumn = 6
         End
         Begin Table = "TMPROVEEDOR"
            Begin Extent = 
               Top = 6
               Left = 480
               Bottom = 136
               Right = 650
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TDMOFA"
            Begin Extent = 
               Top = 6
               Left = 272
               Bottom = 136
               Right = 442
            End
            DisplayFlags = 280
            TopColumn = 5
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 12
         Width = 284
         Width = 3180
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
    ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VistaSeguimiento'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'     Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VistaSeguimiento'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VistaSeguimiento'
GO
USE [master]
GO
ALTER DATABASE [Gambito] SET  READ_WRITE 
GO
