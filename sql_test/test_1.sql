-- 1 Write a query to fetch all users who have signed up in the last 30 days.
SELECT *
FROM Users
-- checking the signed-update is 30
WHERE signUpDate >= DATE_SUB(NOW(), INTERVAL 30 DAY);

-- 2 Write a query to count the total number of users who have their birthday today.
SELECT COUNT(*)
FROM Users
-- condition to check user date of birth and now to know who have their birthday today
WHERE DATE_FORMAT(dateOfBirth, '%m-%d') = DATE_FORMAT(NOW(), '%m-%d');

-- 3 Write a query to fetch the top 10 oldest users who have signed up.
SELECT *
FROM Users
-- user is ordered based on signup-date for top 10 oldest user
ORDER BY signUpDate LIMIT 10;

-- 4 Write a query to update the email addresses of all users by appending ".backup" at the end of their current email.
UPDATE Users
-- updating user email and concat the .backup at the end of all users email
SET email = CONCAT(email, '.backup');