USE [master]
GO
/****** Object:  Database [Mecafab]    Script Date: 16/05/2025 11:18:13 ******/
CREATE DATABASE [Mecafab]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Mecafab', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Mecafab.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Mecafab_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Mecafab_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Mecafab] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Mecafab].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Mecafab] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Mecafab] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Mecafab] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Mecafab] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Mecafab] SET ARITHABORT OFF 
GO
ALTER DATABASE [Mecafab] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Mecafab] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Mecafab] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Mecafab] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Mecafab] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Mecafab] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Mecafab] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Mecafab] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Mecafab] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Mecafab] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Mecafab] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Mecafab] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Mecafab] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Mecafab] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Mecafab] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Mecafab] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Mecafab] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Mecafab] SET RECOVERY FULL 
GO
ALTER DATABASE [Mecafab] SET  MULTI_USER 
GO
ALTER DATABASE [Mecafab] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Mecafab] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Mecafab] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Mecafab] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Mecafab] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Mecafab] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Mecafab', N'ON'
GO
ALTER DATABASE [Mecafab] SET QUERY_STORE = ON
GO
ALTER DATABASE [Mecafab] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Mecafab]
GO
/****** Object:  Table [dbo].[Asignacion]    Script Date: 16/05/2025 11:18:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Asignacion](
	[idAsignacion] [int] IDENTITY(1,1) NOT NULL,
	[idPedido] [int] NOT NULL,
	[idEmpleado] [int] NOT NULL,
	[fechaAsignacion] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idAsignacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 16/05/2025 11:18:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[idCliente] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NOT NULL,
	[apellido] [nvarchar](50) NOT NULL,
	[telefono] [nvarchar](9) NOT NULL,
	[email] [nvarchar](100) NULL,
	[direccion] [nvarchar](200) NULL,
	[fechaRegistro] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empleado]    Script Date: 16/05/2025 11:18:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleado](
	[idEmpleado] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[apellido] [varchar](50) NOT NULL,
	[idRol] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idEmpleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Entrega]    Script Date: 16/05/2025 11:18:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Entrega](
	[idEntrega] [int] IDENTITY(1,1) NOT NULL,
	[idPedido] [int] NOT NULL,
	[fechaEntrega] [datetime] NOT NULL,
	[observaciones] [varchar](300) NULL,
PRIMARY KEY CLUSTERED 
(
	[idEntrega] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Estado]    Script Date: 16/05/2025 11:18:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Estado](
	[idEstado] [int] NOT NULL,
	[descripcion] [varchar](50) NULL,
	[categoria] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[idEstado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pago]    Script Date: 16/05/2025 11:18:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pago](
	[idPago] [int] IDENTITY(1,1) NOT NULL,
	[idPedido] [int] NOT NULL,
	[monto] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[idPago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pedido]    Script Date: 16/05/2025 11:18:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pedido](
	[idPedido] [int] IDENTITY(1,1) NOT NULL,
	[idCliente] [int] NOT NULL,
	[descripcion] [nvarchar](500) NOT NULL,
	[fechaSolicitud] [datetime] NOT NULL,
	[idEstado] [int] NULL,
	[fechaComprometida] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idPedido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rol]    Script Date: 16/05/2025 11:18:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rol](
	[idRol] [int] NOT NULL,
	[descripcion] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[idRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SeguimientoEstado]    Script Date: 16/05/2025 11:18:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SeguimientoEstado](
	[idSeguimiento] [int] IDENTITY(1,1) NOT NULL,
	[idPedido] [int] NOT NULL,
	[idEstado] [int] NOT NULL,
	[fechaCambio] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idSeguimiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Asignacion] ADD  DEFAULT (getdate()) FOR [fechaAsignacion]
GO
ALTER TABLE [dbo].[Cliente] ADD  DEFAULT (getdate()) FOR [fechaRegistro]
GO
ALTER TABLE [dbo].[Entrega] ADD  DEFAULT (getdate()) FOR [fechaEntrega]
GO
ALTER TABLE [dbo].[Pedido] ADD  DEFAULT (getdate()) FOR [fechaSolicitud]
GO
ALTER TABLE [dbo].[Pedido] ADD  DEFAULT ((1)) FOR [idEstado]
GO
ALTER TABLE [dbo].[SeguimientoEstado] ADD  DEFAULT (getdate()) FOR [fechaCambio]
GO
ALTER TABLE [dbo].[Asignacion]  WITH CHECK ADD  CONSTRAINT [FK_Asignacion_Empleado] FOREIGN KEY([idEmpleado])
REFERENCES [dbo].[Empleado] ([idEmpleado])
GO
ALTER TABLE [dbo].[Asignacion] CHECK CONSTRAINT [FK_Asignacion_Empleado]
GO
ALTER TABLE [dbo].[Asignacion]  WITH CHECK ADD  CONSTRAINT [FK_Asignacion_Pedido] FOREIGN KEY([idPedido])
REFERENCES [dbo].[Pedido] ([idPedido])
GO
ALTER TABLE [dbo].[Asignacion] CHECK CONSTRAINT [FK_Asignacion_Pedido]
GO
ALTER TABLE [dbo].[Empleado]  WITH CHECK ADD  CONSTRAINT [FK_Empleado_Rol] FOREIGN KEY([idRol])
REFERENCES [dbo].[Rol] ([idRol])
GO
ALTER TABLE [dbo].[Empleado] CHECK CONSTRAINT [FK_Empleado_Rol]
GO
ALTER TABLE [dbo].[Entrega]  WITH CHECK ADD  CONSTRAINT [FK_Entrega_Pedido] FOREIGN KEY([idPedido])
REFERENCES [dbo].[Pedido] ([idPedido])
GO
ALTER TABLE [dbo].[Entrega] CHECK CONSTRAINT [FK_Entrega_Pedido]
GO
ALTER TABLE [dbo].[Pago]  WITH CHECK ADD  CONSTRAINT [FK_Pago_Pedido] FOREIGN KEY([idPedido])
REFERENCES [dbo].[Pedido] ([idPedido])
GO
ALTER TABLE [dbo].[Pago] CHECK CONSTRAINT [FK_Pago_Pedido]
GO
ALTER TABLE [dbo].[Pedido]  WITH CHECK ADD  CONSTRAINT [FK_Pedido_Cliente] FOREIGN KEY([idCliente])
REFERENCES [dbo].[Cliente] ([idCliente])
GO
ALTER TABLE [dbo].[Pedido] CHECK CONSTRAINT [FK_Pedido_Cliente]
GO
ALTER TABLE [dbo].[Pedido]  WITH CHECK ADD  CONSTRAINT [FK_Pedido_Estado] FOREIGN KEY([idEstado])
REFERENCES [dbo].[Estado] ([idEstado])
GO
ALTER TABLE [dbo].[Pedido] CHECK CONSTRAINT [FK_Pedido_Estado]
GO
ALTER TABLE [dbo].[SeguimientoEstado]  WITH CHECK ADD  CONSTRAINT [FK_SeguimientoEstado_Estado] FOREIGN KEY([idEstado])
REFERENCES [dbo].[Estado] ([idEstado])
GO
ALTER TABLE [dbo].[SeguimientoEstado] CHECK CONSTRAINT [FK_SeguimientoEstado_Estado]
GO
ALTER TABLE [dbo].[SeguimientoEstado]  WITH CHECK ADD  CONSTRAINT [FK_SeguimientoEstado_Pedido] FOREIGN KEY([idPedido])
REFERENCES [dbo].[Pedido] ([idPedido])
GO
ALTER TABLE [dbo].[SeguimientoEstado] CHECK CONSTRAINT [FK_SeguimientoEstado_Pedido]
GO
USE [master]
GO
ALTER DATABASE [Mecafab] SET  READ_WRITE 
GO
