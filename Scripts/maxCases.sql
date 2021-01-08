USE [covid19]
GO

/****** Object:  StoredProcedure [dbo].[maxCases]    Script Date: 1/8/2021 12:39:01 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[maxCases]
AS

WITH maxCase_date AS
(
	SELECT STATE [State], MAX(new_case) [Max Case], CAST(submission_date AS DATE)[Date],
	rank() over (partition by submission_date ORDER BY new_case DESC, state) [maxCaseState]
	FROM [covid19].[dbo].[covid] 
	GROUP BY STATE, submission_date, new_case
)

SELECT [Date],[State],[Max Case]
FROM maxCase_date
WHERE maxCaseState=1

GO

