USE [BDHotel]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_VentaReservaciones_Venta]') AND parent_object_id = OBJECT_ID(N'[dbo].[VentaReservaciones]'))
ALTER TABLE [dbo].[VentaReservaciones] DROP CONSTRAINT [FK_VentaReservaciones_Venta]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_VentaReservaciones_Reservacion]') AND parent_object_id = OBJECT_ID(N'[dbo].[VentaReservaciones]'))
ALTER TABLE [dbo].[VentaReservaciones] DROP CONSTRAINT [FK_VentaReservaciones_Reservacion]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Venta_Cliente]') AND parent_object_id = OBJECT_ID(N'[dbo].[Venta]'))
ALTER TABLE [dbo].[Venta] DROP CONSTRAINT [FK_Venta_Cliente]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ServiciosVendidos_Venta]') AND parent_object_id = OBJECT_ID(N'[dbo].[ServiciosVendidos]'))
ALTER TABLE [dbo].[ServiciosVendidos] DROP CONSTRAINT [FK_ServiciosVendidos_Venta]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ServiciosVendidos_Servicio]') AND parent_object_id = OBJECT_ID(N'[dbo].[ServiciosVendidos]'))
ALTER TABLE [dbo].[ServiciosVendidos] DROP CONSTRAINT [FK_ServiciosVendidos_Servicio]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Reservacion_Habitacion]') AND parent_object_id = OBJECT_ID(N'[dbo].[Reservacion]'))
ALTER TABLE [dbo].[Reservacion] DROP CONSTRAINT [FK_Reservacion_Habitacion]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PeriodoReservacion_Reservacion]') AND parent_object_id = OBJECT_ID(N'[dbo].[PeriodoReservacion]'))
ALTER TABLE [dbo].[PeriodoReservacion] DROP CONSTRAINT [FK_PeriodoReservacion_Reservacion]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PeriodoReservacion_Disponibilidad]') AND parent_object_id = OBJECT_ID(N'[dbo].[PeriodoReservacion]'))
ALTER TABLE [dbo].[PeriodoReservacion] DROP CONSTRAINT [FK_PeriodoReservacion_Disponibilidad]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Nomina_Empleado]') AND parent_object_id = OBJECT_ID(N'[dbo].[Nomina]'))
ALTER TABLE [dbo].[Nomina] DROP CONSTRAINT [FK_Nomina_Empleado]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Nomina_Departamento]') AND parent_object_id = OBJECT_ID(N'[dbo].[Nomina]'))
ALTER TABLE [dbo].[Nomina] DROP CONSTRAINT [FK_Nomina_Departamento]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Empleado_Departamento]') AND parent_object_id = OBJECT_ID(N'[dbo].[Empleado]'))
ALTER TABLE [dbo].[Empleado] DROP CONSTRAINT [FK_Empleado_Departamento]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Disponibilidad_Habitacion]') AND parent_object_id = OBJECT_ID(N'[dbo].[Disponibilidad]'))
ALTER TABLE [dbo].[Disponibilidad] DROP CONSTRAINT [FK_Disponibilidad_Habitacion]
GO
/****** Object:  Table [dbo].[VentaReservaciones]    Script Date: 22/09/2018 02:17:16 a.m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[VentaReservaciones]') AND type in (N'U'))
DROP TABLE [dbo].[VentaReservaciones]
GO
/****** Object:  Table [dbo].[Venta]    Script Date: 22/09/2018 02:17:16 a.m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Venta]') AND type in (N'U'))
DROP TABLE [dbo].[Venta]
GO
/****** Object:  Table [dbo].[ServiciosVendidos]    Script Date: 22/09/2018 02:17:16 a.m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ServiciosVendidos]') AND type in (N'U'))
DROP TABLE [dbo].[ServiciosVendidos]
GO
/****** Object:  Table [dbo].[Servicio]    Script Date: 22/09/2018 02:17:16 a.m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Servicio]') AND type in (N'U'))
DROP TABLE [dbo].[Servicio]
GO
/****** Object:  Table [dbo].[Reservacion]    Script Date: 22/09/2018 02:17:16 a.m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Reservacion]') AND type in (N'U'))
DROP TABLE [dbo].[Reservacion]
GO
/****** Object:  Table [dbo].[PeriodoReservacion]    Script Date: 22/09/2018 02:17:16 a.m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PeriodoReservacion]') AND type in (N'U'))
DROP TABLE [dbo].[PeriodoReservacion]
GO
/****** Object:  Table [dbo].[Nomina]    Script Date: 22/09/2018 02:17:16 a.m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Nomina]') AND type in (N'U'))
DROP TABLE [dbo].[Nomina]
GO
/****** Object:  Table [dbo].[Habitacion]    Script Date: 22/09/2018 02:17:16 a.m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Habitacion]') AND type in (N'U'))
DROP TABLE [dbo].[Habitacion]
GO
/****** Object:  Table [dbo].[Empleado]    Script Date: 22/09/2018 02:17:16 a.m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Empleado]') AND type in (N'U'))
DROP TABLE [dbo].[Empleado]
GO
/****** Object:  Table [dbo].[Disponibilidad]    Script Date: 22/09/2018 02:17:16 a.m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Disponibilidad]') AND type in (N'U'))
DROP TABLE [dbo].[Disponibilidad]
GO
/****** Object:  Table [dbo].[Departamento]    Script Date: 22/09/2018 02:17:16 a.m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Departamento]') AND type in (N'U'))
DROP TABLE [dbo].[Departamento]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 22/09/2018 02:17:16 a.m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Cliente]') AND type in (N'U'))
DROP TABLE [dbo].[Cliente]
GO
USE [master]
GO
/****** Object:  Database [BDHotel]    Script Date: 22/09/2018 02:17:16 a.m. ******/
IF  EXISTS (SELECT name FROM sys.databases WHERE name = N'BDHotel')
DROP DATABASE [BDHotel]
GO
/****** Object:  Database [BDHotel]    Script Date: 22/09/2018 02:17:16 a.m. ******/
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'BDHotel')
BEGIN
CREATE DATABASE [BDHotel]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BDHotel', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\BDHotel.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'BDHotel_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\BDHotel_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
END

GO
ALTER DATABASE [BDHotel] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BDHotel].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BDHotel] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BDHotel] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BDHotel] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BDHotel] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BDHotel] SET ARITHABORT OFF 
GO
ALTER DATABASE [BDHotel] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BDHotel] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [BDHotel] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BDHotel] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BDHotel] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BDHotel] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BDHotel] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BDHotel] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BDHotel] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BDHotel] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BDHotel] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BDHotel] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BDHotel] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BDHotel] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BDHotel] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BDHotel] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BDHotel] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BDHotel] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BDHotel] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BDHotel] SET  MULTI_USER 
GO
ALTER DATABASE [BDHotel] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BDHotel] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BDHotel] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BDHotel] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [BDHotel]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 22/09/2018 02:17:16 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Cliente]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Cliente](
	[idCliente] [int] NOT NULL,
	[nombre] [varchar](50) NULL,
	[apPat] [varchar](50) NULL,
	[apMat] [varchar](50) NULL,
	[nomComp]  AS (((([nombre]+' ')+[apPat])+' ')+[apMat]),
	[fotografia] [image] NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[idCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Departamento]    Script Date: 22/09/2018 02:17:16 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Departamento]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Departamento](
	[idDepartamento] [int] NOT NULL,
	[nombre] [varchar](50) NULL,
 CONSTRAINT [PK_Departamento] PRIMARY KEY CLUSTERED 
(
	[idDepartamento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Disponibilidad]    Script Date: 22/09/2018 02:17:16 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Disponibilidad]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Disponibilidad](
	[idDisponibilidad] [int] NOT NULL,
	[idHabitacion] [int] NULL,
	[fecha] [datetime] NULL,
	[estado] [varchar](50) NULL,
 CONSTRAINT [PK_Disponibilidad] PRIMARY KEY CLUSTERED 
(
	[idDisponibilidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Empleado]    Script Date: 22/09/2018 02:17:16 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Empleado]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Empleado](
	[idEmpleado] [int] NOT NULL,
	[nombre] [varchar](50) NULL,
	[apPat] [varchar](50) NULL,
	[apMat] [varchar](50) NULL,
	[nomComp]  AS (((([nombre]+' ')+[apPat])+' ')+[apMat]),
	[edad] [int] NULL,
	[idDepartamento] [int] NULL,
 CONSTRAINT [PK_Empleado] PRIMARY KEY CLUSTERED 
(
	[idEmpleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Habitacion]    Script Date: 22/09/2018 02:17:16 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Habitacion]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Habitacion](
	[idHabitacion] [int] NOT NULL,
	[clase] [varchar](50) NULL,
	[piso] [int] NULL,
	[costoDiario] [int] NULL,
 CONSTRAINT [PK_Habitacion] PRIMARY KEY CLUSTERED 
(
	[idHabitacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Nomina]    Script Date: 22/09/2018 02:17:16 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Nomina]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Nomina](
	[idNomina] [int] NOT NULL,
	[idEmpleado] [int] NULL,
	[idDepartamento] [int] NULL,
	[sueldoPorHora] [int] NULL,
	[horasTrabajadas] [int] NULL,
	[sueldoTotal] [int] NULL,
 CONSTRAINT [PK_Nomina] PRIMARY KEY CLUSTERED 
(
	[idNomina] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[PeriodoReservacion]    Script Date: 22/09/2018 02:17:16 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PeriodoReservacion]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PeriodoReservacion](
	[idPeriReserv] [int] NOT NULL,
	[idDisponibilidad] [int] NULL,
	[idReservacion] [int] NULL,
 CONSTRAINT [PK_PeriodoReservacion] PRIMARY KEY CLUSTERED 
(
	[idPeriReserv] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Reservacion]    Script Date: 22/09/2018 02:17:16 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Reservacion]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Reservacion](
	[idReservacion] [int] NOT NULL,
	[idHabitacion] [int] NULL,
	[fechaEntrada] [date] NULL,
	[fechaSalida] [date] NULL,
	[estado] [varchar](50) NULL,
	[diasReservados] [int] NULL,
	[costoDiario] [int] NULL,
	[precio]  AS ([diasReservados]*[costoDiario]),
 CONSTRAINT [PK_Reservacion] PRIMARY KEY CLUSTERED 
(
	[idReservacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Servicio]    Script Date: 22/09/2018 02:17:16 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Servicio]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Servicio](
	[idServicio] [int] NOT NULL,
	[nombre] [varchar](50) NULL,
	[precio] [int] NULL,
 CONSTRAINT [PK_Servicio] PRIMARY KEY CLUSTERED 
(
	[idServicio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ServiciosVendidos]    Script Date: 22/09/2018 02:17:16 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ServiciosVendidos]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ServiciosVendidos](
	[idSerVen] [int] NOT NULL,
	[idVenta] [int] NULL,
	[idServicio] [int] NULL,
	[fecha] [datetime] NULL,
 CONSTRAINT [PK_ServiciosVendidos] PRIMARY KEY CLUSTERED 
(
	[idSerVen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Venta]    Script Date: 22/09/2018 02:17:16 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Venta]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Venta](
	[idVenta] [int] NOT NULL,
	[idCliente] [int] NULL,
 CONSTRAINT [PK_Venta] PRIMARY KEY CLUSTERED 
(
	[idVenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[VentaReservaciones]    Script Date: 22/09/2018 02:17:16 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[VentaReservaciones]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[VentaReservaciones](
	[idVenReserv] [int] NOT NULL,
	[idVenta] [int] NULL,
	[idReservacion] [int] NULL,
	[precio] [int] NULL,
 CONSTRAINT [PK_VentaReservaciones] PRIMARY KEY CLUSTERED 
(
	[idVenReserv] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Disponibilidad_Habitacion]') AND parent_object_id = OBJECT_ID(N'[dbo].[Disponibilidad]'))
ALTER TABLE [dbo].[Disponibilidad]  WITH CHECK ADD  CONSTRAINT [FK_Disponibilidad_Habitacion] FOREIGN KEY([idHabitacion])
REFERENCES [dbo].[Habitacion] ([idHabitacion])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Disponibilidad_Habitacion]') AND parent_object_id = OBJECT_ID(N'[dbo].[Disponibilidad]'))
ALTER TABLE [dbo].[Disponibilidad] CHECK CONSTRAINT [FK_Disponibilidad_Habitacion]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Empleado_Departamento]') AND parent_object_id = OBJECT_ID(N'[dbo].[Empleado]'))
ALTER TABLE [dbo].[Empleado]  WITH CHECK ADD  CONSTRAINT [FK_Empleado_Departamento] FOREIGN KEY([idDepartamento])
REFERENCES [dbo].[Departamento] ([idDepartamento])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Empleado_Departamento]') AND parent_object_id = OBJECT_ID(N'[dbo].[Empleado]'))
ALTER TABLE [dbo].[Empleado] CHECK CONSTRAINT [FK_Empleado_Departamento]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Nomina_Departamento]') AND parent_object_id = OBJECT_ID(N'[dbo].[Nomina]'))
ALTER TABLE [dbo].[Nomina]  WITH CHECK ADD  CONSTRAINT [FK_Nomina_Departamento] FOREIGN KEY([idDepartamento])
REFERENCES [dbo].[Departamento] ([idDepartamento])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Nomina_Departamento]') AND parent_object_id = OBJECT_ID(N'[dbo].[Nomina]'))
ALTER TABLE [dbo].[Nomina] CHECK CONSTRAINT [FK_Nomina_Departamento]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Nomina_Empleado]') AND parent_object_id = OBJECT_ID(N'[dbo].[Nomina]'))
ALTER TABLE [dbo].[Nomina]  WITH CHECK ADD  CONSTRAINT [FK_Nomina_Empleado] FOREIGN KEY([idEmpleado])
REFERENCES [dbo].[Empleado] ([idEmpleado])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Nomina_Empleado]') AND parent_object_id = OBJECT_ID(N'[dbo].[Nomina]'))
ALTER TABLE [dbo].[Nomina] CHECK CONSTRAINT [FK_Nomina_Empleado]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PeriodoReservacion_Disponibilidad]') AND parent_object_id = OBJECT_ID(N'[dbo].[PeriodoReservacion]'))
ALTER TABLE [dbo].[PeriodoReservacion]  WITH CHECK ADD  CONSTRAINT [FK_PeriodoReservacion_Disponibilidad] FOREIGN KEY([idDisponibilidad])
REFERENCES [dbo].[Disponibilidad] ([idDisponibilidad])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PeriodoReservacion_Disponibilidad]') AND parent_object_id = OBJECT_ID(N'[dbo].[PeriodoReservacion]'))
ALTER TABLE [dbo].[PeriodoReservacion] CHECK CONSTRAINT [FK_PeriodoReservacion_Disponibilidad]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PeriodoReservacion_Reservacion]') AND parent_object_id = OBJECT_ID(N'[dbo].[PeriodoReservacion]'))
ALTER TABLE [dbo].[PeriodoReservacion]  WITH CHECK ADD  CONSTRAINT [FK_PeriodoReservacion_Reservacion] FOREIGN KEY([idReservacion])
REFERENCES [dbo].[Reservacion] ([idReservacion])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PeriodoReservacion_Reservacion]') AND parent_object_id = OBJECT_ID(N'[dbo].[PeriodoReservacion]'))
ALTER TABLE [dbo].[PeriodoReservacion] CHECK CONSTRAINT [FK_PeriodoReservacion_Reservacion]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Reservacion_Habitacion]') AND parent_object_id = OBJECT_ID(N'[dbo].[Reservacion]'))
ALTER TABLE [dbo].[Reservacion]  WITH CHECK ADD  CONSTRAINT [FK_Reservacion_Habitacion] FOREIGN KEY([idHabitacion])
REFERENCES [dbo].[Habitacion] ([idHabitacion])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Reservacion_Habitacion]') AND parent_object_id = OBJECT_ID(N'[dbo].[Reservacion]'))
ALTER TABLE [dbo].[Reservacion] CHECK CONSTRAINT [FK_Reservacion_Habitacion]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ServiciosVendidos_Servicio]') AND parent_object_id = OBJECT_ID(N'[dbo].[ServiciosVendidos]'))
ALTER TABLE [dbo].[ServiciosVendidos]  WITH CHECK ADD  CONSTRAINT [FK_ServiciosVendidos_Servicio] FOREIGN KEY([idServicio])
REFERENCES [dbo].[Servicio] ([idServicio])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ServiciosVendidos_Servicio]') AND parent_object_id = OBJECT_ID(N'[dbo].[ServiciosVendidos]'))
ALTER TABLE [dbo].[ServiciosVendidos] CHECK CONSTRAINT [FK_ServiciosVendidos_Servicio]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ServiciosVendidos_Venta]') AND parent_object_id = OBJECT_ID(N'[dbo].[ServiciosVendidos]'))
ALTER TABLE [dbo].[ServiciosVendidos]  WITH CHECK ADD  CONSTRAINT [FK_ServiciosVendidos_Venta] FOREIGN KEY([idVenta])
REFERENCES [dbo].[Venta] ([idVenta])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ServiciosVendidos_Venta]') AND parent_object_id = OBJECT_ID(N'[dbo].[ServiciosVendidos]'))
ALTER TABLE [dbo].[ServiciosVendidos] CHECK CONSTRAINT [FK_ServiciosVendidos_Venta]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Venta_Cliente]') AND parent_object_id = OBJECT_ID(N'[dbo].[Venta]'))
ALTER TABLE [dbo].[Venta]  WITH CHECK ADD  CONSTRAINT [FK_Venta_Cliente] FOREIGN KEY([idCliente])
REFERENCES [dbo].[Cliente] ([idCliente])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Venta_Cliente]') AND parent_object_id = OBJECT_ID(N'[dbo].[Venta]'))
ALTER TABLE [dbo].[Venta] CHECK CONSTRAINT [FK_Venta_Cliente]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_VentaReservaciones_Reservacion]') AND parent_object_id = OBJECT_ID(N'[dbo].[VentaReservaciones]'))
ALTER TABLE [dbo].[VentaReservaciones]  WITH CHECK ADD  CONSTRAINT [FK_VentaReservaciones_Reservacion] FOREIGN KEY([idReservacion])
REFERENCES [dbo].[Reservacion] ([idReservacion])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_VentaReservaciones_Reservacion]') AND parent_object_id = OBJECT_ID(N'[dbo].[VentaReservaciones]'))
ALTER TABLE [dbo].[VentaReservaciones] CHECK CONSTRAINT [FK_VentaReservaciones_Reservacion]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_VentaReservaciones_Venta]') AND parent_object_id = OBJECT_ID(N'[dbo].[VentaReservaciones]'))
ALTER TABLE [dbo].[VentaReservaciones]  WITH CHECK ADD  CONSTRAINT [FK_VentaReservaciones_Venta] FOREIGN KEY([idVenta])
REFERENCES [dbo].[Venta] ([idVenta])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_VentaReservaciones_Venta]') AND parent_object_id = OBJECT_ID(N'[dbo].[VentaReservaciones]'))
ALTER TABLE [dbo].[VentaReservaciones] CHECK CONSTRAINT [FK_VentaReservaciones_Venta]
GO
USE [master]
GO
ALTER DATABASE [BDHotel] SET  READ_WRITE 
GO
