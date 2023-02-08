-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 08, 2023 at 05:06 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `projetDBediteur`
--

-- --------------------------------------------------------

--
-- Table structure for table `auteur`
--

CREATE TABLE `auteur` (
  `auid` int(10) NOT NULL,
  `nom` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auteur`
--

INSERT INTO `auteur` (`auid`, `nom`) VALUES
(1, 'Victor Hugo'),
(2, 'Michel Montblanc'),
(3, 'Dan Simmons'),
(4, 'Jean Dorbien'),
(5, 'Alphonse Daudet');

-- --------------------------------------------------------

--
-- Table structure for table `editeur`
--

CREATE TABLE `editeur` (
  `edid` int(10) NOT NULL,
  `nom` varchar(60) DEFAULT NULL,
  `adresse` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `editeur`
--

INSERT INTO `editeur` (`edid`, `nom`, `adresse`) VALUES
(1, 'Campus Presse', '10 rue de la paix, 75015 Paris'),
(2, 'Flammarion', '12 avenue des Champs Elysées, 75010 Paris'),
(3, 'Larousse', '20 rue du peuple Belge, 59000 Lille'),
(4, 'Plein Air', '120 rue du Ciel,  666666 Paradis');

-- --------------------------------------------------------

--
-- Table structure for table `Livres`
--

CREATE TABLE `Livres` (
  `isbn` int(10) NOT NULL,
  `titre` varchar(60) NOT NULL,
  `prix` decimal(10,0) NOT NULL,
  `edid` int(10) NOT NULL,
  `date_edition` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Livres`
--

INSERT INTO `Livres` (`isbn`, `titre`, `prix`, `edid`, `date_edition`) VALUES
(100, 'Journal Interne', '3', 3, '2016-04-03'),
(214, 'La Chute d\'Hypérion', '7', 1, '2016-01-03'),
(215, 'Hypérion', '7', 1, '2016-02-01'),
(547, 'Notre Dame de Paris', '7', 2, '2016-04-04'),
(548, 'Les Misérables', '7', 2, '2016-02-11'),
(744, 'JAvascript 1.3', '55', 1, '2016-03-02'),
(855, 'Journal Interne', '44', 3, '2016-05-05'),
(856, 'Journal Interne', '43', 3, '2016-05-04');

-- --------------------------------------------------------

--
-- Table structure for table `Livre_auteurs`
--

CREATE TABLE `Livre_auteurs` (
  `isbn` int(10) DEFAULT NULL,
  `auid` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Livre_auteurs`
--

INSERT INTO `Livre_auteurs` (`isbn`, `auid`) VALUES
(744, 2),
(744, 4),
(547, 1),
(548, 1),
(214, 3),
(215, 3);

-- --------------------------------------------------------

--
-- Table structure for table `stock`
--

CREATE TABLE `stock` (
  `id` int(10) NOT NULL,
  `isbn` int(10) DEFAULT NULL,
  `id_librarie` int(10) DEFAULT NULL,
  `nb_exemplaire` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `stock`
--

INSERT INTO `stock` (`id`, `isbn`, `id_librarie`, `nb_exemplaire`) VALUES
(3, 214, 1, 1400),
(4, 214, 2, 1879),
(5, 215, 1, 1366),
(6, 215, 2, 714),
(7, 547, 1, 295),
(8, 547, 2, 1340),
(9, 548, 1, 1441),
(10, 548, 2, 1700),
(11, 744, 1, 900),
(12, 744, 2, 300),
(13, 855, 1, 1700),
(14, 855, 2, 1600);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auteur`
--
ALTER TABLE `auteur`
  ADD PRIMARY KEY (`auid`);

--
-- Indexes for table `editeur`
--
ALTER TABLE `editeur`
  ADD PRIMARY KEY (`edid`);

--
-- Indexes for table `Livres`
--
ALTER TABLE `Livres`
  ADD PRIMARY KEY (`isbn`),
  ADD KEY `fk_edid` (`edid`);

--
-- Indexes for table `Livre_auteurs`
--
ALTER TABLE `Livre_auteurs`
  ADD KEY `FK_auid` (`auid`),
  ADD KEY `FK_isbnn` (`isbn`);

--
-- Indexes for table `stock`
--
ALTER TABLE `stock`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_isbn` (`isbn`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auteur`
--
ALTER TABLE `auteur`
  MODIFY `auid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `editeur`
--
ALTER TABLE `editeur`
  MODIFY `edid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `stock`
--
ALTER TABLE `stock`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Livres`
--
ALTER TABLE `Livres`
  ADD CONSTRAINT `fk_edid` FOREIGN KEY (`edid`) REFERENCES `editeur` (`edid`);

--
-- Constraints for table `Livre_auteurs`
--
ALTER TABLE `Livre_auteurs`
  ADD CONSTRAINT `FK_auid` FOREIGN KEY (`auid`) REFERENCES `auteur` (`auid`),
  ADD CONSTRAINT `FK_isbnn` FOREIGN KEY (`isbn`) REFERENCES `Livres` (`isbn`);

--
-- Constraints for table `stock`
--
ALTER TABLE `stock`
  ADD CONSTRAINT `FK_isbn` FOREIGN KEY (`isbn`) REFERENCES `Livres` (`isbn`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
