CREATE DATABASE NEWBOOK;
USE NEWBOOK;

-- USERS TABLE
CREATE TABLE Users (
    userid INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(100),
    email VARCHAR(100),
    password VARCHAR(100)
);

INSERT INTO Users (username, email, password)
VALUES
    ('user1', 'user1@example.com', 'password1'),
    ('user2', 'user2@example.com', 'password2'),
    ('user3', 'user3@example.com', 'password3');

-- LOGIN TABLE
CREATE TABLE login (
    login_id INT AUTO_INCREMENT PRIMARY KEY,
    userid INT,
    username VARCHAR(100),
    password VARCHAR(100),
    email VARCHAR(100),
    FOREIGN KEY (userid) REFERENCES Users(userid)
);

INSERT INTO login (userid, username, password, email)
VALUES
    (1, 'user1', 'password1', 'user1@example.com'),
    (2, 'user2', 'password2', 'user2@example.com'),
    (3, 'user3', 'password3', 'user3@example.com');

-- TRAINS TABLE 
CREATE TABLE Trains (
    TrainID VARCHAR(10) PRIMARY KEY,
    TrainName VARCHAR(100)
);

INSERT INTO Trains (TrainID, TrainName)
VALUES
    ('TN001', 'Rajdhani Express'),
    ('TN002', 'Shatabdi Express'),
    ('TN003', 'Duronto Express');

-- DepartureStation TABLE
CREATE TABLE DepartureStation (
    DepartureStationID VARCHAR(10) PRIMARY KEY,
    TrainID VARCHAR(10),
    DepartureStation VARCHAR(100),
    Platformnumber INT,
    DepartureTime TIME,
    FOREIGN KEY (TrainID) REFERENCES Trains(TrainID)
);

INSERT INTO DepartureStation (DepartureStationID, TrainID, DepartureStation, Platformnumber, DepartureTime)
VALUES
    ('DS001', 'TN001', 'New Delhi', 1, '08:00:00'),
    ('DS002', 'TN002', 'Mumbai Central', 2, '09:00:00'),
    ('DS003', 'TN003', 'Howrah Junction', 3, '10:00:00');

-- ArrivalStation TABLE
CREATE TABLE ArrivalStation (
    ArrivalStationID VARCHAR(10) PRIMARY KEY,
    TrainID VARCHAR(10),
    ArrivalStation VARCHAR(100),
    Platformnumber INT,
    ArrivalTime TIME,
    FOREIGN KEY (TrainID) REFERENCES Trains(TrainID)
);

INSERT INTO ArrivalStation (ArrivalStationID, TrainID, ArrivalStation, Platformnumber, ArrivalTime)
VALUES
    ('AS001', 'TN001', 'Mumbai Central', 1, '14:00:00'),
    ('AS002', 'TN002', 'New Delhi', 2, '15:00:00'),
    ('AS003', 'TN003', 'Chennai Central', 3, '16:00:00');

-- TRAIN SCHEDULE TABLE
CREATE TABLE TrainSchedule (
    TrainScheduleid INT AUTO_INCREMENT PRIMARY KEY,
    TrainID VARCHAR(10),
    DepartureStationID VARCHAR(10),
    ArrivalStationID VARCHAR(10),
    FOREIGN KEY (TrainID) REFERENCES Trains(TrainID),
    FOREIGN KEY (DepartureStationID) REFERENCES DepartureStation(DepartureStationID),
    FOREIGN KEY (ArrivalStationID) REFERENCES ArrivalStation(ArrivalStationID)
);

INSERT INTO TrainSchedule (TrainID, DepartureStationID, ArrivalStationID)
VALUES
    ('TN001', 'DS001', 'AS001'),
    ('TN002', 'DS002', 'AS002'),
    ('TN003', 'DS003', 'AS003');

-- TRAIN COMPARTMENT
CREATE TABLE train_compartment (
    compartment_id VARCHAR(10) PRIMARY KEY,
    compartment_name VARCHAR(100)
);

INSERT INTO train_compartment (compartment_id, compartment_name)
VALUES
    ('CPT001', 'Sleeper Class'),
    ('CPT002', 'AC First Class'),
    ('CPT003', 'AC 2 Tier');

-- TRAIN TICKET PRICE
CREATE TABLE Ticket_price (
    Ticket_slno VARCHAR(10) PRIMARY KEY,
    compartment_id VARCHAR(10),
    TrainID VARCHAR(10),
    price INT,
    selected_id VARCHAR(10),
    FOREIGN KEY (compartment_id) REFERENCES train_compartment(compartment_id),
    FOREIGN KEY (TrainID) REFERENCES Trains(TrainID)
);

INSERT INTO Ticket_price (Ticket_slno, compartment_id, TrainID, price, selected_id)
VALUES
    ('TCKT001', 'CPT001', 'TN001', 500, 'ST001'),
    ('TCKT002', 'CPT002', 'TN002', 1200, 'ST002'),
    ('TCKT003', 'CPT003', 'TN003', 800, 'ST003');

-- PAYMENT METHOD
CREATE TABLE Payment_method (
    PaymentID VARCHAR(10) PRIMARY KEY,
    Passenger_ID VARCHAR(10),
    PaymentType ENUM('CreditCard', 'GooglePay'),
    CardNumber VARCHAR(16),
    ExpiryDate DATE,
    CVV VARCHAR(4),
    GooglePayID VARCHAR(50),
    PaymentStatus ENUM('Pending', 'Successful', 'Failed')
);

INSERT INTO Payment_method (PaymentID, Passenger_ID, PaymentType, CardNumber, ExpiryDate, CVV, GooglePayID, PaymentStatus)
VALUES
    ('PAY001', 'user1', 'CreditCard', '1234567890123456', '2025-12-01', '123', NULL, 'Successful'),
    ('PAY002', 'user2', 'GooglePay', NULL, NULL, NULL, 'GPay12345', 'Pending'),
    ('PAY003', 'user3', 'CreditCard', '9876543210987654', '2024-09-01', '456', NULL, 'Failed');

-- BOOKED TRAIN
CREATE TABLE bookedtrain (
    booking_id INT AUTO_INCREMENT PRIMARY KEY,
    TrainID VARCHAR(10),
    DepartureStationID VARCHAR(10),
    ArrivalStationID VARCHAR(10),
    TrainScheduleid INT,
    compartment_id VARCHAR(10),
    Ticket_slno VARCHAR(10),
    PaymentID VARCHAR(10),
    FOREIGN KEY (TrainID) REFERENCES Trains(TrainID),
    FOREIGN KEY (DepartureStationID) REFERENCES DepartureStation(DepartureStationID),
    FOREIGN KEY (ArrivalStationID) REFERENCES ArrivalStation(ArrivalStationID),
    FOREIGN KEY (TrainScheduleid) REFERENCES TrainSchedule(TrainScheduleid),
    FOREIGN KEY (compartment_id) REFERENCES train_compartment(compartment_id),
    FOREIGN KEY (Ticket_slno) REFERENCES Ticket_price(Ticket_slno),
    FOREIGN KEY (PaymentID) REFERENCES Payment_method(PaymentID)
);

INSERT INTO bookedtrain (TrainID, DepartureStationID, ArrivalStationID, TrainScheduleid, compartment_id, Ticket_slno, PaymentID)
VALUES
    ('TN001', 'DS001', 'AS001', 1, 'CPT001', 'TCKT001', 'PAY001'),
    ('TN002', 'DS002', 'AS002', 2, 'CPT002', 'TCKT002', 'PAY002'),
    ('TN003', 'DS003', 'AS003', 3, 'CPT003', 'TCKT003', 'PAY003');

-- RAILWAY
CREATE TABLE railway (
    booking_id INT,
    TrainScheduleid INT,
    DepartureStationID VARCHAR(10),
    ArrivalStationID VARCHAR(10),
    login_id INT,
    TrainID VARCHAR(10),
    FOREIGN KEY (TrainID) REFERENCES Trains(TrainID),
    FOREIGN KEY (DepartureStationID) REFERENCES DepartureStation(DepartureStationID),
    FOREIGN KEY (ArrivalStationID) REFERENCES ArrivalStation(ArrivalStationID),
    FOREIGN KEY (login_id) REFERENCES login(login_id),
    FOREIGN KEY (TrainScheduleid) REFERENCES TrainSchedule(TrainScheduleid),
    FOREIGN KEY (booking_id) REFERENCES bookedtrain(booking_id)
);
