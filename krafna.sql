-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 04, 2016 at 11:15 PM
-- Server version: 10.1.10-MariaDB
-- PHP Version: 5.6.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `krafna`
--

-- --------------------------------------------------------

--
-- Table structure for table `glumci`
--

CREATE TABLE `glumci` (
  `id` int(11) NOT NULL,
  `id_predstave` int(11) NOT NULL,
  `ime` varchar(50) NOT NULL,
  `prezime` varchar(70) NOT NULL,
  `uloga` varchar(50) NOT NULL,
  `uloga_en` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `glumci`
--

INSERT INTO `glumci` (`id`, `id_predstave`, `ime`, `prezime`, `uloga`, `uloga_en`) VALUES
(1, 1, 'Ana', 'Jelina', 'Glavna', 'Lead'),
(2, 1, 'Tomas', 'Brezek', 'Sporedna', 'Support');

-- --------------------------------------------------------

--
-- Table structure for table `predstave`
--

CREATE TABLE `predstave` (
  `id` int(11) NOT NULL,
  `naziv` varchar(255) DEFAULT NULL,
  `slika` varchar(255) NOT NULL,
  `opis` text NOT NULL,
  `opis_en` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `predstave`
--

INSERT INTO `predstave` (`id`, `naziv`, `slika`, `opis`, `opis_en`) VALUES
(1, 'Romeo i Dalija', 'images/1.jpg', 'basdffgbbsagbpisdgbičasdspodb asuipfbpiadwsgbfaweiba9whefrćšwđepfkwaenmztnke+ogdđasgd', ''),
(2, 'Djevojčica sa upaljačem', '', '', ''),
(3, 'Heidi i Pončo', '', '', ''),
(4, 'Labuđe more', '', '', ''),
(5, 'Roda i ćuk', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `termini_predstava`
--

CREATE TABLE `termini_predstava` (
  `id` int(11) NOT NULL,
  `id_predstave` int(11) DEFAULT NULL,
  `termin` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `termini_predstava`
--

INSERT INTO `termini_predstava` (`id`, `id_predstave`, `termin`) VALUES
(1, 1, 'Subota 19.03. 11H'),
(2, 1, 'Nedjelja 20.03. 12H'),
(3, 2, 'Subota 19.03. 13H'),
(4, 2, 'Nedjelja 20.03. 14H'),
(5, 3, 'Subota 19.03. 15H'),
(6, 3, 'Nedjelja 20.03. 16H'),
(7, 4, 'Subota 19.03. 17H'),
(8, 4, 'Nedjelja 20.03. 18H'),
(9, 5, 'Subota 19.03. 19H'),
(10, 5, 'Nedjelja 20.03. 20H');

-- --------------------------------------------------------

--
-- Table structure for table `ulaznice`
--

CREATE TABLE `ulaznice` (
  `id` int(11) NOT NULL,
  `id_termin` int(11) DEFAULT NULL,
  `broj_ulaznica` int(11) DEFAULT NULL,
  `id_vrsta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ulaznice`
--

INSERT INTO `ulaznice` (`id`, `id_termin`, `broj_ulaznica`, `id_vrsta`) VALUES
(1, 1, 50, NULL),
(2, 1, 30, 2),
(3, 1, 40, 3),
(4, 1, 10, 4),
(5, 2, 50, 1),
(6, 2, 30, 2),
(7, 2, 40, 3),
(8, 2, 10, 4),
(9, 3, 50, 1),
(10, 3, 30, 2),
(11, 3, 40, 3),
(12, 3, 10, 4);

-- --------------------------------------------------------

--
-- Table structure for table `vrste_ulaznice`
--

CREATE TABLE `vrste_ulaznice` (
  `id` int(11) NOT NULL,
  `tip` varchar(45) DEFAULT NULL,
  `cijena` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vrste_ulaznice`
--

INSERT INTO `vrste_ulaznice` (`id`, `tip`, `cijena`) VALUES
(1, 'regularna', '45'),
(2, 'studentska', '25'),
(3, 'umirovljenička', '20'),
(4, 'vip', '70');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `glumci`
--
ALTER TABLE `glumci`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_predstave` (`id_predstave`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `predstave`
--
ALTER TABLE `predstave`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `termini_predstava`
--
ALTER TABLE `termini_predstava`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_termini_predstava_predstave_idx` (`id_predstave`);

--
-- Indexes for table `ulaznice`
--
ALTER TABLE `ulaznice`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_ulaznice_termini_predstava_idx` (`id_termin`),
  ADD KEY `fk_ulaznice_vrste_ulaznice_idx` (`id_vrsta`);

--
-- Indexes for table `vrste_ulaznice`
--
ALTER TABLE `vrste_ulaznice`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `glumci`
--
ALTER TABLE `glumci`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `predstave`
--
ALTER TABLE `predstave`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `termini_predstava`
--
ALTER TABLE `termini_predstava`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `ulaznice`
--
ALTER TABLE `ulaznice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `vrste_ulaznice`
--
ALTER TABLE `vrste_ulaznice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `glumci`
--
ALTER TABLE `glumci`
  ADD CONSTRAINT `fk_glumci_predstave` FOREIGN KEY (`id_predstave`) REFERENCES `predstave` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `termini_predstava`
--
ALTER TABLE `termini_predstava`
  ADD CONSTRAINT `fk_termini_predstava_predstave` FOREIGN KEY (`id_predstave`) REFERENCES `predstave` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ulaznice`
--
ALTER TABLE `ulaznice`
  ADD CONSTRAINT `fk_ulaznice_termini_predstava` FOREIGN KEY (`id_termin`) REFERENCES `termini_predstava` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_ulaznice_vrste_ulaznice` FOREIGN KEY (`id_vrsta`) REFERENCES `vrste_ulaznice` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
