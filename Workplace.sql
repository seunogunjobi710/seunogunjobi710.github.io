-- WORKPLACE SAFETY DATA QUERIES

--How many incidents occurred at each plant?
SELECT [Plant],
	   COUNT(*) AS Plant_Count
FROM [dbo].[Workplace Safety Data]
GROUP BY [Plant]



--What is the total incident cost per department?
SELECT [Department],
		SUM([Incident_Cost])
FROM [dbo].[Workplace Safety Data]
GROUP BY [Department]


--Which incident type resulted in the highest total days lost?

SELECT TOP 1 [Incident_Type],
		SUM([Days_Lost]) AS Sum_Days_Lost
FROM [dbo].[Workplace Safety Data]
GROUP BY [Incident_Type]
ORDER BY Sum_Days_Lost DESC


--What is the distribution of incident types by shift?
SELECT [Shift],
		[Incident_Type],
	    COUNT(*) AS Incident_Count
FROM [dbo].[Workplace Safety Data]
GROUP BY [Shift],
		[Incident_Type]


--What is the average incident cost for each injury location?

SELECT [Injury_Location],
		AVG([Incident_Cost]) AS Avg_Incident_Cost
FROM [dbo].[Workplace Safety Data]
GROUP BY [Injury_Location]
ORDER BY Avg_Incident_Cost DESC


--Which age group has the highest number of incidents?

SELECT TOP 1 [Age_Group],
       COUNT(*) AS Age_Group_Count
FROM [dbo].[Workplace Safety Data]
GROUP BY [Age_Group]
ORDER BY Age_Group_Count DESC


--How many incidents were reported as 'Lost Time' by each plant?

SELECT COUNT(*)
FROM [dbo].[Workplace Safety Data]
WHERE [Report_Type] = 'Lost Time'


--Which department had the highest number of 'Crush & Pinch' incidents?

SELECT TOP 1 [Department],
		COUNT(*) AS Crush_Pin_Dept
FROM [dbo].[Workplace Safety Data]
WHERE [Incident_Type] = 'Crush & Pinch'
GROUP BY [Department]
ORDER BY Crush_Pin_Dept DESC


--Which plants reported the most "Near Miss" incidents?

SELECT TOP 1 [Plant],
		COUNT(*) AS Near_Miss_Count
FROM [dbo].[Workplace Safety Data]
WHERE [Report_Type] = 'Near Miss'
GROUP BY[Plant]
ORDER BY Near_Miss_Count DESC


--What is the total number of incidents by year and month?

SELECT [Year],
	   [Month],
		COUNT (*) AS Incident_Count
FROM [dbo].[Workplace Safety Data]
GROUP BY [Year],
		 [Month]
ORDER BY [Year] DESC


--Which gender has the most reported incidents?

SELECT [Gender],
		COUNT(*) AS Gender_Count
FROM [dbo].[Workplace Safety Data]
GROUP BY [Gender]


--What is the total cost of incidents per year?

SELECT [Year],
	SUM([Incident_Cost]) AS Yearly_Incident_Cost
FROM [dbo].[Workplace Safety Data]
GROUP BY [Year]


--Which incident resulted in the highest cost?

SELECT TOP 1 [Incident_Type],
	SUM([Incident_Cost]) AS Total_Incident_Cost
FROM [dbo].[Workplace Safety Data]
GROUP BY [Incident_Type]
ORDER BY Total_Incident_Cost DESC


--What is the total cost of incidents for each report type?

SELECT [Report_Type],
	SUM([Incident_Cost])
FROM [dbo].[Workplace Safety Data]
GROUP BY [Report_Type]


--Which departments had incidents with more than 2 days lost?

SELECT DISTINCT [Department]
FROM [dbo].[Workplace Safety Data]
WHERE [Days_Lost] > 2


--What is the average number of days lost per incident type?

SELECT [Incident_Type],
	AVG([Days_Lost]) AS Avg_Days_Lost
FROM [dbo].[Workplace Safety Data]
GROUP BY [Incident_Type]


--What is the distribution of incidents by shift (Day, Afternoon, Night)?

SELECT [Shift], 
	COUNT(*)
FROM [dbo].[Workplace Safety Data]
GROUP BY [Shift]


--Which months have the highest number of incidents?

SELECT [Month],
	COUNT(*)
FROM [dbo].[Workplace Safety Data]
GROUP BY [Month]


--What is the total cost of "Vehicle" related incidents?

SELECT SUM([Incident_Cost])
FROM [dbo].[Workplace Safety Data]
WHERE [Incident_Type] = 'Vehicle'


--Which age group is most affected by "Falling Object" incidents?

SELECT TOP 1 [Age_Group],
		COUNT(*) AS Falling_Object_Count
FROM [dbo].[Workplace Safety Data]
WHERE [Incident_Type] = 'Falling Object'
GROUP BY [Age_Group]
ORDER BY Falling_Object_Count DESC



