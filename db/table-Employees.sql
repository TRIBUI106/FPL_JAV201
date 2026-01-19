-- --------------------------------------------------------
-- Host:                         yeume-enterprise.edu.vn
-- Server version:               10.6.23-MariaDB-cll-lve - MariaDB Server
-- Server OS:                    Linux
-- HeidiSQL Version:             12.14.0.7165
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for table yeumeent_dihoc.Employees
CREATE TABLE IF NOT EXISTS `Employees` (
  `Id` varchar(20) NOT NULL,
  `Password` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `Fullname` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `Photo` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `Gender` tinyint(1) NOT NULL,
  `Birthday` date NOT NULL,
  `Salary` double NOT NULL,
  `DepartmentId` char(3) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `idx_department` (`DepartmentId`),
  CONSTRAINT `fk_employee_department` FOREIGN KEY (`DepartmentId`) REFERENCES `Departments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table yeumeent_dihoc.Employees: ~9 rows (approximately)
INSERT INTO `Employees` (`Id`, `Password`, `Fullname`, `Photo`, `Gender`, `Birthday`, `Salary`, `DepartmentId`) VALUES
	('E0010', 'nguginoi123', 'Trần Hải Nam', 'uploads/1764922003503_nam.jpg', 1, '2007-04-01', 90000, 'D02'),
	('E002', 'pass234', 'Jane Smith', 'jane.jpg', 0, '1988-07-23', 60000, '002'),
	('E003', 'pass345', 'Michael Johnson', 'uploads/1764823331042_Untitled.png', 1, '1985-02-12', 55000, '003'),
	('E004', 'pass456', 'Emily Davis', 'emily.jpg', 0, '1992-09-01', 48000, 'D04'),
	('E005', 'pass567', 'Robert Brown', 'robert.jpg', 1, '1994-11-20', 53000, 'D05'),
	('E006', 'pass678', 'Lisa White', 'lisa.jpg', 0, '1987-08-19', 58000, 'D01'),
	('E007', 'pass789', 'James Wilson', 'james.jpg', 1, '1990-12-30', 61000, 'D02'),
	('E008', 'pass890', 'Sarah Taylor', 'sarah.jpg', 0, '1995-04-15', 52000, 'D03'),
	('E009', 'pass901', 'David Lee', 'david.jpg', 1, '1991-06-22', 49000, 'D04'),
	('E010', 'pass012', 'Sophia Moore', 'sophia.jpg', 0, '1993-10-11', 62000, 'D05');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
