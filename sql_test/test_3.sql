-- 1 Write a SQL query to find all employees along with their manager's name.
SELECT
    E.EmployeeID,
    E.FirstName AS EmployeeFirstName,
    E.LastName AS EmployeeLastName,
    M.FirstName AS ManagerFirstName,
    M.LastName AS ManagerLastName
FROM Employees E
--     creating left join between Employees and Employees
         LEFT JOIN Employees M ON E.ManagerID = M.EmployeeID;


-- 2 Write a SQL query to find the employee with the highest current salary.
SELECT
    E.EmployeeID,
    E.FirstName,
    E.LastName,
    S.Salary
FROM Employees E
 --     creating left join between Employees and Salaries
         JOIN Salaries S ON E.EmployeeID = S.EmployeeID
WHERE S.EndDate IS NULL  -- Assuming NULL EndDate indicates the current salary
ORDER BY S.Salary DESC
    LIMIT 1;


-- 3 Write a SQL query to calculate the total salary payout by the company for the current month.
SELECT
    SUM(S.Salary) AS TotalSalaryPayout
FROM Employees E
--     creating left join between Employees and Salaries
         JOIN Salaries S ON E.EmployeeID = S.EmployeeID
WHERE S.StartDate <= CURDATE() AND (S.EndDate IS NULL OR S.EndDate >= LAST_DAY(CURDATE()))
