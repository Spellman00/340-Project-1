CREATE DATABASE `cis340hospital`;

/*Written by Albertson Vergara*/
CREATE TABLE `staff` (
  `staffNumber` int NOT NULL,
  `staffName` varchar(45) NOT NULL,
  `address` varchar(45) DEFAULT NULL,
  `telephoneNumber` varchar(45) DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `sex` varchar(45) DEFAULT NULL,
  `NIN` int NOT NULL,
  `positionHeld` varchar(45) DEFAULT NULL,
  `currentSalary` varchar(45) DEFAULT NULL,
  `salaryScale` varchar(45) DEFAULT NULL,
  `typeOfEmploymentContract` varchar(45) DEFAULT NULL,
  `numberOfHoursPerWeek` int DEFAULT NULL,
  `temporaryOrPermanent` varchar(45) DEFAULT NULL,
  `typeOfSalaryContract` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`staffNumber`),
  UNIQUE KEY `staffNumber_UNIQUE` (`staffNumber`),
  UNIQUE KEY `NIN_UNIQUE` (`NIN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `qualifications` (
  `staffNumber` int NOT NULL,
  `type` varchar(45) NOT NULL,
  `date` date NOT NULL,
  `institution` varchar(45) NOT NULL,
  PRIMARY KEY (`staffNumber`),
  UNIQUE KEY `staffNumber_UNIQUE` (`staffNumber`),
  KEY `staffNumber_idx` (`staffNumber`),
  CONSTRAINT `staffNumberQualifications` FOREIGN KEY (`staffNumber`) REFERENCES `staff` (`staffNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `workexperience` (
  `staffNumber` int NOT NULL,
  `nameOfOrganization` varchar(45) DEFAULT NULL,
  `startDate` date NOT NULL,
  `finishDate` date DEFAULT NULL,
  `position` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`staffNumber`),
  UNIQUE KEY `staffNumber_UNIQUE` (`staffNumber`),
  CONSTRAINT `staffNumberWorkExperience` FOREIGN KEY (`staffNumber`) REFERENCES `staff` (`staffNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `wards` (
  `wardsNumber` int NOT NULL,
  `name` varchar(45) NOT NULL,
  `location` varchar(45) NOT NULL,
  `numberOfBeds` int NOT NULL,
  `telephoneExtension` varchar(45) NOT NULL,
  PRIMARY KEY (`wardsNumber`),
  UNIQUE KEY `wardsNumber_UNIQUE` (`wardsNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `wardsrequisitions` (
  `wardsNumber` int NOT NULL,
  `number` int NOT NULL,
  `costPerUnit` decimal(4,2) NOT NULL,
  `dateOrdered` date DEFAULT NULL,
  `description` varchar(45) NOT NULL,
  `quantityRequired` int DEFAULT NULL,
  `dosage` int DEFAULT NULL,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`number`),
  UNIQUE KEY `wardsNumber_UNIQUE` (`wardsNumber`),
  UNIQUE KEY `itemNumber_UNIQUE` (`number`),
  CONSTRAINT `wardNumberWardRequisitions` FOREIGN KEY (`wardsNumber`) REFERENCES wards (`wardsNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Written By Drew Spellman*/
CREATE TABLE `Patients` (
  `PatientNumber` INT NOT NULL,
  `FirstName` VARCHAR(45) NOT NULL,
  `LastName` VARCHAR(45) NOT NULL,
  `Address` VARCHAR(45) DEFAULT NULL,
  `PhoneNumber` VARCHAR(45) DEFAULT NULL,
  `DateofBirth` DATE NOT NULL,
  `Sex` VARCHAR(45) NOT NULL,
  `MaritalStatus` VARCHAR(45) DEFAULT NULL,
  `Dateofadmission` DATETIME NOT NULL,
  `NextofKin` VARCHAR(45) DEFAULT NULL,
  PRIMARY KEY (`PatientNumber`),
  UNIQUE KEY `PatientNumber_UNIQUE` (`PatientNumber`)
  );

CREATE TABLE `Outpatients` (
  `PatientNumber` INT NOT NULL,
  `FirstName` VARCHAR(45) NOT NULL,
  `LastName` VARCHAR(45) NOT NULL,
  `Address` VARCHAR(45) DEFAULT NULL,
  `PhoneNumber` VARCHAR(45) DEFAULT NULL,
  `DateOfBirth` DATE NOT NULL,
  `Sex` VARCHAR(45) NOT NULL,
  `AppointmentDateAndTime` DATETIME NOT NULL,
  FOREIGN KEY (`PatientNumber`) REFERENCES Patients (`PatientNumber`)
);

CREATE TABLE `Inpatients` (
  `PatientNumber` INT NOT NULL,
  `FirstName` VARCHAR(45) NOT NULL,
  `LastName` VARCHAR(45) NOT NULL,
  `Address` VARCHAR(45) DEFAULT NULL,
  `PhoneNumber` VARCHAR(45) DEFAULT NULL,
  `DateOfBirth` DATE NOT NULL,
  `Sex` VARCHAR(45) NOT NULL,
  `MaritalStatus` VARCHAR(45) DEFAULT NULL,
  `NextOfKin` VARCHAR(45) DEFAULT NULL,
  `DateOnWaitingList` DATETIME NOT NULL,
  `WardRequired` INT NOT NULL,
  `DurationOfStay` INT NOT NULL,
  `DatePlacedInWard` DATETIME NOT NULL,
  `DateOfExpectedLeave` DATETIME NOT NULL,
  `ActualDateOfLeave` DATETIME NOT NULL,
  `BedNumber` INT NOT NULL,
  FOREIGN KEY (`PatientNumber`) REFERENCES Patients (`PatientNumber`)
);

CREATE TABLE `NextofKin` (
  `PatientNumber` INT NOT NULL,
  `FullName` VARCHAR(45) NOT NULL,
  `Relationship` VARCHAR(45) NOT NULL,
  `Address` VARCHAR(45) DEFAULT NULL,
  `PhoneNumber` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`FullName`),
  FOREIGN KEY (`PatientNumber`) REFERENCES Patients (`PatientNumber`)
);

CREATE TABLE `PatientMedication` (
  `PatientNumber` INT NOT NULL,
  `PatientName` VARCHAR(45) NOT NULL,
  `DrugNumber` INT NOT NULL,
  `DrugName` VARCHAR(45) NOT NULL,
  `UnitsPerDay` INT NOT NULL,
  `MethodOfAdministration` VARCHAR(45) NOT NULL,
  `StartDate` DATE NOT NULL,
  `EndDate` DATE NOT NULL,
  FOREIGN KEY (`PatientNumber`) REFERENCES Patients (`PatientNumber`)
);

/*Written By Amin Mohammed*/
CREATE TABLE `Surgical and NonSurgical Supplies` (
  `ItemNumber` INT NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  `ItemDescription` VARCHAR(45) NOT NULL,
  `QuantityinStock` INT NOT NULL,
  `ReorderLevel` VARCHAR(45) NOT NULL,
  `CostperLimit` DOUBLE NOT NULL,
  PRIMARY KEY (`ItemNumber`),
  UNIQUE KEY `ItemNumber_UNIQUE` (`ItemNumber`)
);
CREATE TABLE `Supplies` (
  `Number` INT NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  `Address` VARCHAR(45) DEFAULT NULL,
  `PhoneNumber` VARCHAR(45) DEFAULT NULL,
  `FaxNumber` INT NOT NULL,
  PRIMARY KEY (`Number`),
  UNIQUE KEY `Number_UNIQUE` (`Number`)
);
CREATE TABLE `Pharmaceutical Supplies` (
  `DrugNumber` INT NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  `Description` VARCHAR(45) NOT NULL,
  `MethodofAdministration` VARCHAR(45) NOT NULL,
  `Dosage` VARCHAR(45) NOT NULL,
  `Quantitiyinstock` INT NOT NULL,
  `ReorderLevel` VARCHAR(45) NOT NULL,
  `CostperUnit`DOUBLE NOT NULL,
  PRIMARY KEY (`DrugNumber`),
  UNIQUE KEY `DrugNumber_UNIQUE` (`DrugNumber`)
);
CREATE TABLE `Patient Appointments` (
  `AppointmentNumber` INT NOT NULL,
  `PatientName` VARCHAR(45) NOT NULL,
  `StaffName` VARCHAR(45) NOT NULL,
  `DateandTime` DATETIME NOT NULL,
  `Examination Room` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`AppointmentNumber`),
  UNIQUE KEY `AppointmentNumber_UNIQUE` (`AppointmentNumber`)
);
CREATE TABLE `Local Doctors` (
  `FullName` VARCHAR(45) NOT NULL,
  `ClinicNumber` INT NOT NULL,
  `ClinicAddress` VARCHAR(45) NOT NULL,
  `ClinicPhoneNumber` VARCHAR(45) NOT NULL
);

