USE [covid19]
GO

/****** Object:  StoredProcedure [dbo].[twoStatesCases_TempTables]    Script Date: 1/8/2021 12:40:30 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[twoStatesCases_TempTables] @State1 nvarchar(2), @State2 nvarchar(2), @startDate datetime2 = NULL, @endDate datetime2 =NULL
AS

SELECT state, submission_date[Date], new_case[Total Cases]
INTO #table1
FROM [covid19].[dbo].[covid]
WHERE state = @State1

SELECT state, submission_date[Date], new_case[Total Cases]
INTO #table2
FROM [covid19].[dbo].[covid]
WHERE state = @State2

SELECT CAST(table1.Date AS DATE)[Date],
CASE
  WHEN table1.[Total Cases] < table2.[Total Cases] THEN  @State2 + ' has ' + CAST((table2.[Total Cases] - table1.[Total Cases]) AS nvarchar(50)) + ' more new case' +
	CASE
		WHEN (table2.[Total Cases] - table1.[Total Cases]) = 1 THEN + ''
		WHEN (table2.[Total Cases] - table1.[Total Cases]) != 1 THEN + 's'
	END 
		+
   ' than ' + @State1

  WHEN table2.[Total Cases] < table1.[Total Cases] THEN @State1 + ' has ' + CAST((table1.[Total Cases] - table2.[Total Cases]) AS nvarchar(50)) + ' more new case' + 
  +
	CASE
		WHEN (table1.[Total Cases] - table2.[Total Cases]) = 1 THEN + ''
		WHEN (table1.[Total Cases] - table2.[Total Cases]) != 1 THEN + 's'
	END 
		+
   ' than ' + @State2

  ELSE 'No Change'
END AS "Cases"
FROM 
	#table1 [table1]

INNER JOIN 
	#table2 [table2]
		
ON table1.Date = table2.Date

WHERE 1 = 1
	AND (@startDate IS NULL OR (table1.Date > @startDate) )

	AND (@endDate IS NULL OR (table1.Date < @endDate) )

GO

