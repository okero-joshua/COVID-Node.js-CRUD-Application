-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: xefi550t7t6tjn36.cbetxkdyhwsb.us-east-1.rds.amazonaws.com
-- Generation Time: Aug 29, 2024 at 05:47 PM
-- Server version: 8.0.35
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `m2qmrpzqz1yvzazf`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` int NOT NULL,
  `category_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `category_name`) VALUES
(15, 'Video Games'),
(18, 'Computer Science');

-- --------------------------------------------------------

--
-- Table structure for table `correct_answers`
--

CREATE TABLE `correct_answers` (
  `question_id` int DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `correct_answers`
--

INSERT INTO `correct_answers` (`question_id`, `username`) VALUES
(9, 'abc'),
(6, 'abc'),
(4, 'abc'),
(1, 'abc'),
(7, 'abc'),
(2, 'abc'),
(8, 'abc'),
(7, 'testuser1'),
(5, 'zach'),
(10, 'zach'),
(2, 'zach'),
(5, 'test1'),
(2, 'test1'),
(3, 'testuser4'),
(6, 'testuser4'),
(1, 'testuser4'),
(7, 'testuser4'),
(14, 'abc'),
(5, 'abc'),
(3, 'abc'),
(5, 'user66'),
(9, 'user66'),
(7, 'test1'),
(9, 'test1'),
(3, 'test1'),
(7, 'zach'),
(3, 'user77'),
(2, 'user77'),
(5, 'user88'),
(20, 'test1'),
(16, 'drlara'),
(8, 'Thebestest'),
(24, 'Thebestest'),
(33, 'Thebestest');

-- --------------------------------------------------------

--
-- Table structure for table `c_classification`
--

CREATE TABLE `c_classification` (
  `classification_id` varchar(5) NOT NULL,
  `classification` varchar(30) NOT NULL,
  `attributes` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `c_classification`
--

INSERT INTO `c_classification` (`classification_id`, `classification`, `attributes`) VALUES
('VBM', 'Variant Being Monitor', 'These variants do not pose a significant and imminent risk to public health.\n'),
('VOC', 'Variant of Concern', 'These variants present an increase in transmissibility and severe disease.'),
('VOHC', 'Variant of High Concern', 'More severe clinical disease and increased hospitalizations. Evidence to suggest a significant reduction in vaccine effectiveness.'),
('VOI', 'Variant of Interest', 'Evidence that it is the cause of an increased proportion of cases or unique outbreak clusters.');

-- --------------------------------------------------------

--
-- Table structure for table `c_variants`
--

CREATE TABLE `c_variants` (
  `variant_id` int NOT NULL,
  `variant_name` varchar(100) NOT NULL,
  `country_first_detected` varchar(100) NOT NULL,
  `date_first_detected` date NOT NULL,
  `description` varchar(5000) NOT NULL,
  `image` varchar(200) NOT NULL,
  `classification_id` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `c_variants`
--

INSERT INTO `c_variants` (`variant_id`, `variant_name`, `country_first_detected`, `date_first_detected`, `description`, `image`, `classification_id`) VALUES
(1, 'Alpha', 'United Kingdom', '2020-12-01', 'Alpha is considered to be fifty times more transmissible than the original Wuhan Covid-19 strain. Existing vaccines  have shown efficacy against Alpha.', 'alpha.png', 'VBM'),
(2, 'Delta', 'India', '2021-05-01', 'Delta variant is believed to be twice as contagious as the original SARS-CoV-2 strain from Wuhan and about 40 to 60 per cent more transmissible than Alpha.', 'delta.png', 'VOC'),
(3, 'Omicron', 'South Africa', '2021-11-01', 'Omicron is three times more transmissible than Delta and has a higher rate of reinfection. This variant is not causing as much severe disease as Delta. ', 'omicron.png', 'VOC'),
(4, 'Eta', 'Nigeria', '2021-02-01', 'The Eta variant was different from all other Covid-19 variants detected thus far as it contained two new mutations - E484K and F888L, that were previously unseen in other variants.', 'eta.png', 'VOI'),
(5, 'Zeta', 'Brasil', '2021-02-15', 'The Zeta variant harbors the E484K mutation. It evolved independently in Rio de Janeiro without being directly related to the Gamma variant from Manaus.', 'zeta.png', 'VOI'),
(6, 'Mu', 'Colombia', '2021-01-01', 'This variant contains mutations that may make it resistant against vaccines. The Mu genome has 21 mutations.', 'mu.png', 'VOHC'),
(7, 'Arcturus', 'India', '2023-02-01', 'It is similar in profile to previous omicron sub-variants, however an additional mutation in the spike protein could Ieave it potential for increased infectivity and pathogenicity', 'arcturus.png', 'VOHC');

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `question_id` int NOT NULL,
  `question_text` varchar(1000) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `correct_answer` varchar(255) DEFAULT NULL,
  `incorrect_answer1` varchar(255) DEFAULT NULL,
  `incorrect_answer2` varchar(255) DEFAULT NULL,
  `incorrect_answer3` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`question_id`, `question_text`, `category`, `correct_answer`, `incorrect_answer1`, `incorrect_answer2`, `incorrect_answer3`) VALUES
(1, 'The programming language \'Swift\' was created to replace what other programming language?', '15', 'Objective-C', 'C#', 'Ruby', 'C++'),
(2, 'Which computer hardware device provides an interface for all other connected devices to communicate?', '15', 'Motherboard', 'Central Processing Unit', 'Hard Disk Drive', 'Random Access Memory'),
(3, 'What does the computer software acronym JVM stand for?', '15', 'Java Virtual Machine', 'Java Vendor Machine', 'Java Visual Machine', 'Just Virtual Machine'),
(4, 'When Gmail first launched, how much storage did it provide for your email?', '15', '1GB', '512MB', '5GB', 'Unlimited'),
(5, 'Which programming language shares its name with an island in Indonesia?', '15', 'Java', 'Python', 'C', 'Jakarta'),
(6, 'Which of these is a type of monster found in Minecraft?', '15', 'Skeleton', 'Werewolf', 'Vampire', 'Minotaur'),
(7, 'Which of the following is not a faction in Tom Clancy\'s The Division?', '15', 'CDC', 'Cleaners', 'Last Man Batallion', 'Rikers'),
(8, 'Which of the following Zelda games did not feature Ganon as a final boss?', '15', 'Majora\'s Mask', 'Ocarina of Time', 'Skyward Sword', 'Breath of the Wild'),
(9, 'What year was the game \"Overwatch\" revealed?', '15', '2014', '2015', '2011', '2008'),
(10, 'Who created the \"Metal Gear\" Series?', '15', 'Hideo Kojima', 'Hiroshi Yamauchi', 'Shigeru Miyamoto', 'Gunpei Yokoi'),
(11, 'Who is the main protagonist in the game Life is Strange: Before The Storm?', '15', 'Chloe Price ', 'Max Caulfield', 'Rachel Amber', 'Frank Bowers'),
(12, 'What is the default alias that Princess Garnet goes by in Final Fantasy IX?', '15', 'Dagger', 'Dirk', 'Garnet', 'Quina'),
(13, 'Which of these is NOT a playable character in \"Left 4 Dead\"?', '15', 'Nick', 'Louis', 'Zoey', 'Bill'),
(14, 'Which of the following Elite Four members from the 6th Generation of Pokémon was a member of Team Flare?', '15', 'Malva', 'Siebold', 'Wikstrom', 'Drasna'),
(15, 'Which game did \"Sonic The Hedgehog\" make his first appearance in?', '15', 'Rad Mobile', 'Sonic The Hedgehog', 'Super Mario 64', 'Mega Man'),
(16, 'Gordon Freeman is said to have burnt and destroyed what food in the break room microwave?', '15', 'Casserole', 'Sub Sandwich', 'Chicken Soup', 'Pepperoni Pizza'),
(17, 'Which Pokemon generation did the fan-named \"Masuda Method\" first appear in? ', '15', 'Diamond/Pearl', 'Ruby/Sapphire', 'Black/White', 'X/Y'),
(18, 'What is the name of the 4-armed Chaos Witch from the 2016 video game \"Battleborn\"?', '15', 'Orendi', 'Orendoo', 'Oranda', 'Randy'),
(19, 'In what year was \"Antichamber\" released?', '15', '2013', '2012', '2014', '2011'),
(20, 'In the game Battleblock Theater, what was the name of the voice actor who voiced the narrator?', '15', 'Will Stamper', 'Steve Blum', 'Richard Epcar', 'Yuri Lowenthal'),
(21, 'In \"Fallout 4\" which faction is not present in the game?', '15', 'The Enclave', 'The Minutemen', 'The Brotherhood of Steel', 'The Institute'),
(22, 'In Portal 2, how did CEO of Aperture Science, Cave Johnson, presumably die?', '15', 'Moon Rock Poisoning', 'Accidentally sending a portal to the Moon', 'Slipped in the shower', 'Asbestos Poisoning'),
(23, 'Which of the following Pokemon Types was present in the original games, Red and Blue?', '15', 'Ice', 'Steel', 'Dark', 'Fairy'),
(24, 'What minimum level in the Defence skill is needed to equip Dragon Armour in the MMO RuneScape?', '15', '60', '65', '55', '70'),
(25, 'In \"Call Of Duty: Zombies\", what is the name of the Pack-A-Punched Crossbow?', '15', 'Awful Lawton', 'Longinus', 'V-R11', 'Predator'),
(26, 'The most graphically violent game to precede the creation of the ESRB (Entertainment Software Rating Board) was...', '15', 'Mortal Kombat', 'Duke Nukem', 'Resident Evil', 'Doom'),
(27, 'What language does Node.js use?', '18', 'JavaScript', 'Java', 'Java Source', 'Joomla Source Code'),
(28, 'Which company was established on April 1st, 1976 by Steve Jobs, Steve Wozniak and Ronald Wayne?', '18', 'Apple', 'Microsoft', 'Atari', 'Commodore'),
(29, 'The numbering system with a radix of 16 is more commonly referred to as ', '18', 'Hexidecimal', 'Binary', 'Duodecimal', 'Octal'),
(30, 'In any programming language, what is the most common way to iterate through an array?', '18', '\'For\' loops', '\'If\' Statements', '\'Do-while\' loops', '\'While\' loops'),
(31, 'When Gmail first launched, how much storage did it provide for your email?', '18', '1GB', '512MB', '5GB', 'Unlimited'),
(32, 'Which of the following Pokemon Types was present in the original games, Red and Blue?', '15', 'Ice', 'Steel', 'Dark', 'Fairy'),
(33, 'In Super Mario Bros., who informs Mario that the princess is in another castle?', '15', 'Toad', 'Luigi', 'Yoshi', 'Bowser'),
(34, 'In the game Dark Souls, what is the name of the region you\'re in for the majority of the game?', '15', 'Lordran', 'Drangleic', 'Oolacile', 'Catarina'),
(35, 'Who is the main protagonist in Danganronpa 2: Goodbye Despair?', '15', 'Hajime Hinata', 'Nagito Komaeda', 'Makoto Naegi', 'Junko Enoshima'),
(36, 'Which of the following was a map that was in Team Fortress 2 at launch?', '15', 'Gravel Pit', 'Hoodoo', 'Gold Rush', 'Upward'),
(37, 'In the video game, Half-life, what event started the Half-life universe as we know today?', '15', 'The Resonance Cascade', 'World War 3', 'The Xen Attack', 'The Black Mesa Nuke'),
(38, 'Who is the writer of the game \"Half-Life\"?', '15', 'Marc Laidlaw', 'Gabe Newell', 'Robin Walker', 'Chet Faliszek'),
(39, 'In the videogame Bully, what is the protagonist\'s last name?', '15', 'Hopkins', 'Smith', 'Kowalski', 'Crabblesnitch'),
(40, 'Who is the leader of Team Valor in Pokémon Go?', '15', 'Candela', 'Willow', 'Blanche', 'Spark'),
(41, 'Rocket League is a game which features..', '15', 'Cars', 'Helicopters', 'Planes', 'Submarines'),
(42, 'In what year was \"Metal Gear Solid\" released in North America?', '15', '1998', '1987', '2001', '2004'),
(43, 'Which of these characters is the mascot of the video game company SEGA?', '15', 'Sonic the Hedgehog', 'Dynamite Headdy', 'Alex Kidd', 'Opa-Opa'),
(44, 'In Pokemon, the ability Wonder Guard is exclusive to which Pokemon? ', '15', 'Shedinja ', 'Sableye', 'Spiritomb', 'Silvally '),
(45, 'In the Halo series, which era of SPARTAN is Master Chief? ', '15', 'SPARTAN-II', 'SPARTAN-I', 'SPARTAN-III', 'SPARTAN-IV'),
(46, 'How many times do you fight Gilgamesh in \"Final Fantasy 5\"?', '15', '6', '4', '5', '3'),
(47, 'In the game \"Fire Emblem: Shadow Dragon\", what is the central protagonist\'s name?', '15', 'Marth', 'Roy', 'Eliwood', 'Robin'),
(48, 'Who is the leader of Team Mystic in Pokémon Go?', '15', 'Blanche', 'Candela', 'Spark', 'Willow'),
(49, 'Which of 2 Valve Games are set in the same universe?', '15', 'Half-life and Portal', 'Portal and Left 4 Dead', 'Half-life and Left 4 Dead', 'Half-life and Counter Strike'),
(50, 'Which Animal Crossing game was for the Nintendo Wii?', '15', 'Animal Crossing: City Folk', 'Animal Crossing: New Leaf', 'Animal Crossing: Wild World', 'Animal Crossing: Population Growing!');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `username` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `total_score` int DEFAULT NULL,
  `is_admin` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`username`, `password`, `first_name`, `last_name`, `total_score`, `is_admin`) VALUES
('abc', '$2b$10$sno3NKlsGbevsKuiYbr7T./TeQFh2heCxF3G1JLTkNsS/RzWKB..q', 'Thomas', 'Wood', NULL, 1),
('admin', '$2b$10$e17uW4dV2RdHHTf0JIUD4eKOilYbU9altnCvnqdsKKSHFY7Fmgmxa', 'admin', 'admin', 0, 1),
('admin2', '$2b$10$JnOCGRbz2Svi0ZOGltcKpe.x7OMNoNognBSlKERW6uZ7GaNt86tVS', 'asdf', 'asdf', 0, 0),
('admin22', '$2b$10$B2rRuvgyiDy6EmnQOm4iV./HYqD0rmctrCflohYGYq.exi2DEbhIO', 'admin22', 'asdf', 0, 1),
('admin33', '$2b$10$EMiCpiJremP/JflTvF1cdOA3nf7IUYpYS8MMeAGneR6n.utvQFpby', 'admin33', 'asdf', 0, 1),
('admin4', '$2b$10$jUtD0iO83hHXqcAVklwgUeCUJISvmu1sOXrmJEtWR3r30zVCTwAva', 'admin4', 'asdf', 0, 0),
('admin5', '$2b$10$Hfho7Df.Sy25LisYCPyvBe08FtWND9jXB9iUCKf5lbtUbti6EiiXm', 'admin', 'asdf', 0, 0),
('admin7', '$2b$10$NaGm.XixfBavEJBBRfuN..WGw1ymGn.vvsjfduPm91wfCrGlrMium', 'admin7', 'asdf', 0, 1),
('drlara', '$2b$10$se0x/DalayhVR3GyhFpmlOLOm3rxExbBVV5tSEnsPV7kfM0hLHidK', 'Dr', 'Lara', 0, 1),
('newuser', 'newpassword', 'UpdatedFirstName', 'User', 0, 0),
('test1', '$2b$10$78IbVqmNbZ2VF5Qpj7AJ9OAGAwMCsaaOjLszMlcYnbI.j/KfOF8T.', 'test', 'test', NULL, NULL),
('testuser', '$2b$10$m8I7X3CFRAQEI47nH.LQXeIffjV01vCTbRcoB8kdJxV43MnvMm/Jm', 'testuser', 'user', NULL, 1),
('testuser1', '$2b$10$M2/zGQXZHYQd3QIE4ud5Ee.uI6yD6Z2/JXHv.CmrhWP1Z7ark2Kp6', 'Thomas', '', 0, 1),
('testuser2', '$2b$10$htJZBt/wNBeqmJeY1yECvOr5wKcXmSwaGIcHoAaQI4IYTUlqcvKEm', 'testuser2', 'testuser2', 0, 1),
('testuser3', '$2b$10$ZJrzYla7kDyQWRR70v/92et1Q5IFQY1x.3kN2b33hybThY8Jw05jq', 'Benjamin', 'Buttons', 0, NULL),
('testuser4', '$2b$10$FalS0GEW/K0ejadtH/abEey9rHhhy/o4un8lkNmety5s1ekXVJkmm', 'Benjamin', 'No', 0, 1),
('testuser5', '$2b$10$ciWaZ2vT1beA5Cuoc1CqH.T3vaih5YBHxsy0uObi1wtQ6rFfdMm/C', 'Joe', 'Smith', 0, 0),
('Thebestest', '$2b$10$gnWWS7VhPQ1cgcq4aNs8.ujScmYrk.qZFFX5JggjGkOaFgWBP292a', 'The', 'Bestest', 0, 0),
('user21', '$2b$10$r3NQTib8WN1ROHEoAgrUa.e8Ia04HLKkgKInlp21F/rAHfP6dncMS', 'asdfasdf', 'asdf', 0, 0),
('user244', '$2b$10$rPWrfpOPI9pt0yPaN8nhpeZZiV17.DOiOzlp802o89OVa3QWC5noC', 'asdfasdf', 'asdffdas', 0, 0),
('user333', '$2b$10$cd8CZT9Bqndzd5WuTIrujubzU0m8MN/q2xeKq9jt5yxMUvThAItoy', 'user334', 'asdf', 0, 0),
('user37', '$2b$10$P7uOVhhCgMBn1/p2B1XCU.uZ7rtBs128UuMaFNm4p7p6fD5BkJP96', 'Tyler', 'adfsdf', 0, 0),
('user444', '$2b$10$Jbug6nBhegGiuCn4Tk.rMuembqx9WRR/5aZpU4cpJTf36SiCoVcXi', 'Tyler', 'asdf', 0, 0),
('user55', '$2b$10$kEMwjBGXhH0fetLlbRNneO03Y/Sz4cGhn2ZACRIKFIirP1HAkSpEu', 'user5', 'asdf', 0, NULL),
('user555', '$2b$10$XFKrUn83pbhPBowKVT7Ca.EpRu8b/2EWS6/hKjgvSWEsfUy23E9Be', 'user556', 'asdf', 0, 0),
('user66', '$2b$10$3YyPoUPJ3tq88v.q96cSW.QmPfyIUgw38TAZDM.2ycV2JdFq8SbXW', 'user66', 'asdf', 0, 0),
('user77', '$2b$10$Z4oOFZ.AFwUO0/Nw2bxHKescUgWQMJjBLqyVma1CVkbfRz.FojFUq', 'user777', 'asdffdsa', 0, 0),
('user88', '$2b$10$3uX30EIzC2ZJsBb0bgo93ujd5LJAfV1HkNvg/0nUF7Hls1nD3jHse', 'user99', 'user88', 0, 0),
('user99', '$2b$10$7w9DeMNUTNPVqKRlgVx7muycJ5WI8J.cXf6CnvE3IZZ/vF9Jcgd5.', 'user999', 'asdf', 0, 0),
('usertester', '$2b$10$F3yykFbzEuz2zjptVQHsxe6tu7pNOqbLkRDC8YBT599tfJWP9c7vS', 'Thomas', 'Wood', 0, 0),
('zach', '$2b$10$99hEkE4J8CUrLEoEAyOLwOY0SQGKFzAvnDvb.VldIZAi6BxZDAH3m', 'zach', '', 0, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `correct_answers`
--
ALTER TABLE `correct_answers`
  ADD KEY `loginId` (`username`),
  ADD KEY `correct_answers_ibfk_1` (`question_id`);

--
-- Indexes for table `c_classification`
--
ALTER TABLE `c_classification`
  ADD PRIMARY KEY (`classification_id`);

--
-- Indexes for table `c_variants`
--
ALTER TABLE `c_variants`
  ADD PRIMARY KEY (`variant_id`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`question_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `c_variants`
--
ALTER TABLE `c_variants`
  MODIFY `variant_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `question_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `correct_answers`
--
ALTER TABLE `correct_answers`
  ADD CONSTRAINT `correct_answers_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `questions` (`question_id`),
  ADD CONSTRAINT `correct_answers_ibfk_2` FOREIGN KEY (`username`) REFERENCES `users` (`username`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
