/* 
Write SQL statements to update 1 column and delete 1 row for each table. 
You may copy and paste SQL statements from your own DBMS to the file you’ll upload.
*/

-- Increasing the ROOM Prices by $50
SELECT * FROM ROOM;

UPDATE ROOM
SET Price = Price + 50;

SELECT * FROM ROOM;

-- Decreasing the PartySizes of GUESTS by 1 (unless already one)
SELECT * FROM GUEST;

UPDATE GUEST
SET PartySize = PartySize - 1
WHERE PartySize > 1;

SELECT * FROM GUEST;

-- Giving all employees a $10 raise if they're paid under $20
SELECT * FROM EMPLOYEE;

UPDATE EMPLOYEE
SET PayRate = PayRate + 10
WHERE PayRate < 20;

SELECT * FROM EMPLOYEE;

-- Making Unavailable Services Available
SELECT * FROM SERVICE;

UPDATE SERVICE
SET Available = 'Y'
WHERE Available = 'N';

SELECT * FROM SERVICE;

-- Adding a $5 fee to all Requested Services
SELECT * FROM REQUESTS;

UPDATE REQUESTS
SET ServiceCharge = ServiceCharge + 5;

SELECT * FROM REQUESTS;

-- Adding a $10 reservation fee to all Reserved Rooms
-- that are on the 5th floor (penthouses)
SELECT * FROM RESERVES;

UPDATE RESERVES
SET RoomCharges = RoomCharges + 10
WHERE RoomNo > 500;

SELECT * FROM RESERVES;