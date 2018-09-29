/*PRIMERA PARTE ESTRUCTURA DE LA BASE DE DATOS*/

Create Database BDHotel
Go
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



/*PARTE 2 INSERTS - UPDATES - DELETES*/

USE BDHotel
/*-**************************************INSERTS*******************************************-*/

insert into Cliente(idCliente, nombre, apPat, apMat) values(1, 'Joaquin', 'Hernández', 'Peña')
insert into Cliente(idCliente, nombre, apPat, apMat) values(2, 'Pedro', 'Luna', 'Ramirez')
insert into Cliente(idCliente, nombre, apPat, apMat) values(3, 'Luis', 'Hernández', 'Rodriguez')
insert into Cliente(idCliente, nombre, apPat, apMat) values(4, 'Ramiro', 'Ramos', 'Rea')
insert into Cliente(idCliente, nombre, apPat, apMat) values(5, 'Héctor', 'Gomez', 'Torres')
insert into Cliente(idCliente, nombre, apPat, apMat) values(6, 'Luis', 'Rodriguez', 'Flores')
insert into Cliente(idCliente, nombre, apPat, apMat) values(7, 'Jesús', 'Magon', 'Ortiz')

select * from cliente

insert into Departamento(idDepartamento, nombre) values(1, 'Cocina')
insert into Departamento(idDepartamento, nombre) values(2, 'Ama de Llaves')
insert into Departamento(idDepartamento, nombre) values(3, 'Mesero')
insert into Departamento(idDepartamento, nombre) values(4, 'Botones')
insert into Departamento(idDepartamento, nombre) values(5, 'Gerente')
insert into Departamento(idDepartamento, nombre) values(6, 'Limpieza')
insert into Departamento(idDepartamento, nombre) values(7, 'Mantenimiento')
insert into Departamento(idDepartamento, nombre) values(8, 'Recepción')
insert into Departamento(idDepartamento, nombre) values(9, 'Valet Parking')

select * from Departamento

insert into Disponibilidad(idDisponibilidad, idHabitacion, fecha, estado) values(1, 2, '20/06/2018', 'Disponible')
insert into Disponibilidad(idDisponibilidad, idHabitacion, fecha, estado) values(2, 3, '20/07/2018', 'Disponible')
insert into Disponibilidad(idDisponibilidad, idHabitacion, fecha, estado) values(3, 1, '26/08/2018', 'No Disponible')
insert into Disponibilidad(idDisponibilidad, idHabitacion, fecha, estado) values(4, 4, '01/09/2018', 'No Disponible')
insert into Disponibilidad(idDisponibilidad, idHabitacion, fecha, estado) values(5, 5, '15/09/2018', 'Disponible')
insert into Disponibilidad(idDisponibilidad, idHabitacion, fecha, estado) values(6, 3, '28/09/2018', 'No Disponible')


select * from Disponibilidad


insert into Habitacion(idHabitacion, clase, piso, costoDiario) values(1, 'Primera', 20, 35000)
insert into Habitacion(idHabitacion, clase, piso, costoDiario) values(2, 'Primera', 18, 34500)
insert into Habitacion(idHabitacion, clase, piso, costoDiario) values(3, 'Turista', 5, 1000)
insert into Habitacion(idHabitacion, clase, piso, costoDiario) values(4, 'Turista', 8, 1100)
insert into Habitacion(idHabitacion, clase, piso, costoDiario) values(5, 'Ejecutivo', 15, 10000)
insert into Habitacion(idHabitacion, clase, piso, costoDiario) values(6, 'Ejecutivo', 16, 10000)
insert into Habitacion(idHabitacion, clase, piso, costoDiario) values(7, 'Suite', 21, 35000)

select * from Habitacion

insert into Empleado(idEmpleado, nombre, apPat, apMat, edad, idDepartamento) values(1, 'Juan', 'Meza', 'Gómez', 25, 1)
insert into Empleado(idEmpleado, nombre, apPat, apMat, edad, idDepartamento) values(2, 'Martina', 'Delgado', 'Camacho', 22, 2)
insert into Empleado(idEmpleado, nombre, apPat, apMat, edad, idDepartamento) values(3, 'Pedro', 'Montoya', 'Castro', 25, 3)
insert into Empleado(idEmpleado, nombre, apPat, apMat, edad, idDepartamento) values(4, 'Juan', 'García', 'Iñarritu', 20, 4)
insert into Empleado(idEmpleado, nombre, apPat, apMat, edad, idDepartamento) values(5, 'Carlos', 'Ruiz', 'Castillo', 36, 5)
insert into Empleado(idEmpleado, nombre, apPat, apMat, edad, idDepartamento) values(6, 'Karla', 'Meza', 'Hernandez', 21, 6)
insert into Empleado(idEmpleado, nombre, apPat, apMat, edad, idDepartamento) values(7, 'Jahir', 'Fernandez', 'Cantú', 39, 6)
insert into Empleado(idEmpleado, nombre, apPat, apMat, edad, idDepartamento) values(8, 'Edna', 'Mendoza', 'Gutierrez', 31, 7)
insert into Empleado(idEmpleado, nombre, apPat, apMat, edad, idDepartamento) values(9, 'Diego', 'Alonso', 'Villarreal', 28, 8)
insert into Empleado(idEmpleado, nombre, apPat, apMat, edad, idDepartamento) values(10, 'Saúl', 'Ortiz', 'Hernandez', 30, 9)

select * from Empleado

insert into Nomina(idNomina, idEmpleado, idDepartamento, sueldoPorHora, horasTrabajadas, sueldoTotal) values(1, 1, 1, 30, 54, 1620)
insert into Nomina(idNomina, idEmpleado, idDepartamento, sueldoPorHora, horasTrabajadas, sueldoTotal) values(2, 2, 2, 30, 54, 1620)
insert into Nomina(idNomina, idEmpleado, idDepartamento, sueldoPorHora, horasTrabajadas, sueldoTotal) values(3, 3, 3, 30, 54, 1620)
insert into Nomina(idNomina, idEmpleado, idDepartamento, sueldoPorHora, horasTrabajadas, sueldoTotal) values(4, 4, 4, 30, 54, 1620)
insert into Nomina(idNomina, idEmpleado, idDepartamento, sueldoPorHora, horasTrabajadas, sueldoTotal) values(5, 5, 5, 75, 54, 4050)
insert into Nomina(idNomina, idEmpleado, idDepartamento, sueldoPorHora, horasTrabajadas, sueldoTotal) values(6, 6, 6, 30, 54, 1620)
insert into Nomina(idNomina, idEmpleado, idDepartamento, sueldoPorHora, horasTrabajadas, sueldoTotal) values(7, 7, 6, 30, 54, 1620)
insert into Nomina(idNomina, idEmpleado, idDepartamento, sueldoPorHora, horasTrabajadas, sueldoTotal) values(8, 8, 7, 30, 54, 1620)
insert into Nomina(idNomina, idEmpleado, idDepartamento, sueldoPorHora, horasTrabajadas, sueldoTotal) values(9, 9, 8, 30, 54, 1620)
insert into Nomina(idNomina, idEmpleado, idDepartamento, sueldoPorHora, horasTrabajadas, sueldoTotal) values(10, 10, 9, 30, 54, 1620)

select * from Nomina

insert into PeriodoReservacion(idPeriReserv, idDisponibilidad, idReservacion) values(1, 1, 1)
insert into PeriodoReservacion(idPeriReserv, idDisponibilidad, idReservacion) values(2, 2, 5)
insert into PeriodoReservacion(idPeriReserv, idDisponibilidad, idReservacion) values(3, 6, 4)
select * from PeriodoReservacion


insert into Reservacion(idReservacion, idHabitacion, fechaEntrada, fechaSalida, estado, diasReservados, costoDiario) values(1, 2, '20/06/2018', '22/06/2018', 'Disponible', 2, 34500)
insert into Reservacion(idReservacion, idHabitacion, fechaEntrada, fechaSalida, estado, diasReservados, costoDiario) values(2, 3, '20/07/2018', '22/06/2018', 'Disponible', 10, 1000)
insert into Reservacion(idReservacion, idHabitacion, fechaEntrada, fechaSalida, estado, diasReservados, costoDiario) values(3, 1, '26/08/2018', '22/06/2018', 'Disponible', 1, 35000)
insert into Reservacion(idReservacion, idHabitacion, fechaEntrada, fechaSalida, estado, diasReservados, costoDiario) values(4, 4, '01/09/2018', '22/06/2018', 'Disponible', 6, 1100)
insert into Reservacion(idReservacion, idHabitacion, fechaEntrada, fechaSalida, estado, diasReservados, costoDiario) values(5, 5, '15/09/2018', '22/06/2018', 'Disponible', 3, 10000)
select * from Reservacion


insert into Servicio(idServicio, nombre, precio) values(1, 'Servicio a la Habitacion', 70)
insert into Servicio(idServicio, nombre, precio) values(2, 'Reservación', 500)
insert into Servicio(idServicio, nombre, precio) values(3, 'Buffet', 200)
insert into Servicio(idServicio, nombre, precio) values(4, 'Lavanderia', 250)
insert into Servicio(idServicio, nombre, precio) values(5, 'Valet Parkin', 100)

select * from Servicio

insert into ServiciosVendidos(idSerVen, idVenta, idServicio, fecha) values(1, 1, 3, '20/09/2018')
insert into ServiciosVendidos(idSerVen, idVenta, idServicio, fecha) values(2, 2, 3, '21/09/2018')
insert into ServiciosVendidos(idSerVen, idVenta, idServicio, fecha) values(3, 3, 4, '22/09/2018')
insert into ServiciosVendidos(idSerVen, idVenta, idServicio, fecha) values(4, 4, 5, '23/09/2018')
insert into ServiciosVendidos(idSerVen, idVenta, idServicio, fecha) values(5, 5, 1, '24/09/2018')
insert into ServiciosVendidos(idSerVen, idVenta, idServicio, fecha) values(6, 6, 2, '25/09/2018')
select * from ServiciosVendidos

insert into Venta(idVenta, idCliente) values(1, 2)
insert into Venta(idVenta, idCliente) values(2, 7)
insert into Venta(idVenta, idCliente) values(3, 7)
insert into Venta(idVenta, idCliente) values(4, 3)
insert into Venta(idVenta, idCliente) values(5, 1)
insert into Venta(idVenta, idCliente) values(6, 5)
insert into Venta(idVenta, idCliente) values(7, 2)
select * from Venta

insert into VentaReservaciones(idVenReserv, idVenta, idReservacion, precio) values(1, 1, 2, 10000)
insert into VentaReservaciones(idVenReserv, idVenta, idReservacion, precio) values(2, 7, 5, 30000)
select * from VentaReservaciones

/*-**************************************UPDATES*******************************************-*/

update Servicio
set precio = 70
where nombre like '%a la Habitac%'

update Departamento
set nombre = 'Mucama'
where nombre like '%Llaves'

update Disponibilidad
set estado = 'No Disponible'
where idDisponibilidad = 1

update Empleado
set edad = edad + 1
where idEmpleado = 6

update Nomina
set sueldoTotal = (sueldoTotal + 300)
where horasTrabajadas = 54

update Nomina
set sueldoTotal = (sueldoTotal * 1.25)
where idDepartamento = 1

/*-**************************************DELETES*******************************************-*/

delete from Nomina
where idEmpleado = 3

delete from PeriodoReservacion
where idReservacion = 5

delete from ServiciosVendidos
where fecha < '25/09/2018'

delete from VentaReservaciones
where idVenReserv = 2

delete from ServiciosVendidos
where idSerVen <= 1