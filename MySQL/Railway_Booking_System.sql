CREATE DATABASE Railway_Booking_Database;

USE Railway_Booking_Database;

-- ADMIN TABLE 
CREATE TABLE Administrator_details(
    admin_token INT AUTO_INCREMENT,
    admin_name VARCHAR(100),
    admin_password VARCHAR(100),
    PRIMARY KEY (admin_token)
);

-- PASSENGER DETAILS TABLE
CREATE TABLE Passengers_details(
    user_token INT AUTO_INCREMENT,
    Passenger_Name VARCHAR(100),
    user_name VARCHAR(100),
    user_password VARCHAR(100),
    Passenger_Email VARCHAR(100),
    Passenger_Contact VARCHAR(100),
    Passenger_place VARCHAR(100),
    PRIMARY KEY (user_token)
);

-- LOGIN TABLE 
CREATE TABLE login (
    login_id VARCHAR(100),
    user_name VARCHAR(100),
    user_password VARCHAR(100),
    admin_token INT,
    user_token INT,
    PRIMARY KEY (login_id),
    FOREIGN KEY (admin_token) REFERENCES Administrator_details(admin_token),
    FOREIGN KEY (user_token) REFERENCES Passengers_details(user_token)
);

-- TRAINS TABLE 
CREATE TABLE Trains(
    TrainID VARCHAR(100),
    TrainName VARCHAR(100),
    PRIMARY KEY(TrainID)
);

-- TRAIN STATIONS TABLE
CREATE TABLE Stations(
    StationID VARCHAR(100),
    DepartureStation VARCHAR(100),
    ArrivalStation VARCHAR(100),
    PRIMARY KEY (StationID)
);

-- TrainSchedule table
CREATE TABLE TrainSchedule(
    TrainSchedule_id VARCHAR(100),
    TrainID VARCHAR(100),
    StationID VARCHAR(100),
    DepartureTime TIME,
    ArrivalTime TIME,
    PRIMARY KEY (TrainSchedule_id)
);

-- TRAIN COMPARTMENT
CREATE TABLE train_compartment(
    compartment_id VARCHAR(100),
    compartment_name VARCHAR(100),
    PRIMARY KEY(compartment_id)
);

-- passanger selected train
CREATE TABLE selected_train(
    selected_train_id INT AUTO_INCREMENT,
    TrainID VARCHAR(100),
    StationID VARCHAR(100),
    compartment_id VARCHAR(100),
    TrainSchedule_id VARCHAR(100),
    PRIMARY KEY (selected_train_id),
    FOREIGN KEY (TrainID) REFERENCES trains(TrainID),
    FOREIGN KEY (StationID) REFERENCES stations(StationID),
    FOREIGN KEY (compartment_id) REFERENCES train_compartment(compartment_id),
    FOREIGN KEY (TrainSchedule_id) REFERENCES TrainSchedule(TrainSchedule_id)
);

-- TRAIN TICKET PRICE
CREATE TABLE Ticket_price(
    Ticket_slno int AUTO_INCREMENT,
    compartment_id VARCHAR(100),
    TrainID VARCHAR(100),
    price INT,
    selected_id INT,
    PRIMARY KEY (Ticket_slno)
);

-- PAYMENT METHOD
CREATE TABLE Payment_method(
    PaymentID INT,
    Passenger_ID VARCHAR(100),
    PaymentType ENUM('CreditCard', 'GooglePay'),
    CardNumber VARCHAR(16),
    ExpiryDate DATE,
    CVV VARCHAR(4),
    GooglePayID VARCHAR(50),
    PaymentStatus ENUM('Pending', 'Successful', 'Failed'),
    primary key (PaymentID)
);

-- BOOKING STATUS 
CREATE TABLE reservation_Status (
    reservstion_id INT,
    selected_train_id INT,
    Ticket_slno int,
    PaymentID INT,
    user_token INT,
    PRIMARY KEY (reservstion_id),
    FOREIGN KEY (PaymentID) REFERENCES Payment_method(PaymentID),
    FOREIGN KEY (Ticket_slno) REFERENCES Ticket_price(Ticket_slno),
    FOREIGN KEY (user_token) REFERENCES Passengers_details(user_token),
    FOREIGN KEY (selected_train_id) REFERENCES selected_train(selected_train_id)
);

-- RESERVATION MAIN SYSTEM 
CREATE TABLE booking_system(
    login_id VARCHAR(100),
    reservstion_id INT,
    TrainSchedule_id VARCHAR(100),
    StationID VARCHAR(100),
    TrainID VARCHAR(100),
    FOREIGN KEY (TrainID) REFERENCES Trains(TrainID),
    FOREIGN KEY (StationID) REFERENCES Stations(StationID),
    FOREIGN KEY (TrainSchedule_id) REFERENCES TrainSchedule(TrainSchedule_id),
    FOREIGN KEY (reservstion_id) REFERENCES reservation_Status(reservstion_id),
    FOREIGN KEY (login_id) REFERENCES login(login_id)
);