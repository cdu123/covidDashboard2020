USE [covid19]
GO

/****** Object:  StoredProcedure [dbo].[oneState_newCases]    Script Date: 1/8/2021 12:39:44 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[oneState_newCases] @State nvarchar(2), @startDate datetime2, @endDate datetime2
AS

SELECT state, CAST(submission_date AS DATE), new_case, tot_cases
FROM [covid19].[dbo].[covid]
WHERE state = @State 
AND submission_date BETWEEN @startDate AND @endDate
order by submission_date

GO

