-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mar. 07 fév. 2023 à 11:04
-- Version du serveur : 10.4.27-MariaDB
-- Version de PHP : 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `dam001`
--

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE `client` (
  `codeclient` int(11) NOT NULL,
  `prenomcli` varchar(50) NOT NULL,
  `nomcli` varchar(50) NOT NULL,
  `ruecli` varchar(100) NOT NULL,
  `cpcli` int(11) NOT NULL,
  `villecli` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`codeclient`, `prenomcli`, `nomcli`, `ruecli`, `cpcli`, `villecli`) VALUES
(1, 'Alberto', 'Dubois', '3 rue du pont', 57500, 'Saint avold'),
(2, 'mi', 'volond', '4 rue de la liberté', 57500, 'saint avold'),
(3, 'roger', 'botas', '5 place du marché', 57500, 'saint avold'),
(4, 'edouard', 'nolas', '41 rue d el\'eglise', 57500, 'forbach'),
(5, 'paul', 'lontague', '21 boulevard des oiseux ', 57800, 'Freyming'),
(6, 'THOMAS', 'malon', '12 rue des lapins', 57600, 'Forbach'),
(7, 'renato', 'point', '451 rue de légalité', 57600, 'Forbach'),
(8, 'Michel', 'Botas', '17 rue des hochets', 57500, 'saint anold'),
(9, 'David', 'collague', '14 rue utrillo', 57600, 'Forbach'),
(10, 'Simon', 'potillon', '17 rue des marguerites', 57800, 'Freyming');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`codeclient`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `client`
--
ALTER TABLE `client`
  MODIFY `codeclient` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
