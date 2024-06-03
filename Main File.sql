Create Database Gym_Management_System;
use Gym_Management_System;

-- Members Table
CREATE TABLE Members (
    MemberID INT PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    PhoneNumber VARCHAR(15),
    MembershipTypeID INT,
    StartDate DATE,
    EndDate DATE
);

INSERT INTO Members (MemberID, Name, Email, PhoneNumber, MembershipTypeID, StartDate, EndDate) VALUES
(1, 'Khizer Naeem', 'khizeralivector@gmail.com', '+923100445501', 1, '2024-01-01', '2024-12-31'),
(2, 'Raheel Ali', 'squadgraphicdesigner@gmail.com', '+923303247889', 2, '2024-02-01', '2024-11-30'),
(3, 'Rahim Ahmed Khan', 'khanrahim.rk22@gmail.com', '+923197380051', 3, '2024-03-01', '2024-08-31'),
(4, 'Shabaz Hanif', 'shabazhanif@gmail.com', '+923101314631', 4, '2024-04-01', '2024-07-31'),
(5, 'Abeer Khan', 'abeerkhan11@gmail.com', '+923282615904', 5, '2024-05-01', '2024-10-31');

-- 1. Retrieve all members
SELECT * FROM Members;

-- 2. Retrieve a specific member by ID
SELECT * FROM Members WHERE MemberID = 1;

-- 3. Retrieve members with a specific membership type
SELECT * FROM Members WHERE MembershipTypeID = 1;

-- 4. Retrieve members whose membership is expiring in the next month
SELECT * FROM Members WHERE EndDate BETWEEN CURRENT_DATE AND DATE_ADD(CURRENT_DATE, INTERVAL 1 MONTH);

-- 5. Retrieve members by name
SELECT * FROM Members WHERE Name LIKE '%Khan%';


-- MembershipTypes Table
CREATE TABLE MembershipTypes (
    MembershipTypeID INT PRIMARY KEY,
    Type VARCHAR(50),
    Cost DECIMAL(10, 2),
    DurationMonths INT
);

INSERT INTO MembershipTypes (MembershipTypeID, Type, Cost, DurationMonths) VALUES
(1, 'Monthly', 30.00, 1),
(2, 'Quarterly', 85.00, 3),
(3, 'Semi-Annual', 160.00, 6),
(4, 'Annual', 300.00, 12),
(5, 'Weekly', 10.00, 0);

-- 1. Retrieve all membership types
SELECT * FROM MembershipTypes;

-- 2. Retrieve a specific membership type by ID
SELECT * FROM MembershipTypes WHERE MembershipTypeID = 1;

-- 3. Retrieve membership types with cost less than 100
SELECT * FROM MembershipTypes WHERE Cost < 100;

-- 4. Retrieve membership types sorted by cost
SELECT * FROM MembershipTypes ORDER BY Cost DESC;

-- 5. Retrieve membership types by type name
SELECT * FROM MembershipTypes WHERE Type LIKE '%Annual%';


-- Classes Table
CREATE TABLE Classes (
    ClassID INT PRIMARY KEY,
    Name VARCHAR(50),
    Schedule VARCHAR(50),
    MaxCapacity INT
);

INSERT INTO Classes (ClassID, Name, Schedule, MaxCapacity) VALUES
(1, 'Yoga', 'Monday 8AM', 20),
(2, 'HIIT', 'Tuesday 9AM', 25),
(3, 'Pilates', 'Wednesday 10AM', 15),
(4, 'Zumba', 'Thursday 11AM', 30),
(5, 'Spin', 'Friday 12PM', 10);

-- 1. Retrieve all classes
SELECT * FROM Classes;

-- 2. Retrieve a specific class by ID
SELECT * FROM Classes WHERE ClassID = 1;

-- 3. Retrieve classes with a maximum capacity greater than 20
SELECT * FROM Classes WHERE MaxCapacity > 20;

-- 4. Retrieve classes by schedule
SELECT * FROM Classes WHERE Schedule LIKE '%Monday%';

-- 5. Retrieve classes by name
SELECT * FROM Classes WHERE Name LIKE '%Yoga%';


-- ClassRegistrations Table
CREATE TABLE ClassRegistrations (
    RegistrationID INT PRIMARY KEY,
    MemberID INT,
    ClassID INT,
    RegistrationDate DATE
);

INSERT INTO ClassRegistrations (RegistrationID, MemberID, ClassID, RegistrationDate) VALUES
(1, 1, 1, '2024-01-05'),
(2, 2, 2, '2024-02-10'),
(3, 3, 3, '2024-03-15'),
(4, 4, 4, '2024-04-20'),
(5, 5, 5, '2024-05-25');

-- 1. Retrieve all class registrations
SELECT * FROM ClassRegistrations;

-- 2. Retrieve class registrations for a specific member
SELECT * FROM ClassRegistrations WHERE MemberID = 1;

-- 3. Retrieve class registrations for a specific class
SELECT * FROM ClassRegistrations WHERE ClassID = 1;

-- 4. Retrieve class registrations by date
SELECT * FROM ClassRegistrations WHERE RegistrationDate = '2024-01-05';

-- 5. Retrieve class registrations within a date range
SELECT * FROM ClassRegistrations WHERE RegistrationDate BETWEEN '2024-01-01' AND '2024-12-31';


-- Trainers Table
CREATE TABLE Trainers (
    TrainerID INT PRIMARY KEY,
    Name VARCHAR(100),
    Expertise VARCHAR(100),
    Schedule VARCHAR(50)
);

INSERT INTO Trainers (TrainerID, Name, Expertise, Schedule) VALUES
(1, 'Khizer Naeem', 'Yoga', 'Monday 8AM'),
(2, 'Raheel Ali', 'HIIT', 'Tuesday 9AM'),
(3, 'Rahim Ahmed Khan', 'Pilates', 'Wednesday 10AM'),
(4, 'Shabaz Hanif', 'Zumba', 'Thursday 11AM'),
(5, 'Abeer Khan', 'Spin', 'Friday 12PM');

-- 1. Retrieve all trainers
SELECT * FROM Trainers;

-- 2. Retrieve a specific trainer by ID
SELECT * FROM Trainers WHERE TrainerID = 1;

-- 3. Retrieve trainers by expertise
SELECT * FROM Trainers WHERE Expertise LIKE '%Yoga%';

-- 4. Retrieve trainers by schedule
SELECT * FROM Trainers WHERE Schedule LIKE '%Monday%';

-- 5. Retrieve trainers by name
SELECT * FROM Trainers WHERE Name LIKE '%Khan%';


-- Equipment Table
CREATE TABLE Equipment (
    EquipmentID INT PRIMARY KEY,
    Name VARCHAR(50),
    Type VARCHAR(50),
    MaintenanceSchedule VARCHAR(50)
);

INSERT INTO Equipment (EquipmentID, Name, Type, MaintenanceSchedule) VALUES
(1, 'Treadmill', 'Cardio', 'Monthly'),
(2, 'Dumbbell', 'Strength', 'Quarterly'),
(3, 'Stationary Bike', 'Cardio', 'Monthly'),
(4, 'Kettlebell', 'Strength', 'Quarterly'),
(5, 'Rowing Machine', 'Cardio', 'Monthly');

-- 1. Retrieve all equipment
SELECT * FROM Equipment;

-- 2. Retrieve a specific equipment by ID
SELECT * FROM Equipment WHERE EquipmentID = 1;

-- 3. Retrieve equipment by type
SELECT * FROM Equipment WHERE Type LIKE '%Cardio%';

-- 4. Retrieve equipment by maintenance schedule
SELECT * FROM Equipment WHERE MaintenanceSchedule LIKE '%Monthly%';

-- 5. Retrieve equipment by name
SELECT * FROM Equipment WHERE Name LIKE '%Treadmill%';


-- Payments Table
CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY,
    MemberID INT,
    Amount DECIMAL(10, 2),
    PaymentDate DATE,
    PaymentMethod VARCHAR(50)
);

INSERT INTO Payments (PaymentID, MemberID, Amount, PaymentDate, PaymentMethod) VALUES
(1, 1, 30.00, '2024-01-01', 'Credit Card'),
(2, 2, 85.00, '2024-02-01', 'Cash'),
(3, 3, 150.00, '2024-03-01', 'Cash'),
(4, 4, 280.00, '2024-04-01', 'Credit Card'),
(5, 5, 20.00, '2024-05-01', 'Cash');

-- 1. Retrieve all payments
SELECT * FROM Payments;

-- 2. Retrieve a specific payment by ID
SELECT * FROM Payments WHERE PaymentID = 1;

-- 3. Retrieve payments for a specific member
SELECT * FROM Payments WHERE MemberID = 1;

-- 4. Retrieve payments by date
SELECT * FROM Payments WHERE PaymentDate = '2024-01-01';

-- 5. Retrieve payments within a date range
SELECT * FROM Payments WHERE PaymentDate BETWEEN '2024-01-01' AND '2024-12-31';


-- GymBranches Table
CREATE TABLE GymBranches (
    BranchID INT PRIMARY KEY,
    BranchName VARCHAR(100),
    Location VARCHAR(100)
);

INSERT INTO GymBranches (BranchID, BranchName, Location) VALUES
(1, 'Main Street Gym', '123 Main St'),
(2, 'Downtown Fitness Center', '456 Elm St'),
(3, 'City Central Gym', '789 Oak St'),
(4, 'Suburban Health Club', '101 Pine St'),
(5, 'Westside Athletic Club', '222 Maple St');

-- 1. Retrieve all gym branches
SELECT * FROM GymBranches;

-- 2. Retrieve a specific gym branch by ID
SELECT * FROM GymBranches WHERE BranchID = 1;

-- 3. Retrieve gym branches by location
SELECT * FROM GymBranches WHERE Location LIKE '%Main St%';

-- 4. Retrieve gym branches by name
SELECT * FROM GymBranches WHERE BranchName LIKE '%Downtown%';

-- 5. Retrieve gym branches by partial location
SELECT * FROM GymBranches WHERE Location LIKE '%St%';


-- MemberCheckIns Table
CREATE TABLE MemberCheckIns (
    CheckInID INT PRIMARY KEY,
    MemberID INT,
    CheckInTime DATETIME
);

INSERT INTO MemberCheckIns (CheckInID, MemberID, CheckInTime) VALUES
(1, 1, '2024-01-01 08:00:00'),
(2, 2, '2024-02-01 09:00:00'),
(3, 3, '2024-03-01 10:00:00'),
(4, 4, '2024-04-01 11:00:00'),
(5, 5, '2024-05-01 12:00:00');

-- 1. Retrieve all member check-ins
SELECT * FROM MemberCheckIns;

-- 2. Retrieve check-ins for a specific member
SELECT * FROM MemberCheckIns WHERE MemberID = 1;

-- 3. Retrieve check-ins by date
SELECT * FROM MemberCheckIns WHERE CheckInTime BETWEEN '2024-01-01' AND '2024-01-02';

-- 4. Retrieve check-ins by check-in ID
SELECT * FROM MemberCheckIns WHERE CheckInID = 1;

-- 5. Retrieve check-ins by member ID and date
SELECT * FROM MemberCheckIns WHERE MemberID = 1 AND CheckInTime BETWEEN '2024-01-01' AND '2024-01-02';


-- Staff Table
CREATE TABLE Staff (
    StaffID INT PRIMARY KEY,
    Name VARCHAR(100),
    Role VARCHAR(50),
    Email VARCHAR(100)
);

INSERT INTO Staff (StaffID, Name, Role, Email) VALUES
(1, 'Rahim Ahmed Khan', 'Manager', 'khanrahim.rk22@gmail.com'),
(2, 'Raheel', 'Trainer', 'raheelali@gmail.com'),
(3, 'Khizer ', 'Receptionist', 'Khizerali@gmail.com'),
(4, 'Shabaz', 'Maintenance', 'Shabazhanif@gmail.com'),
(5, 'Abeer', 'Manager', 'Abeer@gmail.com');

-- 1. Retrieve all staff members
SELECT * FROM Staff;

-- 2. Retrieve a specific staff member by ID
SELECT * FROM Staff WHERE StaffID = 1;

-- 3. Retrieve staff members by role
SELECT * FROM Staff WHERE Role LIKE '%Manager%';

-- 4. Retrieve staff members by name
SELECT * FROM Staff WHERE Name LIKE '%Khan%';

-- 5. Retrieve staff members by email
SELECT * FROM Staff WHERE Email LIKE '%gmail.com%';

-- Attendance Table
CREATE TABLE Attendance (
    AttendanceID INT PRIMARY KEY,
    MemberID INT,
    CheckInTime DATETIME
);

-- Inserting values into Attendance table
INSERT INTO Attendance (AttendanceID, MemberID, CheckInTime) VALUES
(1, 1, '2024-01-01 08:00:00'),
(2, 2, '2024-02-01 09:00:00'),
(3, 3, '2024-03-01 10:00:00'),
(4, 4, '2024-04-01 11:00:00'),
(5, 5, '2024-05-01 12:00:00');

-- 1. Retrieve all attendance records
SELECT * FROM Attendance;

-- 2. Retrieve attendance records for a specific member
SELECT * FROM Attendance WHERE MemberID = 1;

-- 3. Retrieve attendance records by check-in time
SELECT * FROM Attendance WHERE CheckInTime BETWEEN '2024-01-01 00:00:00' AND '2024-01-01 23:59:59';

-- 4. Retrieve attendance records for a specific time period
SELECT * FROM Attendance WHERE CheckInTime BETWEEN '2024-02-01 00:00:00' AND '2024-02-01 23:59:59';

-- 5. Retrieve attendance records by attendance ID
SELECT * FROM Attendance WHERE AttendanceID = 1;

-- DietPlans Table
CREATE TABLE DietPlans (
    PlanID INT PRIMARY KEY,
    MemberID INT,
    PlanName VARCHAR(100),
    Description TEXT,
    StartDate DATE,
    EndDate DATE
);

-- Inserting values into DietPlans table
INSERT INTO DietPlans (PlanID, MemberID, PlanName, Description, StartDate, EndDate) VALUES
(1, 1, 'Weight Loss Plan', 'A balanced diet plan for effective weight loss.', '2024-01-01', '2024-01-30'),
(2, 2, 'Muscle Gain Plan', 'High-protein diet plan to promote muscle growth.', '2024-02-01', '2024-02-28'),
(3, 3, 'Healthy Living Plan', 'Focuses on clean eating and overall wellness.', '2024-03-01', '2024-03-31'),
(4, 4, 'Vegetarian Plan', 'Vegetarian diet plan for those avoiding meat products.', '2024-04-01', '2024-04-30'),
(5, 5, 'High Energy Plan', 'Nutrient-rich diet plan to boost energy levels.', '2024-05-01', '2024-05-31');

-- 1. Retrieve all diet plans
SELECT * FROM DietPlans;

-- 2. Retrieve a specific diet plan by ID
SELECT * FROM DietPlans WHERE PlanID = 1;

-- 3. Retrieve diet plans for a specific member
SELECT * FROM DietPlans WHERE MemberID = 1;

-- 4. Retrieve diet plans by plan name
SELECT * FROM DietPlans WHERE PlanName LIKE '%Weight Loss%';

-- 5. Retrieve diet plans by start date
SELECT * FROM DietPlans WHERE StartDate = '2024-01-01';


-- WorkoutDetails Table
CREATE TABLE WorkoutDetails (
    WorkoutID INT PRIMARY KEY,
    MemberID INT,
    WorkoutDate DATE,
    DurationMinutes INT,
    CaloriesBurned INT
);

-- Inserting values into WorkoutDetails table
INSERT INTO WorkoutDetails (WorkoutID, MemberID, WorkoutDate, DurationMinutes, CaloriesBurned) VALUES
(1, 1, '2024-01-01', 60, 300),
(2, 2, '2024-02-01', 45, 250),
(3, 3, '2024-03-01', 90, 500),
(4, 4, '2024-04-01', 75, 400),
(5, 5, '2024-05-01', 70, 450);

-- 1. Retrieve all workout details
SELECT * FROM WorkoutDetails;

-- 2. Retrieve workout details for a specific member
SELECT * FROM WorkoutDetails WHERE MemberID = 1;

-- 3. Retrieve workout details by workout date
SELECT * FROM WorkoutDetails WHERE WorkoutDate = '2024-01-01';

-- 4. Retrieve workout details with duration greater than 60 minutes
SELECT * FROM WorkoutDetails WHERE DurationMinutes > 60;

-- 5. Retrieve workout details with calories burned greater than 400
SELECT * FROM WorkoutDetails WHERE CaloriesBurned > 400;

-- Feedback Table
CREATE TABLE Feedback (
    FeedbackID INT PRIMARY KEY,
    MemberID INT,
    Date DATE,
    FeedbackText TEXT
);

INSERT INTO Feedback (FeedbackID, MemberID, Date, FeedbackText) VALUES
(1, 1, '2024-01-01', 'Great facilities and friendly staff!'),
(2, 2, '2024-02-01', 'Love the variety of classes offered.'),
(3, 3, '2024-03-01', 'Clean environment and well-maintained equipment.'),
(4, 4, '2024-04-01', 'Would appreciate more flexibility in class timings.'),
(5, 5, '2024-05-01', 'Excellent trainers and motivational atmosphere.');

-- 1. Retrieve all feedback
SELECT * FROM Feedback;

-- 2. Retrieve feedback by a specific member
SELECT * FROM Feedback WHERE MemberID = 1;

-- 3. Retrieve feedback by date
SELECT * FROM Feedback WHERE Date = '2024-01-01';

-- 4. Retrieve feedback by feedback text
SELECT * FROM Feedback WHERE FeedbackText LIKE '%great%';

-- 5. Retrieve feedback by member ID and date
SELECT * FROM Feedback WHERE MemberID = 1 AND Date = '2024-01-01';


-- Complaints Table
CREATE TABLE Complaints (
    ComplaintID INT PRIMARY KEY,
    MemberID INT,
    Date DATE,
    ComplaintText TEXT
);

INSERT INTO Complaints (ComplaintID, MemberID, Date, ComplaintText) VALUES
(1, 1, '2024-01-02', 'Some equipment needs repair.'),
(2, 2, '2024-02-02', 'Locker room cleanliness could be improved.'),
(3, 3, '2024-03-02', 'Issues with class scheduling.'),
(4, 4, '2024-04-02', 'Temperature control problems in the gym.'),
(5, 5, '2024-05-02', 'More options needed for vegetarian snacks in the cafe.');

-- 1. Retrieve all complaints
SELECT * FROM Complaints;

-- 2. Retrieve complaints by a specific member
SELECT * FROM Complaints WHERE MemberID = 1;

-- 3. Retrieve complaints by date
SELECT * FROM Complaints WHERE Date = '2024-01-02';

-- 4. Retrieve complaints by complaint text
SELECT * FROM Complaints WHERE ComplaintText LIKE '%equipment%';

-- 5. Retrieve complaints by member ID and date
SELECT * FROM Complaints WHERE MemberID = 1 AND Date = '2024-01-02';


-- Maintenance Table
CREATE TABLE Maintenance (
    MaintenanceID INT PRIMARY KEY,
    EquipmentID INT,
    MaintenanceDate DATE,
    Description TEXT
);

INSERT INTO Maintenance (MaintenanceID, EquipmentID, MaintenanceDate, Description) VALUES
(1, 1, '2024-01-10', 'Routine maintenance check performed.'),
(2, 2, '2024-02-10', 'Dumbbells replaced due to wear and tear.'),
(3, 3, '2024-03-10', 'Stationary bike serviced for optimal performance.'),
(4, 4, '2024-04-10', 'Kettlebells cleaned and inspected.'),
(5, 5, '2024-05-10', 'Rowing machine adjusted for smoother operation.');

-- 1. Retrieve all maintenance records
SELECT * FROM Maintenance;

-- 2. Retrieve maintenance records for specific equipment
SELECT * FROM Maintenance WHERE EquipmentID = 1;

-- 3. Retrieve maintenance records by date
SELECT * FROM Maintenance WHERE MaintenanceDate = '2024-01-10';

-- 4. Retrieve maintenance records by description
SELECT * FROM Maintenance WHERE Description LIKE '%monthly%';

-- 5. Retrieve maintenance records by equipment ID and date
SELECT * FROM Maintenance WHERE EquipmentID = 1 AND MaintenanceDate = '2024-01-10';


-- GymEvents Table
CREATE TABLE GymEvents (
    EventID INT PRIMARY KEY,
    EventName VARCHAR(100),
    EventDate DATE,
    Description TEXT
);

INSERT INTO GymEvents (EventID, EventName, EventDate, Description) VALUES
(1, 'Yoga Session', '2024-01-15', 'Relaxing yoga session for all levels.'),
(2, 'Fitness Bootcamp', '2024-02-15', 'Intensive workout session to challenge your limits.'),
(3, 'Nutrition Workshop', '2024-03-15', 'Learn about healthy eating habits and meal planning.'),
(4, 'Group Cycling', '2024-04-15', 'Join our cycling group for a fun cardio workout.'),
(5, 'Weightlifting Seminar', '2024-05-15', 'Instructional session on proper weightlifting techniques.');

-- 1. Retrieve all gym events
SELECT * FROM GymEvents;

-- 2. Retrieve a specific gym event by ID
SELECT * FROM GymEvents WHERE EventID = 1;

-- 3. Retrieve gym events by name
SELECT * FROM GymEvents WHERE EventName LIKE '%Yoga%';

-- 4. Retrieve gym events by date
SELECT * FROM GymEvents WHERE EventDate = '2024-01-15';

-- 5. Retrieve gym events by partial description
SELECT * FROM GymEvents WHERE Description LIKE '%session%';


-- EventParticipants Table
CREATE TABLE EventParticipants (
    ParticipantID INT PRIMARY KEY,
    EventID INT,
    MemberID INT
);

INSERT INTO EventParticipants (ParticipantID, EventID, MemberID) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5);

-- 1. Retrieve all event participants
SELECT * FROM EventParticipants;

-- 2. Retrieve event participants for a specific event
SELECT * FROM EventParticipants WHERE EventID = 1;

-- 3. Retrieve event participants for a specific member
SELECT * FROM EventParticipants WHERE MemberID = 1;

-- 4. Retrieve event participants by participant ID
SELECT * FROM EventParticipants WHERE ParticipantID = 1;

-- 5. Retrieve event participants by event ID and member ID
SELECT * FROM EventParticipants WHERE EventID = 1 AND MemberID = 1;


 
