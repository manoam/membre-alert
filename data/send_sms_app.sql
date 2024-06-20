-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : jeu. 20 juin 2024 à 16:48
-- Version du serveur : 10.4.24-MariaDB
-- Version de PHP : 7.4.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `send_sms_app`
--
CREATE DATABASE IF NOT EXISTS `send_sms_app` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `send_sms_app`;

-- --------------------------------------------------------

--
-- Structure de la table `excel_importeds`
--

CREATE TABLE `excel_importeds` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `nom_excel` varchar(255) NOT NULL,
  `message` text DEFAULT NULL,
  `nombre_ligne` int(11) NOT NULL DEFAULT 0,
  `num_ligne_imported` int(11) NOT NULL DEFAULT 0,
  `status` enum('envoyer','erroner','enregistrer','') NOT NULL DEFAULT 'enregistrer',
  `user_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `messageries`
--

CREATE TABLE `messageries` (
  `id` int(11) NOT NULL,
  `type` enum('sent','receve') NOT NULL DEFAULT 'sent',
  `excel_imported_id` int(11) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `destinataire` varchar(20) NOT NULL,
  `status` enum('envoye','non_envoye','en_attente','') DEFAULT 'en_attente',
  `user_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `prenom` varchar(255) DEFAULT NULL,
  `created` date NOT NULL,
  `modified` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `nom`, `prenom`, `created`, `modified`) VALUES
(1, 'manoarazafindrabe@gmail.com', '$2y$10$FEkLoByhIeNtnT1PaH4T/ewwZB0zBfc20oln7.ADCW6a0aeJ1/lNq', 'Manoa', 'Fanantenana', '0000-00-00', '0000-00-00');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `excel_importeds`
--
ALTER TABLE `excel_importeds`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `messageries`
--
ALTER TABLE `messageries`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `excel_importeds`
--
ALTER TABLE `excel_importeds`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `messageries`
--
ALTER TABLE `messageries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
