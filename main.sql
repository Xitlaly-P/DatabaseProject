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
    ServiceID      VARCHAR(15)     NOT NULL,
    ServiceName    VARCHAR(30)     NOT NULL,
    PRIMARY KEY (ServiceID)
) ;

CREATE TABLE LAUNDRY (
    ServiceID      VARCHAR(15)     NOT NULL,
    LaundryType VARCHAR(30) NOT NULL,
    PRIMARY KEY (ServiceID),
    CONSTRAINT FK_LaundryService FOREIGN KEY (ServiceID)
    REFERENCES SERVICE(SERVICEID)
) ;

CREATE TABLE TRAVELDESK (
    ServiceID      VARCHAR(15)     NOT NULL,
    AreaOfInterest VARCHAR(50)     NOT NULL,
    AppointmentDate TIMESTAMP      NOT NULL,
    PRIMARY KEY (ServiceID),
    CONSTRAINT FK_TravelDeskService FOREIGN KEY (ServiceID)
    REFERENCES SERVICE(ServiceID)
);

CREATE TABLE RENTDEVICE (
    ServiceID      VARCHAR(15)     NOT NULL,
    DeviceRented     VARCHAR(30)     NOT NULL,
    RentStart    TIMESTAMP       NOT NULL,
    RentEnd      TIMESTAMP       NOT NULL,
    PRIMARY KEY (ServiceID),
    CONSTRAINT FK_DeviceRentalService FOREIGN KEY (ServiceID)
    REFERENCES SERVICE(ServiceID)
);

CREATE TABLE BUSINESS (
    ServiceID      VARCHAR(15)     NOT NULL,
    ConNum     CHAR(3)     NOT NULL,
    StartDate    TIMESTAMP       NOT NULL,
    EndDate      TIMESTAMP       NOT NULL,
    NumofRooms INT NOT NULL,
    PRIMARY KEY (ServiceID),
    CONSTRAINT FK_DeviceRentalService FOREIGN KEY (ServiceID)
    REFERENCES SERVICE(ServiceID)
);