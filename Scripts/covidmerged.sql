
merge [covid19].[dbo].[covid] as c1
using [covid19].[dbo].[covid2] as c2
on c1.submission_date = c2.submission_date
AND c1.state = c2.state
when matched then
update set
	[c1].[submission_date] = [c2].[submission_date]
	,  [c1].[state] = [c2].[state]
      ,[c1].[tot_cases]= [c2].[tot_cases]
      ,[c1].[conf_cases]= [c2].[conf_cases]
      ,[c1].[prob_cases]= [c2].[prob_cases]
      ,[c1].[new_case]= [c2].[new_case]
      ,[c1].[pnew_case]= [c2].[pnew_case]
      ,[c1].[tot_death]= [c2].[tot_death]
      ,[c1].[conf_death]= [c2].[conf_death]
      ,[c1].[prob_death]= [c2].[prob_death]
      ,[c1].[new_death]= [c2].[new_death]
      ,[c1].[pnew_death]= [c2].[pnew_death]
      ,[c1].[created_at]= [c2].[created_at]
      ,[c1].[consent_cases]= [c2].[consent_cases]
      ,[c1].[consent_deaths]= [c2].[consent_deaths]
when not matched then
insert ([submission_date]
      ,[state]
      ,[tot_cases]
      ,[conf_cases]
      ,[prob_cases]
      ,[new_case]
      ,[pnew_case]
      ,[tot_death]
      ,[conf_death]
      ,[prob_death]
      ,[new_death]
      ,[pnew_death]
      ,[created_at]
      ,[consent_cases]
      ,[consent_deaths])
values ([submission_date]
      ,[state]
      ,[tot_cases]
      ,[conf_cases]
      ,[prob_cases]
      ,[new_case]
      ,[pnew_case]
      ,[tot_death]
      ,[conf_death]
      ,[prob_death]
      ,[new_death]
      ,[pnew_death]
      ,[created_at]
      ,[consent_cases]
      ,[consent_deaths]);


