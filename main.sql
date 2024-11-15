CREATE TABLE ROOM (
    RoomNo              INT     NOT NULL, 
	Price               INT     NOT NULL, 
	RoomType               VARCHAR(15)     NOT NULL, 
	Accessible                 CHAR(3)         NOT NULL, 
	MaxGuests               INT     NOT NULL, 
    PRIMARY KEY (RoomNo) 
) ;

CREATE TABLE GUEST (
    GuestID         VARCHAR(15)     NOT NULL,
    GuestName       VARCHAR(15)     NOT NULL,
    PartySize       INT             NOT NULL,
    RoomCharges     INT,
    ServiceCharges  INT,
    TotalCharges    INT,
    PRIMARY KEY (GuestID)
) ;

CREATE TABLE EMPLOYEE (
    EmployeeID      VARCHAR(15)     NOT NULL,
    EmployeeName    VARCHAR(15)     NOT NULL,
    PRIMARY KEY (EmployeeID)
) ;