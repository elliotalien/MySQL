# Railway Booking System
Overview
The Railway Booking System is designed to streamline the process of booking train tickets. It utilizes a MySQL database to manage administrators, passengers, login credentials, trains, train schedules, stations, compartments, selected trains, ticket prices, payment methods, and booking status.

## Database Structure
The database consists of the following tables:

1. Administrator_details: Stores information about administrators.
2. Passengers_details: Contains details of passengers.
3. login: Manages login credentials for administrators and passengers.
4. Trains: Holds information about different trains.
5. Stations: Keeps track of train stations and their details.
6. TrainSchedule: Records the schedule of trains, including departure and arrival times.
7. train_compartment: Defines different compartments in a train.
8. selected_train: Represents the passenger's choice of train with specific details.
9. Ticket_price: Stores ticket prices based on compartments and selected trains.
10. Payment_method: Manages payment details for booking.
11. reservation_Status: Tracks the status of reservations.
12. booking_system: Relates booking details with login credentials, train schedules, stations, and trains.




# ER Diagram

<img src="https://github.com/elliotalien/MySQL/blob/main/MySQL/DB%20ERR%20IMAGE.png" height="100%" width="100%">

## Usage

- Database Setup: Execute the provided SQL statements to create the necessary tables in your MySQL database.

- Adaptation: Modify the database structure or extend its functionality according to your project requirements.

- Integration: Integrate the Railway Booking System with your application to facilitate train ticket bookings.


## License

This project is licensed under the MIT License.
