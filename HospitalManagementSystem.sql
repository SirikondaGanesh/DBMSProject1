-- creating the database
create database HospitalManagementSystem;

-- using database
use HospitalManagementSystem;

-- creating the tables
create table Patient(PatientID INT primary key ,Name VARCHAR(30),Age INT,Gender ENUM('M','F','T'),PhoneNo long,AddressVlgCity VARCHAR(35));
alter table patient add Diagnosis varchar(50);
desc Patient;

create table Receptionist_(ReceptionistID INT primary key,PatientID int ,DoctorID INT ,Name VARCHAR(25),PhoneNo long,HireDate datetime,ShiftSchedule VARCHAR(50),Salary int,FOREIGN KEY (PatientID) REFERENCES Patient(PatientID),FOREIGN KEY (DoctorID) REFERENCES Doctor(DoctorID));
desc Receptionist_;
alter table Receptionist_ rename to Receptionist;
desc Receptionist;

create table Doctor(DoctorID INT primary key,Name VARCHAR(25),Specialty VARCHAR(25),PhoneNo long,AvailabilitySchedule VARCHAR(25));
desc Doctor;

create table Medication(MedicationID INT primary key,Name VARCHAR(30),Dosage VARCHAR(15),PrescribingDoctorID int ,Price decimal,FOREIGN KEY (PrescribingDoctorID) REFERENCES Doctor(DoctorID));
desc Medication;
ALTER TABLE Medication RENAME TO Medical;
ALTER TABLE Medical ADD MFD date,ADD EXD date;
desc Medical;

create table Treatment(TreatmentID  INT primary key,PatientID int ,DoctorID INT ,TreatmentDate DATE,TreatmentName VARCHAR(25),FollowUpRequired ENUM('Yes', 'No'),Cost int,FOREIGN KEY (PatientID) REFERENCES Patient(PatientID),FOREIGN KEY (DoctorID) REFERENCES Doctor(DoctorID));
desc Treatment;

CREATE TABLE HsptlRoom(RoomID INT PRIMARY KEY,PatientID INT,NurseID INT,RoomType ENUM('ICU', 'Private Room', 'General Ward'),Capacity INT,OccupiedStatus ENUM('Yes', 'No'),Cost DECIMAL(10, 2),FOREIGN KEY (PatientID) REFERENCES Patient(PatientID),FOREIGN KEY (NurseID) REFERENCES Nurse(NurseID));
desc HsptlRoom;

create table Nurse(NurseID INT PRIMARY KEY,Name VARCHAR(25),PatientID INT,DoctorID INT,PhoneNo long,Salary long,FOREIGN KEY (PatientID) REFERENCES Patient(PatientID),FOREIGN KEY (DoctorID) REFERENCES Doctor(DoctorID));
desc Nurse;

create table Billing(BillingID INT PRIMARY KEY,PatientID INT,BillingDate DATE,PaymentMethod ENUM('Cash', 'Credit Card'),TotalAmount DECIMAL(10, 2),PaymentStatus ENUM('Paid', 'Unpaid'),PhoneNo long,FOREIGN KEY (PatientID) REFERENCES Patient(PatientID));
desc Billing;

select * from  Patient;
select * from  Receptionist;
select * from  Doctor;
select * from  Medical;
select * from  Treatment;
select * from  HsptlRoom;
select * from  Nurse;
select * from  Billing;



 
