-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  mer. 15 juil. 2020 à 14:45
-- Version du serveur :  10.4.10-MariaDB
-- Version de PHP :  7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `ocr5`
--

-- --------------------------------------------------------

--
-- Structure de la table `clients`
--

DROP TABLE IF EXISTS `clients`;
CREATE TABLE IF NOT EXISTS `clients` (
  `IDClient` int(11) NOT NULL AUTO_INCREMENT,
  `IDProfil` int(11) NOT NULL,
  PRIMARY KEY (`IDClient`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `clients`
--

INSERT INTO `clients` (`IDClient`, `IDProfil`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7);

-- --------------------------------------------------------

--
-- Structure de la table `dailymenu`
--

DROP TABLE IF EXISTS `dailymenu`;
CREATE TABLE IF NOT EXISTS `dailymenu` (
  `IDDailyMenu` int(11) NOT NULL AUTO_INCREMENT,
  `IDMenuItem` int(11) NOT NULL,
  `date` date NOT NULL,
  `price` float NOT NULL DEFAULT -1,
  PRIMARY KEY (`IDDailyMenu`),
  KEY `IDDailyMenu` (`IDDailyMenu`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `dailymenu`
--

INSERT INTO `dailymenu` (`IDDailyMenu`, `IDMenuItem`, `date`, `price`) VALUES
(1, 1, '2020-06-10', -1),
(2, 2, '2020-06-10', -1),
(3, 5, '2020-06-10', -1),
(4, 6, '2020-06-10', -1),
(5, 3, '2020-06-11', 10),
(6, 4, '2020-06-11', 10),
(7, 7, '2020-06-11', 8),
(8, 8, '2020-06-11', -1),
(9, 3, '2020-06-12', -1),
(10, 6, '2020-06-12', 11),
(11, 7, '2020-06-12', 8),
(12, 8, '2020-06-12', -1);

-- --------------------------------------------------------

--
-- Structure de la table `deliverers`
--

DROP TABLE IF EXISTS `deliverers`;
CREATE TABLE IF NOT EXISTS `deliverers` (
  `IDDeliverer` int(11) NOT NULL AUTO_INCREMENT,
  `IDProfil` int(11) NOT NULL,
  `photo_url` varchar(100) NOT NULL,
  PRIMARY KEY (`IDDeliverer`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `deliverers`
--

INSERT INTO `deliverers` (`IDDeliverer`, `IDProfil`, `photo_url`) VALUES
(1, 8, 'some-dumpy-directory/lionelestin.jpg'),
(2, 9, 'some-dumpy-directory/emilsmart.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `lists`
--

DROP TABLE IF EXISTS `lists`;
CREATE TABLE IF NOT EXISTS `lists` (
  `IDListOrder` int(11) NOT NULL AUTO_INCREMENT,
  `IDOrder` int(11) NOT NULL,
  `IDMenuItem` int(11) NOT NULL,
  `soldPrice` float NOT NULL,
  `quantity` int(11) NOT NULL,
  PRIMARY KEY (`IDListOrder`),
  KEY `IDListOrder` (`IDListOrder`,`IDOrder`,`IDMenuItem`),
  KEY `IDDailyMenu` (`IDMenuItem`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `lists`
--

INSERT INTO `lists` (`IDListOrder`, `IDOrder`, `IDMenuItem`, `soldPrice`, `quantity`) VALUES
(1, 1, 1, 9, 1),
(2, 1, 2, 9, 1),
(3, 1, 4, 9, 1),
(4, 2, 2, 9, 1),
(5, 2, 3, 9, 1),
(6, 3, 1, 9, 2),
(7, 3, 3, 10, 1),
(8, 4, 5, 10, 3),
(9, 5, 5, 8, 1),
(10, 6, 6, 11, 2),
(11, 6, 7, 9, 1),
(12, 6, 8, 9, 1),
(13, 7, 12, 8, 1);

-- --------------------------------------------------------

--
-- Structure de la table `manager`
--

DROP TABLE IF EXISTS `manager`;
CREATE TABLE IF NOT EXISTS `manager` (
  `IDManager` int(11) NOT NULL AUTO_INCREMENT,
  `IDProfil` int(11) NOT NULL,
  PRIMARY KEY (`IDManager`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `manager`
--

INSERT INTO `manager` (`IDManager`, `IDProfil`) VALUES
(1, 10);

-- --------------------------------------------------------

--
-- Structure de la table `menuitems`
--

DROP TABLE IF EXISTS `menuitems`;
CREATE TABLE IF NOT EXISTS `menuitems` (
  `IDMenuItem` int(11) NOT NULL AUTO_INCREMENT,
  `type` enum('dishes','dessert') NOT NULL,
  `title` varchar(50) NOT NULL,
  `price` float NOT NULL COMMENT 'price expressed in $',
  `pound` int(11) DEFAULT NULL COMMENT 'pound expressed in grammes',
  `picture_url` varchar(100) NOT NULL,
  `description` varchar(250) NOT NULL,
  `json` text NOT NULL,
  PRIMARY KEY (`IDMenuItem`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `menuitems`
--

INSERT INTO `menuitems` (`IDMenuItem`, `type`, `title`, `price`, `pound`, `picture_url`, `description`, `json`) VALUES
(1, 'dishes', 'Chicken RED sauce', 10.9, NULL, 'some-dumpy-directory/Chicken-RED-sauce.jpg', 'Le lorem ipsum est, en imprimerie, une suite de mots sans signification utilisée à titre provisoire pour calibrer une mise en page, le texte définitif venant remplacer le faux-texte dès qu\'il est prêt ou que la mise en page est achevée. ', '{option_example: {tag: \"red\", v: 3}}'),
(2, 'dishes', 'Chicken GOLD sauce', 12.2, NULL, 'some-dumpy-directory/Chicken-GOLD-sauce.jpg', 'Le lorem ipsum est, en imprimerie, une suite de mots sans signification utilisée à titre provisoire pour calibrer une mise en page, le texte définitif venant remplacer le faux-texte dès qu\'il est prêt ou que la mise en page est achevée. ', '{option_example: {tag: \"gold\", v: 1}}'),
(3, 'dishes', 'Beef RED sauce', 13.9, NULL, 'some-dumpy-directory/Beef-RED-sauce.jpg', 'Le lorem ipsum est, en imprimerie, une suite de mots sans signification utilisée à titre provisoire pour calibrer une mise en page, le texte définitif venant remplacer le faux-texte dès qu\'il est prêt ou que la mise en page est achevée. ', '{option_example: {tag: \"red\", v: 3}}'),
(4, 'dishes', 'Beef GREEN sauce', 13, NULL, 'some-dumpy-directory/Beef-greeb-sauce.jpg', 'Le lorem ipsum est, en imprimerie, une suite de mots sans signification utilisée à titre provisoire pour calibrer une mise en page, le texte définitif venant remplacer le faux-texte dès qu\'il est prêt ou que la mise en page est achevée. ', '{option_example: {tag: \"green\", v: 1}}'),
(5, 'dessert', 'Tiramisu banana choco', 8.5, NULL, 'some-dumpy-directory/Tiramisu-choco-banana.jpg', 'Le lorem ipsum est, en imprimerie, une suite de mots sans signification utilisée à titre provisoire pour calibrer une mise en page, le texte définitif venant remplacer le faux-texte dès qu\'il est prêt ou que la mise en page est achevée. ', '{}'),
(6, 'dessert', 'Flan with Vanilla', 9, NULL, 'some-dumpy-directory/flan-vanilla.jpg', 'Le lorem ipsum est, en imprimerie, une suite de mots sans signification utilisée à titre provisoire pour calibrer une mise en page, le texte définitif venant remplacer le faux-texte dès qu\'il est prêt ou que la mise en page est achevée. ', '{}'),
(7, 'dessert', 'Dried fruit Cake', 8.5, NULL, 'some-dumpy-directory/dried-fruits-cake.jpg', 'Le lorem ipsum est, en imprimerie, une suite de mots sans signification utilisée à titre provisoire pour calibrer une mise en page, le texte définitif venant remplacer le faux-texte dès qu\'il est prêt ou que la mise en page est achevée. ', '{option: {tag: \"candy\", note: \"find a gift inside !\"}'),
(8, 'dessert', 'Apple pie', 9.5, NULL, 'some-dumpy-directory/apple-pie.jpg', 'Le lorem ipsum est, en imprimerie, une suite de mots sans signification utilisée à titre provisoire pour calibrer une mise en page, le texte définitif venant remplacer le faux-texte dès qu\'il est prêt ou que la mise en page est achevée. ', '{}');

-- --------------------------------------------------------

--
-- Structure de la table `pendingorders`
--

DROP TABLE IF EXISTS `pendingorders`;
CREATE TABLE IF NOT EXISTS `pendingorders` (
  `IDOrder` int(11) NOT NULL AUTO_INCREMENT,
  `IDClient` int(11) NOT NULL,
  `IDDeliverer` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` enum('pending','abort','delivered') NOT NULL DEFAULT 'pending',
  `deliveredAddress` varchar(150) NOT NULL,
  `orderedAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `deliveredAt` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`IDOrder`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `pendingorders`
--

INSERT INTO `pendingorders` (`IDOrder`, `IDClient`, `IDDeliverer`, `date`, `status`, `deliveredAddress`, `orderedAt`, `deliveredAt`) VALUES
(1, 1, 1, '2020-06-10 11:06:26', 'delivered', '9121 South George Road Clayton, PA 19401', '2020-06-13 15:17:56', NULL),
(2, 2, 1, '2020-06-10 11:06:26', 'delivered', '699 Alderwood St. Norristown, PA 19401', '2020-06-13 15:17:56', NULL),
(3, 3, 2, '2020-06-10 11:06:26', 'delivered', '896 Marshall Lister, PA 19401', '2020-06-13 15:17:56', NULL),
(4, 4, 1, '2020-06-11 11:06:26', 'delivered', '801 Delta Jar, PA 19401', '2020-06-13 15:17:56', NULL),
(5, 5, 2, '2020-06-11 11:06:26', 'delivered', '112 Heten Guard, PA 19401', '2020-06-13 15:17:56', NULL),
(6, 6, 2, '2020-06-11 11:06:26', 'delivered', '121 Easten Yard, PA 19401', '2020-06-13 15:17:56', NULL),
(7, 2, 1, '2020-06-12 11:06:26', 'delivered', '551 Giston Town, PA 19401', '2020-06-13 15:17:56', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `profils`
--

DROP TABLE IF EXISTS `profils`;
CREATE TABLE IF NOT EXISTS `profils` (
  `IDProfil` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(25) NOT NULL,
  `lastName` varchar(25) NOT NULL,
  `address` varchar(150) NOT NULL,
  `tel` varchar(15) NOT NULL,
  `email` varchar(50) NOT NULL,
  `photo_url` varchar(150) NOT NULL,
  `json` text NOT NULL,
  PRIMARY KEY (`IDProfil`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `profils`
--

INSERT INTO `profils` (`IDProfil`, `firstName`, `lastName`, `address`, `tel`, `email`, `photo_url`, `json`) VALUES
(1, 'George', 'Ken', '9121 South George Road\r\nClayton, PA 19401', '+1-541-754-3010', 'geaorgeken@gmail.com', '', '{details: {}}'),
(2, 'Karl', 'Kassel', '699 Alderwood St.\r\nNorristown, PA 19401', '+1-321-754-3950', 'karlkassel@gmail.com', '', '{details: {}}'),
(3, 'Lila', 'Mayer', '896 Marshall Lister, PA 19401', '+1-541-754-5554', 'lilamayer@gmail.com', '', '{details: {}}'),
(4, 'John', 'Silver', '12 Easten Yard, PA 19401', '+1-541-522-5854', 'johnsilver@gmail.com', '', '{details: {}}'),
(5, 'Edourd', 'Colton', '112 Heten Guard, PA 19401', '+1-541-522-5854', 'edourdcolton@gmail.com', '', '{details: {}}'),
(6, 'Sean', 'Lus', '121 Easten Yard, PA 19401', '+1-541-522-5854', 'seanlus@gmail.com', '', '{details: {}}'),
(7, 'Bart', 'Simp', '458 Infinity Lowel, PA 19401', '+1-541-852-5851', 'bartsimp@gmail.com', '', '{details: {}}'),
(8, 'Lionel', 'Estin', '896 Marshall Lane\r\nEnterprise, PA 19401', '+1-541-799-3010', 'lionelestin@gmail.com', 'some-dumpy-directory/lionelestin.jpg', '{details: {performences: 9}}'),
(9, 'Emil', 'Smart', '449 N. Jockey Hollow Dr. Lombard, PA 19401', '+1-541-665-3018', 'emilsmart@gmail.com', 'some-dumpy-directory/emilsmart.jpg', '{details: {performences: 4, handicap: 27}}'),
(10, 'admin', 'super', 'paradise point, PA 6546548', '+1-541-888-3010', 'adminsuper@gmail.com', 'some-dumpy-directory/superadmin.jpg', '{blabla: \"blablabla\"}');

-- --------------------------------------------------------

--
-- Structure de la table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `IDRole` int(11) NOT NULL AUTO_INCREMENT,
  `IDProfil` int(11) NOT NULL,
  `role` varchar(50) NOT NULL,
  `json` text NOT NULL,
  PRIMARY KEY (`IDRole`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `lists`
--
ALTER TABLE `lists`
  ADD CONSTRAINT `lists_ibfk_1` FOREIGN KEY (`IDMenuItem`) REFERENCES `dailymenu` (`IDDailyMenu`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
