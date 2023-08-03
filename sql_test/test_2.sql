-- 1 Write a query to find the total revenue generated each day.
SELECT orderDate, SUM(quantity * unitPrice) AS totalRevenue
FROM Orders O
--     creating join between Orders and orderItems
         JOIN OrderItems OI ON O.orderId = OI.orderId
-- grouping the data based on order date
GROUP BY orderDate
ORDER BY orderDate;

-- 2 Write a query to find the user who has placed the maximum number of orders.
SELECT U.userId, U.userName, COUNT(O.orderId) AS orderCount
FROM Users U
 --     creating join between Orders and Users
         JOIN Orders O ON U.userId = O.userId
-- grouping the data based on userID and userName
GROUP BY U.userId, U.userName
ORDER BY orderCount DESC LIMIT 1;

-- 3 Write a query to find the most sold product by quantity.
SELECT P.productId, P.productName, SUM(OI.quantity) AS totalQuantitySold
FROM Products P
--     creating join between Products and OrderItems
         JOIN OrderItems OI ON P.productId = OI.productId
-- grouping the data based on productId and productName
GROUP BY P.productId, P.productName
ORDER BY totalQuantitySold DESC LIMIT 1;