-- DROPPING TO RESET FOR ANY UPDATES
ALTER TABLE Laundry DROP CONSTRAINT FK_LaundryService;
ALTER TABLE TravelDesk DROP CONSTRAINT FK_TravelDeskService;
ALTER TABLE RentDevice DROP CONSTRAINT FK_DeviceRentalService;
ALTER TABLE RentDevice DROP CONSTRAINT Check_ValidRentDate;
ALTER TABLE REQUESTS DROP CONSTRAINT FK_RoomService;
ALTER TABLE REQUESTS DROP CONSTRAINT FK_RoomServiceNo;
ALTER TABLE Business DROP CONSTRAINT FK_BusinessService;
ALTER TABLE REQUESTS DROP CONSTRAINT FK_RequestGuest;
ALTER TABLE REQUESTS DROP CONSTRAINT FK_RequestEmployee;
ALTER TABLE REQUESTS DROP CONSTRAINT FK_RequestService;
ALTER TABLE RESERVES DROP CONSTRAINT FK_ReserveGuest;
ALTER TABLE RESERVES DROP CONSTRAINT FK_ReserveRoom;
ALTER TABLE RESERVES DROP CONSTRAINT Check_ValidCheckOut;
DROP TABLE ROOM;
DROP TABLE GUEST;
DROP TABLE EMPLOYEE;
DROP TABLE SERVICE;
DROP TABLE Laundry;
DROP TABLE TravelDesk;
DROP TABLE RentDevice;
DROP TABLE Business;
DROP TABLE REQUESTS;
DROP TABLE RESERVES;

CREATE TABLE ROOM (
    RoomNo              INT     NOT NULL, 
	Price               INT     NOT NULL, 
	RoomType               VARCHAR(15)     NOT NULL, 
	Accessible                 CHAR(1)        NOT NULL, 
	MaxGuests               INT     NOT NULL, 
    PRIMARY KEY (RoomNo) 
) ;

CREATE TABLE GUEST (
    GuestID         CHAR(7)     NOT NULL,
    GuestName       VARCHAR(30)     NOT NULL,
    PartySize       INT             NOT NULL,
    PRIMARY KEY (GuestID)
) ;

CREATE TABLE EMPLOYEE (
    EmployeeID      CHAR(7)     NOT NULL,
    EmployeeName    VARCHAR(30)     NOT NULL,
    PayRate         INT         NOT NULL,
    PRIMARY KEY (EmployeeID)
) ;

CREATE TABLE SERVICE (
    ServiceID      CHAR(7)     NOT NULL,
    ServiceName    VARCHAR(30)     NOT NULL,
    Available      CHAR(1)     NOT NULL,
    PRIMARY KEY (ServiceID)
) ;

CREATE TABLE RoomService (
    ServiceID      CHAR(7)     NOT NULL,
    RoomNo         INT     NOT NULL, 
    PRIMARY KEY (ServiceID),
    CONSTRAINT FK_RoomService FOREIGN KEY (ServiceID)
        REFERENCES SERVICE(SERVICEID)
        ON DELETE CASCADE,
    CONSTRAINT FK_RoomServiceNo FOREIGN KEY (RoomNo)
        REFERENCES ROOM(RoomNo)
) ;

CREATE TABLE Laundry (
    ServiceID      CHAR(7)     NOT NULL,
    LaundryType VARCHAR(30) NOT NULL,
    PRIMARY KEY (ServiceID),
    CONSTRAINT FK_LaundryService FOREIGN KEY (ServiceID)
        REFERENCES SERVICE(SERVICEID)
        ON DELETE CASCADE
) ;

CREATE TABLE TravelDesk (
    ServiceID      CHAR(7)     NOT NULL,
    AreaOfInterest VARCHAR(50)     NOT NULL,
    AppointmentDate DATE      NOT NULL,
    PRIMARY KEY (ServiceID),
    CONSTRAINT FK_TravelDeskService FOREIGN KEY (ServiceID)
        REFERENCES SERVICE(ServiceID)
        ON DELETE CASCADE
);

CREATE TABLE RentDevice (
    ServiceID      CHAR(7)     NOT NULL,
    DeviceRented     VARCHAR(30)     NOT NULL,
    RentStart    DATE       NOT NULL,
    RentEnd      DATE       NOT NULL,
    PRIMARY KEY (ServiceID),
    CONSTRAINT FK_DeviceRentalService FOREIGN KEY (ServiceID)
        REFERENCES SERVICE(ServiceID)
        ON DELETE CASCADE,
    CONSTRAINT Check_ValidRentDate CHECK (RentEnd > RentStart)
);

CREATE TABLE Business (
    ServiceID      CHAR(7)     NOT NULL,
    ConNum     CHAR(3)     NOT NULL,
    StartDate    DATE       NOT NULL,
    EndDate      DATE       NOT NULL,
    NumofRooms INT NOT NULL,
    PRIMARY KEY (ServiceID),
    CONSTRAINT FK_BusinessService FOREIGN KEY (ServiceID)
        REFERENCES SERVICE(ServiceID)
        ON DELETE CASCADE
);

CREATE TABLE REQUESTS (
    RequestID      INT NOT NULL,
    RequestDate           DATE          NOT NULL,
    ServiceCharge  INT                NOT NULL,
    GuestID        CHAR(7)           NOT NULL,
    EmployeeID     CHAR(7)           NOT NULL,
    ServiceID      CHAR(7)        NOT NULL,
    PRIMARY KEY (RequestID),
    CONSTRAINT FK_RequestGuest FOREIGN KEY (GuestID)
        REFERENCES GUEST(GuestID)
        ON DELETE CASCADE,
    CONSTRAINT FK_RequestEmployee FOREIGN KEY (EmployeeID)
        REFERENCES EMPLOYEE(EmployeeID)
        ON DELETE CASCADE,
    CONSTRAINT FK_RequestService FOREIGN KEY (ServiceID)
        REFERENCES SERVICE(ServiceID)
        ON DELETE CASCADE
);

CREATE TABLE RESERVES (
    ReserveID       INT NOT NULL,
    GuestID         CHAR(7)           NOT NULL,
    RoomNo          INT                NOT NULL,
    CheckIn         DATE          NOT NULL,
    CheckOut        DATE          NOT NULL,
    ReservationSet  DATE          NOT NULL,
    RoomCharges     INT                NOT NULL,
    PRIMARY KEY (ReserveID),
    CONSTRAINT FK_ReserveGuest FOREIGN KEY (GuestID)
        REFERENCES GUEST(GuestID)
        ON DELETE CASCADE,
    CONSTRAINT FK_ReserveRoom FOREIGN KEY (RoomNo)
        REFERENCES ROOM(RoomNo)
        ON DELETE CASCADE,
    CONSTRAINT Check_ValidCheckOut CHECK (CheckOut > CheckIn)
);
