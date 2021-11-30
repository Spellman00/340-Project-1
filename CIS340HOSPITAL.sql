CREATE DATABASE `cis340hospital`;

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
  CONSTRAINT `wardNumberWardRequisitions` FOREIGN KEY (`wardsNumber`) REFERENCES `wards` (`wardsNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



