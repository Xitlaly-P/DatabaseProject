SELECT G.GuestID, G.GuestName
FROM GUEST G
WHERE G.GuestID IN (
    SELECT GUESTID
    FROM REQUESTS R
    WHERE R.EmployeeID='1000003'
);
