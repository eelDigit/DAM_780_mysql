-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mer. 08 fév. 2023 à 17:30
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
-- Base de données : `dam_projetlivre_marvin`
--

-- --------------------------------------------------------

--
-- Structure de la table `auteurs`
--

CREATE TABLE `auteurs` (
  `auid` int(11) NOT NULL,
  `nom` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `auteurs`
--

INSERT INTO `auteurs` (`auid`, `nom`) VALUES
(1, 'Victor HUGO'),
(2, 'Michel MONTBLANC'),
(3, 'Dan SIMMONS'),
(4, 'Jean DORBIEN'),
(5, 'Alphonse DAUDET');

-- --------------------------------------------------------

--
-- Structure de la table `editeurs`
--

CREATE TABLE `editeurs` (
  `edid` int(11) NOT NULL,
  `nom` varchar(40) DEFAULT NULL,
  `addresse` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `editeurs`
--

INSERT INTO `editeurs` (`edid`, `nom`, `addresse`) VALUES
(1, 'Campus Presse', '10, rue de la paix, 75015 Paris'),
(2, 'Flammarion', '12, avenue des Champs Elysés, 75010 Paris'),
(3, 'Larrousse', '20, rue du Peuple Belge, 59000 LILLE'),
(4, 'Plain Air', '20, rue du Ciel , 666666 Paradis');

-- --------------------------------------------------------

--
-- Structure de la table `livres`
--

CREATE TABLE `livres` (
  `isbn` int(40) NOT NULL,
  `titre` varchar(255) DEFAULT NULL,
  `prix` int(11) DEFAULT NULL,
  `date_edition` varchar(255) DEFAULT NULL,
  `edid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `livres`
--

INSERT INTO `livres` (`isbn`, `titre`, `prix`, `date_edition`, `edid`) VALUES
(0, 'Journal Interne', 3, '2016-04-03', 0),
(214, 'La chute Hypérion', 7, '2016-01-03', 0),
(215, 'Hypérion', 7, '2016-02-01', 0),
(547, 'Notre dame de Paris', 7, '2016-04-04', 0),
(548, 'Les misérables', 7, '2016-02-11', 0),
(744, 'JavaScript 1.3', 55, '2016-03-02', 0),
(855, 'Dictionnaire', 44, '2016-05-05', 0),
(856, 'Les noms propres', 43, '2016-05-04', 0);

-- --------------------------------------------------------

--
-- Structure de la table `livres_auteurs`
--

CREATE TABLE `livres_auteurs` (
  `auid` int(11) NOT NULL,
  `isbn` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `stock`
--

CREATE TABLE `stock` (
  `id` int(11) NOT NULL,
  `id_librairie` int(11) DEFAULT NULL,
  `nbre_exemplaire` int(11) DEFAULT NULL,
  `isbn` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `stock`
--

INSERT INTO `stock` (`id`, `id_librairie`, `nbre_exemplaire`, `isbn`) VALUES
(1, 1, 1500, 0),
(2, 2, 2000, 0),
(3, 1, 1400, 0),
(4, 2, 1879, 0),
(5, 1, 1366, 0),
(6, 2, 714, 0),
(7, 1, 295, 0),
(8, 2, 1340, 0),
(9, 1, 1441, 0),
(10, 2, 1700, 0),
(11, 1, 900, 0),
(12, 2, 300, 0),
(13, 1, 1700, 0),
(14, 2, 1600, 0);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `auteurs`
--
ALTER TABLE `auteurs`
  ADD PRIMARY KEY (`auid`);

--
-- Index pour la table `editeurs`
--
ALTER TABLE `editeurs`
  ADD PRIMARY KEY (`edid`),
  ADD KEY `edid` (`edid`);

--
-- Index pour la table `livres`
--
ALTER TABLE `livres`
  ADD PRIMARY KEY (`isbn`),
  ADD KEY `edid` (`edid`);

--
-- Index pour la table `livres_auteurs`
--
ALTER TABLE `livres_auteurs`
  ADD KEY `auid` (`auid`),
  ADD KEY `isbn` (`isbn`);

--
-- Index pour la table `stock`
--
ALTER TABLE `stock`
  ADD PRIMARY KEY (`id`),
  ADD KEY `isbn` (`isbn`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `auteurs`
--
ALTER TABLE `auteurs`
  MODIFY `auid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `editeurs`
--
ALTER TABLE `editeurs`
  MODIFY `edid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `stock`
--
ALTER TABLE `stock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `livres_auteurs`
--
ALTER TABLE `livres_auteurs`
  ADD CONSTRAINT `FK_auteurs_livres_Livresauteurs` FOREIGN KEY (`isbn`) REFERENCES `livres` (`isbn`),
  ADD CONSTRAINT `FK_livres_auteurs_livresauteurs` FOREIGN KEY (`auid`) REFERENCES `auteurs` (`auid`);

--
-- Contraintes pour la table `stock`
--
ALTER TABLE `stock`
  ADD CONSTRAINT `FK_livres_stock` FOREIGN KEY (`isbn`) REFERENCES `livres` (`isbn`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
