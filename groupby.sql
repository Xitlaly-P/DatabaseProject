-- Should be a count of accessible rooms and non-accessible rooms
SELECT COUNT(RoomNo), Accessible
FROM ROOM
GROUP BY Accessible;