-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: 22.01.2024 klo 11:43
-- Palvelimen versio: 8.0.36
-- PHP Version: 8.1.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `irysul23_h1_verkkokauppa`
--

-- --------------------------------------------------------

--
-- Rakenne taululle `h1_asiakkaat`
--

CREATE TABLE `h1_asiakkaat` (
  `asiakasID` int NOT NULL,
  `nimi` varchar(100) NOT NULL,
  `puhelin` varchar(50) NOT NULL,
  `sähköposti` varchar(50) NOT NULL,
  `määritteen nimi` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Vedos taulusta `h1_asiakkaat`
--

INSERT INTO `h1_asiakkaat` (`asiakasID`, `nimi`, `puhelin`, `sähköposti`, `määritteen nimi`) VALUES
(1, 'Kaarina Korhonen', '0409876524', 'kkorhonen@gmail.com', 'kaarina'),
(2, 'Antti Bruun', '0508523641', 'abruun@gmail.com', 'antti');

-- --------------------------------------------------------

--
-- Rakenne taululle `h1_kategoriat`
--

CREATE TABLE `h1_kategoriat` (
  `kategoriaID` int NOT NULL,
  `nimi` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Vedos taulusta `h1_kategoriat`
--

INSERT INTO `h1_kategoriat` (`kategoriaID`, `nimi`) VALUES
(1, 'Talvihaalarit'),
(2, 'Pipo'),
(3, 'Housut'),
(4, 'Hanskat');

-- --------------------------------------------------------

--
-- Rakenne taululle `h1_tilauksen tuotteet`
--

CREATE TABLE `h1_tilauksen tuotteet` (
  `ttID` int NOT NULL,
  `tuoteID` int NOT NULL,
  `tiluausID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Vedos taulusta `h1_tilauksen tuotteet`
--

INSERT INTO `h1_tilauksen tuotteet` (`ttID`, `tuoteID`, `tiluausID`) VALUES
(1, 1, 1),
(2, 2, 2);

-- --------------------------------------------------------

--
-- Rakenne taululle `h1_tilaukset`
--

CREATE TABLE `h1_tilaukset` (
  `tilausID` int NOT NULL,
  `asiakasID` int NOT NULL,
  `tilausPvm` date NOT NULL,
  `lähetysPvm` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Vedos taulusta `h1_tilaukset`
--

INSERT INTO `h1_tilaukset` (`tilausID`, `asiakasID`, `tilausPvm`, `lähetysPvm`) VALUES
(1, 1, '2024-01-15', '2024-01-16'),
(2, 2, '2024-01-09', '2024-01-10');

-- --------------------------------------------------------

--
-- Rakenne taululle `h1_vaatteet`
--

CREATE TABLE `h1_vaatteet` (
  `tuoteID` int NOT NULL,
  `nimike` text NOT NULL,
  `hinta` double NOT NULL,
  `kategoriaID` int NOT NULL,
  `merkki` text NOT NULL,
  `koko` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Vedos taulusta `h1_vaatteet`
--

INSERT INTO `h1_vaatteet` (`tuoteID`, `nimike`, `hinta`, `kategoriaID`, `merkki`, `koko`) VALUES
(1, 'Kipinä', 109.99, 1, 'Reima', 122),
(2, 'Talvipipo', 29.99, 2, 'Peuhu', 5);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `h1_asiakkaat`
--
ALTER TABLE `h1_asiakkaat`
  ADD PRIMARY KEY (`asiakasID`);

--
-- Indexes for table `h1_kategoriat`
--
ALTER TABLE `h1_kategoriat`
  ADD PRIMARY KEY (`kategoriaID`);

--
-- Indexes for table `h1_tilauksen tuotteet`
--
ALTER TABLE `h1_tilauksen tuotteet`
  ADD PRIMARY KEY (`ttID`),
  ADD KEY `tuoteID` (`tuoteID`),
  ADD KEY `tiluausID` (`tiluausID`);

--
-- Indexes for table `h1_tilaukset`
--
ALTER TABLE `h1_tilaukset`
  ADD PRIMARY KEY (`tilausID`),
  ADD KEY `asiakasID` (`asiakasID`);

--
-- Indexes for table `h1_vaatteet`
--
ALTER TABLE `h1_vaatteet`
  ADD PRIMARY KEY (`tuoteID`),
  ADD KEY `kategoriaID` (`kategoriaID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `h1_asiakkaat`
--
ALTER TABLE `h1_asiakkaat`
  MODIFY `asiakasID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `h1_kategoriat`
--
ALTER TABLE `h1_kategoriat`
  MODIFY `kategoriaID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `h1_tilauksen tuotteet`
--
ALTER TABLE `h1_tilauksen tuotteet`
  MODIFY `ttID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `h1_tilaukset`
--
ALTER TABLE `h1_tilaukset`
  MODIFY `tilausID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `h1_vaatteet`
--
ALTER TABLE `h1_vaatteet`
  MODIFY `tuoteID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Rajoitteet vedostauluille
--

--
-- Rajoitteet taululle `h1_tilauksen tuotteet`
--
ALTER TABLE `h1_tilauksen tuotteet`
  ADD CONSTRAINT `h1_tilauksen tuotteet_ibfk_1` FOREIGN KEY (`tiluausID`) REFERENCES `h1_tilaukset` (`tilausID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `h1_tilauksen tuotteet_ibfk_2` FOREIGN KEY (`tuoteID`) REFERENCES `h1_vaatteet` (`tuoteID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Rajoitteet taululle `h1_tilaukset`
--
ALTER TABLE `h1_tilaukset`
  ADD CONSTRAINT `h1_tilaukset_ibfk_1` FOREIGN KEY (`asiakasID`) REFERENCES `h1_asiakkaat` (`asiakasID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Rajoitteet taululle `h1_vaatteet`
--
ALTER TABLE `h1_vaatteet`
  ADD CONSTRAINT `h1_vaatteet_ibfk_1` FOREIGN KEY (`kategoriaID`) REFERENCES `h1_kategoriat` (`kategoriaID`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
