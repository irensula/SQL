-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: 08.01.2024 klo 11:52
-- Palvelimen versio: 8.0.35
-- PHP Version: 8.1.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `irysul23_demot`
--

-- --------------------------------------------------------

--
-- Rakenne taululle `Artists`
--

CREATE TABLE `Artists` (
  `ArtistID` int NOT NULL,
  `Name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ContactEmail` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ContactPhone` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `StyleID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Vedos taulusta `Artists`
--

INSERT INTO `Artists` (`ArtistID`, `Name`, `ContactEmail`, `ContactPhone`, `StyleID`) VALUES
(1, 'Zemfira', 'zemfira@gmail.com', '0501234567', 1),
(2, '50cent', '50cent@gmail.com', '0501234568', 3),
(3, 'Nora Jhones', 'norajhones@gmail.com', '0501234569', 2),
(4, 'Alma', 'alma@gmail.com', '0501234567', 6),
(5, 'Lauri Tähkä', 'lauritahka@gmail.com', '0501234570', 4);

-- --------------------------------------------------------

--
-- Rakenne taululle `Gigs`
--

CREATE TABLE `Gigs` (
  `GigID` int NOT NULL,
  `Date` date NOT NULL,
  `Showtime` time NOT NULL,
  `AgeLimit` int NOT NULL,
  `VenuelID` int NOT NULL,
  `ArtistID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Vedos taulusta `Gigs`
--

INSERT INTO `Gigs` (`GigID`, `Date`, `Showtime`, `AgeLimit`, `VenuelID`, `ArtistID`) VALUES
(1, '2024-01-19', '19:00:00', 18, 1, 4),
(2, '2024-01-20', '19:00:00', 18, 2, 1),
(3, '2024-01-25', '19:00:00', 18, 2, 5),
(4, '2024-01-26', '19:00:00', 18, 1, 3);

-- --------------------------------------------------------

--
-- Rakenne taululle `Styles`
--

CREATE TABLE `Styles` (
  `StyleID` int NOT NULL,
  `StayleName` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Vedos taulusta `Styles`
--

INSERT INTO `Styles` (`StyleID`, `StayleName`) VALUES
(1, 'Rock'),
(2, 'Jazz'),
(3, 'Rap'),
(4, 'Pop'),
(5, 'Classic'),
(6, 'Iskelmä');

-- --------------------------------------------------------

--
-- Rakenne taululle `Venues`
--

CREATE TABLE `Venues` (
  `VenueID` int NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Address` varchar(50) NOT NULL,
  `PostalCode` int NOT NULL,
  `PostalAddress` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Vedos taulusta `Venues`
--

INSERT INTO `Venues` (`VenueID`, `Name`, `Address`, `PostalCode`, `PostalAddress`) VALUES
(1, 'Nokia Areena', 'Keskustankatu 11', 12300, 'Tampere'),
(2, 'TampereTalo', 'Keskustankatu 100', 12301, 'Tampere');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Artists`
--
ALTER TABLE `Artists`
  ADD PRIMARY KEY (`ArtistID`),
  ADD KEY `StyleID` (`StyleID`);

--
-- Indexes for table `Gigs`
--
ALTER TABLE `Gigs`
  ADD PRIMARY KEY (`GigID`),
  ADD KEY `ArtistID` (`ArtistID`),
  ADD KEY `VenuelID` (`VenuelID`);

--
-- Indexes for table `Styles`
--
ALTER TABLE `Styles`
  ADD PRIMARY KEY (`StyleID`);

--
-- Indexes for table `Venues`
--
ALTER TABLE `Venues`
  ADD PRIMARY KEY (`VenueID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Artists`
--
ALTER TABLE `Artists`
  MODIFY `ArtistID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `Gigs`
--
ALTER TABLE `Gigs`
  MODIFY `GigID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `Styles`
--
ALTER TABLE `Styles`
  MODIFY `StyleID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `Venues`
--
ALTER TABLE `Venues`
  MODIFY `VenueID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Rajoitteet vedostauluille
--

--
-- Rajoitteet taululle `Artists`
--
ALTER TABLE `Artists`
  ADD CONSTRAINT `Artists_ibfk_1` FOREIGN KEY (`StyleID`) REFERENCES `Styles` (`StyleID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Rajoitteet taululle `Gigs`
--
ALTER TABLE `Gigs`
  ADD CONSTRAINT `Gigs_ibfk_1` FOREIGN KEY (`ArtistID`) REFERENCES `Artists` (`ArtistID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `Gigs_ibfk_2` FOREIGN KEY (`VenuelID`) REFERENCES `Venues` (`VenueID`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
