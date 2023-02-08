-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mer. 08 fév. 2023 à 16:21
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
-- Base de données : `marysql`
--

-- --------------------------------------------------------

--
-- Structure de la table `auteurs`
--

CREATE TABLE `auteurs` (
  `auid` int(11) NOT NULL,
  `nom` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `auteurs`
--

INSERT INTO `auteurs` (`auid`, `nom`) VALUES
(1, 'Victor Hugo'),
(2, 'Michel MontBlanc'),
(3, 'Dan Simmons'),
(4, 'Jean Dorbien'),
(5, 'Alphonse Daudet');

-- --------------------------------------------------------

--
-- Structure de la table `editeurs`
--

CREATE TABLE `editeurs` (
  `edid` int(11) NOT NULL,
  `nom` varchar(60) NOT NULL,
  `adresse` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `editeurs`
--

INSERT INTO `editeurs` (`edid`, `nom`, `adresse`) VALUES
(1, 'Campus Presse', '10, rue de la Paix, 75015 Paris'),
(2, 'Flammarion', '12, avenue des Champs Elysées, 75010 Paris'),
(3, 'Larousse', '20, rue du Peuple Belge, 59000 Lille'),
(4, 'Plein Air', '20, rue du Ciel, 666666 Paradis');

-- --------------------------------------------------------

--
-- Structure de la table `livres`
--

CREATE TABLE `livres` (
  `isbn` int(11) NOT NULL,
  `titre` varchar(60) NOT NULL,
  `prix` int(11) NOT NULL,
  `edid` int(11) NOT NULL,
  `date_edition` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `livres`
--

INSERT INTO `livres` (`isbn`, `titre`, `prix`, `edid`, `date_edition`) VALUES
(0, 'Journal Interne', 3, 3, '2016-04-03'),
(214, 'La chute d\'Hypérion', 7, 1, '2016-01-03'),
(215, 'Hypérion', 7, 1, '2016-02-01'),
(547, 'Notre dame de Paris', 7, 2, '2016-04-04'),
(548, 'Les misérables', 7, 2, '2016-02-11'),
(744, 'Javascript 1.3', 55, 1, '2016-03-02'),
(855, 'Dictionnaire', 44, 3, '2016-05-05'),
(856, 'Les noms propres', 43, 3, '2016-05-04');

-- --------------------------------------------------------

--
-- Structure de la table `livres_auteurs`
--

CREATE TABLE `livres_auteurs` (
  `auid` int(11) NOT NULL,
  `isbn` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `livres_auteurs`
--

INSERT INTO `livres_auteurs` (`auid`, `isbn`) VALUES
(2, 744),
(4, 744),
(1, 547),
(1, 548),
(3, 214),
(3, 215);

-- --------------------------------------------------------

--
-- Structure de la table `stock`
--

CREATE TABLE `stock` (
  `id` int(11) NOT NULL,
  `isbn` int(11) NOT NULL,
  `id_libraire` int(11) NOT NULL,
  `nbre_exemplaire` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `stock`
--

INSERT INTO `stock` (`id`, `isbn`, `id_libraire`, `nbre_exemplaire`) VALUES
(1, 0, 1, 1500),
(2, 0, 2, 2000),
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
  ADD PRIMARY KEY (`edid`);

--
-- Index pour la table `livres`
--
ALTER TABLE `livres`
  ADD PRIMARY KEY (`isbn`),
  ADD KEY `FK_Editeurs` (`edid`);

--
-- Index pour la table `livres_auteurs`
--
ALTER TABLE `livres_auteurs`
  ADD KEY `FK_Auterus` (`auid`),
  ADD KEY `FK_Livres` (`isbn`);

--
-- Index pour la table `stock`
--
ALTER TABLE `stock`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_Stock` (`isbn`);

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
-- AUTO_INCREMENT pour la table `livres`
--
ALTER TABLE `livres`
  MODIFY `isbn` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=857;

--
-- AUTO_INCREMENT pour la table `stock`
--
ALTER TABLE `stock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `livres`
--
ALTER TABLE `livres`
  ADD CONSTRAINT `FK_Editeurs` FOREIGN KEY (`edid`) REFERENCES `editeurs` (`edid`);

--
-- Contraintes pour la table `livres_auteurs`
--
ALTER TABLE `livres_auteurs`
  ADD CONSTRAINT `FK_Auterus` FOREIGN KEY (`auid`) REFERENCES `auteurs` (`auid`),
  ADD CONSTRAINT `FK_Livres` FOREIGN KEY (`isbn`) REFERENCES `livres` (`isbn`);

--
-- Contraintes pour la table `stock`
--
ALTER TABLE `stock`
  ADD CONSTRAINT `FK_Stock` FOREIGN KEY (`isbn`) REFERENCES `livres` (`isbn`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
