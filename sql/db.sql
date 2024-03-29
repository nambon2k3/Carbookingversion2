USE [PRJ_Car_Booking]
GO
/****** Object:  Table [dbo].[Cars]    Script Date: 2/29/2024 11:04:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cars](
	[CarID] [int] IDENTITY(1,1) NOT NULL,
	[CarType] [nvarchar](50) NULL,
	[Capacity] [int] NULL,
	[RentalPricePerDay] [decimal](10, 2) NULL,
	[img] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[CarID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ContractDetails]    Script Date: 2/29/2024 11:04:38 PM ******/
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
/****** Object:  Table [dbo].[Contracts]    Script Date: 2/29/2024 11:04:38 PM ******/
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
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 2/29/2024 11:04:38 PM ******/
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
ALTER TABLE [dbo].[Contracts] ADD  DEFAULT ((0)) FOR [TotalCost]
GO
ALTER TABLE [dbo].[ContractDetails]  WITH CHECK ADD FOREIGN KEY([CarID])
REFERENCES [dbo].[Cars] ([CarID])
GO
ALTER TABLE [dbo].[ContractDetails]  WITH CHECK ADD FOREIGN KEY([ContractID])
REFERENCES [dbo].[Contracts] ([ContractID])
GO
/****** Object:  StoredProcedure [dbo].[GetAvailableCars]    Script Date: 2/29/2024 11:04:38 PM ******/
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
