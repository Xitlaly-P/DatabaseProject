/* 
Write SQL statements to update 1 column and delete 1 row for each table. 
You may copy and paste SQL statements from your own DBMS to the file you’ll upload.
*/
SELECT * FROM ROOM;

UPDATE ROOM
SET Price = Price + 50;

SELECT * FROM ROOM;