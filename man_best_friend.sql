-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Vært: localhost:3306
-- Genereringstid: 31. 10 2025 kl. 13:47:30
-- Serverversion: 5.7.24
-- PHP-version: 8.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `man_best_friend`
--

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `furry_friends`
--

CREATE TABLE `furry_friends` (
  `id` int(11) NOT NULL,
  `breed` varchar(20) NOT NULL,
  `description` text NOT NULL,
  `longevity_in_years` int(11) NOT NULL,
  `weight_in_kg` int(11) NOT NULL,
  `activity_level` varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Data dump for tabellen `furry_friends`
--

INSERT INTO `furry_friends` (`id`, `breed`, `description`, `longevity_in_years`, `weight_in_kg`, `activity_level`) VALUES
(1, 'Golden Retriever', 'A Golden Retriever is a friendly, loyal, and intelligent dog breed known for its gentle temperament and playful nature. They make excellent family pets and enjoy outdoor activities.', 11, 30, 'high activity level'),
(2, 'Siberian Husky', 'The Siberian Husky is an energetic, outgoing, and strong breed known for its striking looks and endurance. They are social dogs that need plenty of exercise and companionship.', 12, 27, 'very high activity level'),
(3, 'Labrador Retriever', 'The Labrador Retriever is friendly, outgoing, and eager to please. Labs are excellent family pets and often used as guide or service dogs due to their intelligence and calm nature.', 12, 32, 'high activity level'),
(4, 'Pembroke Welsh Corgi', 'The Pembroke Welsh Corgi is affectionate, intelligent, and alert. Known for their short legs and long bodies, they make loyal companions and are great with families.', 13, 12, 'moderate activity level'),
(5, 'Dachshund', 'The Dachshund is a small, curious, and courageous breed with a distinctive long body and short legs. They are playful and make loyal family pets.', 14, 9, 'moderate activity level'),
(6, 'Chihuahua', 'The Chihuahua is a tiny, alert, and confident dog with a big personality. They are loyal to their owners and adapt well to apartment living.', 15, 3, 'low to moderate activity level'),
(7, 'German Shepherd', 'The German Shepherd is an intelligent, courageous, and loyal working dog. They are highly trainable and excel as police, service, and family dogs.', 10, 35, 'high activity level'),
(8, 'The Border Collie :)', 'The Border Collie is one of the most intelligent and energetic dog breeds.', 11, 12, 'incredibly high activity level.'),
(12, 'Poodle 3', 'Poodle (standard) Poodles are brilliant and highly trainable. The breed is also widely used in mixed breeds', 12, 11, 'high activity level'),
(13, 'Poodle ', 'Poodle (standard) Poodles are brilliant and highly trainable. The breed is also widely used in mixed breeds', 12, 11, 'high activity level');

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `furry_friends_media`
--

CREATE TABLE `furry_friends_media` (
  `id` int(11) NOT NULL,
  `furry_friend_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `url` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Data dump for tabellen `furry_friends_media`
--

INSERT INTO `furry_friends_media` (`id`, `furry_friend_id`, `name`, `url`) VALUES
(1, 1, 'adult_golden', 'https://unsplash.com/photos/portrait...'),
(2, 1, 'puppy_golden', 'https://unsplash.com/photos/golden...'),
(3, 2, 'husky_puppy', 'https://plus.unsplash.com/premium_photo-1725400830688-904d6862de60?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&q=80&w=2071'),
(4, 6, 'christmas_chihuahua', 'https://images.unsplash.com/photo-1605639156481-244775d6f803?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&q=80&w=687'),
(5, 7, 'german_shepherd_adult', 'https://images.unsplash.com/photo-1662939092439-67d3d9d733b4?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&q=80&w=1113'),
(6, 12, 'poodle_elegant', 'https://plus.unsplash.com/premium_photo-1664392446675-5596416071a1?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&q=80&w=746'),
(7, 12, 'poodle_white', 'https://media.istockphoto.com/id/172409492/photo/movie-star-poodle-striking-a-pose.jpg?s=2048x2048&w=is&k=20&c=9WdaeYC68UQ4lhjB-Q_WhxGhTzBz87cBlsrgLcmczlI=');

--
-- Begrænsninger for dumpede tabeller
--

--
-- Indeks for tabel `furry_friends`
--
ALTER TABLE `furry_friends`
  ADD PRIMARY KEY (`id`);

--
-- Indeks for tabel `furry_friends_media`
--
ALTER TABLE `furry_friends_media`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_furry_friend` (`furry_friend_id`);

--
-- Brug ikke AUTO_INCREMENT for slettede tabeller
--

--
-- Tilføj AUTO_INCREMENT i tabel `furry_friends`
--
ALTER TABLE `furry_friends`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Tilføj AUTO_INCREMENT i tabel `furry_friends_media`
--
ALTER TABLE `furry_friends_media`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Begrænsninger for dumpede tabeller
--

--
-- Begrænsninger for tabel `furry_friends_media`
--
ALTER TABLE `furry_friends_media`
  ADD CONSTRAINT `fk_furry_friend` FOREIGN KEY (`furry_friend_id`) REFERENCES `furry_friends` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
