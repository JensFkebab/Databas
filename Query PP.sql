CREATE TABLE Department (
    DepartmentName VARCHAR(255) PRIMARY KEY,
    BuildingNr VARCHAR(50) NOT NULL
);

CREATE TABLE Employee (
    ID INT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    PhoneNr VARCHAR(20) NOT NULL,
    DepartmentName VARCHAR(255) NOT NULL,
    MentorID INT UNIQUE,
    FOREIGN KEY (DepartmentName) REFERENCES Department(DepartmentName),
    FOREIGN KEY (MentorID) REFERENCES Employee(ID)
);

CREATE TABLE Doctor (
    ID INT PRIMARY KEY,
    Specialization VARCHAR(255) NOT NULL,
    RoomNr VARCHAR(50) NOT NULL,
    FOREIGN KEY (ID) REFERENCES Employee(ID)
);

CREATE TABLE Nurse (
    ID INT PRIMARY KEY,
    Degree VARCHAR(255) NOT NULL,
    FOREIGN KEY (ID) REFERENCES Employee(ID)
);

-- ADELA

CREATE TABLE Patient (
    ID INT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Age INT NOT NULL,
    Diagnosises TEXT NOT NULL,
    DoctorID INT NOT NULL,
    FOREIGN KEY (DoctorID) REFERENCES Doctor(ID)
);

CREATE TABLE Treating (
    PatientID INT NOT NULL,
    DoctorID INT NOT NULL,
    FOREIGN KEY (PatientID) REFERENCES Patient(ID),
    FOREIGN KEY (DoctorID) REFERENCES Doctor(ID)
);

CREATE TABLE WorksAt (
    EmployeeID INT NOT NULL,
    DepartmentName VARCHAR(255) NOT NULL,
    StartDate INT NOT NULL,
    FOREIGN KEY (EmployeeID) REFERENCES Employee(ID),
    FOREIGN KEY (DepartmentName) REFERENCES Department(DepartmentName)
);

INSERT INTO Department (DepartmentName, BuildingNr) VALUES
('Cardiology', 'B1'),
('Neurology', 'B2'),
('Emergency', 'B3');

INSERT INTO Employee (ID, Name, PhoneNr, StartDate, DepartmentName, MentorID) VALUES
(1, 'Alice Smith', '555-0101', '2020-01-15', 'Cardiology', NULL),
(2, 'Bob Jones', '555-0102', '2021-03-20', 'Neurology', 1),
(3, 'Clara Oswald', '555-0103', '2019-11-05', 'Cardiology', NULL),
(4, 'David Tennant', '555-0104', '2022-05-10', 'Emergency', NULL);

INSERT INTO Doctor (ID, Specialization, RoomNr) VALUES
(1, 'Cardiologist', '101A'),
(2, 'Neurologist', '205B');

INSERT INTO Nurse (ID, Degree) VALUES
(3, 'BSN'),
(4, 'MSN');

INSERT INTO Patient (ID, Name, Age, Diagnosises, DoctorID) VALUES
(100, 'John Doe', 45, 'Hypertension', 1),
(101, 'Jane Smith', 30, 'Migraine', 2);

INSERT INTO Treating (PatientID, DoctorID) VALUES
(100, 1),
(101, 2);

INSERT INTO WorksAt (EmployeeID, DepartmentName, StartDate) VALUES
(1, 'Cardiology', 2020),
(2, 'Neurology', 2021),
(3, 'Cardiology', 2019),
(4, 'Emergency', 2022);