
SELECT *
FROM [dbo].[02_Employee_info]

SELECT *
FROM [dbo].[02_Employee_Position]

-- 01
--Write a query to fetch the EmpFname from the EmployeeInfo table in the upper case and use the ALIAS name as EmpName.

SELECT[EmpFname],
	UPPER([EmpFname]) AS EmpName
FROM [dbo].[02_Employee_info]

--02
--Write a query to fetch the number of employees working in the department ‘HR’

SELECT COUNT([EmpID])
FROM [dbo].[02_Employee_info]
WHERE [Department] = 'HR'

--03
--Write a query to get the current date.
SELECT GETDATE() As 'Current_Date'

--04
--Write a query to retrieve the first four characters of  EmpLname from the EmployeeInfo table.

SELECT LEFT([EmpFname],4) Short_Name
FROM [dbo].[02_Employee_info]

--05
--Write a query to fetch only the place name(string before brackets) from the Address column of EmployeeInfo table.

SELECT RTRIM(LEFT([Address], CHARINDEX('(',[Address])-1)) AS Place_Name
FROM [dbo].[02_Employee_info]

--06
--Write a query to create a new table that consists of data and structure copied from the other table.

SELECT *
INTO [dbo].[02_Employee_info_Backup]
FROM [dbo].[02_Employee_info]

--07
--Write a query to find all the employees whose salary is between 50000 to 100000.

SELECT*
FROM [dbo].[02_Employee_Position]
WHERE [Salary] BETWEEN 50000 AND 100000

--08
--Write a query to find the names of employees that begin with ‘S’

SELECT*
FROM [dbo].[02_Employee_info]
WHERE [EmpFname] LIKE 'S%'

--09
--Write a query to fetch top 3 records.

SELECT TOP 3*
FROM [dbo].[02_Employee_Position]
ORDER BY [Salary] DESC

--10
--Write a query to retrieve the EmpFname and EmpLname in a single column as “FullName”. The first name and the last name must be separated with space.

SELECT *,
	CONCAT([EmpFname], ' ', [EmpLname]) AS Full_Name
FROM [dbo].[02_Employee_info]

--11
--Write a query find number of employees whose DOB is between 02/05/1970 to 31/12/1995 and are grouped according to gender

SELECT [Gender],
	COUNT([EmpID])
FROM [dbo].[02_Employee_info]
WHERE [DOB] BETWEEN '1970-05-02' AND '1995-12-31'
GROUP BY [Gender]

--12
--Write a query to fetch all the records from the EmployeeInfo table ordered by EmpLname in descending order and Department in the ascending order.

SELECT*
FROM [dbo].[02_Employee_info]
ORDER BY [EmpLname] DESC,
		[Department]

--13
--Write a query to fetch details of employees whose EmpLname ends with an alphabet ‘A’ and contains five alphabets.

SELECT *
FROM [dbo].[02_Employee_info]
WHERE [EmpLname] LIKE '____A'

--14
--Write a query to fetch details of all employees excluding the employees with first names, “Sanjay” and “Sonia” from the EmployeeInfo table.

SELECT*
FROM [dbo].[02_Employee_info]
WHERE [EmpFname] NOT IN ('Sanjay','Sonia')

--15
--Write a query to fetch details of employees with the address as “DELHI(DEL)”

SELECT *
FROM [dbo].[02_Employee_info]
WHERE [Address] = 'DELHI(DEL)'

--16
--Write a query to fetch all employees who also hold the managerial position.

SELECT *
FROM [dbo].[02_Employee_Position]
WHERE [EmpPosition] = 'Manager'

--17
--Write a query to fetch the department-wise count of employees sorted by department’s count in ascending order

SELECT [Department],
	COUNT([Department])
FROM [dbo].[02_Employee_info]
GROUP BY [Department]

--18
--Write a query to fecth Male employees in HR department

SELECT *
FROM [dbo].[02_Employee_info]
WHERE [Gender] = 'M' AND [Department] = 'HR'

--19
--Write a SQL query to retrieve employee details from EmployeeInfo table who have a date of joining in the EmployeePosition table

SELECT i.[EmpID],
		i.[EmpFname],
		i.[EmpLname],
		i.[Department],
		i.[Project],
		i.[Address],
		i.[DOB],
		i.[Gender]
FROM [dbo].[02_Employee_info] i
JOIN [dbo].[02_Employee_Position] p ON i.[EmpID] = p.[EmpID]
WHERE p.[DateOfJoining] IS NOT NULL

--20
--Write a query to retrieve two minimum and maximum salaries from the EmployeePosition table

WITH Temporary_Table AS (
	SELECT*,
	RANK () OVER (ORDER BY [Salary] DESC) AS Desc_Insured,
	RANK () OVER (ORDER BY [Salary]) AS Asc_Insured
	FROM [dbo].[01_Employee_Salary] 
)

SELECT*
FROM Temporary_Table
WHERE Desc_Insured <=1 OR Asc_Insured <=1
