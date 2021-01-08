USE [covid19]
GO

/****** Object:  Table [dbo].[covid]    Script Date: 1/8/2021 12:15:50 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[covid](
	[submission_date] [datetime2](7) NOT NULL,
	[state] [nvarchar](50) NOT NULL,
	[tot_cases] [int] NOT NULL,
	[conf_cases] [nvarchar](50) NULL,
	[prob_cases] [nvarchar](50) NULL,
	[new_case] [int] NOT NULL,
	[pnew_case] [nvarchar](50) NULL,
	[tot_death] [int] NOT NULL,
	[conf_death] [nvarchar](50) NULL,
	[prob_death] [nvarchar](50) NULL,
	[new_death] [int] NOT NULL,
	[pnew_death] [nvarchar](50) NULL,
	[created_at] [datetime2](7) NOT NULL,
	[consent_cases] [nvarchar](50) NULL,
	[consent_deaths] [nvarchar](50) NULL
) ON [PRIMARY]
GO


