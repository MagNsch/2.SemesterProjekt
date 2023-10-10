

--create database aarsprojekt
--use aarsprojekt

CREATE TABLE PostalCode(
	postalCode int NOT NULL,
	city varchar(50) NOT NULL,
	PRIMARY KEY(postalCode),
)

CREATE TABLE Address(
	address_Id int identity(1,1),
	address varchar(50) NOT NULL,
	postalCode_Id int NOT NULL,
	PRIMARY KEY(address_Id),
	Constraint FK_Postalcode FOREIGN KEY(postalCode_Id) REFERENCES PostalCode(postalCode)
)

CREATE TABLE Person(
	personId int identity(1,1),
	fName varchar(30) NOT NULL,
	lName varchar(30) NOT NULL,
	phone varchar(30) NOT NULL,
	email varchar(20) NOT NULL,
	personType varchar(30) NOT NULL,
	address_Id int NOT NULL, -- 1 for customer 0 for instructor
	PRIMARY KEY(personId),
	Constraint FK_Address FOREIGN KEY(address_Id) REFERENCES Address(address_Id)
)

CREATE TABLE Customer(
	customer_Id int NOT NULL,
	PRIMARY KEY(customer_Id),
	Constraint FK_CustomerPerson FOREIGN KEY(customer_Id) REFERENCES Person(personId)
)

CREATE TABLE Instructor(
	instructor_Id int NOT NULL,
	status int NOT NULL,  -- 1 for available 0 for not available
	PRIMARY KEY(instructor_Id),
	Constraint FK_InstructorPerson FOREIGN KEY(instructor_Id) REFERENCES Person(personId)
)

CREATE TABLE ShootingRange(
	shootingRange_Id int identity(1,1) NOT NULL,
	status int NOT NULL, -- 1 for available 0 for not available
	PRIMARY KEY(shootingRange_Id)
)

CREATE TABLE WeaponType(
	weaponTypeId int identity(1,1) NOT NULL,
	weaponType varchar(40) NOT NULL,
	PRIMARY KEY(weaponTypeId)
)

CREATE TABLE AmmunitionType(
	AmmunitionTypeId int identity(1,1) NOT NULL,
	AmmunitionType varchar(40) NOT NULL,
	PRIMARY KEY(AmmunitionTypeId)
)

CREATE TABLE Weapon(
	weaponId int NOT NULL,  -- serial number of weapon
	weaponName varchar(40) NOT NULL,
	weaponType_Id int,
	ammunitionType_Id int,
	status int NOT NULL, -- 1 for available 0 for not available
	PRIMARY KEY(weaponId),
	Constraint FK_Weapon FOREIGN KEY(weaponType_Id) REFERENCES WeaponType(weaponTypeId),
	Constraint FK_Ammunition FOREIGN KEY(ammunitionType_Id) REFERENCES AmmunitionType(ammunitionTypeId)
)


CREATE TABLE Booking(
	bookingNumber int identity(1,1) NOT NULL,
	creationDate date,
	priceTotal float(2),
	time int,
	date date,
	customer_Id int,
	instructor_Id int,
	ShootingRange_Id int,
	Weapon_Id int,
	PRIMARY KEY(bookingNumber),
	Constraint FK_CustomerToBooking FOREIGN KEY(customer_Id) REFERENCES Customer(customer_Id),
	Constraint FK_InstructorToBooking FOREIGN KEY(instructor_Id) REFERENCES Instructor(instructor_Id),
	Constraint FK_ShootingRangeToBooking FOREIGN KEY(ShootingRange_Id) REFERENCES ShootingRange(ShootingRange_Id),
	Constraint FK_WeaponToBooking FOREIGN KEY(Weapon_Id) REFERENCES Weapon(weaponId)
)



CREATE TABLE Price(
	priceId int identity(1,1) NOT NULL,
	startDate date NOT NULL,
	price float(2),
	instructor_Id int,
	shootingRange_Id int,
	weapon_Id int,
	PRIMARY KEY(priceId),
	Constraint FK_PriceInstructor FOREIGN KEY(instructor_Id) REFERENCES Instructor(instructor_Id),
	Constraint FK_PriceShootingRange FOREIGN KEY(shootingRange_Id) REFERENCES ShootingRange(shootingRange_Id),
	Constraint FK_PriceWeapon FOREIGN KEY(weapon_Id) REFERENCES Weapon(weaponId)
)
