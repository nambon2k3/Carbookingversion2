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
	[UserID] [int] NULL,
	[StartDateTime] [datetime] NULL,
	[EndDateTime] [datetime] NULL,
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
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NULL,
	[Password] [nvarchar](max) NULL,
	[Email] [nvarchar](100) NULL,
	[UserType] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
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
INSERT [dbo].[Contracts] ([ContractID], [UserID], [StartDateTime], [EndDateTime], [TotalCost], [Status]) VALUES (1, 1, CAST(N'2024-02-20T08:00:00.000' AS DateTime), CAST(N'2024-02-25T08:00:00.000' AS DateTime), CAST(260.00 AS Decimal(10, 2)), N'Active')
GO
INSERT [dbo].[Contracts] ([ContractID], [UserID], [StartDateTime], [EndDateTime], [TotalCost], [Status]) VALUES (2, 2, CAST(N'2024-03-10T10:00:00.000' AS DateTime), CAST(N'2024-03-15T10:00:00.000' AS DateTime), CAST(400.00 AS Decimal(10, 2)), N'Active')
GO
INSERT [dbo].[Contracts] ([ContractID], [UserID], [StartDateTime], [EndDateTime], [TotalCost], [Status]) VALUES (3, 3, CAST(N'2024-04-05T09:00:00.000' AS DateTime), CAST(N'2024-04-10T09:00:00.000' AS DateTime), CAST(300.00 AS Decimal(10, 2)), N'Active')
GO
SET IDENTITY_INSERT [dbo].[Contracts] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 
GO
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Email], [UserType]) VALUES (1, N'customer1', N'hashed_password1', N'customer1@example.com', N'Customer')
GO
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Email], [UserType]) VALUES (2, N'customer2', N'hashed_password2', N'customer2@example.com', N'Customer')
GO
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Email], [UserType]) VALUES (3, N'customer3', N'hashed_password3', N'customer3@example.com', N'Customer')
GO
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Email], [UserType]) VALUES (4, N'employee1', N'hashed_password4', N'employee1@example.com', N'Employee')
GO
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Email], [UserType]) VALUES (5, N'employee2', N'hashed_password5', N'employee2@example.com', N'Employee')
GO
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Email], [UserType]) VALUES (6, N'admin', N'hashed_password6', N'admin@example.com', N'Admin')
GO
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Contracts] ADD  DEFAULT ((0)) FOR [TotalCost]
GO
ALTER TABLE [dbo].[ContractDetails]  WITH CHECK ADD FOREIGN KEY([CarID])
REFERENCES [dbo].[Cars] ([CarID])
GO
ALTER TABLE [dbo].[ContractDetails]  WITH CHECK ADD FOREIGN KEY([ContractID])
REFERENCES [dbo].[Contracts] ([ContractID])
GO
ALTER TABLE [dbo].[Contracts]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
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
