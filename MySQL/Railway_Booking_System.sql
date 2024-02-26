CREATE DATABASE Railway_Booking_Database;

USE Railway_Booking_Database;

-- ADMIN TABLE 
CREATE TABLE Administrator_details(
    admin_token VARCHAR(10) PRIMARY KEY,
    admin_name VARCHAR(100),
    admin_password VARCHAR(100)
);

INSERT INTO Administrator_details (admin_token, admin_name, admin_password)
VALUES
    ('admin1', 'Admin One', 'admin123'),
    ('admin2', 'Admin Two', 'admin456'),
    ('admin3', 'Admin Three', 'admin789'),
    ('admin4', 'Admin Four', 'admin987'),
    ('admin5', 'Admin Five', 'admin654'),
    ('admin6', 'Admin Six', 'admin321'),
    ('admin7', 'Admin Seven', 'admin000'),
    ('admin8', 'Admin Eight', 'admin999'),
    ('admin9', 'Admin Nine', 'admin111'),
    ('admin10', 'Admin Ten', 'admin222');




-- PASSENGER DETAILS TABLE
CREATE TABLE Passengers_details(
    user_token VARCHAR(10) PRIMARY KEY,
    Passenger_Name VARCHAR(100),
    user_name VARCHAR(100),
    user_password VARCHAR(100),
    Passenger_Email VARCHAR(100),
    Passenger_Contact VARCHAR(100),
    Passenger_place VARCHAR(100)
);


INSERT INTO Passengers_details (user_token, Passenger_Name, user_name, user_password, Passenger_Email, Passenger_Contact, Passenger_place)
VALUES
    ('user1', 'John Doe', 'john_doe', 'pass@123', 'john.doe@example.com', '9876543210', 'Mumbai, India'),
    ('user2', 'Jane Smith', 'jane_smith', 'pass@456', 'jane.smith@example.com', '8765432109', 'Delhi, India'),
    ('user3', 'Amit Patel', 'amit_patel', 'pass@789', 'amit.patel@example.com', '7654321098', 'Ahmedabad, India'),
    ('user4', 'Sneha Reddy', 'sneha_reddy', 'pass@987', 'sneha.reddy@example.com', '6543210987', 'Hyderabad, India'),
    ('user5', 'Rahul Kapoor', 'rahul_kapoor', 'pass@654', 'rahul.kapoor@example.com', '5432109876', 'Bangalore, India'),
    ('user6', 'Priya Sharma', 'priya_sharma', 'pass@321', 'priya.sharma@example.com', '4321098765', 'Chennai, India'),
    ('user7', 'Vikram Singh', 'vikram_singh', 'pass@000', 'vikram.singh@example.com', '3210987654', 'Kolkata, India'),
    ('user8', 'Neha Verma', 'neha_verma', 'pass@999', 'neha.verma@example.com', '2109876543', 'Pune, India'),
    ('user9', 'Raj Malhotra', 'raj_malhotra', 'pass@111', 'raj.malhotra@example.com', '1098765432', 'Jaipur, India'),
    ('user10', 'Sara Khan', 'sara_khan', 'pass@222', 'sara.khan@example.com', '0987654321', 'Lucknow, India');



-- LOGIN TABLE 
CREATE TABLE login (
    login_id VARCHAR(10) PRIMARY KEY,
    user_name VARCHAR(100),
    user_password VARCHAR(100),
    admin_token VARCHAR(10),
    user_token VARCHAR(10),
    FOREIGN KEY (admin_token) REFERENCES Administrator_details(admin_token),
    FOREIGN KEY (user_token) REFERENCES Passengers_details(user_token)
);

INSERT INTO login (login_id, user_name, user_password, admin_token, user_token)
VALUES
    ('L001', 'john_doe', 'pass@123', 'admin1', 'user1'),
    ('L002', 'jane_smith', 'pass@456', 'admin2', 'user2'),
    ('L003', 'amit_patel', 'pass@789', 'admin3', 'user3'),
    ('L004', 'sneha_reddy', 'pass@987', 'admin4', 'user4'),
    ('L005', 'rahul_kapoor', 'pass@654', 'admin5', 'user5'),
    ('L006', 'priya_sharma', 'pass@321', 'admin6', 'user6'),
    ('L007', 'vikram_singh', 'pass@000', 'admin7', 'user7'),
    ('L008', 'neha_verma', 'pass@999', 'admin8', 'user8'),
    ('L009', 'raj_malhotra', 'pass@111', 'admin9', 'user9'),
    ('L010', 'sara_khan', 'pass@222', 'admin10', 'user10');




-- TRAINS TABLE 
CREATE TABLE Trains(
    TrainID VARCHAR(10) PRIMARY KEY,
    TrainName VARCHAR(100)
);

INSERT INTO Trains (TrainID, TrainName)
VALUES
    ('TN001', 'Rajdhani Express'),
    ('TN002', 'Shatabdi Express'),
    ('TN003', 'Duronto Express'),
    ('TN004', 'Gatimaan Express'),
    ('TN005', 'Garib Rath Express'),
    ('TN006', 'Humsafar Express'),
    ('TN007', 'Tejas Express'),
    ('TN008', 'Sampark Kranti Express'),
    ('TN009', 'Janshatabdi Express'),
    ('TN010', 'Vande Bharat Express'),
    ('TN011', 'Godavari Express'),
    ('TN012', 'Deccan Queen'),
    ('TN013', 'Howrah Mail'),
    ('TN014', 'Chennai Express'),
    ('TN015', 'Mumbai Local'),
    ('TN016', 'Bangalore Rajya Rani'),
    ('TN017', 'Kolkata Metro'),
    ('TN018', 'Lucknow Mail'),
    ('TN019', 'Jaipur Superfast'),
    ('TN020', 'Ahmedabad Shatabdi'),
    ('TN021', 'Pune Intercity'),
    ('TN022', 'Chennai Superfast'),
    ('TN023', 'Bhopal Express'),
    ('TN024', 'Jodhpur Janshatabdi'),
    ('TN025', 'Kolkata Duronto'),
    ('TN026', 'Hyderabad Express'),
    ('TN027', 'Goa Sampark Kranti'),
    ('TN028', 'Trivandrum Rajdhani'),
    ('TN029', 'Agra Superfast'),
    ('TN030', 'Varanasi Shatabdi'),
    ('TN031', 'Kochuveli Express'),
    ('TN032', 'Patna Rajdhani'),
    ('TN033', 'Mangalore Mail'),
    ('TN034', 'Bengaluru Duronto'),
    ('TN035', 'Ajmer Shatabdi'),
    ('TN036', 'Amritsar Express'),
    ('TN037', 'Gujarat Mail'),
    ('TN038', 'Ernakulam Superfast'),
    ('TN039', 'Haridwar Express'),
    ('TN040', 'Bhubaneswar Rajdhani'),
    ('TN041', 'Nagpur Garib Rath'),
    ('TN042', 'Ranchi Rajdhani'),
    ('TN043', 'Chandigarh Superfast'),
    ('TN044', 'Kanpur Shatabdi'),
    ('TN045', 'Shalimar Express'),
    ('TN046', 'Kanyakumari Express'),
    ('TN047', 'Amrapali Express'),
    ('TN048', 'Indore Intercity'),
    ('TN049', 'Vasco Da Gama Express'),
    ('TN050', 'Mysuru Shatabdi');



-- TRAIN STATIONS TABLE
CREATE TABLE Stations(
    StationID VARCHAR(10) PRIMARY KEY,
    DepartureStation VARCHAR(100),
    ArrivalStation VARCHAR(100)
);


INSERT INTO Stations (StationID, DepartureStation, ArrivalStation)
VALUES
    ('STN001', 'New Delhi', 'Mumbai Central'),
    ('STN002', 'Chennai Central', 'Kolkata Howrah'),
    ('STN003', 'Bangalore City', 'Hyderabad Secunderabad'),
    ('STN004', 'Jaipur Junction', 'Ahmedabad Junction'),
    ('STN005', 'Pune Junction', 'Lucknow Charbagh'),
    ('STN006', 'Bhopal Junction', 'Indore Junction'),
    ('STN007', 'Chandigarh Junction', 'Amritsar Junction'),
    ('STN008', 'Patna Junction', 'Varanasi Junction'),
    ('STN009', 'Guwahati Junction', 'Kolkata Sealdah'),
    ('STN010', 'Trivandrum Central', 'Ernakulam Junction'),
    ('STN011', 'Vadodara Junction', 'Surat Junction'),
    ('STN012', 'Rajkot Junction', 'Jamnagar Junction'),
    ('STN013', 'Bhubaneswar', 'Cuttack'),
    ('STN014', 'Mysuru Junction', 'Hubli Junction'),
    ('STN015', 'Vijayawada Junction', 'Tirupati Main'),
    ('STN016', 'Nagpur Junction', 'Bilaspur Junction'),
    ('STN017', 'Kanpur Central', 'Allahabad Junction'),
    ('STN018', 'Jhansi Junction', 'Gwalior Junction'),
    ('STN019', 'Varanasi Junction', 'Gorakhpur Junction'),
    ('STN020', 'Ranchi Junction', 'Dhanbad Junction'),
    ('STN021', 'Ahmedabad Junction', 'Vadodara Junction'),
    ('STN022', 'Kochi Ernakulam', 'Thiruvananthapuram Central'),
    ('STN023', 'Coimbatore Junction', 'Salem Junction'),
    ('STN024', 'Amritsar Junction', 'Jalandhar Junction'),
    ('STN025', 'Secunderabad Junction', 'Vijayawada Junction'),
    ('STN026', 'Agra Cantt', 'Mathura Junction'),
    ('STN027', 'Ratlam Junction', 'Ujjain Junction'),
    ('STN028', 'Bilaspur Junction', 'Raipur Junction'),
    ('STN029', 'Jodhpur Junction', 'Bikaner Junction'),
    ('STN030', 'Kharagpur Junction', 'Asansol Junction'),
    ('STN031', 'Ludhiana Junction', 'Jalandhar Cantt'),
    ('STN032', 'Tiruchirappalli Junction', 'Madurai Junction'),
    ('STN033', 'Guntur Junction', 'Nellore Junction'),
    ('STN034', 'Howrah Junction', 'Sealdah Junction'),
    ('STN035', 'Vellore Junction', 'Tirupati Main'),
    ('STN036', 'Bareilly Junction', 'Moradabad Junction'),
    ('STN037', 'Haldia Junction', 'Kharagpur Junction'),
    ('STN038', 'Surat Junction', 'Vadodara Junction'),
    ('STN039', 'Dibrugarh Junction', 'Guwahati Junction'),
    ('STN040', 'Jammu Tawi', 'Udhampur Junction'),
    ('STN041', 'Nagaur Junction', 'Bikaner Junction'),
    ('STN042', 'Firozpur Cantt', 'Bhatinda Junction'),
    ('STN043', 'Tatanagar Junction', 'Rourkela Junction'),
    ('STN044', 'Sambalpur Junction', 'Bhubaneswar'),
    ('STN045', 'Gaya Junction', 'Patna Junction'),
    ('STN046', 'Jaisalmer Junction', 'Barmer Junction'),
    ('STN047', 'Dhanbad Junction', 'Asansol Junction'),
    ('STN048', 'Kalyan Junction', 'Thane Junction'),
    ('STN049', 'Bhopal Junction', 'Jabalpur Junction'),
    ('STN050', 'Ajmer Junction', 'Jaipur Junction');


-- TrainSchedule table
CREATE TABLE TrainSchedule(
    TrainSchedule_id VARCHAR(10) PRIMARY KEY,
    TrainID VARCHAR(10),
    StationID VARCHAR(10),
    DepartureTime TIME,
    ArrivalTime TIME,
    FOREIGN KEY (TrainID) REFERENCES Trains(TrainID),
    FOREIGN KEY (StationID) REFERENCES Stations(StationID)
);


INSERT INTO TrainSchedule (TrainSchedule_id, TrainID, StationID, DepartureTime, ArrivalTime)
VALUES
    ('TS001', 'TN001', 'STN001', '08:00:00', '12:00:00'),
    ('TS002', 'TN002', 'STN002', '09:30:00', '14:45:00'),
    ('TS003', 'TN003', 'STN003', '12:15:00', '18:30:00'),
    ('TS004', 'TN004', 'STN004', '14:45:00', '20:30:00'),
    ('TS005', 'TN005', 'STN005', '07:30:00', '12:45:00'),
    ('TS006', 'TN006', 'STN006', '10:00:00', '15:15:00'),
    ('TS007', 'TN007', 'STN007', '11:45:00', '17:00:00'),
    ('TS008', 'TN008', 'STN008', '14:30:00', '20:45:00'),
    ('TS009', 'TN009', 'STN009', '08:15:00', '13:30:00'),
    ('TS010', 'TN010', 'STN010', '06:45:00', '11:00:00'),
    ('TS011', 'TN011', 'STN011', '13:30:00', '19:45:00'),
    ('TS012', 'TN012', 'STN012', '15:00:00', '21:15:00'),
    ('TS013', 'TN013', 'STN013', '18:45:00', '00:00:00'),
    ('TS014', 'TN014', 'STN014', '11:15:00', '16:30:00'),
    ('TS015', 'TN015', 'STN015', '16:30:00', '22:45:00'),
    ('TS016', 'TN016', 'STN016', '07:45:00', '13:00:00'),
    ('TS017', 'TN017', 'STN017', '10:30:00', '15:45:00'),
    ('TS018', 'TN018', 'STN018', '09:00:00', '14:15:00'),
    ('TS019', 'TN019', 'STN019', '15:45:00', '21:00:00'),
    ('TS020', 'TN020', 'STN020', '12:00:00', '17:15:00');




-- TRAIN COMPARTMENT

CREATE TABLE train_compartment(
    compartment_id VARCHAR(10) PRIMARY KEY,
    compartment_name VARCHAR(100)
);

INSERT INTO train_compartment (compartment_id, compartment_name)
VALUES
    ('CPT001', 'Sleeper Class'),
    ('CPT002', 'AC First Class'),
    ('CPT003', 'AC 2 Tier'),
    ('CPT004', 'AC 3 Tier'),
    ('CPT005', 'General Compartment'),
    ('CPT006', 'Executive Chair Car'),
    ('CPT007', 'Second Sitting'),
    ('CPT008', 'Unreserved Class'),
    ('CPT009', 'Ladies Compartment'),
    ('CPT010', 'Economy Class');


-- passenger selected train

CREATE TABLE selected_train(
    selected_train_id VARCHAR(10) PRIMARY KEY,
    TrainID VARCHAR(10),
    StationID VARCHAR(10),
    compartment_id VARCHAR(10),
    TrainSchedule_id VARCHAR(10),
    FOREIGN KEY (TrainID) REFERENCES Trains(TrainID),
    FOREIGN KEY (StationID) REFERENCES Stations(StationID),
    FOREIGN KEY (compartment_id) REFERENCES train_compartment(compartment_id),
    FOREIGN KEY (TrainSchedule_id) REFERENCES TrainSchedule(TrainSchedule_id)
);


INSERT INTO selected_train (selected_train_id, TrainID, StationID, compartment_id, TrainSchedule_id)
VALUES
    ('ST001', 'TN001', 'STN001', 'CPT001', 'TS001'),
    ('ST002', 'TN002', 'STN002', 'CPT002', 'TS002'),
    ('ST003', 'TN003', 'STN003', 'CPT003', 'TS003'),
    ('ST004', 'TN004', 'STN004', 'CPT004', 'TS004'),
    ('ST005', 'TN005', 'STN005', 'CPT005', 'TS005'),
    ('ST006', 'TN006', 'STN006', 'CPT006', 'TS006'),
    ('ST007', 'TN007', 'STN007', 'CPT007', 'TS007'),
    ('ST008', 'TN008', 'STN008', 'CPT008', 'TS008'),
    ('ST009', 'TN009', 'STN009', 'CPT009', 'TS009'),
    ('ST010', 'TN010', 'STN010', 'CPT010', 'TS010');


-- TRAIN TICKET PRICE
CREATE TABLE Ticket_price(
    Ticket_slno VARCHAR(10) PRIMARY KEY,
    compartment_id VARCHAR(10),
    TrainID VARCHAR(10),
    price INT,
    selected_id VARCHAR(10),
    FOREIGN KEY (compartment_id) REFERENCES train_compartment(compartment_id),
    FOREIGN KEY (TrainID) REFERENCES Trains(TrainID),
    FOREIGN KEY (selected_id) REFERENCES selected_train(selected_train_id)
);

INSERT INTO Ticket_price (Ticket_slno, compartment_id, TrainID, price, selected_id)
VALUES
    ('TCKT001', 'CPT001', 'TN001', 500, 'ST001'),
    ('TCKT002', 'CPT002', 'TN002', 1200, 'ST002'),
    ('TCKT003', 'CPT003', 'TN003', 800, 'ST003'),
    ('TCKT004', 'CPT004', 'TN004', 1000, 'ST004'),
    ('TCKT005', 'CPT005', 'TN005', 200, 'ST005'),
    ('TCKT006', 'CPT006', 'TN006', 1500, 'ST006'),
    ('TCKT007', 'CPT007', 'TN007', 100, 'ST007'),
    ('TCKT008', 'CPT008', 'TN008', 50, 'ST008'),
    ('TCKT009', 'CPT009', 'TN009', 300, 'ST009'),
    ('TCKT010', 'CPT010', 'TN010', 400, 'ST010');


-- PAYMENT METHOD

CREATE TABLE Payment_method(
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
    ('PAY003', 'user3', 'CreditCard', '9876543210987654', '2024-09-01', '456', NULL, 'Failed'),
    ('PAY004', 'user4', 'GooglePay', NULL, NULL, NULL, 'GPay67890', 'Successful'),
    ('PAY005', 'user5', 'CreditCard', '5678901234567890', '2023-05-01', '789', NULL, 'Pending'),
    ('PAY006', 'user6', 'GooglePay', NULL, NULL, NULL, 'GPay54321', 'Successful'),
    ('PAY007', 'user7', 'CreditCard', '3456789012345678', '2024-03-01', '012', NULL, 'Failed'),
    ('PAY008', 'user8', 'GooglePay', NULL, NULL, NULL, 'GPay98765', 'Successful'),
    ('PAY009', 'user9', 'CreditCard', '8765432109876543', '2022-08-01', '234', NULL, 'Pending'),
    ('PAY010', 'user10', 'CreditCard', '2345678901234567', '2023-11-01', '567', NULL, 'Successful');


-- BOOKING STATUS 
CREATE TABLE reservation_Status (
    reservstion_id VARCHAR(10) PRIMARY KEY,
    selected_train_id VARCHAR(10),
    Ticket_slno VARCHAR(10),
    PaymentID VARCHAR(10),
    user_token VARCHAR(10),
    FOREIGN KEY (PaymentID) REFERENCES Payment_method(PaymentID),
    FOREIGN KEY (Ticket_slno) REFERENCES Ticket_price(Ticket_slno),
    FOREIGN KEY (user_token) REFERENCES Passengers_details(user_token),
    FOREIGN KEY (selected_train_id) REFERENCES selected_train(selected_train_id)
);


INSERT INTO reservation_Status (reservstion_id, selected_train_id, Ticket_slno, PaymentID, user_token)
VALUES
    ('RES001', 'ST001', 'TCKT001', 'PAY001', 'user1'),
    ('RES002', 'ST002', 'TCKT002', 'PAY002', 'user2'),
    ('RES003', 'ST003', 'TCKT003', 'PAY003', 'user3'),
    ('RES004', 'ST004', 'TCKT004', 'PAY004', 'user4'),
    ('RES005', 'ST005', 'TCKT005', 'PAY005', 'user5'),
    ('RES006', 'ST006', 'TCKT006', 'PAY006', 'user6'),
    ('RES007', 'ST007', 'TCKT007', 'PAY007', 'user7'),
    ('RES008', 'ST008', 'TCKT008', 'PAY008', 'user8'),
    ('RES009', 'ST009', 'TCKT009', 'PAY009', 'user9'),
    ('RES010', 'ST010', 'TCKT010', 'PAY010', 'user10');


-- RESERVATION MAIN SYSTEM 
CREATE TABLE booking_system(
    booking_id INT AUTO_INCREMENT PRIMARY KEY,
    login_id VARCHAR(10),
    reservstion_id VARCHAR(10),
    TrainSchedule_id VARCHAR(10),
    StationID VARCHAR(10),
    TrainID VARCHAR(10),
    FOREIGN KEY (TrainID) REFERENCES Trains(TrainID),
    FOREIGN KEY (StationID) REFERENCES Stations(StationID),
    FOREIGN KEY (TrainSchedule_id) REFERENCES TrainSchedule(TrainSchedule_id),
    FOREIGN KEY (reservstion_id) REFERENCES reservation_Status(reservstion_id),
    FOREIGN KEY (login_id) REFERENCES login(login_id)
);



INSERT INTO booking_system (login_id, reservstion_id, TrainSchedule_id, StationID, TrainID)
VALUES
    ('L001', 'RES001', 'TS001', 'STN001', 'TN001'),
    ('L002', 'RES002', 'TS002', 'STN002', 'TN002'),
    ('L003', 'RES003', 'TS003', 'STN003', 'TN003'),
    ('L004', 'RES004', 'TS004', 'STN004', 'TN004'),
    ('L005', 'RES005', 'TS005', 'STN005', 'TN005'),
    ('L006', 'RES006', 'TS006', 'STN006', 'TN006'),
    ('L007', 'RES007', 'TS007', 'STN007', 'TN007'),
    ('L008', 'RES008', 'TS008', 'STN008', 'TN008'),
    ('L009', 'RES009', 'TS009', 'STN009', 'TN009'),
    ('L010', 'RES010', 'TS010', 'STN010', 'TN010');




-- copyright by ABHIJITH P