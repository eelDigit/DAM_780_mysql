-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mer. 08 fév. 2023 à 16:45
-- Version du serveur : 10.4.21-MariaDB
-- Version de PHP : 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `livre`
--

-- --------------------------------------------------------

--
-- Structure de la table `isbn`
--

CREATE TABLE `isbn` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_librairie` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `isbn`
--

INSERT INTO `isbn` (`id`, `id_user`, `id_librairie`) VALUES
(1, 0, '2');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `isbn`
--
ALTER TABLE `isbn`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_isbn` (`id_user`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `isbn`
--
ALTER TABLE `isbn`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `isbn`
--
ALTER TABLE `isbn`
  ADD CONSTRAINT `fk_isbn` FOREIGN KEY (`id_user`) REFERENCES `livres` (`isbn`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
