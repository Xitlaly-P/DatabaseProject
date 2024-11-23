-- MaxGuests with more than 1 room belonging to it
-- should show just the count of rooms with 2 and 4 MaxGuests respectively
SELECT MaxGuests, COUNT(RoomNo)
FROM ROOM
GROUP BY MaxGuests
HAVING COUNT(RoomNo) > 1;