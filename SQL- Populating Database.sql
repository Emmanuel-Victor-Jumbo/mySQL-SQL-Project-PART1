-- INSERTING DUMMY DATA:
-------------------------
-- FOR TABLE = Driver:
INSERT INTO Driver VALUES (
	"LIC23432",
	"JACOB", 
	"PAUL",  
	"711-2880 Nulla St.Mankato Mississippi 96522 (257) 563-7401",
	"202-555-0148",
	'1967-11-03',
	'jacob2334@yahoo.com',
	'UK',
	'M',
	'2012-04-23',
	'2022-02-14'
	);

INSERT INTO Driver VALUES (
	"LIC25432",
	"BETTY", 
	"MENTIS",  
	"P.O. Box 283 8562 Fusce Rd.Frederick Nebraska 20620",
	"242-435-0115",
	'1987-10-13',
	'bettyM@yahoo.com',
	'UK',
	'A',
	'2016-08-27',
	'2026-01-31'
	);

INSERT INTO Driver VALUES (
	"LIC42859",
	"CHARLIE", 
	"CHAN",  
	"606-3727 Ullamcorper. Street Roseville NH 11523",
	"372-587-235",
	'1977-05-21',
	'charlie_chan@yahoo.com',
	'UK',
	'M',
	'2010-04-17',
	'2020-11-15'
	);

INSERT INTO Driver VALUES (
	"LIC54731",
	"AANAD", 
	"VENUGOPAL",  
	"Theodore Lowe Ap #867-859 Sit Rd.Azusa New York 39531",
	"793-151-623",
	'2000-02-18',
	'AnandV@gmail.com',
	'UK',
	'M',
	'2019-07-16',
	'2034-09-23'
	);

INSERT INTO Driver VALUES (
	"LIC54651",
	"CALISTA", 
	"WISE",  
	"7292 Dictum Av. San Antonio MI 47096",
	"492-709-692",
	'1996-03-30',
	'christieCal@gmail.com',
	'UK',
	'A',
	'2009-10-27',
	'2021-03-12'
	);

-- FOR TABLE = BookingMedium:
INSERT INTO BookingMedium VALUES(
	"HW Motors Online",
	'W',
	'https://www.HwMotorsOnline.com/html/'
);

INSERT INTO BookingMedium VALUES(
	"HWM Leasing App(Android)",
	'M',
	'GooglePlayStore'
);

INSERT INTO BookingMedium VALUES(
	"HWM Leasing App(Apple)",
	'M',
	'AppStore'
);

-- FOR TABLE = Base:
INSERT INTO Base VALUES(
	00001,
 	"London"
);

INSERT INTO Base VALUES(
	00002,
 	"Edinburgh"
);

INSERT INTO Base VALUES(
	00003,
 	"Liverpool"
);

INSERT INTO Base VALUES(
	00004,
 	"Glasgo"
);

INSERT INTO Base VALUES(
	00005,
 	"Yorkshire"
);

INSERT INTO Base VALUES(
	00006,
 	"Manchester"
);

-- FOR TABLE = AdditionalDrivers
INSERT INTO AdditionalDrivers VALUES( 
	"LIC23432",
	"LIC25432"
);

INSERT INTO AdditionalDrivers VALUES( 
	"LIC23432",
	"LIC42859"
);

INSERT INTO AdditionalDrivers VALUES( 
	"LIC25432",
	"LIC42859"
);

INSERT INTO AdditionalDrivers VALUES( 
	"LIC25432",
	"LIC54651"
);

INSERT INTO AdditionalDrivers VALUES( 
	"LIC42859",
	"LIC25432"
);

INSERT INTO AdditionalDrivers VALUES( 
	"LIC42859",
	"LIC23432"
);

-- FOR TABLE = Vehicle
INSERT INTO Vehicle VALUES(
	"01GH92A",
	"Niccan",
	"V-Sport",
	"2",
	"four-cylinder",
	"1390cc",
	"A",
	30,
	209648,
	"2021-02-12",
	"2021-02-18",
	00001,
	00002,
	00002,
	'car'
);

INSERT INTO Vehicle VALUES(
	"12KH23S",
	"Tokota",
	"Caraval",
	"4",
	"six-cylinder",
	"3000-cc",
	"A",
	30,
	300210,
	"2024-12-09",
	"2024-12-15",
	00002,
	00002,
	00001,
	'car'
);

INSERT INTO Vehicle VALUES(
	"64LH09T",
	"Merceedias",
	"M23",
	"8",
	"six-cylinder",
	"3000-cc",
	"M",
	30,
	102310,
	"2020-02-05",
	"2020-02-09",
	00003,
	00001,
	00005,
	'van'
);

INSERT INTO Vehicle VALUES(
	"75FZ12K",
	"Mitzabish",
	"Phaser-L8",
	"7",
	"five-cylinder",
	"2980-cc",
	"A",
	30,
	399210,
	"2026-08-21",
	"2031-06-19",
	00006,
	00002,
	00006,
	'car'
);

INSERT INTO Vehicle VALUES(
	"53UI23K",
	"Hornta",
	"Slick",
	"2",
	"two-cylinder",
	"1089-cc",
	"M",
	25,
	80310,
	"2027-06-16",
	"2036-07-03",
	00003,
	00004,
	00003,
	'car'
);

INSERT INTO Vehicle VALUES(
	"96AK12K",
	"Hornta",
	"Girrano",
	"2",
	"two-cylinder",
	"1089-cc",
	"M",
	25,
	90310,
	"2025-10-01",
	"2030-07-07",
	00005,
	00002,
	00004,
	'car'
);

-- FOR TABLE = VehicleType:
INSERT INTO VehicleType VALUES(
	"01GH92A",
	"sports car"
);

INSERT INTO VehicleType VALUES(
	"01GH92A",
	"luxury car"
);

INSERT INTO VehicleType VALUES(
	"12KH23S",
	"small town car"
);

INSERT INTO VehicleType VALUES(
	"12KH23S",
	"family car"
);

INSERT INTO VehicleType VALUES(
	"64LH09T",
	"minivan"
);

INSERT INTO VehicleType VALUES(
	"75FZ12K",
	"MPV"
);

INSERT INTO VehicleType VALUES(
	"75FZ12K",
	"family car"
);

INSERT INTO VehicleType VALUES(
	"53UI23K",
	"small town car"
);

INSERT INTO VehicleType VALUES(
	"96AK12K",
	"family car"
);

-- FOR TABLE = BookingMediumDriver:
INSERT INTO BookingMediumDriver VALUES(
	"HW Motors Online",
	"LIC23432"
);

INSERT INTO BookingMediumDriver VALUES(
	"HW Motors Online",
	"LIC25432"
);

INSERT INTO BookingMediumDriver VALUES(
	"HWM Leasing App(Android)",
	"LIC42859"
);

INSERT INTO BookingMediumDriver VALUES(
	"HWM Leasing App(Android)",
	"LIC54731"
);

INSERT INTO BookingMediumDriver VALUES(
	"HWM Leasing App(Apple)",
	"LIC54651"
);

-- FOR TABLE = Booking:
INSERT INTO Booking VALUES(
	"A1",
	"LIC23432",
	"HW Motors Online",
	"2020-03-14",
	"2020-03-18",
	'Y',
	'01GH92A'
);

INSERT INTO Booking VALUES(
	"A2",
	"LIC25432",
	"HW Motors Online",
	"2020-02-15",
	"2020-02-16",
	'N',
	'12KH23S'
);

INSERT INTO Booking VALUES(
	"A3",
	"LIC42859",
	"HWM Leasing App(Android)",
	"2020-07-30",
	"2020-08-03",
	'Y',
	'53UI23K'
);

INSERT INTO Booking VALUES(
	"A4",
	"LIC54731",
	"HWM Leasing App(Android)",
	"2020-06-03",
	"2020-06-10",
	'Y',
	'01GH92A'
);

INSERT INTO Booking VALUES(
	"A5",
	"LIC54651",
	"HWM Leasing App(Apple)",
	"2020-05-25",
	"2020-05-28",
	'N',
	'01GH92A'
);