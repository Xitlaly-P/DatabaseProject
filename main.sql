-- DROPPING TO RESET FOR ANY UPDATES
DROP TABLE ROOM
DROP TABLE GUEST
DROP TABLE EMPLOYEE
DROP TABLE SERVICE
DROP TABLE Laundry
DROP TABLE TravelDesk
DROP TABLE RentDevice
DROP TABLE Business

CREATE TABLE ROOM (
    RoomNo              INT     NOT NULL, 
	Price               INT     NOT NULL, 
	RoomType               VARCHAR(15)     NOT NULL, 
	Accessible                 BOOLEAN         NOT NULL, 
	MaxGuests               INT     NOT NULL, 
    PRIMARY KEY (RoomNo) 
) ;

CREATE TABLE GUEST (
    GuestID         CHAR(15)     NOT NULL,
    GuestName       VARCHAR(30)     NOT NULL,
    PartySize       INT             NOT NULL,
    RoomCharges     INT,
    ServiceCharges  INT,
    TotalCharges    INT,
    PRIMARY KEY (GuestID)
) ;

CREATE TABLE EMPLOYEE (
    EmployeeID      CHAR(15)     NOT NULL,
    EmployeeName    VARCHAR(30)     NOT NULL,
    PRIMARY KEY (EmployeeID)
) ;

CREATE TABLE SERVICE (
    ServiceID      CHAR(15)     NOT NULL,
    ServiceName    VARCHAR(30)     NOT NULL,
    PRIMARY KEY (ServiceID)
) ;

CREATE TABLE Laundry (
    ServiceID      CHAR(15)     NOT NULL,
    LaundryType VARCHAR(30) NOT NULL,
    PRIMARY KEY (ServiceID),
    CONSTRAINT FK_LaundryService FOREIGN KEY (ServiceID)
    REFERENCES SERVICE(SERVICEID)
) ;

CREATE TABLE TravelDesk (
    ServiceID      CHAR(15)     NOT NULL,
    AreaOfInterest VARCHAR(50)     NOT NULL,
    AppointmentDate TIMESTAMP      NOT NULL,
    PRIMARY KEY (ServiceID),
    CONSTRAINT FK_TravelDeskService FOREIGN KEY (ServiceID)
    REFERENCES SERVICE(ServiceID)
);

CREATE TABLE RentDevice (
    ServiceID      CHAR(15)     NOT NULL,
    DeviceRented     VARCHAR(30)     NOT NULL,
    RentStart    TIMESTAMP       NOT NULL,
    RentEnd      TIMESTAMP       NOT NULL,
    PRIMARY KEY (ServiceID),
    CONSTRAINT FK_DeviceRentalService FOREIGN KEY (ServiceID)
    REFERENCES SERVICE(ServiceID)
);

CREATE TABLE Business (
    ServiceID      CHAR(15)     NOT NULL,
    ConNum     CHAR(3)     NOT NULL,
    StartDate    TIMESTAMP       NOT NULL,
    EndDate      TIMESTAMP       NOT NULL,
    NumofRooms INT NOT NULL,
    PRIMARY KEY (ServiceID),
    CONSTRAINT FK_DeviceRentalService FOREIGN KEY (ServiceID)
    REFERENCES SERVICE(ServiceID)
);

CREATE TABLE Requests (
    RequestID      INT NOT NULL,
    RequestDate           TIMESTAMP          NOT NULL,
    ServiceCharge  INT                NOT NULL,
    GuestID        CHAR(15)           NOT NULL,
    EmployeeID     CHAR(15)           NOT NULL,
    ServiceID      VARCHAR(15)        NOT NULL,
    PRIMARY KEY (RequestID),
    CONSTRAINT FK_RequestGuest FOREIGN KEY (GuestID)
        REFERENCES GUEST(GuestID),
    CONSTRAINT FK_RequestEmployee FOREIGN KEY (EmployeeID)
        REFERENCES EMPLOYEE(EmployeeID),
    CONSTRAINT FK_RequestService FOREIGN KEY (ServiceID)
        REFERENCES SERVICE(ServiceID)
);

CREATE TABLE RESERVES (
    ReserveID       INT NOT NULL,
    GuestID         CHAR(15)           NOT NULL,
    RoomNo          INT                NOT NULL,
    CheckIn         TIMESTAMP          NOT NULL,
    CheckOut        TIMESTAMP          NOT NULL,
    ReservationSet  TIMESTAMP          NOT NULL,
    RoomCharges     INT                NOT NULL,
    PRIMARY KEY (ReserveID),
    CONSTRAINT FK_ReserveGuest FOREIGN KEY (GuestID)
        REFERENCES GUEST(GuestID),
    CONSTRAINT FK_ReserveRoom FOREIGN KEY (RoomNo)
        REFERENCES ROOM(RoomNo)
);
