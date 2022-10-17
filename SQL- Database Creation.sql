mysql -u root -p -h 127.0.0.1

-- SQL TO CREATE AND USE DATABASE hw_motors: 
---------------------------------------------
CREATE DATABASE hw_motors;
USE hw_motors;

-- SQL TO CREATE VARIOUS TABLES:
---------------------------------
/* DRIVER TABLE:
   licenceId - VARCHAR(35) considering the numbers and alphabets in an ID.
             - It is a naturally occuring unique value hence = PRIMARY KEY.
   firstName & lastName - VARCHAR(35) as per the UK recommendation
   						  for no. of characters in a name field.
   homeAddress - VARCHAR(100) taking into account long addresses.
   mobileNo - VARCHAR(20) since the number can be very long, have characters
   			  like + and is not used as integers in calculations.
   dateOfBirth, issueDate, expieryDate - DATE.
   email - VARCHAR(50) and Unique since all email IDs are 
           different from one another.
   countryIssued - VARCHAR(35).
   transmission - 'A' / 'M' where 'A' stands for Automatic and 'M' stands
                  for Manual. 
*/
CREATE TABLE Driver ( 
	licenseID VARCHAR(35) PRIMARY KEY,
	firstName VARCHAR (35) NOT NULL, 
	lastName VARCHAR (35) NOT NULL,  
	homeAddress VARCHAR (100),
	mobileNo VARCHAR (20) NOT NULL,
	dateOfBirth DATE NOT NULL,
	email VARCHAR (50) NOT NULL UNIQUE,
	countryIssued VARCHAR(35) NOT NULL,
	transmission ENUM('A','M') NOT NULL,
	issueDate DATE NOT NULL,
	expieryDate DATE NOT NULL
)ENGINE=INNODB;



/* BOOKING MEDIUM TABLE:
   mediumName - VARCHAR(50): name of the medioum the booking was made using.
   		      - Here it is unique hence = PRIMARY KEY.
   type - 'W' / 'M' where 'W' stands for Website and 'M' stands for
   	       mobile app.
   urlOrPlatformAppStore - VARCHAR(50): Indicates where the app or
                           or the website (url) can be found.
*/
CREATE TABLE BookingMedium(
	mediumName VARCHAR(50) PRIMARY KEY,
	type ENUM('W','M') NOT NULL,
	urlOrPlatformAppStore VARCHAR(50) NOT NULL
)ENGINE=INNODB;



/* BASE TABLE:
   baseNumber - int(5).
   		      - Here it is unique hence = PRIMARY KEY.
   baseLocation - VARCHAR(30): Only drivers with an UK
                  address will eligible to rent vehicle.
*/
CREATE TABLE Base(
 	baseNumber INT(5) PRIMARY KEY,
 	baseLocation VARCHAR(30) NOT NULL
)ENGINE=INNODB;



/* ADDITIONAL DRIVERS TABLE:
   mainLicenceID - VARCHAR(35): since a license ID can have numebrs and letters.
   additionalLicenceID - VARCHAR(35): ID number of the additional
                         driver registered by this driver.
   Here this table embodies a muliple attribute. i.e. one main driver may have 
   registered 1 / more additional drivers.

   Hence, mainLicenceID together with aditionalLicenceID forms a compound Primary Key.
*/
CREATE TABLE AdditionalDrivers ( 
	mainLicenceID VARCHAR(35) NOT NULL,
	additionalLicenceID VARCHAR(35),
	CONSTRAINT fk_MainLicenceID FOREIGN KEY (MainLicenceID ) 
								REFERENCES Driver (licenseID)
								ON DELETE CASCADE 
								ON UPDATE CASCADE,
	CONSTRAINT fk_AdditionalLicenceID FOREIGN KEY (AdditionalLicenceID) 
									  REFERENCES Driver (licenseID)
									  ON DELETE CASCADE
									  ON UPDATE CASCADE,
	PRIMARY KEY (MainLicenceID, AdditionalLicenceID)
)ENGINE=INNODB;



/* VEHICLE TABLE:
   	numberPlate - VARCHAR(7): It is unique hence PRIMARY KEY,
   	company - VARCHAR(35): Name of the company that is the maker of the vehicle.
   						   (i.e Nissan, Toyota, Mercedes etc.)
	model - VARCHAR(35): Model name of the vehicle. (Pathfinder, Innova, Q7 etc.)
	numOfSeats - INT(2) no: of seats a 4 wheeler can have falls within 2 digits,
	engineType - VARCHAR(20)
	engineSize - VARCHAR(10)
	transmission - ENUM('A','M'): Where A stands for automatica nd M for manual
	minAgeToRent - INT(2)
	standardHirePrice - INT(10): The base price for each vehicle.
	ServiceStartDate - DATE
	ServiceEndDate - DATE
	rentedFrom - INT(5): number of the base vehicle was rented from
	returnedTo - INT(5): number of the base vehicle is to be returned to
	homeBase - INT(5): number of the home base of the vehicle
	carOrVan - ENUM('car','van') : To identify whether vehicle is a car or a van.
*/
CREATE TABLE Vehicle(
	numberPlate VARCHAR(7) PRIMARY KEY,
	company VARCHAR(35) NOT NULL,
	model VARCHAR(35) NOT NULL,
	numOfSeats INT(2) NOT NULL,
	engineType VARCHAR(20) NOT NULL,
	engineSize VARCHAR(10) NOT NULL,
	transmission ENUM('A','M') NOT NULL DEFAULT 'M',
	minAgeToRent INT(2) NOT NULL,
	standardHirePrice INT(10) NOT NULL,
	ServiceStartDate DATE NOT NULL,
	ServiceEndDate DATE NOT NULL,
	rentedFrom INT(5) NOT NULL,
	returnedTo INT(5),
	homeBase INT(5) NOT NULL,
	carOrVan ENUM('car','van') DEFAULT 'car',
	CONSTRAINT fk_rentedFrom FOREIGN KEY (rentedFrom) 
							 REFERENCES Base (baseNumber)
							 ON UPDATE CASCADE
							 ON DELETE CASCADE,
	CONSTRAINT fk_returnedTo FOREIGN KEY (returnedTo) 
							 REFERENCES Base (baseNumber)
							 ON UPDATE CASCADE
							 ON DELETE CASCADE,
	CONSTRAINT fk_homeBase FOREIGN KEY (homeBase) 
	                       REFERENCES Base (baseNumber)
	                       ON UPDATE CASCADE
						   ON DELETE NO ACTION
)ENGINE=INNODB;

/* VEHICLE TYPE TABLE:
   	numberPlate - VARCHAR(7): Number plate of vehicle.
	type - VARCHAR(20): The type of vehicle(family car, luxury car, minvan etc.)

	Here this table embodies a muliple attribute. i.e. one vehicle may be of many types. 

   	Hence, numberPlate together with type forms a compound Primary Key.
*/
CREATE TABLE VehicleType(
	numberPlate VARCHAR(7) NOT NULL,
	type VARCHAR(20) NOT NULL,
	CONSTRAINT fk_numberPlate FOREIGN KEY (numberPlate) 
							  REFERENCES Vehicle (numberPlate)
							  ON UPDATE CASCADE
							  ON DELETE CASCADE,
	PRIMARY KEY (numberPlate, type)
)ENGINE=INNODB;

/* BOOKING MEDIUM DRIVER TABLE:
   	mediumName - VARCHAR(50): Name of the website or mobile app
	driverLicenceID - VARCHAR(35): Licence ID of main driver.

	Here, this table is the result of a many to many relationship between 
	the Driver table and the BookingMedium table.

	Hence, mediumName together with driverLicenceID forms a compound Primary Key.
*/
CREATE TABLE BookingMediumDriver(
	mediumName VARCHAR(50) NOT NULL,
	driverLicenceID VARCHAR(35) NOT NULL UNIQUE,
	CONSTRAINT fk_mediumName FOREIGN KEY (mediumName) 
							 REFERENCES BookingMedium (mediumName)
							 ON UPDATE CASCADE 
							 ON DELETE NO ACTION,
	CONSTRAINT fk_driverLicenceID FOREIGN KEY (driverLicenceID)
	                              REFERENCES Driver (licenseID),
	PRIMARY KEY (mediumName, driverLicenceID)
)ENGINE=INNODB;

/* BOOKING TABLE:
   	bookingId - VARCHAR(20): A mix of letters and numbers that represent the booking made.
	driver - VARCHAR(35): LicenceID of the main driver
	bookingMediumName - VARCHAR(50): name of the website/mobile app used to make booking.
	startDate - DATE
	endDate - DATE
	hasInsuranceExtras - ENUM('Y','N'): Y stands for Yes and N for No.
	vehicleBooked - VARCHAR(7): Number plate of vehicle booked.
	standardDemand - INT(3): The normal no: of bookings that are usually made.

	The Booking table is dependent on the Driver table and the bookingMedium table,
	so the primary key of the booking table is made up of the unique bookingID and
	the foreign keys, driver and bookingMediumName together forming a compound PRIMARY KEY.
*/
CREATE TABLE Booking(
	bookingId VARCHAR(20) NOT NULL UNIQUE,
	driver VARCHAR(35) NOT NULL,
	bookingMediumName VARCHAR(50) NOT NULL,
	startDate DATE NOT NULL,
	endDate DATE NOT NULL,
	hasInsuranceExtras ENUM('Y','N') NOT NULL DEFAULT 'N',
	vehicleBooked VARCHAR(7) NOT NULL,
	CONSTRAINT fk_driver FOREIGN KEY (driver) 
						 REFERENCES Driver(licenseID)
						 ON UPDATE CASCADE
					 	 ON DELETE CASCADE,
	CONSTRAINT fk_bookingMediumName FOREIGN KEY (bookingMediumName) 
									REFERENCES BookingMedium (mediumName)
									ON UPDATE CASCADE
					 				ON DELETE NO ACTION,
	CONSTRAINT fk_vehicleBooked FOREIGN KEY (vehicleBooked) 
								REFERENCES Vehicle(numberPlate)
								ON UPDATE NO ACTION
					 	 		ON DELETE NO ACTION,
	PRIMARY KEY(bookingId,driver,bookingMediumName)
)ENGINE=INNODB;