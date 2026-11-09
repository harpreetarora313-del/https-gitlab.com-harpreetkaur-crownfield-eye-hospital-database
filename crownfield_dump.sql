-- MySQL dump 10.13  Distrib 9.7.4, for Win64 (x86_64)
--
-- Host: localhost    Database: crownfield
-- ------------------------------------------------------
-- Server version	9.7.4

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `appointment`
--

DROP TABLE IF EXISTS `appointment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointment` (
  `appointment_id` varchar(10) NOT NULL,
  `patient_id` varchar(10) NOT NULL,
  `clinician_id` varchar(10) NOT NULL,
  `clinic_id` varchar(10) NOT NULL,
  `appointment_date` date NOT NULL,
  `status` varchar(15) NOT NULL DEFAULT 'Scheduled',
  PRIMARY KEY (`appointment_id`),
  KEY `patient_id` (`patient_id`),
  KEY `clinician_id` (`clinician_id`),
  KEY `clinic_id` (`clinic_id`),
  CONSTRAINT `appointment_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`),
  CONSTRAINT `appointment_ibfk_2` FOREIGN KEY (`clinician_id`) REFERENCES `clinician` (`clinician_id`),
  CONSTRAINT `appointment_ibfk_3` FOREIGN KEY (`clinic_id`) REFERENCES `clinic` (`clinic_id`),
  CONSTRAINT `chk_status` CHECK ((`status` in (_utf8mb4'Scheduled',_utf8mb4'Completed',_utf8mb4'Cancelled')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment`
--

LOCK TABLES `appointment` WRITE;
/*!40000 ALTER TABLE `appointment` DISABLE KEYS */;
INSERT INTO `appointment` VALUES ('A001','P001','C001','CL01','2026-03-02','Completed'),('A002','P002','C001','CL01','2026-03-04','Completed'),('A003','P003','C001','CL01','2026-03-09','Completed'),('A004','P004','C001','CL01','2026-03-11','Completed'),('A005','P005','C001','CL01','2026-03-16','Scheduled'),('A006','P001','C002','CL02','2026-03-18','Completed'),('A007','P006','C002','CL02','2026-03-23','Completed'),('A008','P007','C002','CL02','2026-03-25','Scheduled'),('A009','P008','C002','CL02','2026-03-30','Scheduled'),('A010','P009','C003','CL03','2026-04-01','Completed'),('A011','P010','C004','CL04','2026-04-06','Completed'),('A012','P002','C005','CL05','2026-04-08','Scheduled'),('A013','P003','C006','CL06','2026-04-13','Scheduled');
/*!40000 ALTER TABLE `appointment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clinic`
--

DROP TABLE IF EXISTS `clinic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clinic` (
  `clinic_id` varchar(10) NOT NULL,
  `clinic_name` varchar(80) NOT NULL,
  PRIMARY KEY (`clinic_id`),
  UNIQUE KEY `clinic_name` (`clinic_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clinic`
--

LOCK TABLES `clinic` WRITE;
/*!40000 ALTER TABLE `clinic` DISABLE KEYS */;
INSERT INTO `clinic` VALUES ('CL05','Cataract Clinic'),('CL03','Cornea Clinic'),('CL10','Emergency Eye Clinic'),('CL09','General Eye Clinic'),('CL01','Glaucoma Clinic'),('CL07','Neuro-ophthalmology Clinic'),('CL06','Oculoplastics Clinic'),('CL04','Paediatric Clinic'),('CL02','Retina Clinic'),('CL08','Uveitis Clinic');
/*!40000 ALTER TABLE `clinic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clinician`
--

DROP TABLE IF EXISTS `clinician`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clinician` (
  `clinician_id` varchar(10) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `specialty` varchar(60) NOT NULL,
  PRIMARY KEY (`clinician_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clinician`
--

LOCK TABLES `clinician` WRITE;
/*!40000 ALTER TABLE `clinician` DISABLE KEYS */;
INSERT INTO `clinician` VALUES ('C001','Priya','Nair','Glaucoma'),('C002','James','Okafor','Retina'),('C003','Helen','Marsh','Cornea'),('C004','Tariq','Rahman','Paediatric'),('C005','Sophie','Lindgren','Cataract'),('C006','David','Ng','Oculoplastics'),('C007','Maria','Fontaine','Neuro-ophthalmology'),('C008','Alan','Whitby','Uveitis'),('C009','Rachel','Obi','General'),('C010','Samuel','Kerr','Glaucoma');
/*!40000 ALTER TABLE `clinician` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diagnosis`
--

DROP TABLE IF EXISTS `diagnosis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diagnosis` (
  `diagnosis_id` varchar(10) NOT NULL,
  `appointment_id` varchar(10) NOT NULL,
  `description` varchar(120) NOT NULL,
  PRIMARY KEY (`diagnosis_id`),
  KEY `appointment_id` (`appointment_id`),
  CONSTRAINT `diagnosis_ibfk_1` FOREIGN KEY (`appointment_id`) REFERENCES `appointment` (`appointment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diagnosis`
--

LOCK TABLES `diagnosis` WRITE;
/*!40000 ALTER TABLE `diagnosis` DISABLE KEYS */;
INSERT INTO `diagnosis` VALUES ('D001','A001','Primary open-angle glaucoma'),('D002','A002','Ocular hypertension'),('D003','A003','Primary open-angle glaucoma'),('D004','A004','Normal-tension glaucoma'),('D005','A006','Diabetic retinopathy'),('D006','A007','Retinal tear'),('D007','A010','Dry eye syndrome'),('D008','A011','Amblyopia'),('D009','A012','Cataract'),('D010','A013','Ptosis');
/*!40000 ALTER TABLE `diagnosis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `followup`
--

DROP TABLE IF EXISTS `followup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `followup` (
  `followup_id` varchar(10) NOT NULL,
  `appointment_id` varchar(10) NOT NULL,
  `due_date` date NOT NULL,
  `notes` varchar(120) DEFAULT NULL,
  PRIMARY KEY (`followup_id`),
  KEY `appointment_id` (`appointment_id`),
  CONSTRAINT `followup_ibfk_1` FOREIGN KEY (`appointment_id`) REFERENCES `appointment` (`appointment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `followup`
--

LOCK TABLES `followup` WRITE;
/*!40000 ALTER TABLE `followup` DISABLE KEYS */;
INSERT INTO `followup` VALUES ('F001','A001','2026-06-02','Review pressure in 3 months'),('F002','A002','2026-06-04','Review pressure in 3 months'),('F003','A003','2026-06-09','Visual field test'),('F004','A004','2026-06-11','Review medication'),('F005','A005','2026-06-16','Routine review'),('F006','A006','2026-05-18','Retinal scan'),('F007','A007','2026-05-23','Post-repair check'),('F008','A008','2026-05-25','Routine review'),('F009','A009','2026-05-30','Routine review'),('F010','A010','2026-05-01','Dry eye review'),('F011','A011','2026-07-06','Vision therapy review');
/*!40000 ALTER TABLE `followup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicine`
--

DROP TABLE IF EXISTS `medicine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medicine` (
  `medicine_id` varchar(10) NOT NULL,
  `medicine_name` varchar(80) NOT NULL,
  PRIMARY KEY (`medicine_id`),
  UNIQUE KEY `medicine_name` (`medicine_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicine`
--

LOCK TABLES `medicine` WRITE;
/*!40000 ALTER TABLE `medicine` DISABLE KEYS */;
INSERT INTO `medicine` VALUES ('M010','Acetazolamide'),('M004','Brimonidine'),('M005','Chloramphenicol'),('M008','Cyclopentolate'),('M003','Dorzolamide'),('M007','Hypromellose'),('M001','Latanoprost'),('M006','Prednisolone'),('M002','Timolol'),('M009','Tropicamide');
/*!40000 ALTER TABLE `medicine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient` (
  `patient_id` varchar(10) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `postcode` varchar(10) NOT NULL,
  PRIMARY KEY (`patient_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
INSERT INTO `patient` VALUES ('P001','Amelia','Hart','CO10 1AA'),('P002','Oliver','Finch','CO10 2BB'),('P003','Isla','Moreton','CO10 3CC'),('P004','Noah','Barlow','IP33 1DD'),('P005','Freya','Collins','IP33 2EE'),('P006','Leo','Ashworth','CB9 1FF'),('P007','Grace','Pemberton','CB9 2GG'),('P008','Harry','Doyle','CO6 1HH'),('P009','Poppy','Whitlock','CO6 2JJ'),('P010','Jack','Renshaw','IP2 1KK');
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prescription`
--

DROP TABLE IF EXISTS `prescription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prescription` (
  `prescription_id` varchar(10) NOT NULL,
  `appointment_id` varchar(10) NOT NULL,
  `medicine_id` varchar(10) NOT NULL,
  `dosage` varchar(60) NOT NULL,
  PRIMARY KEY (`prescription_id`),
  KEY `appointment_id` (`appointment_id`),
  KEY `medicine_id` (`medicine_id`),
  CONSTRAINT `prescription_ibfk_1` FOREIGN KEY (`appointment_id`) REFERENCES `appointment` (`appointment_id`),
  CONSTRAINT `prescription_ibfk_2` FOREIGN KEY (`medicine_id`) REFERENCES `medicine` (`medicine_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prescription`
--

LOCK TABLES `prescription` WRITE;
/*!40000 ALTER TABLE `prescription` DISABLE KEYS */;
INSERT INTO `prescription` VALUES ('RX001','A001','M001','1 drop nightly, both eyes'),('RX002','A001','M002','1 drop twice daily, both eyes'),('RX003','A002','M001','1 drop nightly, right eye'),('RX004','A003','M003','1 drop three times daily'),('RX005','A004','M004','1 drop twice daily'),('RX006','A006','M006','1 drop four times daily'),('RX007','A010','M007','1 drop as needed'),('RX008','A011','M008','1 drop before examination'),('RX009','A007','M009','1 drop before examination'),('RX010','A003','M001','1 drop nightly, left eye');
/*!40000 ALTER TABLE `prescription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'crownfield'
--
/*!50003 DROP PROCEDURE IF EXISTS `GetPatientAppointments` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetPatientAppointments`(IN p_patient_id VARCHAR(10))
BEGIN
    SELECT appointment_id, appointment_date, status
    FROM Appointment
    WHERE patient_id = p_patient_id
    ORDER BY appointment_date;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-11-09 16:12:58
