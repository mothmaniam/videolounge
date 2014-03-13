USE [master]
GO
/****** Object:  Database [videolounge]    Script Date: 2014/03/07 08:59:05 AM ******/
CREATE DATABASE [videolounge]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'videolounge', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLSERVER2012\MSSQL\DATA\videolounge.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'videolounge_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLSERVER2012\MSSQL\DATA\videolounge_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [videolounge] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [videolounge].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [videolounge] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [videolounge] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [videolounge] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [videolounge] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [videolounge] SET ARITHABORT OFF 
GO
ALTER DATABASE [videolounge] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [videolounge] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [videolounge] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [videolounge] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [videolounge] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [videolounge] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [videolounge] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [videolounge] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [videolounge] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [videolounge] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [videolounge] SET  DISABLE_BROKER 
GO
ALTER DATABASE [videolounge] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [videolounge] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [videolounge] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [videolounge] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [videolounge] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [videolounge] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [videolounge] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [videolounge] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [videolounge] SET  MULTI_USER 
GO
ALTER DATABASE [videolounge] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [videolounge] SET DB_CHAINING OFF 
GO
ALTER DATABASE [videolounge] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [videolounge] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [videolounge]
GO
/****** Object:  StoredProcedure [dbo].[sp_Debt]    Script Date: 2014/03/07 08:59:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_Debt]
	-- Add the parameters for the stored procedure here
	@Company_Name nvarchar(255),
	@Job_Active nvarchar(3)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * From Opportunities
	WHERE Company_Name LIKE @Company_Name
	AND Opportunity_Stage = 'Debt'
	AND Job_Active = @Job_Active
END


GO
/****** Object:  StoredProcedure [dbo].[sp_DebtCompleted]    Script Date: 2014/03/07 08:59:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_DebtCompleted]
	-- Add the parameters for the stored procedure here
	@Company_Name nvarchar(255),
	@Successful nvarchar(3)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * From Opportunities
	WHERE Company_Name LIKE @Company_Name
	AND Opportunity_Stage = 'Debt'
	AND Successful = @Successful
END


GO
/****** Object:  StoredProcedure [dbo].[sp_DebtPaidUnpaid]    Script Date: 2014/03/07 08:59:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_DebtPaidUnpaid] 
	-- Add the parameters for the stored procedure here
	@Company_Name nvarchar(255),
	@Job_Active nvarchar(10),
	@Paid nvarchar(3)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM Opportunities
	WHERE Company_Name = @Company_Name
	AND Opportunity_Stage = 'Debt'
	AND Job_Active = @Job_Active
	AND Paid = @Paid
END


GO
/****** Object:  StoredProcedure [dbo].[sp_InactiveLeads]    Script Date: 2014/03/07 08:59:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_InactiveLeads]
	-- Add the parameters for the stored procedure here
	@Company_Name nvarchar(255),
	@Job_Active nvarchar(10)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * From Opportunities
	WHERE Company_Name LIKE @Company_Name
	AND Opportunity_Stage = 'Pipeline'
	AND Job_Active = @Job_Active
END


GO
/****** Object:  StoredProcedure [dbo].[sp_JobsInPipeline]    Script Date: 2014/03/07 08:59:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_JobsInPipeline]
	-- Add the parameters for the stored procedure here
	@Company_Name nvarchar(255),
	@Job_Active nvarchar(10)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * From Opportunities
	WHERE Company_Name LIKE @Company_Name
	AND Opportunity_Stage = 'Pipeline'
	AND Job_Active LIKE @Job_Active
END


GO
/****** Object:  StoredProcedure [dbo].[sp_JobsInPipelineAll]    Script Date: 2014/03/07 08:59:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_JobsInPipelineAll] 
	-- Add the parameters for the stored procedure here
	@Company_Name nvarchar(255)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * From Opportunities
	WHERE Company_Name LIKE @Company_Name
	AND Opportunity_Stage = 'Pipeline'
END


GO
/****** Object:  StoredProcedure [dbo].[sp_Leads]    Script Date: 2014/03/07 08:59:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_Leads]
	-- Add the parameters for the stored procedure here
	@Company_Name nvarchar(255)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * From Opportunities
	WHERE Company_Name LIKE @Company_Name
	AND Opportunity_Stage = 'Pipeline'
	AND Job_Active IS NULL
END


GO
/****** Object:  StoredProcedure [dbo].[sp_LiveJobs]    Script Date: 2014/03/07 08:59:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_LiveJobs]
	-- Add the parameters for the stored procedure here
	@Job_Active nvarchar(3)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * From Opportunities
	WHERE Job_Active = @Job_Active
END


GO
/****** Object:  StoredProcedure [dbo].[sp_Quotes]    Script Date: 2014/03/07 08:59:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_Quotes]
	-- Add the parameters for the stored procedure here
	@Company_Name nvarchar(255),
	@Job_Active nvarchar(3)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * From Opportunities
	WHERE Company_Name LIKE @Company_Name
	AND Opportunity_Stage = 'Quote'
	AND Job_Active = @Job_Active
END


GO
/****** Object:  StoredProcedure [dbo].[sp_sortByChannel]    Script Date: 2014/03/07 08:59:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_sortByChannel]
	-- Add the parameters for the stored procedure here
	@Channel nvarchar(20)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM Opportunities O, Contacts C
	WHERE O.Company_Name = C.Company_Name
	AND C.Channel = @Channel
END


GO
/****** Object:  StoredProcedure [dbo].[sp_sortByCompany]    Script Date: 2014/03/07 08:59:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_sortByCompany]
	-- Add the parameters for the stored procedure here
	@Company_Name nvarchar(255)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM Opportunities O, Contacts C
	WHERE O.Company_Name = C.Company_Name
	AND C.Company_Name = @Company_Name
END


GO
/****** Object:  StoredProcedure [dbo].[sp_sortByCountry]    Script Date: 2014/03/07 08:59:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_sortByCountry] 
	-- Add the parameters for the stored procedure here
	@Country_Name nvarchar(255)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM Opportunities O, Countries C
	WHERE O.Country_ID = C.Country_ID
	AND O.Country = @Country_Name

END


GO
/****** Object:  StoredProcedure [dbo].[sp_sortByIndustry]    Script Date: 2014/03/07 08:59:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_sortByIndustry]
	-- Add the parameters for the stored procedure here
	@Industry nvarchar(255)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM Opportunities O, Contacts C
	WHERE O.Company_Name = C.Company_Name
	AND O.Job_Industry = @Industry
END


GO
/****** Object:  StoredProcedure [dbo].[sp_sortByRegion]    Script Date: 2014/03/07 08:59:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_sortByRegion]
	-- Add the parameters for the stored procedure here
	@Region_ID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM Opportunities O, Countries C, Regions R
	WHERE C.Country_Region = R.Region_Name
	AND O.Country_ID = C.Country_ID
	AND R.Region_ID = C.Region_ID
	AND R.Region_ID = @Region_ID
	ORDER BY O.Job_Active DESC
END


GO
/****** Object:  StoredProcedure [dbo].[sp_sortByService]    Script Date: 2014/03/07 08:59:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_sortByService]
	-- Add the parameters for the stored procedure here
	@Service nvarchar(255)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM Contacts C
	WHERE C.Work_Types LIKE '%' + @Service + '%'
END


GO
/****** Object:  StoredProcedure [dbo].[sp_ViewAppointments]    Script Date: 2014/03/07 08:59:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_ViewAppointments]
	-- Add the parameters for the stored procedure here
	@Company_Name nvarchar(255)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM Appointments
	WHERE Company_Name LIKE @Company_Name
	ORDER BY Appointment_Date DESC
END


GO
/****** Object:  Table [dbo].[Agency_Clients]    Script Date: 2014/03/07 08:59:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Agency_Clients](
	[Agency_Clients_ID] [int] IDENTITY(1,1) NOT NULL,
	[Agency_Clients_Name] [nvarchar](255) NULL,
	[Additional_Info] [nvarchar](255) NULL,
 CONSTRAINT [PK_Agency_Clients] PRIMARY KEY CLUSTERED 
(
	[Agency_Clients_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Appointments]    Script Date: 2014/03/07 08:59:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Appointments](
	[Appointment_ID] [int] IDENTITY(1,1) NOT NULL,
	[Appointment_Date] [nvarchar](255) NULL,
	[Appointment_Time] [nvarchar](255) NULL,
	[Appointment_Description] [nvarchar](max) NULL,
	[Appointment_Country] [nvarchar](255) NULL,
	[Appointment_Location] [nvarchar](255) NULL,
	[Employee] [nvarchar](50) NULL,
	[Company_Name] [nvarchar](255) NULL,
 CONSTRAINT [PK_Appointments] PRIMARY KEY CLUSTERED 
(
	[Appointment_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Contact_Persons]    Script Date: 2014/03/07 08:59:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact_Persons](
	[Contact_Person_ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[Position] [nvarchar](255) NULL,
	[Cell] [nvarchar](255) NULL,
	[Email] [nvarchar](255) NULL,
	[Company] [nvarchar](255) NULL,
 CONSTRAINT [PK_Contact_Persons] PRIMARY KEY CLUSTERED 
(
	[Contact_Person_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Contacts]    Script Date: 2014/03/07 08:59:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contacts](
	[Contact_ID] [int] IDENTITY(1,1) NOT NULL,
	[Marketer] [nvarchar](max) NULL,
	[How_Lead_Sourced] [nvarchar](max) NULL,
	[Company_Name] [nvarchar](max) NULL,
	[Additional_Info] [nvarchar](max) NULL,
	[Affiliated_To] [nvarchar](max) NULL,
	[Channel] [nvarchar](max) NULL,
	[Industry] [nvarchar](max) NULL,
	[Work_Types] [nvarchar](max) NULL,
	[Landline] [nvarchar](max) NULL,
	[Website] [nvarchar](max) NULL,
	[Physical_Address] [nvarchar](max) NULL,
	[Postal_Address] [nvarchar](max) NULL,
	[Ad_Agency] [nvarchar](max) NULL,
	[Producers_Local] [nvarchar](max) NULL,
	[Producers_International] [nvarchar](max) NULL,
	[Directors_Local] [nvarchar](max) NULL,
	[Directors_International] [nvarchar](max) NULL,
	[Produce_In_SA] [nvarchar](max) NULL,
	[Agencies_Clients] [nvarchar](max) NULL,
	[Produce_In_Countries] [nvarchar](max) NULL,
	[Meeting_Comments] [nvarchar](max) NULL,
 CONSTRAINT [PK_Entities] PRIMARY KEY CLUSTERED 
(
	[Contact_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Countries]    Script Date: 2014/03/07 08:59:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Countries](
	[Country_ID] [int] IDENTITY(1,1) NOT NULL,
	[Country_Name] [nvarchar](50) NULL,
	[Country_Region] [nvarchar](50) NULL,
	[Region_ID] [int] NULL,
 CONSTRAINT [PK_Countries] PRIMARY KEY CLUSTERED 
(
	[Country_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Debt_Collection]    Script Date: 2014/03/07 08:59:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Debt_Collection](
	[Debt_Collection_ID] [int] NOT NULL,
	[Employee] [nvarchar](50) NULL,
	[Company_Name] [nvarchar](255) NULL,
	[Client] [nvarchar](50) NULL,
	[Campaign] [nvarchar](max) NULL,
	[Status] [nvarchar](max) NULL,
	[Rand_Amount] [bigint] NULL,
	[Naira_Amount] [bigint] NULL,
	[Comments] [nvarchar](max) NULL,
 CONSTRAINT [PK_Debt_Collection] PRIMARY KEY CLUSTERED 
(
	[Debt_Collection_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Employees]    Script Date: 2014/03/07 08:59:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[Employee_ID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NULL,
	[Password] [nvarchar](max) NULL,
	[Status] [nvarchar](10) NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[Employee_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Job_Industry]    Script Date: 2014/03/07 08:59:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Job_Industry](
	[Job_Industry_ID] [int] IDENTITY(1,1) NOT NULL,
	[Job_Industry_Description] [nvarchar](50) NULL,
	[Additional_Info] [nvarchar](255) NULL,
 CONSTRAINT [PK_Job_For] PRIMARY KEY CLUSTERED 
(
	[Job_Industry_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Locations]    Script Date: 2014/03/07 08:59:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Locations](
	[Location_ID] [int] IDENTITY(1,1) NOT NULL,
	[Location_Name] [nvarchar](50) NULL,
	[Location_Colour] [nvarchar](50) NULL,
 CONSTRAINT [PK_Locations] PRIMARY KEY CLUSTERED 
(
	[Location_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Opportunities]    Script Date: 2014/03/07 08:59:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Opportunities](
	[Opportunities_ID] [int] IDENTITY(1,1) NOT NULL,
	[Employee] [nvarchar](255) NULL,
	[Country] [nvarchar](255) NULL,
	[Country_ID] [int] NULL,
	[Job_Industry] [nvarchar](255) NULL,
	[Agency] [nvarchar](255) NULL,
	[Company_Name] [nvarchar](255) NULL,
	[Opportunity_Name] [nvarchar](255) NULL,
	[Opportunity_Value] [float] NULL,
	[Opportunity_Date] [nvarchar](255) NULL,
	[Description] [nvarchar](max) NULL,
	[Date_Last_Contact] [nvarchar](255) NULL,
	[Outcome_Last_Contact] [nvarchar](max) NULL,
	[Next_Action_Required] [nvarchar](max) NULL,
	[Date_Next_Contact] [nvarchar](255) NULL,
	[Debbie_Comments] [nvarchar](max) NULL,
	[Opportunity_Stage] [nvarchar](50) NULL,
	[Last_Updated_By] [nvarchar](255) NULL,
	[Quote_Likelihood] [nvarchar](50) NULL,
	[Quote_Campaign] [nvarchar](max) NULL,
	[Quote_Status] [nvarchar](max) NULL,
	[Quote_Budget] [bigint] NULL,
	[Quote_Date_Next_Contact] [nvarchar](255) NULL,
	[Quote_Comments] [nvarchar](max) NULL,
	[Rand_Amount] [bigint] NULL,
	[Naira_Amount] [bigint] NULL,
	[Paid] [nvarchar](3) NULL,
	[Job_Active] [nvarchar](3) NULL,
	[Successful] [nvarchar](3) NULL,
 CONSTRAINT [PK_Opportunities] PRIMARY KEY CLUSTERED 
(
	[Opportunities_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Regions]    Script Date: 2014/03/07 08:59:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Regions](
	[Region_ID] [int] IDENTITY(1,1) NOT NULL,
	[Region_Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Regions] PRIMARY KEY CLUSTERED 
(
	[Region_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Work_Types]    Script Date: 2014/03/07 08:59:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Work_Types](
	[Work_Type_ID] [int] IDENTITY(1,1) NOT NULL,
	[Work_Type_Description] [nvarchar](50) NULL,
 CONSTRAINT [PK_Work_Types] PRIMARY KEY CLUSTERED 
(
	[Work_Type_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Agency_Clients] ON 

INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (1, N'Government', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (2, N'Oaklands', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (3, N'Brand Footprint', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (4, N'Casinos', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (5, N'Pod JHB', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (6, N'Leftfields CT', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (7, N'Dajcom', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (8, N'Vodacom', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (9, N'Arizona', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (10, N'Nigerian Breweries', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (11, N'DDB', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (12, N'Airtel', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (13, N'DV Works', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (14, N'Cal Bank Ghana', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (15, N'Centrespread', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (17, N'Minute Mate', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (18, N'Insight Communications', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (19, N'Bates Cosse', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (20, N'Yellow Brick Road', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (21, N'Guiness', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (22, N'Brand Believers', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (23, N'Five Alive', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (24, N'Kankelan', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (25, N'Malta Guinness', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (26, N'Stanbic', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (27, N'JWT', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (28, N'Ireland Davenport JHB', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (29, N'Bank of Ghana', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (30, N'Blackeberry', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (31, N'First Bank', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (32, N'Various', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (33, N'Other', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (34, N'None', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (35, N'Saatchi', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (36, N'Epiderm', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (37, N'Soulsight', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (38, N'Glue Media', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (39, N'Bobo Milk', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (40, N'Intercontinental Breweries', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (41, N'Prima Garnet', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (42, N'Inhouse Agency', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (43, N'MTN', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (44, N'Fidelity Bank', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (45, N'Gillettes', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (46, N'Mainstreet', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (47, N'Honeywell', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (48, N'Mikano', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (49, N'Mobitell', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (50, N'So Klin', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (51, N'24-7 Communications', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (53, N'Eva Soap', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (54, N'Firehouse', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (55, N'DP Partnership', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (56, N'Fayrouz', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (57, N'Sterling Bank', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (58, N'Oyo State', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (59, N'Nokia', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (60, N'Chivita', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (61, N'Reckit Benkiser', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (62, N'United Breweries (Macdowell Whiskey)', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (63, N'Telnet', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (64, N'Rosabel', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (65, N'Neimeth', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (66, N'Publicis West Africa', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (67, N'Elrose Productions', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (68, N'PT Mayora Cereal Brands', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (69, N'Nutricema (PZ Cuzzons)', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (70, N'Noble Carpets', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (71, N'Hypo Bleach', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (72, N'GO TV', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (73, N'PAGA', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (74, N'LTC', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (75, N'LG Mobile', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (76, N'Kome and Aircons', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (77, N'Chevron', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (78, N'Coca Cola', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (79, N'Bagco', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (80, N'Dark Sailor Rum', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (81, N'Cherrie Noodles', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (82, N'De Rica', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (83, N'Tasty Tom', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (84, N'Dano Milk', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (85, N'Proctor and Gamble', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (86, N'GLO', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (87, N'Con Oil TVC''s', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (88, N'Johnson', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (89, N'Cadburies', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (90, N'Etisalat', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (91, N'Heineken', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (92, N'Clover', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (93, N'Blue Jeans', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (94, N'Mobi Phone', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (95, N'Ogilvy Ghana', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (96, N'Total', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (97, N'Norvartis Pharmaceuticals', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (98, N'VISA', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (99, N'SKG Parmaceuticals', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (100, N'Vono Foam (VitaFoam)', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (101, N'UAC', NULL)
GO
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (102, N'UAC Gala', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (103, N'Chelsea Gin', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (104, N'Purit', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (105, N'Portland Paints', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (106, N'Maggi (Nestle)', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (108, N'UBA', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (109, N'Haier', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (110, N'Wema Bank', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (111, N'Etisalat Nigerian Idol', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (116, N'Adworks', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (117, N'Etu Odi Comuunications', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (118, N'SAB Miller', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (119, N'KFC', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (120, N'Ink Brand', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (121, N'X3M', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (122, N'Heritage Bank', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (123, N'Eko Supreme Pan Africa', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (124, N'Engen Pan Africa', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (125, N'Sun Newspaper', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (126, N'141 Worldwide', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (127, N'Continental Breweries', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (128, N'Intensity Media', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (129, N'Prize Communication', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (130, N'Adstar', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (131, N'Digibrands', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (132, N'Unified Payments', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (133, N'Halogen', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (134, N'Pepsi', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (135, N'7Up', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (136, N'Culture Communications', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (137, N'Peak Milk', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (138, N'4 Crowns Milk', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (139, N'Novelpotta', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (140, N'Stone Mountain', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (141, N'Mart Link', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (142, N'DKK', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (143, N'PZ Cuzzons', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (144, N'Cascade Water', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (145, N'Vite Vita', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (146, N'Business Strategy And Communication', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (147, N'Forte Oil', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (148, N'Keystone Bank', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (149, N'Nest Oil', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (150, N'Noahs Ark', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (151, N'Central Bank', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (152, N'Access Bank', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (153, N'Squeeky Clean', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (154, N'FMCG', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (155, N'Gold Estate', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (156, N'TBWA', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (157, N'IMS', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (158, N'Nasco', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (159, N'Swift Networks', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (160, N'Good Knight', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (161, N'Blue Bird', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (162, N'Docsa Water', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (163, N'Ems Couriers', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (164, N'Milk Product', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (165, N'Insurance Co', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (166, N'Diamond Bank', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (167, N'Interswitch', NULL)
INSERT [dbo].[Agency_Clients] ([Agency_Clients_ID], [Agency_Clients_Name], [Additional_Info]) VALUES (168, N'PT Mayora Candy Brands', NULL)
SET IDENTITY_INSERT [dbo].[Agency_Clients] OFF
SET IDENTITY_INSERT [dbo].[Appointments] ON 

INSERT [dbo].[Appointments] ([Appointment_ID], [Appointment_Date], [Appointment_Time], [Appointment_Description], [Appointment_Country], [Appointment_Location], [Employee], [Company_Name]) VALUES (1, N'2014/02/14', N'12:00', N'Valentine''s appointment', N'Nigeria', N'Alausa', N'nizaam', N'Access Bank')
INSERT [dbo].[Appointments] ([Appointment_ID], [Appointment_Date], [Appointment_Time], [Appointment_Description], [Appointment_Country], [Appointment_Location], [Employee], [Company_Name]) VALUES (2, N'2014/02/21', N'12:00', N'test appointment', N'Ghana', N'Alausa', N'nizaam', N'123test')
INSERT [dbo].[Appointments] ([Appointment_ID], [Appointment_Date], [Appointment_Time], [Appointment_Description], [Appointment_Country], [Appointment_Location], [Employee], [Company_Name]) VALUES (3, N'2014/02/28', N'12:00', N'bla bla bla', N'Ghana', N'Alausa', N'nizaam', N'111test')
SET IDENTITY_INSERT [dbo].[Appointments] OFF
SET IDENTITY_INSERT [dbo].[Contact_Persons] ON 

INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (17, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'Access Bank')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (18, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'Alpha Star Paints')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (19, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'Brand Heroes Limited')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (20, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'Cascade Water')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (21, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'Chams')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (22, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'Euro African Petroleum')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (23, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'Chemstar Paints')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (24, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'Cisco Systems')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (25, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'Classic Beverages Nigeria')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (26, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'Clear Essence Spa')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (27, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'Clover Nigeria')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (28, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'Cobranet')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (29, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'Consolidated Food and Beverages LTD')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (30, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'CPMS')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (31, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'CPMS Ghana')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (32, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'Creative Eye')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (33, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'Cross Soap Industries')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (34, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'Cyberstrobe')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (35, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'DHL Ghana')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (36, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'DizenGoff Ghana')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (37, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'Doyin Industries LTD')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (38, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'Ecobank Togo')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (39, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'Engen')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (40, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'Evolve Limited Ghana')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (41, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'EXP Ghana')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (42, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'Expresso')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (43, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'Fan Milk')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (44, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'FCMB Bank')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (45, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'First Guarantee Pensions')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (46, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'Food Concepts')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (47, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'Friesland Food Wamco Group Nigeria')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (48, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'Fumman Juice')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (49, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'Geolynx Limited')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (50, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'Ghana Breweries')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (51, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'IGI Insurance')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (52, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'Infrastructure Bank')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (53, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'Ink Brand')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (54, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'Insight Communications Ghana')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (55, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'Integrated Telecomm And Networks Ltd')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (56, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'Intercontinental Bank Of Ghana')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (57, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'Ireland Davenport')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (58, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'Jagal Group')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (59, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'JWT - Adams Advertising')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (60, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'Left Field')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (61, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'Lowe Lintas')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (62, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'Lowe Lintas Ghana')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (63, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'M&C Saatchi')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (64, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'Mainstreet Bank')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (65, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'May & Baker')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (66, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'ME Cure Health Care')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (67, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'Media Lynx Limited Ghana')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (68, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'Mediacom')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (69, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'Megasea Industries')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (70, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'Metropolitan Group Of Companies')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (71, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'Mmrs Ogilvy Ghana')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (72, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'Mobitel')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (73, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'Moringa Ogilvy Uganda')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (74, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'Mpact')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (75, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'MTN Ghana - (Scancom Limited)')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (76, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'Multiple Concepts (Charter House Ghana)')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (77, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'Multi-Trex')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (78, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'NoSak Group')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (79, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'Nigeria Distilleries')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (80, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'Nigeria Insurance')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (81, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'Nomada Group')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (82, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'Now Available Africa')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (83, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'O&M Studios')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (84, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'Oasis Insurance')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (85, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'Obat Oil')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (86, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'Ogilvy Africa Joburg')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (87, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'Oracle Productions Kenya')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (88, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'Origin 8 Saatchi Ghana')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (89, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'Park N Shop/Spar')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (90, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'Pepsi')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (91, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'Pfizer Nigeria')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (92, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'Plascon')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (93, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'Pod JHB')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (94, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'Premier Paints')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (95, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'Primus Advertising Ghana Ltd')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (96, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'Prize Communications')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (97, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'Promasidor')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (98, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'Promise Food & Beverages')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (99, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'Publicis Ghana')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (100, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'Reckit Benckiser Africa / International')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (101, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'Reckit Benkiser')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (102, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'RIM')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (103, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'Saatchi Cape Town')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (104, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'Sacra Breweries')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (105, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'Samsung')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (106, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'Saponaria')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (107, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'Saro Agrosciences')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (108, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'Scoa Foods')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (109, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'Sona Breweries')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (110, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'Spur')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (111, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'Starcomms Ltd')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (112, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'Stb Mccann Limited')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (113, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'Stb Mccann Nigeria')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (114, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'Sweet Sensation')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (115, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'Tbwa Medcom')
GO
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (116, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'Techno Oil')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (117, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'The First Group')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (118, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'Transocean Nigeria')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (119, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'Troyka Holdings')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (120, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'Tullow Ghana Ltd')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (121, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'Uba Bank Ghana')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (122, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'Unilever')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (123, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'Union Bank')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (124, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'Union Dicon Salt')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (125, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'United Breweries')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (126, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'UTC Nigeria PLC')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (127, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'Verdeant Zeal')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (128, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'Vodacom/Vodafone')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (129, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'Vodafone Ghana')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (130, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'VW Leventis Motors')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (131, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'Y&R Ghana')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (132, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'Yellow Brick Road')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (133, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'Zenith Bank Ghana')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (134, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'ZK Ghana')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (135, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'Zoom (Reliance)')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (136, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'Bates Cosse')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (137, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'Blue Bird Advertising')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (138, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'BRA')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (139, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'Briscoe Ford Nigeria')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (140, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'Centurion Gates Nigeria')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (141, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'Commstrat')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (142, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'Coscharis Group')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (143, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'Daddo Group')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (144, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'Dangote Group')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (145, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'DDB Hot Lagos')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (146, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'DP Partnership')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (147, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'Flour Mills Of Nigeria')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (148, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'Franchise Law And Kenneth')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (149, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'Globacom')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (150, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'GT Bank')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (151, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'Honeywell Flour Mills')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (152, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'IMS Immersion')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (153, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'Ingrid Strauss Freelance')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (154, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'Insight Communications Nigeria')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (155, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'JWT LTC  Nigeria')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (156, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'Keystone Bank')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (157, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'Kongo.Com')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (158, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'Lino Laboratories')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (159, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'L''Oreal West Africa')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (160, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'Mart Link')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (161, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'Mobi Phone')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (162, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'Nestle Ghana')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (163, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'Nestle Nigeria')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (164, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'Nigerian German Chemicals')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (165, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'Nigerite And Elrose Plus For Nigerite')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (166, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'Noahs Ark')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (167, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'Nokia')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (168, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'Novelpotta Y&R/Wunderman')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (169, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'Oando Oil')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (170, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'Ogilvy Africa')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (171, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'Olam Group: Candia')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (172, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'Olam Group/Crown Mills')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (173, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'Olam Group/OK Foods')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (174, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'Power Horse')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (175, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'Prima Garnet Ogilvy')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (176, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'Rosabel Leo Burnett')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (177, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'Scanad Nigeria')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (178, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'Telnet Nigeria Ltd')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (179, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'The Fire House/Obaika Consultants')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (180, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'Uba Bank')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (181, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'Vitafoam')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (182, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'Vital Products')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (183, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'Vodacom Business Nigeria')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (184, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'Zenith Bank')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (185, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'TBWA Manchester')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (186, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'TBWA Kenya')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (189, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'Ghana Commercial Bank Ltd')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (190, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'Grey Advertising Joburg')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (191, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'Saatchi')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (192, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'123test')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (193, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'111test')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (194, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'111test')
INSERT [dbo].[Contact_Persons] ([Contact_Person_ID], [Name], [Position], [Cell], [Email], [Company]) VALUES (195, N'John Doe', N'Handyman', N'0821234567', N'john.doe@gmail.com', N'111test')
SET IDENTITY_INSERT [dbo].[Contact_Persons] OFF
SET IDENTITY_INSERT [dbo].[Contacts] ON 

INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (1, NULL, NULL, N'Alpha Star Paints', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (2, NULL, NULL, N'Brand Heroes Limited', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (3, NULL, NULL, N'Cascade Water', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (4, NULL, NULL, N'Chams', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (5, NULL, NULL, N'Euro African Petroleum', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (6, NULL, NULL, N'Chemstar Paints', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (7, NULL, NULL, N'Cisco Systems', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (8, NULL, NULL, N'Classic Beverages Nigeria', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (9, NULL, NULL, N'Clear Essence Spa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (10, NULL, NULL, N'Clover Nigeria', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (11, NULL, NULL, N'Cobranet', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (12, NULL, NULL, N'Consolidated Food and Beverages LTD', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (13, NULL, NULL, N'CPMS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (14, NULL, NULL, N'CPMS Ghana', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (15, NULL, NULL, N'Creative Eye', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (16, NULL, NULL, N'Cross Soap Industries', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (17, NULL, NULL, N'Cyberstrobe', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (18, NULL, NULL, N'DHL Ghana', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (19, NULL, NULL, N'DizenGoff Ghana', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (20, NULL, NULL, N'Doyin Industries LTD', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (21, NULL, NULL, N'Ecobank Togo', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (22, NULL, NULL, N'Engen', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (23, NULL, NULL, N'Evolve Limited Ghana', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (24, NULL, NULL, N'EXP Ghana', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (25, NULL, NULL, N'Expresso', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (26, NULL, NULL, N'Fan Milk', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (27, NULL, NULL, N'FCMB Bank', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (28, NULL, NULL, N'First Guarantee Pensions', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (29, NULL, NULL, N'Food Concepts', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (30, NULL, NULL, N'Friesland Food Wamco Group Nigeria', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (31, NULL, NULL, N'Fumman Juice', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (32, NULL, NULL, N'Geolynx Limited', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (33, NULL, NULL, N'Ghana Breweries', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (34, NULL, NULL, N'Ghana Commercial Bank Ltd', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (35, NULL, NULL, N'Grey Advertising Joburg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (36, NULL, NULL, N'IGI Insurance', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (37, NULL, NULL, N'Infrastructure Bank', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (38, NULL, NULL, N'Ink Brand', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (39, NULL, NULL, N'Insight Communications Ghana', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (40, NULL, NULL, N'Integrated Telecomm And Networks Ltd', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (41, NULL, NULL, N'Intercontinental Bank Of Ghana', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (42, NULL, NULL, N'Ireland Davenport', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (43, NULL, NULL, N'Jagal Group', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (44, NULL, NULL, N'JWT - Adams Advertising', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (45, NULL, NULL, N'Left Field', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (46, NULL, NULL, N'Lowe Lintas', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (47, NULL, NULL, N'Lowe Lintas Ghana', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (48, NULL, NULL, N'M&C Saatchi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (49, NULL, NULL, N'Mainstreet Bank ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (50, NULL, NULL, N'May & Baker', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (51, NULL, NULL, N'ME Cure Health Care
', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (52, NULL, NULL, N'Media Lynx Limited Ghana', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (53, NULL, NULL, N'Mediacom', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (54, NULL, NULL, N'Megasea Industries', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (55, NULL, NULL, N'Metropolitan Group Of Companies', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (56, NULL, NULL, N'Mmrs Ogilvy Ghana', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (57, NULL, NULL, N'Mobitel', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (58, NULL, NULL, N'Moringa Ogilvy', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (59, NULL, NULL, N'Mpact', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (60, NULL, NULL, N'MTN Ghana - (Scancom Limited)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (61, NULL, NULL, N'Multiple Concepts (Charter House Ghana)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (62, NULL, NULL, N'Multi-Trex', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (63, NULL, NULL, N'NoSak Group', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (64, NULL, NULL, N'Nigeria Distilleries', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (65, NULL, NULL, N'Nigeria Insurance', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (66, NULL, NULL, N'Nomada Group', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (67, NULL, NULL, N'Now Available Africa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (68, NULL, NULL, N'O&M Studios', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (69, NULL, NULL, N'Oasis Insurance', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (70, NULL, NULL, N'Obat Oil
', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (71, NULL, NULL, N'Ogilvy Africa Joburg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (72, NULL, NULL, N'Oracle Productions Kenya', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (73, NULL, NULL, N'Origin 8 Saatchi Ghana', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (74, NULL, NULL, N'Park N Shop/Spar', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (75, NULL, NULL, N'Pepsi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (76, NULL, NULL, N'Pfizer Nigeria', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (77, NULL, NULL, N'Plascon', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (78, NULL, NULL, N'Pod JHB', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (79, NULL, NULL, N'Premier Paints', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (80, NULL, NULL, N'Primus Advertising Ghana Ltd', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (81, NULL, NULL, N'Prize Communications', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (82, NULL, NULL, N'Promasidor', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (83, NULL, NULL, N'Promise Food & Beverages', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (84, NULL, NULL, N'Publicis Ghana
', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (85, NULL, NULL, N'Reckit Benckiser Africa / International', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (86, NULL, NULL, N'Reckit Benkiser', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (87, NULL, NULL, N'RIM', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (88, NULL, NULL, N'Saatchi Cape Town', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (89, NULL, NULL, N'Sacra Breweries', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (90, NULL, NULL, N'Samsung', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (91, NULL, NULL, N'Saponaria', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (92, NULL, NULL, N'Saro Agrosciences', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (93, NULL, NULL, N'Scoa Foods', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (94, NULL, NULL, N'Sona Breweries', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (95, NULL, NULL, N'Spur', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (96, NULL, NULL, N'Starcomms Ltd', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (97, NULL, NULL, N'Stb Mccann Limited', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (98, NULL, NULL, N'Stb Mccann Nigeria
', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (99, NULL, NULL, N'Sweet Sensation', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (100, NULL, NULL, N'Tbwa Medcom', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (101, NULL, NULL, N'Techno Oil
', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (102, NULL, NULL, N'The First Group', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (103, NULL, NULL, N'Transocean Nigeria', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (104, NULL, NULL, N'Troyka Holdings', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (105, NULL, NULL, N'Tullow Ghana Ltd
', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (106, NULL, NULL, N'Uba Bank Ghana
', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (107, NULL, NULL, N'Unilever', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (108, NULL, NULL, N'Union Bank', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (109, NULL, NULL, N'Union Dicon Salt', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (110, NULL, NULL, N'United Breweries', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (111, NULL, NULL, N'UTC Nigeria PLC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (112, NULL, NULL, N'Verdeant Zeal', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (113, NULL, NULL, N'Vodacom/Vodafone', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (114, NULL, NULL, N'Vodafone Ghana', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (115, NULL, NULL, N'VW Leventis Motors', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (116, NULL, NULL, N'Y&R Ghana', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (117, NULL, NULL, N'Yellow Brick Road', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (118, NULL, NULL, N'Zenith Bank Ghana', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (119, NULL, NULL, N'ZK Ghana', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (120, NULL, NULL, N'Zoom (Reliance)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (121, NULL, NULL, N'Access Bank', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'02./09/2013 - COLIN - FIDELITY BANK HAS BEEN SHOT ALREADY WE DID IT LOCALLY. BUT WE HAVE A LOT OF OTHER PROJECTS COMING IN WE JUST NEED TO FINALISE A FEW THINGS. CONTACT ME AGAIN IN ABOUT A WEEK			
			
09.09.2013 CANT REACH COLIN REGARDING OTHER UPCOMING JOBS HE SAID I MUST CALL HIM ABOUT			
			
11.09.2013 COLIN THEY HAVE 3 NESTLE TVC''S. ONE IS A SMALL ANIMATION TVC HE WILL SEND ME THE SCRIPT TOMORROW. THE OTHER 2 TVC''S ARE FOR 22 COUNTRIES AND THEY ARE FINALSING THE SCRIPTS I CAN CALL REGARDING THOSE IN A WEEK.			
			
12.09.2013COLIN PLEASE SPEAK WITH KUJO REGARDING YOUR QUESTIONS FOR THE QUOTE I CAN ONLY DO CREATIVE. KUJO NOT ANSWERING TRY AGAIN TOMORROW. 			
			
13.09.2013 KUJO - HAS SENT ME A STORYBOARD FOR NESTLE MAGGI STOP ANIMATION FOR THE IVORY COAST. CLIENT HAS NOT SET A BUDGET BECAUSE THEY DON’T KNOW WHAT THIS WILL COST. THE SCRIPT IS 95% CONFIRMED KUJO SAID THERE MIGHT BE A VERY SMALL ADJUSTMENT ON MONDAY. IT CAN BE SHOT IN SA, GHANA OR NIGERIA AS LONG AS IT LOOKS LIKE A KITCHEN IN WEST AFRICA. THE TVC WILL NEED A FRENCH VOICE OVER. 			
			
16/09/2013 COLIN - MAGGIE - STOP ANIMATION - WE MUST QUOTE EVEN THOUGH THE SCRIPTS HAVE NOT BEEN COMPLETELY APPROVED. I HAVE TRIED CALLING KUJO AS HE IS CLIENT SERVICE PERSON AS I WANT TO HAVE THE SCRIPTS APPROVED BEOFRE WE QUOTE I HAVE MAILED KUJO 			
			
JUNE 2013 FIDELTIY BANK JOB: . 18/09/2013 FIDELITY BANK WAS DONE BY A LOCAL COMPANY IN GHANA. SPETEMBER 2013 MAGGI STOP ANIMATION - I HAVE SENT BRIEF AND BOARD TO PRODUCERS FOR QUOTING. CHRIS HAS ASKED FOR A MORE DETAILED TRANSLATION INTO ENGLISH AND CLEARER IDEA OF WHAT THEY WANT REGARDING STOP FRAME & ANIMATION. I HAVE REQUETSED A SKYPE CALL TO GET A CLEARER IDEA FROM THEM.  THE CLIENT DOES NOT HAVE A BUDGET AS THEY DO NOT KNOW HOW MUCH THIS WILL COST, THEY HAVE ASKED FOR THE QUOTE BY FRIDAY. CAN BE SHOT IN GHANA, NIGERIA OR S.A. CONFIRM A SKYPE CALL WITH COLIN BY 19/09/2013			
			
23/09/2013 STEVE IS TO SPEAK WITH XY ZOO A SPECIALISED STOP ANIMATION COMPANY IN CAPE TOWN RGERADING MAGGI STOP ANIMATION & ADVISE CHRIS HOW TO APPROACH THIS TVC			
			
SEPTEMBER 2013 MAGGI STOP ANIMATION - CHRIS HAS QUOTED 38 055,56 USD USING A MARK UP ON WIANS 3D QUOTE. KWADWO HAS RECEIVED THE QUOTE, I CAN FOLLOW UP ON THE QUOTE ON MONDAY. 			
			
SEPTEMBER 2013 MAGGI STOP ANIMATION - CHRIS HAS QUOTED 38 055,56 USD USING A MARK UP ON WIANS 3D QUOTE. 30/09/2013 KWADWO OUR QUOTE WAS A LOT MORE THAN HE EXPECTED ALTHOUGH THE CLIENT HAS NOT GIVEN AN INDICATION ON BUDGET. HE EXPECTS OUR WORK WILL BE OF A HIGHER QUALITY THAN OTHER QUOTES RECIEVED, WE ARE MORE THAN DOUBLE OTHER QUOTES. GET THE STOP ANIMATION QUOTE FROM CHRIS TOMORROW FOR KWADWO 01/10/2013			
			
01/10/2013 KWADWO THE CLIENT HAS NOW COME BACK TO THE AGENCY SAYING THEY ONLY HAVE A BUDGET OF USD 3500,00 FOR THIS TVC. KWADWO WILL HAVE TO USE A LOCAL PRODUCTION COMPANY BUT HE DOUBTS HE CAN EVEN FIND ONE TO DO IT AT THAT PRICE. I ASKED IF IT IS NOT POSSIBLE TO GET MORE BUDGET OUT OF THE CLIENT, HE SAID NO THEY CAN ONLY DO THIS AMOUNT IF THEY CANT GET IT DONE THEY WILL NOT DO IT FOR THE IVORY COAST.CALL REGARDING OTHER NESTLE TVC''S 07/10/2013			
			
07/10/2013 COLIN - HE HAS 2 NESTLE TVC SCRIPTS TO SEND ME. THE CLIENT WOULD WANT THE SAME PRODUCTION COMPANY TO DO BOTH AS A COST SAVING. IF THEY ARE DONE IN NIGERIA THE BUDGET WILL BE 50 000USD FOR EACH TVC IF IT IS DONE IN S.A THE BUDGET WOULD BE 100 000USD. BUT THE CLIENT WILL BE LOOKIIG FOR THE MOST COST EFFECTIVE SOLUTION. COLIN IS NOT MEANT TO SEND THEM TO ME AS THE SCRIPT IS NOT ALLOWED TO OFFICIALY BE SENT YET, BUT HE KNOWS HOW LONG THIS TAKES & WOULD LIKE TO SEND IT TO US SO WE CAN START THINKING ABOUT HOW BEST TO DO THIS. WE CAN ONLY DEAL WITH COLIN ON THIS FOR NOW AS WE ARE NOT SUPPOSED TO HAVE THESE SCRIPTS. I CAN CALL HIM WITH A LIST OF QUESTIONS TOMORROW ON THE SCRIPTS.CALL COLIN ON 08/10/2013			
			
08/10/2013 COLIN -HASNT HAD A CHANCE TO SEND THE 2 NESTLE SCRIPTS HE WILL STILL TRY GET THEM TO ME TODAY. HE HAS 2 NESTLE TVC SCRIPTS TO SEND ME. THE CLIENT WOULD WANT THE SAME PRODUCTION COMPANY TO DO BOTH AS A COST SAVING. CALL COLIN AGAIN IF I HAVE NOT RECIEVED THE SCRIPTS ON 09/10/2013			
			
09/10/2013 COLIN WILL SEND  2 NESTLE SCRIPTS TO ME THIS AFTERNOON. THE CLIENT WOULD WANT THE SAME PRODUCTION COMPANY TO DO BOTH AS A COST SAVING.  			
			
17/10/2013 DURAND WILL PUT FORWARD A HIGH END & LOW END DIRECTOR FOR NESTLE NIDO AND UPLOAD REFERENCES FOR THE AGENCY ONTO WETRANSFER.COM			
			
24/10/2013 COLIN RECEIVED THE LINK I SENT TO BLIZZARDS SITE FOR STEVE MANNERING FOR LOW END & MARK LAWRIE FOR HIGH END FOR NESTE NIDO TVC. I DID NOT HAVE ENOUGH TIME TO ASK HIM IF HE HAD RECEIVED ANYTHING FROM DURAND AS HE WAS RUSHING INTO A MEETING. CALL ON THE 29/11/2013			
			
NOVEMBER 2013: NO YAWA CHRIS QUOTED  81 207,60USD			
			
Hi Alice.			
Here are the costs for the no Yawa shoot… this is for shoot and post in SA but doesn’t include any agency travel… 			
My gut feel is that this is where we would be sitting if we were to shoot this in Ghana as well (including travel from SA and accommodation).			
Give me a shout if you want to chat.			
Best			
Chris			
			
			
From: Alice Champain <Alice@publiciswestafrica.com>			
Date: Monday 11 November 2013 at 3:49 PM			
To: CHRIS FRIEND <chris@blizzardproductions.tv>			
Subject: RE: No Yawa script			
			
Hello Chris,			
			
I haven’t receive the new costs please,			
			
Thanks,			
			
Alice			
			
From: CHRIS FRIEND [mailto:chris@thevideoloungect.co.za] On Behalf Of Chris Friend			
Sent: Tuesday, November 5, 2013 2:59 PM			
To: Alice Champain			
Cc: ''Samuel Akuffo''			
Subject: Re: No Yawa script			
			
			
Hi Alice.			
Sorry for such a late reply, I was under the impression I had already sent you this mail (but after checking I see that I haven’t – must have been a Monday). 			
I haven’t been able to find anyone who will take on the project as director for 45k… I take it the 45k needs to include the flights and accommodation for 3 people, right? Would you like me to do you a costing for what it will actually cost or is this a waste of time?			
Best			
Chris			
			
From: Alice Champain <Alice@publiciswestafrica.com>			
Date: Tuesday 05 November 2013 at 1:58 PM			
To: CHRIS FRIEND <chris@thevideoloungect.co.za>			
Cc: ''Samuel Akuffo'' <Samuel@publiciswestafrica.com>			
Subject: RE: No Yawa script			
			
Dear Chris,			
			
Could you please let us know where do you stand on this project?			
			
Will it be possible for us to work together? Let me know your thoughts,			
			
Thank you,			
			
Best regards,			
			
Alice			
			
From: CHRIS FRIEND [mailto:chris@thevideoloungect.co.za]			
Sent: Thursday, October 24, 2013 6:06 PM			
To: Alice Champain			
Cc: ''Samuel Akuffo''			
Subject: Re: No Yawa script			
			
Hi Alice.			
That will probably save money (not probably, definitely), but it won''t solve our problem as its still going to cost a little more than what you have – and then we are going to have a troubled time casting… we can look at it, might be a viable option. I will get back to you.			
Best			
Chris			
			
			
From: Alice Champain <Alice@publiciswestafrica.com>			
Date: Thursday 24 October 2013 8:02 PM			
To: CHRIS FRIEND <chris@thevideoloungect.co.za>			
Cc: ''Samuel Akuffo'' <Samuel@publiciswestafrica.com>			
Subject: RE: No Yawa script			
			
Dear Chris,			
			
What if we fly in SA? (three people)			
			
Let me know,			
			
Best,			
			
Alice			
			
From: CHRIS FRIEND [mailto:chris@thevideoloungect.co.za]			
Sent: Thursday, October 24, 2013 5:12 PM			
To: Alice Champain			
Cc: ''Samuel Akuffo''			
Subject: Re: No Yawa script			
			
Hi Alice.			
Sorry for such long delay, but I have been trying to find a director who is interested in doing this production at the budget (and who is available of course), but I have not been able to find anyone… there is plenty of interest as it is quite a cool scrip, but not near the 45k you are talking about.			
Sorry, I have really tried.			
Best			
Chris			
			
			
From: Alice Champain <Alice@publiciswestafrica.com>			
Date: Tuesday 22 October 2013 4:19 PM			
To: CHRIS FRIEND <chris@thevideoloungect.co.za>			
Cc: ''Samuel Akuffo'' <Samuel@publiciswestafrica.com>			
Subject: No Yawa script			
			
Dear Chris,			
			
Please find attached the revised version of No yawa script. As discussed on the phone the budget is 90 000 GHs.			
			
Can we receive the cost estimate and treatment for Thursday please?			
			
Thank you,			
			
Best regards,			
			
Alicw			
			
Alice Champain			
Account Manager			
Publicis West Africa Ltd, P.O Box CT 6212, Cantonments, Accra			
Tel:+233 3 2 776 843 Mobile:+233 501 258 855			
Email: alice@publiciswestafrica.com			
			
http://www.publicisafricagroup.com/Publicis_Africa_Group/Publicis_Ghana_files/PAG%20newsletter_r5%20copy%2045.jpg			
			
			
			
			
			
Dear Graeme,			
			
I hope to get a feedback by tomorrow.			
			
I will get back to you quickly.			
			
Thank you,			
			
Best regards,			
			
Alice			
			
From: Graeme [mailto:graeme@blizzardproductions.tv]			
Sent: Thursday, November 21, 2013 12:21 PM			
To: Alice@publiciswestafrica.com			
Subject: No Yawa			
			
Hello Alice			
			
I am following up to see if you received the revised quote for No Yawa. Have you had any feedback from your client yet?			
			
Bliz Sig Graeme			
			
			
			
			
			
			
			
			
			
21/11/2013 ALICE - NO YAWA - WE WILL HAVE FEEDBACK FROM THE CLIENT TOMORROW. CALL ON 22/11/2013	22/11/2013 COLIN - NESTLE NIDO IS NOT READY TO QUOTE ON YET CALL HIM NEXT YEEK. CALL ON 26/11/2013		
			
 22/11/2013 ALICE - NO YAWA - SHE HAS PRESENTED OUR QUOTE TO THE CLIENT. CLIENT HAS NOT MADE ANY FINAL DECISIONS YET. SHE SAID WE MIGHT STILL BE A LITTLE TO EXPENSIVE FOR THE CLIENT AS THE CLIENT WAS HOPING TO SPEND AROUND 40 000USD. SHE IS HOPING TO GIVE US MORE FEEDBACK BY MONDAY. CALL ON 25/11/2013			
			
25/11/2013 NO REPLY FROM ALICE I HAVE MAILED HER FOR FEEDBACK ON NO YAWA			
			
			
Good afternoon Graeme,			
			
Greetings from Publicis.			
Attached is a script for one of our NIDO brands .			
We would love you to quote for this production. Kindly send 2 proposals			
1.       To shoot in South Africa			
2.       To shoot in Ghana			
			
Please provide for 3 years usage - Ghana only			
			
Also do propose to us 2 directors for our consideration and their respective treatments.			
			
Kindly send us your proposal by December 4th 9am Ghana time.			
			
Looking forward to doing this with you.			
			
Kind regards			
			
Hello Graeme			
			
Please find attached the quote for Nestle Nido Essentai			
			
We have opted to shoot in SA and we going to shoot in a rural setting. We will shoot in a Rural type school and home and play down the location a bit. As shooting with children is going to be a problem we going to cast twin boys for leads so that we use both of them. One of them for Classroom, Bus stop and Award scene and then the other for Home scene. This will allow us to get the best performance out of them and allow us to shoot a full day as shooting with kids only allow us to shoot like 7 hours. We can shoot in Ghana but then we going to spend money on flying out a lot of crew and logistics (equipment etc) and not spend the money in the movie were it actually counts.			
			
We have shot a lot of African movies in SA and can send this to you to show you how authentic we get it, we have awesome Art Department who can replicate anything. We also have a lot of authentic West African cast and this won’t become a problem.			
			
Mark will be in contact today about treatment and I will be uploading Mark’s reel to share with client.			
			
			
Please look at all reels for proposed Heads of Department			
			
Mark Lawrie (Director) – http://www.marklawrie.com/			
			
Terence Maritz (Director of Photography) - http://www.terencemaritz.co.za/			
			
Lana De Carvalho (Art Director) -  http://www.gforcedesign.co.za/			
			
			
			
Let me know if you require anything further.			
			
Look forward to your reply			
			
Email DurandLeSueur C			
			
			
			
			
			
			
Hello Colin			
			
Please find attached the Link to Mark Lawrie Reel and The Video Lounge reel of work similar to the Nestle Nido Essentai			
			
Link to FTP Download			
			
http://www.hightail.com/download/OGhkZ296b0I5eFg0WjlVag			
			
Regards			
			
Email DurandLeSueur C			
			
			
			
			
			
			
			
Hi			
			
I emailed Colin to look for me on Skype because his addy – africanfuturist , comes up with a hector peterssen in London!			
			
I’m at home in bed – flu – so I’ll be here all day. Anytime is OK.			
			
Cheers			
			
Mark Lawrie | Director			
+44 77 80 86 82 83			
+27 21 813 6790			
+27 82 555 3295			
Skype “Makhlari”			
mark@lawrie.com			
www.marklawrie.com			
P Please consider the environment before printing this e-mail			
			
29/11/2013 NIDO QUOTE SENT TO COLIN & NII NIDO - NO RESPONSE FROM COLIN TO TRY SCHEDULE SKYPE MEETING WITH MARK LAWRIE. NO YAWA - NO RESPONSE FROM ALICE			
			
Hello Graeme			
			
I have another script for you.			
			
This will mean another treatment for this script and a revision of your total budget to accommodate these 2 jobs as a package.			
The whole intent is to make savings and we are hoping to get these 2 done within a budget of 210kUSD.			
			
The coverage for this will be CWAR and rights for 3years  - FRENCH & ENGLISH			
			
Thanks and please revert with questions if any.			
			
Kind regards			
			
			
Description: Corporate Mail Signature_Nii			
			
			
			
			
			
			
			
			
			
			
 03/12/2013 NII - NDO - ESSENTIA - THERE IS NOW AN ADDITIONAL SCRIPT, BUDGET FOR SHOOTING BOTH SCRIPTS BACK TO BACK IS USD210 000. I HAVE REQUESTED A SKYPE MEETING FOR THURSDAY 12:00 GHANA TIME. CALL ON 04/12/2013			
			
06/12/2013 DURAND HAS QUOTED BOTH NIDO TVCS TO IN GHANA.MARK LAWRIE WILL HAVE HIS TREATMENT TO US BY TUESDAY. WE ARE PUSHING MARK TO HAVE IT DONE BY TUESDAY MORNING AS WE NEED TO GET IT TO AGENCY BY TUESDAY AFTERNOON. I HAVE RECIEVED MUSIC & VISUAL REFERENCES WHICH I HAVE PASSED ONTO MARK. GET TREATMENT TO AGENCY ON 10/12/2013			
')
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (122, NULL, NULL, N'Bates Cosse', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (123, NULL, NULL, N'Blue Bird Advertising', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (124, NULL, NULL, N'BRA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (125, NULL, NULL, N'Briscoe Ford Nigeria', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (126, NULL, NULL, N'Centurion Gates Nigeria', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (127, NULL, NULL, N'Commstrat', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (128, NULL, NULL, N'Coscharis Group', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (129, NULL, NULL, N'Daddo Group', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (130, NULL, NULL, N'Dangote Group', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (131, NULL, NULL, N'DDB Hot Lagos', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (132, NULL, NULL, N'DP Partnership', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (133, NULL, NULL, N'Flour Mills Of Nigeria', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (134, NULL, NULL, N'Franchise Law And Kenneth', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (135, NULL, NULL, N'Globacom', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (136, NULL, NULL, N'GT Bank', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (137, NULL, NULL, N'Honeywell Flour Mills', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (138, NULL, NULL, N'IMS Immersion', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (139, NULL, NULL, N'Ingrid Strauss Freelance', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (140, NULL, NULL, N'Insight Communications Nigeria', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (141, NULL, NULL, N'JWT LTC  Nigeria', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (142, NULL, NULL, N'Keystone Bank', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (143, NULL, NULL, N'Kongo.Com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (144, NULL, NULL, N'Lino Laboratories', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (145, NULL, NULL, N'L''Oreal West Africa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (146, NULL, NULL, N'Mart Link', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (147, NULL, NULL, N'Mobi Phone', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (148, NULL, NULL, N'Nestle Ghana', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (149, NULL, NULL, N'Nestle Nigeria', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (150, NULL, NULL, N'Nigerian German Chemicals', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (151, NULL, NULL, N'Nigerite And Elrose Plus For Nigerite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (152, NULL, NULL, N'Noahs Ark', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (153, NULL, NULL, N'Nokia', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (154, NULL, NULL, N'Novelpotta Y&R/Wunderman', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (155, NULL, NULL, N'Oando Oil', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (156, NULL, NULL, N'Ogilvy Africa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (157, NULL, NULL, N'Olam Group: Candia', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (158, NULL, NULL, N'Olam Group/Crown Mills', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (159, NULL, NULL, N'Olam Group/OK Foods', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (160, NULL, NULL, N'Power Horse', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (161, NULL, NULL, N'Prima Garnet Ogilvy', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (162, NULL, NULL, N'Rosabel Leo Burnett', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (163, NULL, NULL, N'Scanad Nigeria', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (164, NULL, NULL, N'Telnet Nigeria Ltd', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (165, NULL, NULL, N'The Fire House/Obaika Consultants', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (166, NULL, NULL, N'Uba Bank', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (167, NULL, NULL, N'Vitafoam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (168, NULL, NULL, N'Vital Products', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (169, NULL, NULL, N'Vodacom Business Nigeria', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (170, NULL, NULL, N'Zenith Bank', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (171, NULL, NULL, N'TBWA Manchester', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (172, NULL, NULL, N'TBWA Kenya', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contacts] ([Contact_ID], [Marketer], [How_Lead_Sourced], [Company_Name], [Additional_Info], [Affiliated_To], [Channel], [Industry], [Work_Types], [Landline], [Website], [Physical_Address], [Postal_Address], [Ad_Agency], [Producers_Local], [Producers_International], [Directors_Local], [Directors_International], [Produce_In_SA], [Agencies_Clients], [Produce_In_Countries], [Meeting_Comments]) VALUES (177, N'nizaam', N'internet', N'111test', NULL, N'no one', N'Corporate', N'Bank', N'Production', N'0215559988', N'www.nizaam.com', N'111', N'111', N'', N'video lounge, cape films', N'no one', N'video lounge, cape films', N'no one', N'Yes', N'no one', N'Ghana', NULL)
SET IDENTITY_INSERT [dbo].[Contacts] OFF
SET IDENTITY_INSERT [dbo].[Countries] ON 

INSERT [dbo].[Countries] ([Country_ID], [Country_Name], [Country_Region], [Region_ID]) VALUES (1, N'Ghana', N'Africa', 1)
INSERT [dbo].[Countries] ([Country_ID], [Country_Name], [Country_Region], [Region_ID]) VALUES (2, N'Kenya', N'Africa', 1)
INSERT [dbo].[Countries] ([Country_ID], [Country_Name], [Country_Region], [Region_ID]) VALUES (3, N'Nigeria', N'Africa', 1)
INSERT [dbo].[Countries] ([Country_ID], [Country_Name], [Country_Region], [Region_ID]) VALUES (4, N'South Africa', N'Africa', 1)
INSERT [dbo].[Countries] ([Country_ID], [Country_Name], [Country_Region], [Region_ID]) VALUES (5, N'Togo', N'Africa', 1)
INSERT [dbo].[Countries] ([Country_ID], [Country_Name], [Country_Region], [Region_ID]) VALUES (6, N'Uganda', N'Africa', 1)
SET IDENTITY_INSERT [dbo].[Countries] OFF
SET IDENTITY_INSERT [dbo].[Employees] ON 

INSERT [dbo].[Employees] ([Employee_ID], [Username], [Password], [Status]) VALUES (1, N'debbie', N'cRjov+R/YI5pBY7uhC8tlOT1+E9sJz5bkz9WUHqElTo3xv6kW4ZUEn3OQUi18o5zBAscLcxbLVjzoIluiIpbGCHax9ca', N'active')
INSERT [dbo].[Employees] ([Employee_ID], [Username], [Password], [Status]) VALUES (2, N'graeme', N'PnAqkl7iPczAeXPFwp4hcxD8dQV1oe99mfkkPug5dMjkzcLo+JAiWYNjtgxz459/vJw4iuHvvJzsuvgHfUMUaI2j8cbc', N'active')
INSERT [dbo].[Employees] ([Employee_ID], [Username], [Password], [Status]) VALUES (3, N'quintin', N'/7WJLyJBVhsXiCXMQVM3SJPEAqer9MU8tja6WB1VI1NIBuV2N2ommS+dOpjEgXeqhZDvtkpTk5UWQpOe0iwuGSApQQui', N'active')
INSERT [dbo].[Employees] ([Employee_ID], [Username], [Password], [Status]) VALUES (4, N'nizaam', N'f8r6LfQQ3pcNAd6GM0bYm3ddECp2ZX4RoZ5zA2p5s5hHDy2pEZPp3PnF4TaJnUk1YXs2iuqY7qhYlijALJUVtDabCW8jxrY=', N'active')
INSERT [dbo].[Employees] ([Employee_ID], [Username], [Password], [Status]) VALUES (5, N'test', N'CTgrsVb6iTvB3rCuGnVJRPKKCoZ1dRzwrPICQZpInp3J6dcu1pfKTpHHeJA4oRIpGACd7fZNRz20enWUUIPI+Gt1sHY=', N'active')
SET IDENTITY_INSERT [dbo].[Employees] OFF
SET IDENTITY_INSERT [dbo].[Job_Industry] ON 

INSERT [dbo].[Job_Industry] ([Job_Industry_ID], [Job_Industry_Description], [Additional_Info]) VALUES (3, N'Oil and Gas', NULL)
INSERT [dbo].[Job_Industry] ([Job_Industry_ID], [Job_Industry_Description], [Additional_Info]) VALUES (4, N'Telecommunication', NULL)
INSERT [dbo].[Job_Industry] ([Job_Industry_ID], [Job_Industry_Description], [Additional_Info]) VALUES (5, N'Food', NULL)
INSERT [dbo].[Job_Industry] ([Job_Industry_ID], [Job_Industry_Description], [Additional_Info]) VALUES (6, N'Cellphone Network', NULL)
INSERT [dbo].[Job_Industry] ([Job_Industry_ID], [Job_Industry_Description], [Additional_Info]) VALUES (7, N'Bank', NULL)
INSERT [dbo].[Job_Industry] ([Job_Industry_ID], [Job_Industry_Description], [Additional_Info]) VALUES (8, N'Insurance', NULL)
INSERT [dbo].[Job_Industry] ([Job_Industry_ID], [Job_Industry_Description], [Additional_Info]) VALUES (9, N'Group - Cleaning Beauty and Food', NULL)
INSERT [dbo].[Job_Industry] ([Job_Industry_ID], [Job_Industry_Description], [Additional_Info]) VALUES (10, N'Pharmaceutical', NULL)
INSERT [dbo].[Job_Industry] ([Job_Industry_ID], [Job_Industry_Description], [Additional_Info]) VALUES (11, N'Group - CCD Stores, Haulage, Distillers and Oil', NULL)
INSERT [dbo].[Job_Industry] ([Job_Industry_ID], [Job_Industry_Description], [Additional_Info]) VALUES (12, N'Production Company', NULL)
INSERT [dbo].[Job_Industry] ([Job_Industry_ID], [Job_Industry_Description], [Additional_Info]) VALUES (13, N'Retailer', NULL)
INSERT [dbo].[Job_Industry] ([Job_Industry_ID], [Job_Industry_Description], [Additional_Info]) VALUES (14, N'Soft Drinks', NULL)
INSERT [dbo].[Job_Industry] ([Job_Industry_ID], [Job_Industry_Description], [Additional_Info]) VALUES (15, N'Soap and Detergent Manufacturers', NULL)
INSERT [dbo].[Job_Industry] ([Job_Industry_ID], [Job_Industry_Description], [Additional_Info]) VALUES (16, N'Group', NULL)
SET IDENTITY_INSERT [dbo].[Job_Industry] OFF
SET IDENTITY_INSERT [dbo].[Locations] ON 

INSERT [dbo].[Locations] ([Location_ID], [Location_Name], [Location_Colour]) VALUES (1, N'Ikoyi', N'EE7CB3')
INSERT [dbo].[Locations] ([Location_ID], [Location_Name], [Location_Colour]) VALUES (2, N'Victoria Island', N'EE7CB3')
INSERT [dbo].[Locations] ([Location_ID], [Location_Name], [Location_Colour]) VALUES (3, N'Lekki', N'EE7CB3')
INSERT [dbo].[Locations] ([Location_ID], [Location_Name], [Location_Colour]) VALUES (4, N'Out Of Town', N'833030')
INSERT [dbo].[Locations] ([Location_ID], [Location_Name], [Location_Colour]) VALUES (5, N'Ikeja', N'1F38D7')
INSERT [dbo].[Locations] ([Location_ID], [Location_Name], [Location_Colour]) VALUES (6, N'Ojota', N'1F38D7')
INSERT [dbo].[Locations] ([Location_ID], [Location_Name], [Location_Colour]) VALUES (7, N'Maryland', N'1F38D7')
INSERT [dbo].[Locations] ([Location_ID], [Location_Name], [Location_Colour]) VALUES (8, N'Anthony', N'1F38D7')
INSERT [dbo].[Locations] ([Location_ID], [Location_Name], [Location_Colour]) VALUES (9, N'Opebi', N'1F38D7')
INSERT [dbo].[Locations] ([Location_ID], [Location_Name], [Location_Colour]) VALUES (10, N'Alausa', N'F9E356')
INSERT [dbo].[Locations] ([Location_ID], [Location_Name], [Location_Colour]) VALUES (11, N'Oregun', N'F9E356')
INSERT [dbo].[Locations] ([Location_ID], [Location_Name], [Location_Colour]) VALUES (12, N'Illupeju', N'F9E356')
INSERT [dbo].[Locations] ([Location_ID], [Location_Name], [Location_Colour]) VALUES (13, N'Oshodi', N'F9E356')
INSERT [dbo].[Locations] ([Location_ID], [Location_Name], [Location_Colour]) VALUES (14, N'Apapa', N'F36214')
INSERT [dbo].[Locations] ([Location_ID], [Location_Name], [Location_Colour]) VALUES (15, N'Apapa Expressway', N'F36214')
INSERT [dbo].[Locations] ([Location_ID], [Location_Name], [Location_Colour]) VALUES (16, N'Marina', N'0C6E0D')
INSERT [dbo].[Locations] ([Location_ID], [Location_Name], [Location_Colour]) VALUES (17, N'Lagos Island', N'0C6E0D')
INSERT [dbo].[Locations] ([Location_ID], [Location_Name], [Location_Colour]) VALUES (18, N'Yaba', N'0C6E0D')
INSERT [dbo].[Locations] ([Location_ID], [Location_Name], [Location_Colour]) VALUES (19, N'Surulere', N'0C6E0D')
SET IDENTITY_INSERT [dbo].[Locations] OFF
SET IDENTITY_INSERT [dbo].[Opportunities] ON 

INSERT [dbo].[Opportunities] ([Opportunities_ID], [Employee], [Country], [Country_ID], [Job_Industry], [Agency], [Company_Name], [Opportunity_Name], [Opportunity_Value], [Opportunity_Date], [Description], [Date_Last_Contact], [Outcome_Last_Contact], [Next_Action_Required], [Date_Next_Contact], [Debbie_Comments], [Opportunity_Stage], [Last_Updated_By], [Quote_Likelihood], [Quote_Campaign], [Quote_Status], [Quote_Budget], [Quote_Date_Next_Contact], [Quote_Comments], [Rand_Amount], [Naira_Amount], [Paid], [Job_Active], [Successful]) VALUES (1, N'debbie', N'Ghana', 1, N'Bank', N'141 Worldwide', N'Access Bank', N'testjob', 5000, N'2013/12/11', NULL, N'2013/12/11', N'sdasd', N'asda', N'2013/12/11', NULL, N'Quote', N'nizaam', N'', N'', N'', NULL, NULL, NULL, 0, 0, NULL, N'Yes', NULL)
SET IDENTITY_INSERT [dbo].[Opportunities] OFF
SET IDENTITY_INSERT [dbo].[Regions] ON 

INSERT [dbo].[Regions] ([Region_ID], [Region_Name]) VALUES (1, N'Africa')
INSERT [dbo].[Regions] ([Region_ID], [Region_Name]) VALUES (2, N'Asia')
INSERT [dbo].[Regions] ([Region_ID], [Region_Name]) VALUES (3, N'Europe')
INSERT [dbo].[Regions] ([Region_ID], [Region_Name]) VALUES (4, N'Middle East')
SET IDENTITY_INSERT [dbo].[Regions] OFF
SET IDENTITY_INSERT [dbo].[Work_Types] ON 

INSERT [dbo].[Work_Types] ([Work_Type_ID], [Work_Type_Description]) VALUES (1, N'TV Commercials')
INSERT [dbo].[Work_Types] ([Work_Type_ID], [Work_Type_Description]) VALUES (2, N'TV Series')
INSERT [dbo].[Work_Types] ([Work_Type_ID], [Work_Type_Description]) VALUES (3, N'Corporates and Training')
INSERT [dbo].[Work_Types] ([Work_Type_ID], [Work_Type_Description]) VALUES (4, N'Live Shows')
INSERT [dbo].[Work_Types] ([Work_Type_ID], [Work_Type_Description]) VALUES (5, N'Radio')
INSERT [dbo].[Work_Types] ([Work_Type_ID], [Work_Type_Description]) VALUES (6, N'Print')
INSERT [dbo].[Work_Types] ([Work_Type_ID], [Work_Type_Description]) VALUES (7, N'Public Relations')
INSERT [dbo].[Work_Types] ([Work_Type_ID], [Work_Type_Description]) VALUES (8, N'Equipment Hire')
INSERT [dbo].[Work_Types] ([Work_Type_ID], [Work_Type_Description]) VALUES (9, N'Post Production')
INSERT [dbo].[Work_Types] ([Work_Type_ID], [Work_Type_Description]) VALUES (10, N'Line Producing')
INSERT [dbo].[Work_Types] ([Work_Type_ID], [Work_Type_Description]) VALUES (11, N'Event Management')
INSERT [dbo].[Work_Types] ([Work_Type_ID], [Work_Type_Description]) VALUES (12, N'Billboards')
SET IDENTITY_INSERT [dbo].[Work_Types] OFF
ALTER TABLE [dbo].[Countries]  WITH CHECK ADD  CONSTRAINT [FK_Countries_Regions] FOREIGN KEY([Region_ID])
REFERENCES [dbo].[Regions] ([Region_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Countries] CHECK CONSTRAINT [FK_Countries_Regions]
GO
ALTER TABLE [dbo].[Opportunities]  WITH CHECK ADD  CONSTRAINT [FK_Opportunities_Countries] FOREIGN KEY([Country_ID])
REFERENCES [dbo].[Countries] ([Country_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Opportunities] CHECK CONSTRAINT [FK_Opportunities_Countries]
GO
USE [master]
GO
ALTER DATABASE [videolounge] SET  READ_WRITE 
GO
