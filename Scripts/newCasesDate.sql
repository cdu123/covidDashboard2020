USE [covid19]
GO

/****** Object:  StoredProcedure [dbo].[newCasesDate]    Script Date: 1/8/2021 12:39:26 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[newCasesDate] @get_Date datetime2 AS 

SELECT state, new_case
FROM dbo.covid
where submission_date = @get_Date

GO

