-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : lun. 28 oct. 2024 à 08:21
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

--
-- Déchargement des données de la table `excel_importeds`
--

INSERT INTO `excel_importeds` (`id`, `nom`, `nom_excel`, `message`, `nombre_ligne`, `num_ligne_imported`, `status`, `user_id`, `created`, `modified`) VALUES
(1, 'PREMIER SMS', 'd7bcab2b-e2b9-4f92-a848-56f82e4afc7d.xlsx', 'Antsoina ianao #B mba ho tonga hamonjy fivoriana apitso.', 3, 3, 'envoyer', 1, '2024-04-17 19:30:10', '2024-04-17 19:30:21'),
(2, 'RENVOI SMS', 'f0b7335e-fa70-4cd4-b657-aa89b41643c4.xlsx', '#B Renvoi sms', 3, 0, 'envoyer', 1, '2024-04-17 19:42:17', '2024-04-17 19:42:22'),
(3, 'RENVOI SMS 2', '99041a59-94ce-43fb-a458-16bbeb3e820f.xlsx', '#B Renvoi sms', 3, 2, 'enregistrer', 1, '2024-04-17 19:43:50', '2024-04-17 19:45:09'),
(4, 'RENVOI PAR MANOA', '05b78d39-1ecd-4206-a285-76cd7921fce0.xlsx', 'TEST MESSAGE CHERIE A', 3, 3, 'envoyer', 1, '2024-04-17 19:47:35', '2024-04-17 19:47:41'),
(5, 'TEST CECAM', 'd21d652d-edef-4255-a117-0db39ad70153.xlsx', 'Ilazana ianao #B #C mba ho tonga aty amin\'ny cecam #D', 7, 7, 'envoyer', 1, '2024-04-18 11:32:40', '2024-04-18 11:33:10'),
(6, 'TEST 2 CECAM', 'd7827358-a145-4afd-bb1d-10366709bb27.xlsx', 'Antsoina ianao #B #C ho tonga aty amin\'ny cecam #D. Fa misy vola mbola tsy voahefanao.', 10, 10, 'envoyer', 1, '2024-04-18 11:37:44', '2024-04-18 11:38:10'),
(7, 'FIANTSOANA FIVORIAM-BENTSAPANA CECAM ANTSAMPANDRANO', '086d77d2-ce1c-4093-9839-1efe2e254f43.xlsx', 'Antsoina ianao #C mpikambana N #B ao @CECAM Antsampandrano,mba ho tonga hamonjy ny fivoriam-be izay atao ny TALATA 23 APRILY @ 8ora ao @ KATOLIKA MAHEREZA.Mety hisy fiatraikany @ findramam-bola manaraka ny tsy fahatongavanao.Ento ny karine.MIFAMPILAZA', 125, 125, 'envoyer', 1, '2024-04-20 17:23:08', '2024-04-20 17:38:43');

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
  `status` enum('envoye','non_envoye','en_attente','lu','non_lu') DEFAULT 'en_attente',
  `user_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `messageries`
--

INSERT INTO `messageries` (`id`, `type`, `excel_imported_id`, `message`, `destinataire`, `status`, `user_id`, `created`, `modified`) VALUES
(1, 'receve', 1, 'Antsoina ianao RAZAFINDRABE Manoa mba ho tonga hamonjy fivoriana apitso.', '0341790628', 'lu', 1, '2024-04-17 19:30:17', '2024-04-17 19:30:17'),
(2, 'sent', 1, 'Antsoina ianao TAHINANIAINA Lalasoa  mba ho tonga hamonjy fivoriana apitso.', '0340570530', 'non_envoye', 1, '2024-04-17 19:30:19', '2024-04-17 19:30:19'),
(3, 'sent', 3, 'RAZAFINDRABE Manoa Renvoi sms', '0341790628', 'envoye', 1, '2024-04-17 19:43:53', '2024-04-17 19:43:53'),
(4, 'sent', 3, 'RAZAFINDRABE Manoa Renvoi sms', '0341790628', 'envoye', 1, '2024-04-17 19:45:09', '2024-04-17 19:45:09'),
(5, 'sent', 4, 'TEST MESSAGE CHERIE A', '0341790628', 'envoye', 1, '2024-04-17 19:47:38', '2024-04-17 19:47:38'),
(6, 'sent', 4, 'TEST MESSAGE CHERIE A', '0340570530', 'envoye', 1, '2024-04-17 19:47:39', '2024-04-17 19:47:39'),
(7, 'sent', 5, 'Ilazana ianao 889 RIVONALA mba ho tonga aty amin\'ny cecam AMBOHIJANAKA', '0340538720', 'envoye', 1, '2024-04-18 11:32:57', '2024-04-18 11:32:57'),
(8, 'sent', 5, 'Ilazana ianao 898 ROBY mba ho tonga aty amin\'ny cecam Amabtolampy', '0340570520', 'envoye', 1, '2024-04-18 11:33:00', '2024-04-18 11:33:00'),
(9, 'sent', 5, 'Ilazana ianao 885 Zo mba ho tonga aty amin\'ny cecam Andohatapenaka', '0340570553', 'envoye', 1, '2024-04-18 11:33:02', '2024-04-18 11:33:02'),
(10, 'sent', 5, 'Ilazana ianao 884 Voahirana mba ho tonga aty amin\'ny cecam Antsirabe', '0340570530', 'envoye', 1, '2024-04-18 11:33:04', '2024-04-18 11:33:04'),
(11, 'sent', 5, 'Ilazana ianao 883 Rita mba ho tonga aty amin\'ny cecam 67Ha', '0343910888', 'envoye', 1, '2024-04-18 11:33:06', '2024-04-18 11:33:06'),
(12, 'sent', 5, 'Ilazana ianao 876 Christian  mba ho tonga aty amin\'ny cecam Andranomanalina', '0341150632', 'envoye', 1, '2024-04-18 11:33:07', '2024-04-18 11:33:07'),
(13, 'sent', 6, 'Antsoina ianao 889 RIVONALA ho tonga aty amin\'ny cecam AMBOHIJANAKA. Fa misy vola mbola tsy voahefanao.', '0340538720', 'envoye', 1, '2024-04-18 11:37:54', '2024-04-18 11:37:54'),
(14, 'sent', 6, 'Antsoina ianao 898 ROBY ho tonga aty amin\'ny cecam Amabtolampy. Fa misy vola mbola tsy voahefanao.', '0340570520', 'envoye', 1, '2024-04-18 11:37:56', '2024-04-18 11:37:56'),
(15, 'sent', 6, 'Antsoina ianao 885 Zo ho tonga aty amin\'ny cecam Andohatapenaka. Fa misy vola mbola tsy voahefanao.', '0340570553', 'envoye', 1, '2024-04-18 11:37:58', '2024-04-18 11:37:58'),
(16, 'sent', 6, 'Antsoina ianao 884 Voahirana ho tonga aty amin\'ny cecam Antsirabe. Fa misy vola mbola tsy voahefanao.', '0340570530', 'envoye', 1, '2024-04-18 11:37:59', '2024-04-18 11:37:59'),
(17, 'sent', 6, 'Antsoina ianao 883 Rita ho tonga aty amin\'ny cecam 67Ha. Fa misy vola mbola tsy voahefanao.', '0343910888', 'envoye', 1, '2024-04-18 11:38:01', '2024-04-18 11:38:01'),
(18, 'sent', 6, 'Antsoina ianao 876 Christian  ho tonga aty amin\'ny cecam Andranomanalina. Fa misy vola mbola tsy voahefanao.', '0341150632', 'envoye', 1, '2024-04-18 11:38:02', '2024-04-18 11:38:02'),
(19, 'sent', 6, 'Antsoina ianao 903 Eric ho tonga aty amin\'ny cecam Paris. Fa misy vola mbola tsy voahefanao.', '0340570506', 'envoye', 1, '2024-04-18 11:38:04', '2024-04-18 11:38:04'),
(20, 'sent', 6, 'Antsoina ianao 889 RIVONALA ho tonga aty amin\'ny cecam AMBOHIJANAKA. Fa misy vola mbola tsy voahefanao.', '0340538720', 'envoye', 1, '2024-04-18 11:38:06', '2024-04-18 11:38:06'),
(21, 'sent', 6, 'Antsoina ianao 898 ROBY ho tonga aty amin\'ny cecam Amabtolampy. Fa misy vola mbola tsy voahefanao.', '0340570520', 'envoye', 1, '2024-04-18 11:38:08', '2024-04-18 11:38:08'),
(22, 'sent', 7, 'Antsoina ianao RANDRIAMAHEFA mpikambana N 871 ao @CECAM Antsampandrano,mba ho tonga hamonjy ny fivoriam-be izay atao ny TALATA 23 APRILY @ 8ora ao @ KATOLIKA MAHEREZA.Mety hisy fiatraikany @ findramam-bola manaraka ny tsy fahatongavanao.Ento ny karine.MIFAMPILAZA', '0346067629', 'envoye', 1, '2024-04-20 17:23:21', '2024-04-20 17:23:21'),
(23, 'sent', 7, 'Antsoina ianao Ra-Gervais mpikambana N 872 ao @CECAM Antsampandrano,mba ho tonga hamonjy ny fivoriam-be izay atao ny TALATA 23 APRILY @ 8ora ao @ KATOLIKA MAHEREZA.Mety hisy fiatraikany @ findramam-bola manaraka ny tsy fahatongavanao.Ento ny karine.MIFAMPILAZA', '0345932845', 'envoye', 1, '2024-04-20 17:23:22', '2024-04-20 17:23:22'),
(24, 'sent', 7, 'Antsoina ianao RAZAFINDRAMANGA Berthine mpikambana N 873 ao @CECAM Antsampandrano,mba ho tonga hamonjy ny fivoriam-be izay atao ny TALATA 23 APRILY @ 8ora ao @ KATOLIKA MAHEREZA.Mety hisy fiatraikany @ findramam-bola manaraka ny tsy fahatongavanao.Ento ny karine.MIFAMPILAZA', '0344937561', 'envoye', 1, '2024-04-20 17:23:23', '2024-04-20 17:23:23'),
(25, 'sent', 7, 'Antsoina ianao RAZAFINDRAMANGA Berthine mpikambana N 873 ao @CECAM Antsampandrano,mba ho tonga hamonjy ny fivoriam-be izay atao ny TALATA 23 APRILY @ 8ora ao @ KATOLIKA MAHEREZA.Mety hisy fiatraikany @ findramam-bola manaraka ny tsy fahatongavanao.Ento ny karine.MIFAMPILAZA', '0337509758', 'envoye', 1, '2024-04-20 17:23:23', '2024-04-20 17:23:23'),
(26, 'sent', 7, 'Antsoina ianao RANDRIANANTENAINA Jean Fidèle mpikambana N 874 ao @CECAM Antsampandrano,mba ho tonga hamonjy ny fivoriam-be izay atao ny TALATA 23 APRILY @ 8ora ao @ KATOLIKA MAHEREZA.Mety hisy fiatraikany @ findramam-bola manaraka ny tsy fahatongavanao.Ento ny karine.MIFAMPILAZA', '0338203651', 'envoye', 1, '2024-04-20 17:23:29', '2024-04-20 17:23:29'),
(27, 'sent', 7, 'Antsoina ianao RAFALIMANANA Maurice mpikambana N 875 ao @CECAM Antsampandrano,mba ho tonga hamonjy ny fivoriam-be izay atao ny TALATA 23 APRILY @ 8ora ao @ KATOLIKA MAHEREZA.Mety hisy fiatraikany @ findramam-bola manaraka ny tsy fahatongavanao.Ento ny karine.MIFAMPILAZA', '0347435946', 'envoye', 1, '2024-04-20 17:23:30', '2024-04-20 17:23:30'),
(28, 'sent', 7, 'Antsoina ianao RAFALIMANANA Maurice mpikambana N 875 ao @CECAM Antsampandrano,mba ho tonga hamonjy ny fivoriam-be izay atao ny TALATA 23 APRILY @ 8ora ao @ KATOLIKA MAHEREZA.Mety hisy fiatraikany @ findramam-bola manaraka ny tsy fahatongavanao.Ento ny karine.MIFAMPILAZA', '0349607818', 'envoye', 1, '2024-04-20 17:23:31', '2024-04-20 17:23:31'),
(29, 'sent', 7, 'Antsoina ianao RANORINA mpikambana N 876 ao @CECAM Antsampandrano,mba ho tonga hamonjy ny fivoriam-be izay atao ny TALATA 23 APRILY @ 8ora ao @ KATOLIKA MAHEREZA.Mety hisy fiatraikany @ findramam-bola manaraka ny tsy fahatongavanao.Ento ny karine.MIFAMPILAZA', '0342119469', 'envoye', 1, '2024-04-20 17:23:37', '2024-04-20 17:23:37'),
(30, 'sent', 7, 'Antsoina ianao RAMANDIMBISOA Bernard mpikambana N 878 ao @CECAM Antsampandrano,mba ho tonga hamonjy ny fivoriam-be izay atao ny TALATA 23 APRILY @ 8ora ao @ KATOLIKA MAHEREZA.Mety hisy fiatraikany @ findramam-bola manaraka ny tsy fahatongavanao.Ento ny karine.MIFAMPILAZA', '0343142539', 'envoye', 1, '2024-04-20 17:23:39', '2024-04-20 17:23:39'),
(31, 'sent', 7, 'Antsoina ianao RANDRIAMADY mpikambana N 879 ao @CECAM Antsampandrano,mba ho tonga hamonjy ny fivoriam-be izay atao ny TALATA 23 APRILY @ 8ora ao @ KATOLIKA MAHEREZA.Mety hisy fiatraikany @ findramam-bola manaraka ny tsy fahatongavanao.Ento ny karine.MIFAMPILAZA', '0345740901', 'envoye', 1, '2024-04-20 17:23:54', '2024-04-20 17:23:54'),
(32, 'sent', 7, 'Antsoina ianao RANDRIAMADY mpikambana N 879 ao @CECAM Antsampandrano,mba ho tonga hamonjy ny fivoriam-be izay atao ny TALATA 23 APRILY @ 8ora ao @ KATOLIKA MAHEREZA.Mety hisy fiatraikany @ findramam-bola manaraka ny tsy fahatongavanao.Ento ny karine.MIFAMPILAZA', '0347860902', 'envoye', 1, '2024-04-20 17:24:03', '2024-04-20 17:24:03'),
(33, 'sent', 7, 'Antsoina ianao RA Jean Claude mpikambana N 880 ao @CECAM Antsampandrano,mba ho tonga hamonjy ny fivoriam-be izay atao ny TALATA 23 APRILY @ 8ora ao @ KATOLIKA MAHEREZA.Mety hisy fiatraikany @ findramam-bola manaraka ny tsy fahatongavanao.Ento ny karine.MIFAMPILAZA', '0343315604', 'envoye', 1, '2024-04-20 17:24:09', '2024-04-20 17:24:09'),
(34, 'sent', 7, 'Antsoina ianao RA Jean Claude mpikambana N 880 ao @CECAM Antsampandrano,mba ho tonga hamonjy ny fivoriam-be izay atao ny TALATA 23 APRILY @ 8ora ao @ KATOLIKA MAHEREZA.Mety hisy fiatraikany @ findramam-bola manaraka ny tsy fahatongavanao.Ento ny karine.MIFAMPILAZA', '0338998841', 'envoye', 1, '2024-04-20 17:24:09', '2024-04-20 17:24:09'),
(35, 'sent', 7, 'Antsoina ianao RANDRIANARIMANANA Leonard Jean Bosco mpikambana N 881 ao @CECAM Antsampandrano,mba ho tonga hamonjy ny fivoriam-be izay atao ny TALATA 23 APRILY @ 8ora ao @ KATOLIKA MAHEREZA.Mety hisy fiatraikany @ findramam-bola manaraka ny tsy fahatongavanao.Ento ny karine.MIFAMPILAZA', '0386322386', 'envoye', 1, '2024-04-20 17:24:11', '2024-04-20 17:24:11'),
(36, 'sent', 7, 'Antsoina ianao RAKOTOZAFY mpikambana N 882 ao @CECAM Antsampandrano,mba ho tonga hamonjy ny fivoriam-be izay atao ny TALATA 23 APRILY @ 8ora ao @ KATOLIKA MAHEREZA.Mety hisy fiatraikany @ findramam-bola manaraka ny tsy fahatongavanao.Ento ny karine.MIFAMPILAZA', '0341712940', 'envoye', 1, '2024-04-20 17:24:19', '2024-04-20 17:24:19'),
(37, 'sent', 7, 'Antsoina ianao RAKOTOZAFY mpikambana N 882 ao @CECAM Antsampandrano,mba ho tonga hamonjy ny fivoriam-be izay atao ny TALATA 23 APRILY @ 8ora ao @ KATOLIKA MAHEREZA.Mety hisy fiatraikany @ findramam-bola manaraka ny tsy fahatongavanao.Ento ny karine.MIFAMPILAZA', '0332117994', 'envoye', 1, '2024-04-20 17:24:34', '2024-04-20 17:24:34'),
(38, 'sent', 7, 'Antsoina ianao RANDRIANANTENAINA Livasoa mpikambana N 883 ao @CECAM Antsampandrano,mba ho tonga hamonjy ny fivoriam-be izay atao ny TALATA 23 APRILY @ 8ora ao @ KATOLIKA MAHEREZA.Mety hisy fiatraikany @ findramam-bola manaraka ny tsy fahatongavanao.Ento ny karine.MIFAMPILAZA', '0387205253', 'envoye', 1, '2024-04-20 17:24:50', '2024-04-20 17:24:50'),
(39, 'sent', 7, 'Antsoina ianao RAMIANDRISOA mpikambana N 885 ao @CECAM Antsampandrano,mba ho tonga hamonjy ny fivoriam-be izay atao ny TALATA 23 APRILY @ 8ora ao @ KATOLIKA MAHEREZA.Mety hisy fiatraikany @ findramam-bola manaraka ny tsy fahatongavanao.Ento ny karine.MIFAMPILAZA', '0341462151', 'envoye', 1, '2024-04-20 17:24:58', '2024-04-20 17:24:58'),
(40, 'sent', 7, 'Antsoina ianao RAMIANDRISOA mpikambana N 885 ao @CECAM Antsampandrano,mba ho tonga hamonjy ny fivoriam-be izay atao ny TALATA 23 APRILY @ 8ora ao @ KATOLIKA MAHEREZA.Mety hisy fiatraikany @ findramam-bola manaraka ny tsy fahatongavanao.Ento ny karine.MIFAMPILAZA', '0389879278', 'envoye', 1, '2024-04-20 17:25:05', '2024-04-20 17:25:05'),
(41, 'sent', 7, 'Antsoina ianao RAMAROKOTO mpikambana N 886 ao @CECAM Antsampandrano,mba ho tonga hamonjy ny fivoriam-be izay atao ny TALATA 23 APRILY @ 8ora ao @ KATOLIKA MAHEREZA.Mety hisy fiatraikany @ findramam-bola manaraka ny tsy fahatongavanao.Ento ny karine.MIFAMPILAZA', '0339286410', 'non_envoye', 1, '2024-04-20 17:25:11', '2024-04-20 17:25:11'),
(42, 'sent', 7, 'Antsoina ianao RAKOTOMANDIMBY mpikambana N 887 ao @CECAM Antsampandrano,mba ho tonga hamonjy ny fivoriam-be izay atao ny TALATA 23 APRILY @ 8ora ao @ KATOLIKA MAHEREZA.Mety hisy fiatraikany @ findramam-bola manaraka ny tsy fahatongavanao.Ento ny karine.MIFAMPILAZA', '0341432131', 'envoye', 1, '2024-04-20 17:25:12', '2024-04-20 17:25:12'),
(43, 'sent', 7, 'Antsoina ianao RANDRIANANTENAINA mpikambana N 889 ao @CECAM Antsampandrano,mba ho tonga hamonjy ny fivoriam-be izay atao ny TALATA 23 APRILY @ 8ora ao @ KATOLIKA MAHEREZA.Mety hisy fiatraikany @ findramam-bola manaraka ny tsy fahatongavanao.Ento ny karine.MIFAMPILAZA', '0334163893', 'envoye', 1, '2024-04-20 17:25:14', '2024-04-20 17:25:14'),
(44, 'sent', 7, 'Antsoina ianao RANDRIANANTENAINA mpikambana N 889 ao @CECAM Antsampandrano,mba ho tonga hamonjy ny fivoriam-be izay atao ny TALATA 23 APRILY @ 8ora ao @ KATOLIKA MAHEREZA.Mety hisy fiatraikany @ findramam-bola manaraka ny tsy fahatongavanao.Ento ny karine.MIFAMPILAZA', '0330243095', 'envoye', 1, '2024-04-20 17:25:23', '2024-04-20 17:25:23'),
(45, 'sent', 7, 'Antsoina ianao RAZAFINDRAHANTA Lovasoa mpikambana N 890 ao @CECAM Antsampandrano,mba ho tonga hamonjy ny fivoriam-be izay atao ny TALATA 23 APRILY @ 8ora ao @ KATOLIKA MAHEREZA.Mety hisy fiatraikany @ findramam-bola manaraka ny tsy fahatongavanao.Ento ny karine.MIFAMPILAZA', '0388257140', 'envoye', 1, '2024-04-20 17:25:29', '2024-04-20 17:25:29'),
(46, 'sent', 7, 'Antsoina ianao RANDRIANARISOA Chrysant mpikambana N 891 ao @CECAM Antsampandrano,mba ho tonga hamonjy ny fivoriam-be izay atao ny TALATA 23 APRILY @ 8ora ao @ KATOLIKA MAHEREZA.Mety hisy fiatraikany @ findramam-bola manaraka ny tsy fahatongavanao.Ento ny karine.MIFAMPILAZA', '0342793289', 'envoye', 1, '2024-04-20 17:25:31', '2024-04-20 17:25:31'),
(47, 'sent', 7, 'Antsoina ianao LALAOARISOA Marie mpikambana N 892 ao @CECAM Antsampandrano,mba ho tonga hamonjy ny fivoriam-be izay atao ny TALATA 23 APRILY @ 8ora ao @ KATOLIKA MAHEREZA.Mety hisy fiatraikany @ findramam-bola manaraka ny tsy fahatongavanao.Ento ny karine.MIFAMPILAZA', '0382864567', 'envoye', 1, '2024-04-20 17:25:39', '2024-04-20 17:25:39'),
(48, 'sent', 7, 'Antsoina ianao NAMBININTSOA Honore  mpikambana N 894 ao @CECAM Antsampandrano,mba ho tonga hamonjy ny fivoriam-be izay atao ny TALATA 23 APRILY @ 8ora ao @ KATOLIKA MAHEREZA.Mety hisy fiatraikany @ findramam-bola manaraka ny tsy fahatongavanao.Ento ny karine.MIFAMPILAZA', '0381071210', 'envoye', 1, '2024-04-20 17:25:48', '2024-04-20 17:25:48'),
(49, 'sent', 7, 'Antsoina ianao RAHARIMALANTO Solo mpikambana N 896 ao @CECAM Antsampandrano,mba ho tonga hamonjy ny fivoriam-be izay atao ny TALATA 23 APRILY @ 8ora ao @ KATOLIKA MAHEREZA.Mety hisy fiatraikany @ findramam-bola manaraka ny tsy fahatongavanao.Ento ny karine.MIFAMPILAZA', '0336727798', 'envoye', 1, '2024-04-20 17:25:56', '2024-04-20 17:25:56'),
(50, 'sent', 7, 'Antsoina ianao LIVARISOA  mpikambana N 897 ao @CECAM Antsampandrano,mba ho tonga hamonjy ny fivoriam-be izay atao ny TALATA 23 APRILY @ 8ora ao @ KATOLIKA MAHEREZA.Mety hisy fiatraikany @ findramam-bola manaraka ny tsy fahatongavanao.Ento ny karine.MIFAMPILAZA', '0382702829', 'envoye', 1, '2024-04-20 17:26:05', '2024-04-20 17:26:05'),
(51, 'sent', 7, 'Antsoina ianao LIVARISOA  mpikambana N 897 ao @CECAM Antsampandrano,mba ho tonga hamonjy ny fivoriam-be izay atao ny TALATA 23 APRILY @ 8ora ao @ KATOLIKA MAHEREZA.Mety hisy fiatraikany @ findramam-bola manaraka ny tsy fahatongavanao.Ento ny karine.MIFAMPILAZA', '0339173280', 'envoye', 1, '2024-04-20 17:26:13', '2024-04-20 17:26:13'),
(52, 'sent', 7, 'Antsoina ianao RAKOTONINDRIANA Gilbert mpikambana N 214 ao @CECAM Antsampandrano,mba ho tonga hamonjy ny fivoriam-be izay atao ny TALATA 23 APRILY @ 8ora ao @ KATOLIKA MAHEREZA.Mety hisy fiatraikany @ findramam-bola manaraka ny tsy fahatongavanao.Ento ny karine.MIFAMPILAZA', '0332018235', 'envoye', 1, '2024-04-20 17:26:22', '2024-04-20 17:26:22'),
(53, 'sent', 7, 'Antsoina ianao RANDRIANJATOVO  mpikambana N 825 ao @CECAM Antsampandrano,mba ho tonga hamonjy ny fivoriam-be izay atao ny TALATA 23 APRILY @ 8ora ao @ KATOLIKA MAHEREZA.Mety hisy fiatraikany @ findramam-bola manaraka ny tsy fahatongavanao.Ento ny karine.MIFAMPILAZA', '0341475403', 'envoye', 1, '2024-04-20 17:26:31', '2024-04-20 17:26:31'),
(54, 'sent', 7, 'Antsoina ianao LALAHARINAIVO Andriambinitsoa mpikambana N 840 ao @CECAM Antsampandrano,mba ho tonga hamonjy ny fivoriam-be izay atao ny TALATA 23 APRILY @ 8ora ao @ KATOLIKA MAHEREZA.Mety hisy fiatraikany @ findramam-bola manaraka ny tsy fahatongavanao.Ento ny karine.MIFAMPILAZA', '0344726484', 'envoye', 1, '2024-04-20 17:26:34', '2024-04-20 17:26:34'),
(55, 'sent', 7, 'Antsoina ianao RASOLONIAINA Jean Marie mpikambana N 782 ao @CECAM Antsampandrano,mba ho tonga hamonjy ny fivoriam-be izay atao ny TALATA 23 APRILY @ 8ora ao @ KATOLIKA MAHEREZA.Mety hisy fiatraikany @ findramam-bola manaraka ny tsy fahatongavanao.Ento ny karine.MIFAMPILAZA', '0341949659', 'non_envoye', 1, '2024-04-20 17:26:40', '2024-04-20 17:26:40'),
(56, 'sent', 7, 'Antsoina ianao RASOLONIAINA Jean Marie mpikambana N 782 ao @CECAM Antsampandrano,mba ho tonga hamonjy ny fivoriam-be izay atao ny TALATA 23 APRILY @ 8ora ao @ KATOLIKA MAHEREZA.Mety hisy fiatraikany @ findramam-bola manaraka ny tsy fahatongavanao.Ento ny karine.MIFAMPILAZA', '0383869559', 'envoye', 1, '2024-04-20 17:26:52', '2024-04-20 17:26:52'),
(57, 'sent', 7, 'Antsoina ianao IDEALITSARA Bienvenue Elise mpikambana N 387 ao @CECAM Antsampandrano,mba ho tonga hamonjy ny fivoriam-be izay atao ny TALATA 23 APRILY @ 8ora ao @ KATOLIKA MAHEREZA.Mety hisy fiatraikany @ findramam-bola manaraka ny tsy fahatongavanao.Ento ny karine.MIFAMPILAZA', '0331777039', 'envoye', 1, '2024-04-20 17:27:00', '2024-04-20 17:27:00'),
(58, 'sent', 7, 'Antsoina ianao IDEALITSARA Bienvenue Elise mpikambana N 387 ao @CECAM Antsampandrano,mba ho tonga hamonjy ny fivoriam-be izay atao ny TALATA 23 APRILY @ 8ora ao @ KATOLIKA MAHEREZA.Mety hisy fiatraikany @ findramam-bola manaraka ny tsy fahatongavanao.Ento ny karine.MIFAMPILAZA', '0342389507', 'envoye', 1, '2024-04-20 17:27:01', '2024-04-20 17:27:01'),
(59, 'sent', 7, 'Antsoina ianao RANDRIANARY Roger mpikambana N 717 ao @CECAM Antsampandrano,mba ho tonga hamonjy ny fivoriam-be izay atao ny TALATA 23 APRILY @ 8ora ao @ KATOLIKA MAHEREZA.Mety hisy fiatraikany @ findramam-bola manaraka ny tsy fahatongavanao.Ento ny karine.MIFAMPILAZA', '0344418342', 'non_envoye', 1, '2024-04-20 17:27:07', '2024-04-20 17:27:07'),
(60, 'sent', 7, 'Antsoina ianao RAZAFIMAHATRATRA Michel mpikambana N 520 ao @CECAM Antsampandrano,mba ho tonga hamonjy ny fivoriam-be izay atao ny TALATA 23 APRILY @ 8ora ao @ KATOLIKA MAHEREZA.Mety hisy fiatraikany @ findramam-bola manaraka ny tsy fahatongavanao.Ento ny karine.MIFAMPILAZA', '0341155147', 'envoye', 1, '2024-04-20 17:27:09', '2024-04-20 17:27:09'),
(61, 'sent', 7, 'Antsoina ianao RAJAOHARISON Jean Claude mpikambana N 607 ao @CECAM Antsampandrano,mba ho tonga hamonjy ny fivoriam-be izay atao ny TALATA 23 APRILY @ 8ora ao @ KATOLIKA MAHEREZA.Mety hisy fiatraikany @ findramam-bola manaraka ny tsy fahatongavanao.Ento ny karine.MIFAMPILAZA', '0331356144', 'envoye', 1, '2024-04-20 17:27:11', '2024-04-20 17:27:11'),
(62, 'sent', 7, 'Antsoina ianao RANDRIANATOANDRO  mpikambana N 445 ao @CECAM Antsampandrano,mba ho tonga hamonjy ny fivoriam-be izay atao ny TALATA 23 APRILY @ 8ora ao @ KATOLIKA MAHEREZA.Mety hisy fiatraikany @ findramam-bola manaraka ny tsy fahatongavanao.Ento ny karine.MIFAMPILAZA', '0343426192', 'envoye', 1, '2024-04-20 17:27:20', '2024-04-20 17:27:20'),
(63, 'sent', 7, 'Antsoina ianao RAMENASON Rivomanana mpikambana N 423 ao @CECAM Antsampandrano,mba ho tonga hamonjy ny fivoriam-be izay atao ny TALATA 23 APRILY @ 8ora ao @ KATOLIKA MAHEREZA.Mety hisy fiatraikany @ findramam-bola manaraka ny tsy fahatongavanao.Ento ny karine.MIFAMPILAZA', '0341933758', 'envoye', 1, '2024-04-20 17:27:27', '2024-04-20 17:27:27'),
(64, 'sent', 7, 'Antsoina ianao RANDRIANARIMANANA mpikambana N 293 ao @CECAM Antsampandrano,mba ho tonga hamonjy ny fivoriam-be izay atao ny TALATA 23 APRILY @ 8ora ao @ KATOLIKA MAHEREZA.Mety hisy fiatraikany @ findramam-bola manaraka ny tsy fahatongavanao.Ento ny karine.MIFAMPILAZA', '0346942049', 'envoye', 1, '2024-04-20 17:27:35', '2024-04-20 17:27:35'),
(65, 'sent', 7, 'Antsoina ianao RASOANANDRASANA Florine mpikambana N 425 ao @CECAM Antsampandrano,mba ho tonga hamonjy ny fivoriam-be izay atao ny TALATA 23 APRILY @ 8ora ao @ KATOLIKA MAHEREZA.Mety hisy fiatraikany @ findramam-bola manaraka ny tsy fahatongavanao.Ento ny karine.MIFAMPILAZA', '0388977040', 'envoye', 1, '2024-04-20 17:27:51', '2024-04-20 17:27:51'),
(66, 'sent', 7, 'Antsoina ianao RAKOTOMALALA Albert mpikambana N 616 ao @CECAM Antsampandrano,mba ho tonga hamonjy ny fivoriam-be izay atao ny TALATA 23 APRILY @ 8ora ao @ KATOLIKA MAHEREZA.Mety hisy fiatraikany @ findramam-bola manaraka ny tsy fahatongavanao.Ento ny karine.MIFAMPILAZA', '0338439766', 'envoye', 1, '2024-04-20 17:27:59', '2024-04-20 17:27:59'),
(67, 'sent', 7, 'Antsoina ianao SOLOFOHERY Jean désiré mpikambana N 618 ao @CECAM Antsampandrano,mba ho tonga hamonjy ny fivoriam-be izay atao ny TALATA 23 APRILY @ 8ora ao @ KATOLIKA MAHEREZA.Mety hisy fiatraikany @ findramam-bola manaraka ny tsy fahatongavanao.Ento ny karine.MIFAMPILAZA', '0336426003', 'envoye', 1, '2024-04-20 17:28:05', '2024-04-20 17:28:05'),
(68, 'sent', 7, 'Antsoina ianao RAMBOLATIANA Jocelyn mpikambana N 622 ao @CECAM Antsampandrano,mba ho tonga hamonjy ny fivoriam-be izay atao ny TALATA 23 APRILY @ 8ora ao @ KATOLIKA MAHEREZA.Mety hisy fiatraikany @ findramam-bola manaraka ny tsy fahatongavanao.Ento ny karine.MIFAMPILAZA', '0330661187', 'envoye', 1, '2024-04-20 17:28:09', '2024-04-20 17:28:09'),
(69, 'sent', 7, 'Antsoina ianao RAJOHNSON Edmond mpikambana N 623 ao @CECAM Antsampandrano,mba ho tonga hamonjy ny fivoriam-be izay atao ny TALATA 23 APRILY @ 8ora ao @ KATOLIKA MAHEREZA.Mety hisy fiatraikany @ findramam-bola manaraka ny tsy fahatongavanao.Ento ny karine.MIFAMPILAZA', '0332572260', 'envoye', 1, '2024-04-20 17:28:14', '2024-04-20 17:28:14'),
(70, 'sent', 7, 'Antsoina ianao RAFIDIMANANA Heritiana mpikambana N 507 ao @CECAM Antsampandrano,mba ho tonga hamonjy ny fivoriam-be izay atao ny TALATA 23 APRILY @ 8ora ao @ KATOLIKA MAHEREZA.Mety hisy fiatraikany @ findramam-bola manaraka ny tsy fahatongavanao.Ento ny karine.MIFAMPILAZA', '0330205081', 'non_envoye', 1, '2024-04-20 17:28:20', '2024-04-20 17:28:20'),
(71, 'sent', 7, 'Antsoina ianao RAFIDIMANANA Heritiana mpikambana N 507 ao @CECAM Antsampandrano,mba ho tonga hamonjy ny fivoriam-be izay atao ny TALATA 23 APRILY @ 8ora ao @ KATOLIKA MAHEREZA.Mety hisy fiatraikany @ findramam-bola manaraka ny tsy fahatongavanao.Ento ny karine.MIFAMPILAZA', '0343253859', 'envoye', 1, '2024-04-20 17:28:34', '2024-04-20 17:28:34'),
(72, 'sent', 7, 'Antsoina ianao RANDRIANAINA Andrianasolo mpikambana N 494 ao @CECAM Antsampandrano,mba ho tonga hamonjy ny fivoriam-be izay atao ny TALATA 23 APRILY @ 8ora ao @ KATOLIKA MAHEREZA.Mety hisy fiatraikany @ findramam-bola manaraka ny tsy fahatongavanao.Ento ny karine.MIFAMPILAZA', '0344932666', 'non_envoye', 1, '2024-04-20 17:28:40', '2024-04-20 17:28:40'),
(73, 'sent', 7, 'Antsoina ianao RANDRIANAINA Andrianasolo mpikambana N 494 ao @CECAM Antsampandrano,mba ho tonga hamonjy ny fivoriam-be izay atao ny TALATA 23 APRILY @ 8ora ao @ KATOLIKA MAHEREZA.Mety hisy fiatraikany @ findramam-bola manaraka ny tsy fahatongavanao.Ento ny karine.MIFAMPILAZA', '0384664670', 'envoye', 1, '2024-04-20 17:28:41', '2024-04-20 17:28:41'),
(74, 'sent', 7, 'Antsoina ianao RANAIVOMANANA MAROSAONA mpikambana N 107 ao @CECAM Antsampandrano,mba ho tonga hamonjy ny fivoriam-be izay atao ny TALATA 23 APRILY @ 8ora ao @ KATOLIKA MAHEREZA.Mety hisy fiatraikany @ findramam-bola manaraka ny tsy fahatongavanao.Ento ny karine.MIFAMPILAZA', '0341455190', 'envoye', 1, '2024-04-20 17:28:43', '2024-04-20 17:28:43'),
(75, 'sent', 7, 'Antsoina ianao RAZAFINDRAKOTO mpikambana N 801 ao @CECAM Antsampandrano,mba ho tonga hamonjy ny fivoriam-be izay atao ny TALATA 23 APRILY @ 8ora ao @ KATOLIKA MAHEREZA.Mety hisy fiatraikany @ findramam-bola manaraka ny tsy fahatongavanao.Ento ny karine.MIFAMPILAZA', '0340103584', 'envoye', 1, '2024-04-20 17:28:44', '2024-04-20 17:28:44'),
(76, 'sent', 7, 'Antsoina ianao RANDRIANANTENAINA Richard mpikambana N 495 ao @CECAM Antsampandrano,mba ho tonga hamonjy ny fivoriam-be izay atao ny TALATA 23 APRILY @ 8ora ao @ KATOLIKA MAHEREZA.Mety hisy fiatraikany @ findramam-bola manaraka ny tsy fahatongavanao.Ento ny karine.MIFAMPILAZA', '0331600061', 'envoye', 1, '2024-04-20 17:28:49', '2024-04-20 17:28:49'),
(77, 'sent', 7, 'Antsoina ianao RANDRIANANTENAINA Richard mpikambana N 495 ao @CECAM Antsampandrano,mba ho tonga hamonjy ny fivoriam-be izay atao ny TALATA 23 APRILY @ 8ora ao @ KATOLIKA MAHEREZA.Mety hisy fiatraikany @ findramam-bola manaraka ny tsy fahatongavanao.Ento ny karine.MIFAMPILAZA', '0349577062', 'envoye', 1, '2024-04-20 17:28:55', '2024-04-20 17:28:55'),
(78, 'sent', 7, 'Antsoina ianao FOMALANDISON Fred Alimane  mpikambana N 403 ao @CECAM Antsampandrano,mba ho tonga hamonjy ny fivoriam-be izay atao ny TALATA 23 APRILY @ 8ora ao @ KATOLIKA MAHEREZA.Mety hisy fiatraikany @ findramam-bola manaraka ny tsy fahatongavanao.Ento ny karine.MIFAMPILAZA', '0387056619', 'envoye', 1, '2024-04-20 17:28:57', '2024-04-20 17:28:57'),
(79, 'sent', 7, 'Antsoina ianao RASAMIMANANA Lantonirina mpikambana N 699 ao @CECAM Antsampandrano,mba ho tonga hamonjy ny fivoriam-be izay atao ny TALATA 23 APRILY @ 8ora ao @ KATOLIKA MAHEREZA.Mety hisy fiatraikany @ findramam-bola manaraka ny tsy fahatongavanao.Ento ny karine.MIFAMPILAZA', '0342794902', 'envoye', 1, '2024-04-20 17:29:08', '2024-04-20 17:29:08'),
(80, 'sent', 7, 'Antsoina ianao RASAMIMANANA Lantonirina mpikambana N 699 ao @CECAM Antsampandrano,mba ho tonga hamonjy ny fivoriam-be izay atao ny TALATA 23 APRILY @ 8ora ao @ KATOLIKA MAHEREZA.Mety hisy fiatraikany @ findramam-bola manaraka ny tsy fahatongavanao.Ento ny karine.MIFAMPILAZA', '0341234745', 'envoye', 1, '2024-04-20 17:29:17', '2024-04-20 17:29:17'),
(81, 'sent', 7, 'Antsoina ianao RANDRIANANDRASANA  mpikambana N 513 ao @CECAM Antsampandrano,mba ho tonga hamonjy ny fivoriam-be izay atao ny TALATA 23 APRILY @ 8ora ao @ KATOLIKA MAHEREZA.Mety hisy fiatraikany @ findramam-bola manaraka ny tsy fahatongavanao.Ento ny karine.MIFAMPILAZA', '0343240199', 'non_envoye', 1, '2024-04-20 17:29:22', '2024-04-20 17:29:22'),
(82, 'sent', 7, 'Antsoina ianao RANDRIANANDRASANA  mpikambana N 513 ao @CECAM Antsampandrano,mba ho tonga hamonjy ny fivoriam-be izay atao ny TALATA 23 APRILY @ 8ora ao @ KATOLIKA MAHEREZA.Mety hisy fiatraikany @ findramam-bola manaraka ny tsy fahatongavanao.Ento ny karine.MIFAMPILAZA', '0339620237', 'envoye', 1, '2024-04-20 17:29:24', '2024-04-20 17:29:24'),
(83, 'sent', 7, 'Antsoina ianao RANDRIANIAINA Toky Fanantenana mpikambana N 516 ao @CECAM Antsampandrano,mba ho tonga hamonjy ny fivoriam-be izay atao ny TALATA 23 APRILY @ 8ora ao @ KATOLIKA MAHEREZA.Mety hisy fiatraikany @ findramam-bola manaraka ny tsy fahatongavanao.Ento ny karine.MIFAMPILAZA', '0332151491', 'non_envoye', 1, '2024-04-20 17:29:30', '2024-04-20 17:29:30'),
(84, 'sent', 7, 'Antsoina ianao RANDRIANIAINA Toky Fanantenana mpikambana N 516 ao @CECAM Antsampandrano,mba ho tonga hamonjy ny fivoriam-be izay atao ny TALATA 23 APRILY @ 8ora ao @ KATOLIKA MAHEREZA.Mety hisy fiatraikany @ findramam-bola manaraka ny tsy fahatongavanao.Ento ny karine.MIFAMPILAZA', '0336274069', 'envoye', 1, '2024-04-20 17:29:31', '2024-04-20 17:29:31'),
(85, 'sent', 7, 'Antsoina ianao RAMBOLAZAFY  mpikambana N 223 ao @CECAM Antsampandrano,mba ho tonga hamonjy ny fivoriam-be izay atao ny TALATA 23 APRILY @ 8ora ao @ KATOLIKA MAHEREZA.Mety hisy fiatraikany @ findramam-bola manaraka ny tsy fahatongavanao.Ento ny karine.MIFAMPILAZA', '0337570364', 'envoye', 1, '2024-04-20 17:29:32', '2024-04-20 17:29:32'),
(86, 'sent', 7, 'Antsoina ianao RAKOTONIRINA Augustin mpikambana N 477 ao @CECAM Antsampandrano,mba ho tonga hamonjy ny fivoriam-be izay atao ny TALATA 23 APRILY @ 8ora ao @ KATOLIKA MAHEREZA.Mety hisy fiatraikany @ findramam-bola manaraka ny tsy fahatongavanao.Ento ny karine.MIFAMPILAZA', '0332164136', 'envoye', 1, '2024-04-20 17:29:41', '2024-04-20 17:29:41'),
(87, 'sent', 7, 'Antsoina ianao RANDRIANANTENAINA Julson mpikambana N 321 ao @CECAM Antsampandrano,mba ho tonga hamonjy ny fivoriam-be izay atao ny TALATA 23 APRILY @ 8ora ao @ KATOLIKA MAHEREZA.Mety hisy fiatraikany @ findramam-bola manaraka ny tsy fahatongavanao.Ento ny karine.MIFAMPILAZA', '0334284910', 'envoye', 1, '2024-04-20 17:29:52', '2024-04-20 17:29:52'),
(88, 'sent', 7, 'Antsoina ianao RANDRIANANTENAINA Julson mpikambana N 321 ao @CECAM Antsampandrano,mba ho tonga hamonjy ny fivoriam-be izay atao ny TALATA 23 APRILY @ 8ora ao @ KATOLIKA MAHEREZA.Mety hisy fiatraikany @ findramam-bola manaraka ny tsy fahatongavanao.Ento ny karine.MIFAMPILAZA', '0342874913', 'envoye', 1, '2024-04-20 17:29:53', '2024-04-20 17:29:53'),
(89, 'sent', 7, 'Antsoina ianao RANDRIANANTENAINA Julson mpikambana N 321 ao @CECAM Antsampandrano,mba ho tonga hamonjy ny fivoriam-be izay atao ny TALATA 23 APRILY @ 8ora ao @ KATOLIKA MAHEREZA.Mety hisy fiatraikany @ findramam-bola manaraka ny tsy fahatongavanao.Ento ny karine.MIFAMPILAZA', '0334688833', 'envoye', 1, '2024-04-20 17:29:55', '2024-04-20 17:29:55'),
(90, 'sent', 7, 'Antsoina ianao RANDRIAMADY mpikambana N  ao @CECAM Antsampandrano,mba ho tonga hamonjy ny fivoriam-be izay atao ny TALATA 23 APRILY @ 8ora ao @ KATOLIKA MAHEREZA.Mety hisy fiatraikany @ findramam-bola manaraka ny tsy fahatongavanao.Ento ny karine.MIFAMPILAZA', '0331310235', 'non_envoye', 1, '2024-04-20 17:30:02', '2024-04-20 17:30:02'),
(91, 'sent', 7, 'Antsoina ianao RAFALIMANANA Josephe mpikambana N  ao @CECAM Antsampandrano,mba ho tonga hamonjy ny fivoriam-be izay atao ny TALATA 23 APRILY @ 8ora ao @ KATOLIKA MAHEREZA.Mety hisy fiatraikany @ findramam-bola manaraka ny tsy fahatongavanao.Ento ny karine.MIFAMPILAZA', '0336856599', 'envoye', 1, '2024-04-20 17:30:03', '2024-04-20 17:30:03'),
(92, 'sent', 7, 'Antsoina ianao RAKOTONIRINA Miakatra mpikambana N 574 ao @CECAM Antsampandrano,mba ho tonga hamonjy ny fivoriam-be izay atao ny TALATA 23 APRILY @ 8ora ao @ KATOLIKA MAHEREZA.Mety hisy fiatraikany @ findramam-bola manaraka ny tsy fahatongavanao.Ento ny karine.MIFAMPILAZA', '0332908082', 'envoye', 1, '2024-04-20 17:30:04', '2024-04-20 17:30:04'),
(93, 'sent', 7, 'Antsoina ianao RAMANAMBOHITRA Jean Jacque mpikambana N 575 ao @CECAM Antsampandrano,mba ho tonga hamonjy ny fivoriam-be izay atao ny TALATA 23 APRILY @ 8ora ao @ KATOLIKA MAHEREZA.Mety hisy fiatraikany @ findramam-bola manaraka ny tsy fahatongavanao.Ento ny karine.MIFAMPILAZA', '0337993859', 'envoye', 1, '2024-04-20 17:30:05', '2024-04-20 17:30:05'),
(94, 'sent', 7, 'Antsoina ianao TAHIANA Heritiana mpikambana N 578 ao @CECAM Antsampandrano,mba ho tonga hamonjy ny fivoriam-be izay atao ny TALATA 23 APRILY @ 8ora ao @ KATOLIKA MAHEREZA.Mety hisy fiatraikany @ findramam-bola manaraka ny tsy fahatongavanao.Ento ny karine.MIFAMPILAZA', '0334191418', 'envoye', 1, '2024-04-20 17:30:13', '2024-04-20 17:30:13'),
(95, 'sent', 7, 'Antsoina ianao RANDRIAMIFIDY Jean Claude  mpikambana N 579 ao @CECAM Antsampandrano,mba ho tonga hamonjy ny fivoriam-be izay atao ny TALATA 23 APRILY @ 8ora ao @ KATOLIKA MAHEREZA.Mety hisy fiatraikany @ findramam-bola manaraka ny tsy fahatongavanao.Ento ny karine.MIFAMPILAZA', '0331368681', 'envoye', 1, '2024-04-20 17:30:40', '2024-04-20 17:30:40'),
(96, 'sent', 7, 'Antsoina ianao RAZAKAFIDY Fidel mpikambana N 581 ao @CECAM Antsampandrano,mba ho tonga hamonjy ny fivoriam-be izay atao ny TALATA 23 APRILY @ 8ora ao @ KATOLIKA MAHEREZA.Mety hisy fiatraikany @ findramam-bola manaraka ny tsy fahatongavanao.Ento ny karine.MIFAMPILAZA', '0346341514', 'envoye', 1, '2024-04-20 17:30:55', '2024-04-20 17:30:55'),
(97, 'sent', 7, 'Antsoina ianao RANAIVOMANANA mpikambana N 580 ao @CECAM Antsampandrano,mba ho tonga hamonjy ny fivoriam-be izay atao ny TALATA 23 APRILY @ 8ora ao @ KATOLIKA MAHEREZA.Mety hisy fiatraikany @ findramam-bola manaraka ny tsy fahatongavanao.Ento ny karine.MIFAMPILAZA', '0347165182', 'envoye', 1, '2024-04-20 17:31:16', '2024-04-20 17:31:16'),
(98, 'sent', 7, 'Antsoina ianao RANDRIANASOLO Jean Fidel mpikambana N 583 ao @CECAM Antsampandrano,mba ho tonga hamonjy ny fivoriam-be izay atao ny TALATA 23 APRILY @ 8ora ao @ KATOLIKA MAHEREZA.Mety hisy fiatraikany @ findramam-bola manaraka ny tsy fahatongavanao.Ento ny karine.MIFAMPILAZA', '0332180622', 'envoye', 1, '2024-04-20 17:31:55', '2024-04-20 17:31:55'),
(99, 'sent', 7, 'Antsoina ianao RANDRIANASOLO Jean Fidel mpikambana N 583 ao @CECAM Antsampandrano,mba ho tonga hamonjy ny fivoriam-be izay atao ny TALATA 23 APRILY @ 8ora ao @ KATOLIKA MAHEREZA.Mety hisy fiatraikany @ findramam-bola manaraka ny tsy fahatongavanao.Ento ny karine.MIFAMPILAZA', '0348341492', 'envoye', 1, '2024-04-20 17:32:26', '2024-04-20 17:32:26'),
(100, 'sent', 7, 'Antsoina ianao RAZAKARIMANANA George mpikambana N 584 ao @CECAM Antsampandrano,mba ho tonga hamonjy ny fivoriam-be izay atao ny TALATA 23 APRILY @ 8ora ao @ KATOLIKA MAHEREZA.Mety hisy fiatraikany @ findramam-bola manaraka ny tsy fahatongavanao.Ento ny karine.MIFAMPILAZA', '0347686305', 'envoye', 1, '2024-04-20 17:32:28', '2024-04-20 17:32:28'),
(101, 'sent', 7, 'Antsoina ianao RAZANADRAKOTO Jean Pierre mpikambana N 589 ao @CECAM Antsampandrano,mba ho tonga hamonjy ny fivoriam-be izay atao ny TALATA 23 APRILY @ 8ora ao @ KATOLIKA MAHEREZA.Mety hisy fiatraikany @ findramam-bola manaraka ny tsy fahatongavanao.Ento ny karine.MIFAMPILAZA', '0339115758', 'non_envoye', 1, '2024-04-20 17:32:34', '2024-04-20 17:32:34'),
(102, 'sent', 7, 'Antsoina ianao RAZAFIMAHATRATRA Harimamy Odon mpikambana N 551 ao @CECAM Antsampandrano,mba ho tonga hamonjy ny fivoriam-be izay atao ny TALATA 23 APRILY @ 8ora ao @ KATOLIKA MAHEREZA.Mety hisy fiatraikany @ findramam-bola manaraka ny tsy fahatongavanao.Ento ny karine.MIFAMPILAZA', '0333249607', 'envoye', 1, '2024-04-20 17:32:39', '2024-04-20 17:32:39'),
(103, 'sent', 7, 'Antsoina ianao RAZAHAMARINA Marie Juliette mpikambana N 552 ao @CECAM Antsampandrano,mba ho tonga hamonjy ny fivoriam-be izay atao ny TALATA 23 APRILY @ 8ora ao @ KATOLIKA MAHEREZA.Mety hisy fiatraikany @ findramam-bola manaraka ny tsy fahatongavanao.Ento ny karine.MIFAMPILAZA', '0336165395', 'envoye', 1, '2024-04-20 17:32:42', '2024-04-20 17:32:42'),
(104, 'sent', 7, 'Antsoina ianao RAKOTOARISON Philibert mpikambana N 554 ao @CECAM Antsampandrano,mba ho tonga hamonjy ny fivoriam-be izay atao ny TALATA 23 APRILY @ 8ora ao @ KATOLIKA MAHEREZA.Mety hisy fiatraikany @ findramam-bola manaraka ny tsy fahatongavanao.Ento ny karine.MIFAMPILAZA', '0347891424', 'envoye', 1, '2024-04-20 17:32:53', '2024-04-20 17:32:53'),
(105, 'sent', 7, 'Antsoina ianao RAVALOMANANA mpikambana N 555 ao @CECAM Antsampandrano,mba ho tonga hamonjy ny fivoriam-be izay atao ny TALATA 23 APRILY @ 8ora ao @ KATOLIKA MAHEREZA.Mety hisy fiatraikany @ findramam-bola manaraka ny tsy fahatongavanao.Ento ny karine.MIFAMPILAZA', '0331888077', 'envoye', 1, '2024-04-20 17:32:56', '2024-04-20 17:32:56'),
(106, 'sent', 7, 'Antsoina ianao RAVALOMANANA mpikambana N 555 ao @CECAM Antsampandrano,mba ho tonga hamonjy ny fivoriam-be izay atao ny TALATA 23 APRILY @ 8ora ao @ KATOLIKA MAHEREZA.Mety hisy fiatraikany @ findramam-bola manaraka ny tsy fahatongavanao.Ento ny karine.MIFAMPILAZA', '0345944588', 'non_envoye', 1, '2024-04-20 17:33:02', '2024-04-20 17:33:02'),
(107, 'sent', 7, 'Antsoina ianao RAFIDISOANIRINA Eveline mpikambana N 561 ao @CECAM Antsampandrano,mba ho tonga hamonjy ny fivoriam-be izay atao ny TALATA 23 APRILY @ 8ora ao @ KATOLIKA MAHEREZA.Mety hisy fiatraikany @ findramam-bola manaraka ny tsy fahatongavanao.Ento ny karine.MIFAMPILAZA', '0332435724', 'envoye', 1, '2024-04-20 17:33:03', '2024-04-20 17:33:03'),
(108, 'sent', 7, 'Antsoina ianao RABEARIVELO Tina Germain  mpikambana N 563 ao @CECAM Antsampandrano,mba ho tonga hamonjy ny fivoriam-be izay atao ny TALATA 23 APRILY @ 8ora ao @ KATOLIKA MAHEREZA.Mety hisy fiatraikany @ findramam-bola manaraka ny tsy fahatongavanao.Ento ny karine.MIFAMPILAZA', '0332438093', 'envoye', 1, '2024-04-20 17:33:04', '2024-04-20 17:33:04'),
(109, 'sent', 7, 'Antsoina ianao RASITRAKA Jean De Dieu mpikambana N 564 ao @CECAM Antsampandrano,mba ho tonga hamonjy ny fivoriam-be izay atao ny TALATA 23 APRILY @ 8ora ao @ KATOLIKA MAHEREZA.Mety hisy fiatraikany @ findramam-bola manaraka ny tsy fahatongavanao.Ento ny karine.MIFAMPILAZA', '0338565783', 'envoye', 1, '2024-04-20 17:33:11', '2024-04-20 17:33:11'),
(110, 'sent', 7, 'Antsoina ianao RASITRAKA Jean De Dieu mpikambana N 564 ao @CECAM Antsampandrano,mba ho tonga hamonjy ny fivoriam-be izay atao ny TALATA 23 APRILY @ 8ora ao @ KATOLIKA MAHEREZA.Mety hisy fiatraikany @ findramam-bola manaraka ny tsy fahatongavanao.Ento ny karine.MIFAMPILAZA', '0343917120', 'envoye', 1, '2024-04-20 17:33:30', '2024-04-20 17:33:30'),
(111, 'sent', 7, 'Antsoina ianao MAMY Tinarivola mpikambana N 566 ao @CECAM Antsampandrano,mba ho tonga hamonjy ny fivoriam-be izay atao ny TALATA 23 APRILY @ 8ora ao @ KATOLIKA MAHEREZA.Mety hisy fiatraikany @ findramam-bola manaraka ny tsy fahatongavanao.Ento ny karine.MIFAMPILAZA', '0338435855', 'envoye', 1, '2024-04-20 17:33:33', '2024-04-20 17:33:33'),
(112, 'sent', 7, 'Antsoina ianao RAZAFIMAHEFA Paul François mpikambana N 567 ao @CECAM Antsampandrano,mba ho tonga hamonjy ny fivoriam-be izay atao ny TALATA 23 APRILY @ 8ora ao @ KATOLIKA MAHEREZA.Mety hisy fiatraikany @ findramam-bola manaraka ny tsy fahatongavanao.Ento ny karine.MIFAMPILAZA', '0332944598', 'envoye', 1, '2024-04-20 17:33:42', '2024-04-20 17:33:42'),
(113, 'sent', 7, 'Antsoina ianao RAKOTOARISOA Robelson mpikambana N 568 ao @CECAM Antsampandrano,mba ho tonga hamonjy ny fivoriam-be izay atao ny TALATA 23 APRILY @ 8ora ao @ KATOLIKA MAHEREZA.Mety hisy fiatraikany @ findramam-bola manaraka ny tsy fahatongavanao.Ento ny karine.MIFAMPILAZA', '0342883259', 'envoye', 1, '2024-04-20 17:34:04', '2024-04-20 17:34:04'),
(114, 'sent', 7, 'Antsoina ianao RAKOTOMALALA Richard mpikambana N 629 ao @CECAM Antsampandrano,mba ho tonga hamonjy ny fivoriam-be izay atao ny TALATA 23 APRILY @ 8ora ao @ KATOLIKA MAHEREZA.Mety hisy fiatraikany @ findramam-bola manaraka ny tsy fahatongavanao.Ento ny karine.MIFAMPILAZA', '0345383891', 'envoye', 1, '2024-04-20 17:34:24', '2024-04-20 17:34:24'),
(115, 'sent', 7, 'Antsoina ianao RANDRIAMIFIDY   mpikambana N 630 ao @CECAM Antsampandrano,mba ho tonga hamonjy ny fivoriam-be izay atao ny TALATA 23 APRILY @ 8ora ao @ KATOLIKA MAHEREZA.Mety hisy fiatraikany @ findramam-bola manaraka ny tsy fahatongavanao.Ento ny karine.MIFAMPILAZA', '0332580389', 'envoye', 1, '2024-04-20 17:34:25', '2024-04-20 17:34:25'),
(116, 'sent', 7, 'Antsoina ianao RANDRIAMIFIDY   mpikambana N 630 ao @CECAM Antsampandrano,mba ho tonga hamonjy ny fivoriam-be izay atao ny TALATA 23 APRILY @ 8ora ao @ KATOLIKA MAHEREZA.Mety hisy fiatraikany @ findramam-bola manaraka ny tsy fahatongavanao.Ento ny karine.MIFAMPILAZA', '0345307011', 'non_envoye', 1, '2024-04-20 17:34:31', '2024-04-20 17:34:31'),
(117, 'sent', 7, 'Antsoina ianao RANDRIANARISOA Venance mpikambana N 632 ao @CECAM Antsampandrano,mba ho tonga hamonjy ny fivoriam-be izay atao ny TALATA 23 APRILY @ 8ora ao @ KATOLIKA MAHEREZA.Mety hisy fiatraikany @ findramam-bola manaraka ny tsy fahatongavanao.Ento ny karine.MIFAMPILAZA', '0338422321', 'envoye', 1, '2024-04-20 17:34:32', '2024-04-20 17:34:32'),
(118, 'sent', 7, 'Antsoina ianao RANDRIAMPARANY Evariste mpikambana N 633 ao @CECAM Antsampandrano,mba ho tonga hamonjy ny fivoriam-be izay atao ny TALATA 23 APRILY @ 8ora ao @ KATOLIKA MAHEREZA.Mety hisy fiatraikany @ findramam-bola manaraka ny tsy fahatongavanao.Ento ny karine.MIFAMPILAZA', '0331940495', 'envoye', 1, '2024-04-20 17:34:44', '2024-04-20 17:34:44'),
(119, 'sent', 7, 'Antsoina ianao RANDRIAMPARANY Evariste mpikambana N 633 ao @CECAM Antsampandrano,mba ho tonga hamonjy ny fivoriam-be izay atao ny TALATA 23 APRILY @ 8ora ao @ KATOLIKA MAHEREZA.Mety hisy fiatraikany @ findramam-bola manaraka ny tsy fahatongavanao.Ento ny karine.MIFAMPILAZA', '0338507439', 'envoye', 1, '2024-04-20 17:34:58', '2024-04-20 17:34:58'),
(120, 'sent', 7, 'Antsoina ianao TAFITASOANIAINA Maminiaina mpikambana N 634 ao @CECAM Antsampandrano,mba ho tonga hamonjy ny fivoriam-be izay atao ny TALATA 23 APRILY @ 8ora ao @ KATOLIKA MAHEREZA.Mety hisy fiatraikany @ findramam-bola manaraka ny tsy fahatongavanao.Ento ny karine.MIFAMPILAZA', '0334255667', 'envoye', 1, '2024-04-20 17:35:08', '2024-04-20 17:35:08'),
(121, 'sent', 7, 'Antsoina ianao TAFITASOANIAINA Maminiaina mpikambana N 634 ao @CECAM Antsampandrano,mba ho tonga hamonjy ny fivoriam-be izay atao ny TALATA 23 APRILY @ 8ora ao @ KATOLIKA MAHEREZA.Mety hisy fiatraikany @ findramam-bola manaraka ny tsy fahatongavanao.Ento ny karine.MIFAMPILAZA', '0347577492', 'envoye', 1, '2024-04-20 17:35:24', '2024-04-20 17:35:24'),
(122, 'sent', 7, 'Antsoina ianao RANDRIANATOANDRO Jean fidele mpikambana N 635 ao @CECAM Antsampandrano,mba ho tonga hamonjy ny fivoriam-be izay atao ny TALATA 23 APRILY @ 8ora ao @ KATOLIKA MAHEREZA.Mety hisy fiatraikany @ findramam-bola manaraka ny tsy fahatongavanao.Ento ny karine.MIFAMPILAZA', '0333180919', 'envoye', 1, '2024-04-20 17:35:32', '2024-04-20 17:35:32'),
(123, 'sent', 7, 'Antsoina ianao RAMANANDRAIBE mpikambana N 605 ao @CECAM Antsampandrano,mba ho tonga hamonjy ny fivoriam-be izay atao ny TALATA 23 APRILY @ 8ora ao @ KATOLIKA MAHEREZA.Mety hisy fiatraikany @ findramam-bola manaraka ny tsy fahatongavanao.Ento ny karine.MIFAMPILAZA', '0331531696', 'non_envoye', 1, '2024-04-20 17:35:38', '2024-04-20 17:35:38'),
(124, 'sent', 7, 'Antsoina ianao RAVELOJAONA François de Paul mpikambana N 606 ao @CECAM Antsampandrano,mba ho tonga hamonjy ny fivoriam-be izay atao ny TALATA 23 APRILY @ 8ora ao @ KATOLIKA MAHEREZA.Mety hisy fiatraikany @ findramam-bola manaraka ny tsy fahatongavanao.Ento ny karine.MIFAMPILAZA', '0338328405', 'envoye', 1, '2024-04-20 17:35:40', '2024-04-20 17:35:40'),
(125, 'sent', 7, 'Antsoina ianao RANDRIANANDRASANA Charles mpikambana N 609 ao @CECAM Antsampandrano,mba ho tonga hamonjy ny fivoriam-be izay atao ny TALATA 23 APRILY @ 8ora ao @ KATOLIKA MAHEREZA.Mety hisy fiatraikany @ findramam-bola manaraka ny tsy fahatongavanao.Ento ny karine.MIFAMPILAZA', '0342962836', 'envoye', 1, '2024-04-20 17:35:42', '2024-04-20 17:35:42'),
(126, 'sent', 7, 'Antsoina ianao RAKOTOVAO mpikambana N 612 ao @CECAM Antsampandrano,mba ho tonga hamonjy ny fivoriam-be izay atao ny TALATA 23 APRILY @ 8ora ao @ KATOLIKA MAHEREZA.Mety hisy fiatraikany @ findramam-bola manaraka ny tsy fahatongavanao.Ento ny karine.MIFAMPILAZA', '0343156219', 'envoye', 1, '2024-04-20 17:35:44', '2024-04-20 17:35:44'),
(127, 'sent', 7, 'Antsoina ianao RAKOTOVAO mpikambana N 612 ao @CECAM Antsampandrano,mba ho tonga hamonjy ny fivoriam-be izay atao ny TALATA 23 APRILY @ 8ora ao @ KATOLIKA MAHEREZA.Mety hisy fiatraikany @ findramam-bola manaraka ny tsy fahatongavanao.Ento ny karine.MIFAMPILAZA', '0338687242', 'envoye', 1, '2024-04-20 17:35:53', '2024-04-20 17:35:53'),
(128, 'sent', 7, 'Antsoina ianao RANDRIANAMBININA Roger mpikambana N 613 ao @CECAM Antsampandrano,mba ho tonga hamonjy ny fivoriam-be izay atao ny TALATA 23 APRILY @ 8ora ao @ KATOLIKA MAHEREZA.Mety hisy fiatraikany @ findramam-bola manaraka ny tsy fahatongavanao.Ento ny karine.MIFAMPILAZA', '0347101779', 'envoye', 1, '2024-04-20 17:36:00', '2024-04-20 17:36:00'),
(129, 'sent', 7, 'Antsoina ianao RANDRIANARISON Emile mpikambana N 614 ao @CECAM Antsampandrano,mba ho tonga hamonjy ny fivoriam-be izay atao ny TALATA 23 APRILY @ 8ora ao @ KATOLIKA MAHEREZA.Mety hisy fiatraikany @ findramam-bola manaraka ny tsy fahatongavanao.Ento ny karine.MIFAMPILAZA', '0342421551', 'envoye', 1, '2024-04-20 17:36:08', '2024-04-20 17:36:08'),
(130, 'sent', 7, 'Antsoina ianao RANDRIANANTENAINA Jean jacque mpikambana N 593 ao @CECAM Antsampandrano,mba ho tonga hamonjy ny fivoriam-be izay atao ny TALATA 23 APRILY @ 8ora ao @ KATOLIKA MAHEREZA.Mety hisy fiatraikany @ findramam-bola manaraka ny tsy fahatongavanao.Ento ny karine.MIFAMPILAZA', '0340232125', 'envoye', 1, '2024-04-20 17:36:23', '2024-04-20 17:36:23'),
(131, 'sent', 7, 'Antsoina ianao RAZAFIMANDIMBINDRAIBE mpikambana N 594 ao @CECAM Antsampandrano,mba ho tonga hamonjy ny fivoriam-be izay atao ny TALATA 23 APRILY @ 8ora ao @ KATOLIKA MAHEREZA.Mety hisy fiatraikany @ findramam-bola manaraka ny tsy fahatongavanao.Ento ny karine.MIFAMPILAZA', '0338145321', 'envoye', 1, '2024-04-20 17:36:36', '2024-04-20 17:36:36'),
(132, 'sent', 7, 'Antsoina ianao RAKOTONIRINA mpikambana N 595 ao @CECAM Antsampandrano,mba ho tonga hamonjy ny fivoriam-be izay atao ny TALATA 23 APRILY @ 8ora ao @ KATOLIKA MAHEREZA.Mety hisy fiatraikany @ findramam-bola manaraka ny tsy fahatongavanao.Ento ny karine.MIFAMPILAZA', '0338563658', 'envoye', 1, '2024-04-20 17:36:47', '2024-04-20 17:36:47'),
(133, 'sent', 7, 'Antsoina ianao RANDRIANAINA Jean de Dieu mpikambana N 596 ao @CECAM Antsampandrano,mba ho tonga hamonjy ny fivoriam-be izay atao ny TALATA 23 APRILY @ 8ora ao @ KATOLIKA MAHEREZA.Mety hisy fiatraikany @ findramam-bola manaraka ny tsy fahatongavanao.Ento ny karine.MIFAMPILAZA', '0338587242', 'envoye', 1, '2024-04-20 17:37:01', '2024-04-20 17:37:01'),
(134, 'sent', 7, 'Antsoina ianao RANDRIANASOLO  mpikambana N 597 ao @CECAM Antsampandrano,mba ho tonga hamonjy ny fivoriam-be izay atao ny TALATA 23 APRILY @ 8ora ao @ KATOLIKA MAHEREZA.Mety hisy fiatraikany @ findramam-bola manaraka ny tsy fahatongavanao.Ento ny karine.MIFAMPILAZA', '0345154846', 'envoye', 1, '2024-04-20 17:37:10', '2024-04-20 17:37:10'),
(135, 'sent', 7, 'Antsoina ianao RANDRIANASOLO  mpikambana N 597 ao @CECAM Antsampandrano,mba ho tonga hamonjy ny fivoriam-be izay atao ny TALATA 23 APRILY @ 8ora ao @ KATOLIKA MAHEREZA.Mety hisy fiatraikany @ findramam-bola manaraka ny tsy fahatongavanao.Ento ny karine.MIFAMPILAZA', '0338096772', 'envoye', 1, '2024-04-20 17:37:35', '2024-04-20 17:37:35'),
(136, 'sent', 7, 'Antsoina ianao RAKOTONINDRIANA Edmond mpikambana N 599 ao @CECAM Antsampandrano,mba ho tonga hamonjy ny fivoriam-be izay atao ny TALATA 23 APRILY @ 8ora ao @ KATOLIKA MAHEREZA.Mety hisy fiatraikany @ findramam-bola manaraka ny tsy fahatongavanao.Ento ny karine.MIFAMPILAZA', '0389130213', 'envoye', 1, '2024-04-20 17:37:47', '2024-04-20 17:37:47'),
(137, 'sent', 7, 'Antsoina ianao RAKOTONDRABE mpikambana N 600 ao @CECAM Antsampandrano,mba ho tonga hamonjy ny fivoriam-be izay atao ny TALATA 23 APRILY @ 8ora ao @ KATOLIKA MAHEREZA.Mety hisy fiatraikany @ findramam-bola manaraka ny tsy fahatongavanao.Ento ny karine.MIFAMPILAZA', '0330540845', 'envoye', 1, '2024-04-20 17:37:48', '2024-04-20 17:37:48'),
(138, 'sent', 7, 'Antsoina ianao RAKOTONDRABE mpikambana N 600 ao @CECAM Antsampandrano,mba ho tonga hamonjy ny fivoriam-be izay atao ny TALATA 23 APRILY @ 8ora ao @ KATOLIKA MAHEREZA.Mety hisy fiatraikany @ findramam-bola manaraka ny tsy fahatongavanao.Ento ny karine.MIFAMPILAZA', '0348905153', 'envoye', 1, '2024-04-20 17:37:49', '2024-04-20 17:37:49'),
(139, 'sent', 7, 'Antsoina ianao RAFANOMEZANTSOA Dieu Donné mpikambana N 601 ao @CECAM Antsampandrano,mba ho tonga hamonjy ny fivoriam-be izay atao ny TALATA 23 APRILY @ 8ora ao @ KATOLIKA MAHEREZA.Mety hisy fiatraikany @ findramam-bola manaraka ny tsy fahatongavanao.Ento ny karine.MIFAMPILAZA', '0337240630', 'envoye', 1, '2024-04-20 17:37:55', '2024-04-20 17:37:55'),
(140, 'sent', 7, 'Antsoina ianao RANAIVOMANANA Rina mpikambana N 903 ao @CECAM Antsampandrano,mba ho tonga hamonjy ny fivoriam-be izay atao ny TALATA 23 APRILY @ 8ora ao @ KATOLIKA MAHEREZA.Mety hisy fiatraikany @ findramam-bola manaraka ny tsy fahatongavanao.Ento ny karine.MIFAMPILAZA', '0343546834', 'envoye', 1, '2024-04-20 17:37:56', '2024-04-20 17:37:56'),
(141, 'sent', 7, 'Antsoina ianao RANAIVOMANANA Rina mpikambana N 903 ao @CECAM Antsampandrano,mba ho tonga hamonjy ny fivoriam-be izay atao ny TALATA 23 APRILY @ 8ora ao @ KATOLIKA MAHEREZA.Mety hisy fiatraikany @ findramam-bola manaraka ny tsy fahatongavanao.Ento ny karine.MIFAMPILAZA', '0340248292', 'non_envoye', 1, '2024-04-20 17:38:02', '2024-04-20 17:38:02'),
(142, 'sent', 7, 'Antsoina ianao RAZANAJATOVO Martin mpikambana N 905 ao @CECAM Antsampandrano,mba ho tonga hamonjy ny fivoriam-be izay atao ny TALATA 23 APRILY @ 8ora ao @ KATOLIKA MAHEREZA.Mety hisy fiatraikany @ findramam-bola manaraka ny tsy fahatongavanao.Ento ny karine.MIFAMPILAZA', '0345103679', 'envoye', 1, '2024-04-20 17:38:03', '2024-04-20 17:38:03'),
(143, 'sent', 7, 'Antsoina ianao RAKOTOARIMANANA mpikambana N 907 ao @CECAM Antsampandrano,mba ho tonga hamonjy ny fivoriam-be izay atao ny TALATA 23 APRILY @ 8ora ao @ KATOLIKA MAHEREZA.Mety hisy fiatraikany @ findramam-bola manaraka ny tsy fahatongavanao.Ento ny karine.MIFAMPILAZA', '0345454305', 'envoye', 1, '2024-04-20 17:38:06', '2024-04-20 17:38:06'),
(144, 'sent', 7, 'Antsoina ianao RAKOTOARIMANANA mpikambana N 907 ao @CECAM Antsampandrano,mba ho tonga hamonjy ny fivoriam-be izay atao ny TALATA 23 APRILY @ 8ora ao @ KATOLIKA MAHEREZA.Mety hisy fiatraikany @ findramam-bola manaraka ny tsy fahatongavanao.Ento ny karine.MIFAMPILAZA', '0341979138', 'envoye', 1, '2024-04-20 17:38:18', '2024-04-20 17:38:18'),
(145, 'sent', 7, 'Antsoina ianao TALE RIVONALA mpikambana N 1 ao @CECAM Antsampandrano,mba ho tonga hamonjy ny fivoriam-be izay atao ny TALATA 23 APRILY @ 8ora ao @ KATOLIKA MAHEREZA.Mety hisy fiatraikany @ findramam-bola manaraka ny tsy fahatongavanao.Ento ny karine.MIFAMPILAZA', '0340538720', 'envoye', 1, '2024-04-20 17:38:33', '2024-04-20 17:38:33'),
(146, 'sent', NULL, '', '0341790628', 'non_envoye', 1, '2024-05-28 18:17:05', '2024-05-28 18:17:05'),
(147, 'sent', NULL, 'message test', '0341790628', 'non_envoye', 1, '2024-05-28 18:17:18', '2024-05-28 18:17:18'),
(148, 'sent', NULL, 'Test', '0341790628', 'non_envoye', 1, '2024-06-20 17:27:32', '2024-06-20 17:27:32'),
(149, 'sent', NULL, 'Test', '0341790628', 'non_envoye', 1, '2024-06-20 17:27:46', '2024-06-20 17:27:46'),
(150, 'sent', NULL, 'Manoa', '0341790628', 'non_envoye', 1, '2024-06-20 17:29:32', '2024-06-20 17:29:32'),
(151, 'sent', NULL, 'Manoa test', '0341790628', 'non_envoye', 1, '2024-06-20 17:30:15', '2024-06-20 17:30:15'),
(152, 'sent', NULL, 'Teqsdqs', '0341790628', 'non_envoye', 1, '2024-06-20 17:31:08', '2024-06-20 17:31:08'),
(153, 'sent', NULL, 'chrie', '0341790628', 'non_envoye', 1, '2024-06-20 17:31:58', '2024-06-20 17:31:58'),
(154, 'sent', NULL, 'jtm', '0341790628', 'non_envoye', 1, '2024-06-20 17:32:31', '2024-06-20 17:32:31'),
(155, 'sent', NULL, 'Manoa ity', '0341790628', 'non_envoye', 1, '2024-06-20 17:33:37', '2024-06-20 17:33:37');

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
  `photo` varchar(255) DEFAULT NULL,
  `mdp_modem` varchar(255) DEFAULT NULL,
  `created` date NOT NULL,
  `modified` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `nom`, `prenom`, `photo`, `mdp_modem`, `created`, `modified`) VALUES
(1, 'manoarazafindrabe@gmail.com', '$2y$10$2fk2iVslGk9DKFKL.NOqSuL3WGsH2xIegmnckWMKGfY60tdbVc7I6', 'Manoa', 'Fanantenana', NULL, NULL, '0000-00-00', '0000-00-00');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `messageries`
--
ALTER TABLE `messageries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=156;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
