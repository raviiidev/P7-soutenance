-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mar. 19 avr. 2022 à 05:17
-- Version du serveur : 8.0.28
-- Version de PHP : 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `groupomania_database`
--

-- --------------------------------------------------------

--
-- Structure de la table `comments`
--

DROP TABLE IF EXISTS `comments`;
CREATE TABLE IF NOT EXISTS `comments` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `userId` int UNSIGNED NOT NULL,
  `postId` int UNSIGNED NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `comContent` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_comments_postId` (`postId`),
  KEY `fk_comments_userId` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `comments`
--

INSERT INTO `comments` (`id`, `userId`, `postId`, `date`, `comContent`) VALUES
(15, 4, 20, '2022-04-18 16:30:48', 'Merci'),
(16, 4, 21, '2022-04-18 16:31:07', 'Marrakech biensûr :-)');

-- --------------------------------------------------------

--
-- Structure de la table `likes`
--

DROP TABLE IF EXISTS `likes`;
CREATE TABLE IF NOT EXISTS `likes` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `postId` int UNSIGNED NOT NULL,
  `userId` int UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  KEY `fk_like_postId` (`postId`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `likes`
--

INSERT INTO `likes` (`id`, `postId`, `userId`) VALUES
(14, 21, 2),
(15, 20, 2),
(16, 22, 4),
(17, 21, 4),
(18, 20, 4);

-- --------------------------------------------------------

--
-- Structure de la table `posts`
--

DROP TABLE IF EXISTS `posts`;
CREATE TABLE IF NOT EXISTS `posts` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `userId` int UNSIGNED NOT NULL,
  `title` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `content` text COLLATE utf8mb4_general_ci NOT NULL,
  `date` datetime NOT NULL,
  `likes` int UNSIGNED NOT NULL DEFAULT '0',
  `img` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_userId` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `posts`
--

INSERT INTO `posts` (`id`, `userId`, `title`, `content`, `date`, `likes`, `img`) VALUES
(20, 2, 'Bienvenue', 'Bonjour à tous et à toutes, bienvenue sur notre nouvelle plateforme de partage. Ici, vous pouvez nous partager des articles pertinents en référence à votre métier, des évènements pour créer une cohésion de groupe, vos humeurs et différents partages dans la bienveillance :-)', '2022-04-18 16:25:47', 2, 'http://localhost:3000/images/bienvenue_1650295547183.webp'),
(21, 2, 'Séminaire', 'Bonjour à tous, Notre séminaire annuel arrive à grand pas, et pour ce faire, nous avons besoin de votre avis. Tout d\'abord la société souhaiterait que le séminaire se déroule sur 3 jours, nous nous sommes arrêtés sur 2 destinations. Comme nous nous soucions de nos collaborateurs c\'est vous qui allez choisir la destination finale. 1 choix : Marrakech (Maroc) 2ème choix : Porto (Portugal) Vous avez jusqu\'au 20/04 pour voter en commentaire. A vos votes! Stéphanie', '2022-04-18 16:28:29', 2, 'http://localhost:3000/images/marrakech_1650295709069.jpg'),
(22, 4, 'Afterwork', 'Je voulais vous remercier pour l\'afterwork de jeudi dernier, super enrichissante, j\'ai fait de belles rencontres inattendus, merci encore de nous réunir. Nadine', '2022-04-18 16:30:31', 1, 'http://localhost:3000/images/afterwork_1650295831358.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `lastName` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `firstName` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `moderation` int UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `lastName`, `firstName`, `email`, `password`, `moderation`) VALUES
(2, 'groupomania', 'admin', 'admin@groupomania.fr', '$2b$10$aUzLozurTBgayrgNniQqbuskNlONQtmsnM.6vSKXz68H3VxT/ZVJm', 1),
(4, 'Cesaire', 'Nadine', 'nadine@groupomania.fr', '$2b$10$O2xFODt.o2nBNZ7D5Bx96ed1VsZSyT8Ghn45l8LhSwmPmD.Xjh2EG', NULL),
(5, 'Sam', 'Marianne', 'marianne@groupomania.fr', '$2b$10$69jTvIx21eZ7VpF5hKENKuXksRGfKt.WC8hO5WRzr6WGFQzVd1q2u', NULL),
(7, 'dhytyt', 'Delphiné-isabelle', 'delphine@groupomania.fr', '$2b$10$b98ozYltUkGGnr/ARbAReOC8Uvc6pNk11X7Y2ppVWIW0rdLmNlyEC', NULL);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `fk_comments_postId` FOREIGN KEY (`postId`) REFERENCES `posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_comments_userId` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `likes`
--
ALTER TABLE `likes`
  ADD CONSTRAINT `fk_like_postId` FOREIGN KEY (`postId`) REFERENCES `posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_like_userId` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_likes_postId` FOREIGN KEY (`postId`) REFERENCES `posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_likes_userId` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `fk_userId` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
