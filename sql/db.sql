USE [master]
GO
/****** Object:  Database [PRJ_Car_Booking]    Script Date: 2/25/2024 1:07:48 PM ******/
CREATE DATABASE [PRJ_Car_Booking]
GO
ALTER DATABASE [PRJ_Car_Booking] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PRJ_Car_Booking].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PRJ_Car_Booking] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PRJ_Car_Booking] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PRJ_Car_Booking] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PRJ_Car_Booking] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PRJ_Car_Booking] SET ARITHABORT OFF 
GO
ALTER DATABASE [PRJ_Car_Booking] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PRJ_Car_Booking] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PRJ_Car_Booking] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PRJ_Car_Booking] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PRJ_Car_Booking] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PRJ_Car_Booking] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PRJ_Car_Booking] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PRJ_Car_Booking] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PRJ_Car_Booking] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PRJ_Car_Booking] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PRJ_Car_Booking] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PRJ_Car_Booking] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PRJ_Car_Booking] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PRJ_Car_Booking] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PRJ_Car_Booking] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PRJ_Car_Booking] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PRJ_Car_Booking] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PRJ_Car_Booking] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PRJ_Car_Booking] SET  MULTI_USER 
GO
ALTER DATABASE [PRJ_Car_Booking] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PRJ_Car_Booking] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PRJ_Car_Booking] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PRJ_Car_Booking] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PRJ_Car_Booking] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PRJ_Car_Booking] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [PRJ_Car_Booking] SET QUERY_STORE = OFF
GO
USE [PRJ_Car_Booking]
GO
/****** Object:  Table [dbo].[Cars]    Script Date: 2/25/2024 1:07:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cars](
	[CarID] [int] IDENTITY(1,1) NOT NULL,
	[CarType] [nvarchar](50) NULL,
	[Capacity] [int] NULL,
	[RentalPricePerDay] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[CarID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ContractDetails]    Script Date: 2/25/2024 1:07:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContractDetails](
	[ContractDetailID] [int] IDENTITY(1,1) NOT NULL,
	[ContractID] [int] NULL,
	[CarID] [int] NULL,
	[Status] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ContractDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contracts]    Script Date: 2/25/2024 1:07:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contracts](
	[ContractID] [int] IDENTITY(1,1) NOT NULL,
	[username] [text] NULL,
	[StartDateTime] [date] NULL,
	[EndDateTime] [date] NULL,
	[TotalCost] [decimal](10, 2) NULL,
	[Status] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ContractID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 2/25/2024 1:07:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[username] [varchar](100) NOT NULL,
	[dob] [date] NULL,
	[email] [varchar](320) NULL,
	[full_name] [varchar](100) NULL,
	[gender] [int] NULL,
	[password] [varchar](100) NULL,
	[role] [int] NULL,
	[img] [nvarchar](max) NULL,
	[status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Cars] ON 
GO
INSERT [dbo].[Cars] ([CarID], [CarType], [Capacity], [RentalPricePerDay]) VALUES (1, N'Sedan', 4, CAST(50.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Cars] ([CarID], [CarType], [Capacity], [RentalPricePerDay]) VALUES (2, N'SUV', 7, CAST(80.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Cars] ([CarID], [CarType], [Capacity], [RentalPricePerDay]) VALUES (3, N'Van', 9, CAST(100.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Cars] ([CarID], [CarType], [Capacity], [RentalPricePerDay]) VALUES (4, N'Compact', 4, CAST(45.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Cars] ([CarID], [CarType], [Capacity], [RentalPricePerDay]) VALUES (5, N'Luxury', 4, CAST(150.00 AS Decimal(10, 2)))
GO
SET IDENTITY_INSERT [dbo].[Cars] OFF
GO
SET IDENTITY_INSERT [dbo].[ContractDetails] ON 
GO
INSERT [dbo].[ContractDetails] ([ContractDetailID], [ContractID], [CarID], [Status]) VALUES (1, 1, 1, N'Active')
GO
INSERT [dbo].[ContractDetails] ([ContractDetailID], [ContractID], [CarID], [Status]) VALUES (2, 1, 2, N'Active')
GO
INSERT [dbo].[ContractDetails] ([ContractDetailID], [ContractID], [CarID], [Status]) VALUES (3, 2, 3, N'Active')
GO
INSERT [dbo].[ContractDetails] ([ContractDetailID], [ContractID], [CarID], [Status]) VALUES (4, 3, 4, N'Active')
GO
INSERT [dbo].[ContractDetails] ([ContractDetailID], [ContractID], [CarID], [Status]) VALUES (5, 3, 5, N'Active')
GO
INSERT [dbo].[ContractDetails] ([ContractDetailID], [ContractID], [CarID], [Status]) VALUES (6, 1, 1, N'Active')
GO
INSERT [dbo].[ContractDetails] ([ContractDetailID], [ContractID], [CarID], [Status]) VALUES (7, 1, 2, N'Active')
GO
SET IDENTITY_INSERT [dbo].[ContractDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Contracts] ON 
GO
INSERT [dbo].[Contracts] ([ContractID], [username], [StartDateTime], [EndDateTime], [TotalCost], [Status]) VALUES (1, 'Aline', CAST(N'2024-02-20' AS Date), CAST(N'2024-02-25' AS Date), CAST(260.00 AS Decimal(10, 2)), N'Active')
GO
INSERT [dbo].[Contracts] ([ContractID], [username], [StartDateTime], [EndDateTime], [TotalCost], [Status]) VALUES (2, 'Aline', CAST(N'2024-03-10' AS Date), CAST(N'2024-03-15' AS Date), CAST(400.00 AS Decimal(10, 2)), N'Active')
GO
INSERT [dbo].[Contracts] ([ContractID], [username], [StartDateTime], [EndDateTime], [TotalCost], [Status]) VALUES (3, 'Aline', CAST(N'2024-04-05' AS Date), CAST(N'2024-04-10' AS Date), CAST(300.00 AS Decimal(10, 2)), N'Active')
GO
SET IDENTITY_INSERT [dbo].[Contracts] OFF
GO
INSERT [dbo].[Users] ([username], [dob], [email], [full_name], [gender], [password], [role], [img], [status]) VALUES (N'admin', CAST(N'2023-05-26' AS Date), N'malesuada@hotmail.net', N'Castor', 0, N'21232f297a57a5a743894a0e4a801fc3', 0, N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQNL_ZnOTpXSvhf1UaK7beHey2BX42U6solRA&usqp=CAU', 1)
INSERT [dbo].[Users] ([username], [dob], [email], [full_name], [gender], [password], [role], [img], [status]) VALUES (N'Aline', CAST(N'2023-07-19' AS Date), N'phasellus.dolor@yahoo.org', N'Kadeem', 0, N'202cb962ac59075b964b07152d234b70', 0, N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQNL_ZnOTpXSvhf1UaK7beHey2BX42U6solRA&usqp=CAU', 1)
INSERT [dbo].[Users] ([username], [dob], [email], [full_name], [gender], [password], [role], [img], [status]) VALUES (N'Branden', CAST(N'2023-08-15' AS Date), N'consequat.purus@google.com', N'Yuli', 0, N'202cb962ac59075b964b07152d234b70', 0, N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQNL_ZnOTpXSvhf1UaK7beHey2BX42U6solRA&usqp=CAU', 1)
INSERT [dbo].[Users] ([username], [dob], [email], [full_name], [gender], [password], [role], [img], [status]) VALUES (N'Chiquita', CAST(N'2023-04-29' AS Date), N'tellus.justo.sit@google.com', N'Ulysses', 1, N'202cb962ac59075b964b07152d234b70', 0, N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQNL_ZnOTpXSvhf1UaK7beHey2BX42U6solRA&usqp=CAU', 1)
INSERT [dbo].[Users] ([username], [dob], [email], [full_name], [gender], [password], [role], [img], [status]) VALUES (N'Christian', CAST(N'2023-05-26' AS Date), N'eu.erat@google.net', N'Damian', 0, N'202cb962ac59075b964b07152d234b70', 0, N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQNL_ZnOTpXSvhf1UaK7beHey2BX42U6solRA&usqp=CAU', 1)
INSERT [dbo].[Users] ([username], [dob], [email], [full_name], [gender], [password], [role], [img], [status]) VALUES (N'Clio', CAST(N'2023-08-17' AS Date), N'fusce@icloud.com', N'Elvis Nam', 0, N'e10adc3949ba59abbe56e057f20f883e', 0, N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQNL_ZnOTpXSvhf1UaK7beHey2BX42U6solRA&usqp=CAU', 1)
GO
ALTER TABLE [dbo].[Contracts] ADD  DEFAULT ((0)) FOR [TotalCost]
GO
ALTER TABLE [dbo].[ContractDetails]  WITH CHECK ADD FOREIGN KEY([CarID])
REFERENCES [dbo].[Cars] ([CarID])
GO
ALTER TABLE [dbo].[ContractDetails]  WITH CHECK ADD FOREIGN KEY([ContractID])
REFERENCES [dbo].[Contracts] ([ContractID])
GO
/****** Object:  StoredProcedure [dbo].[GetAvailableCars]    Script Date: 2/25/2024 1:07:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAvailableCars]
    @StartDate DATETIME,
    @EndDate DATETIME
AS
BEGIN
    SET NOCOUNT ON;

    SELECT c.*
    FROM Cars c
    WHERE c.CarID NOT IN (
        SELECT cd.CarID
        FROM ContractDetails cd
        INNER JOIN Contracts con ON cd.ContractID = con.ContractID
        WHERE NOT (@StartDate >= con.EndDateTime OR @EndDate <= con.StartDateTime)
    );
END;
GO
/****** Object:  Trigger [dbo].[UpdateContractTotalCost]    Script Date: 2/25/2024 1:07:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[UpdateContractTotalCost]
ON [dbo].[ContractDetails]
AFTER INSERT
AS
BEGIN
    DECLARE @ContractID INT;
    
    -- Get the ContractID of the newly inserted contract details
    SELECT @ContractID = ContractID FROM inserted;
    
    -- Update the TotalCost in the Contracts table
    UPDATE Contracts
    SET TotalCost = (
        SELECT SUM(RentalPricePerDay)
        FROM ContractDetails cd
        INNER JOIN Cars c ON cd.CarID = c.CarID
        WHERE cd.ContractID = @ContractID
    )
    WHERE ContractID = @ContractID;
END;
GO
ALTER TABLE [dbo].[ContractDetails] ENABLE TRIGGER [UpdateContractTotalCost]
GO
USE [master]
GO
ALTER DATABASE [PRJ_Car_Booking] SET  READ_WRITE 
GO
