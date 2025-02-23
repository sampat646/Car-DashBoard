DROP TABLE IF EXISTS `car`;
CREATE TABLE `car` (
  `carId` int NOT NULL,
  `carModel` varchar(45) NOT NULL,
  `carBrand` varchar(45) NOT NULL,
  `carColor` varchar(45) NOT NULL,
  `carPrice` varchar(45) NOT NULL,
  PRIMARY KEY (`carId`),
  UNIQUE KEY `carId_UNIQUE` (`carId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


