INSERT INTO ROOM VALUES(506, 500, 'Penthouse', 'Y', 7);
INSERT INTO ROOM VALUES(507, 500, 'Penthouse', 'Y', 5);

SELECT *
FROM ROOM
WHERE MaxGuests > ALL (
    SELECT PartySize
    FROM RESERVES Reserved
    JOIN GUEST G ON Reserved.GuestID = G.GUESTID
);