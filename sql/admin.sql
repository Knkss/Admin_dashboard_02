-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3325
-- Generation Time: Dec 07, 2023 at 06:06 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `admin`
--

-- --------------------------------------------------------

--
-- Table structure for table `adm`
--

CREATE TABLE `adm` (
  `id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `pass_word` varchar(50) NOT NULL,
  `address` text NOT NULL,
  `dob` varchar(15) NOT NULL,
  `gender` varchar(15) NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `last_login` varchar(20) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1 COMMENT '0 - delete\r\n1 - new\r\n2 - activate\r\n3 - deactivate',
  `type` int(11) NOT NULL COMMENT '1 - admin\r\n2 - employee'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `adm`
--

INSERT INTO `adm` (`id`, `first_name`, `last_name`, `user_name`, `pass_word`, `address`, `dob`, `gender`, `date_time`, `last_login`, `status`, `type`) VALUES
(17, 'Kavi', 'Kumar', 'kavi@gmail.com', '$1$4$6Z4CCz8N7S9Ac.QyQHwN7/', 'Mumbai', '2023-11-07', 'male', '2023-12-07 17:02:37', '2023-11-15 05:26:01', 1, 0),
(18, 'Kshitij', 'Naik', 'kshitijnaik@gmail.com', '$1$4$6Z4CCz8N7S9Ac.QyQHwN7/', 'Goa', '2001-01-01', 'male', '2023-08-12 04:27:53', '2023-11-24 05:26:01', 1, 0),
(20, 'Vijay', 'Shah', 'vv@vv.vv', '$1$4$b2m8/JQITYFtj7hf9w3iW/', 'Delhi', '2001-01-10', 'male', '2023-09-20 04:28:24', '2023-11-16 05:26:01', 3, 0),
(21, 'Rohan', 'Manik', 'rr@rr.rr', '$1$4$b2m8/JQITYFtj7hf9w3iW/', 'Mangalore', '2001-01-29', 'male', '2023-09-24 04:36:40', '2023-11-17 05:26:01', 0, 0),
(22, 'Daniel', 'Jones', 'jj@jj.jj', '$1$4$FVNjk5rzaAs4o3HoloHy8/', 'Panjim', '2001-02-08', 'male', '2023-10-24 04:29:01', '2023-11-18 05:26:01', 1, 0),
(23, 'Sohan', 'Kumar', 'ss@ss.ss', '$1$4$FVNjk5rzaAs4o3HoloHy8/', 'Surat', '2001-02-18', 'male', '2023-10-24 04:29:10', '2023-11-19 05:26:01', 3, 0),
(24, 'Karthik', 'Sharma', 'kk@kk.kk', '$1$4$6Z4CCz8N7S9Ac.QyQHwN7/', 'Chennai', '2001-02-18', 'male', '2023-11-24 04:29:19', '2023-11-20 05:26:01', 1, 0),
(25, 'Vibhav ', 'Borkar', 'vi@vi.vi', '$1$4$6Z4CCz8N7S9Ac.QyQHwN7/', 'Pune', '2002-02-28', 'male', '2023-12-07 17:00:31', '2023-11-24 05:26:01', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `subject` varchar(200) NOT NULL,
  `message` text NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` int(2) NOT NULL DEFAULT 1 COMMENT '0: deleted\r\n1:new\r\n2: activated\r\n3: deactivated'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`id`, `name`, `email`, `subject`, `message`, `date_time`, `status`) VALUES
(5, 'D\' Souza', 'abc@yahoo.com', 'To be renewed', 'Orders to be booked. Want to contact.', '2023-01-24 00:23:55', 2),
(6, 'D\' Souza', 'xyz@gmail.com', 'To be contacted', 'Urgent meeting required', '2023-01-24 00:24:39', 0),
(7, 'Kartik', 'knk@gmail.com', 'Urgent Request', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua', '2023-02-24 00:28:26', 1),
(8, 'Sam', 'ksk@gmail.com', 'Urgent Meeting', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua', '2023-03-24 00:28:37', 1),
(9, 'ewcecwe', 'wcew@jr.vvf', 'ewcwevcew', 'wcqecewcew', '2023-03-24 00:37:31', 1),
(10, 'John', 'mailabc1@gmail.com', 'subject1', 'Ultrices gravida dictum fusce ut. Libero justo laoreet sit amet cursus sit amet.', '2023-03-24 00:41:06', 1),
(11, 'Olivia', 'mailabc2@gmail.com', 'subject2', 'Ultrices gravida dictum fusce ut. Libero justo laoreet sit amet cursus sit amet.', '2023-04-24 00:41:06', 1),
(12, 'Mohammed', 'mailabc3@gmail.com', 'subject3', 'Ultrices gravida dictum fusce ut. Libero justo laoreet sit amet cursus sit amet.', '2023-04-24 00:41:06', 1),
(13, 'Olivia', 'mailabc4@gmail.com', 'subject4', 'Ultrices gravida dictum fusce ut. Libero justo laoreet sit amet cursus sit amet.', '2023-05-24 00:41:06', 1),
(14, 'Olivia', 'mailabc5@gmail.com', 'subject5', 'Ultrices gravida dictum fusce ut. Libero justo laoreet sit amet cursus sit amet.', '2023-06-24 00:41:07', 1),
(15, 'Michael', 'mailabc6@gmail.com', 'subject6', 'Ultrices gravida dictum fusce ut. Libero justo laoreet sit amet cursus sit amet.', '2023-06-24 00:41:07', 1),
(16, 'Jane', 'mailabc7@gmail.com', 'subject7', 'Ultrices gravida dictum fusce ut. Libero justo laoreet sit amet cursus sit amet.', '2023-07-24 00:41:07', 1),
(17, 'Emily', 'mailabc8@gmail.com', 'subject8', 'Ultrices gravida dictum fusce ut. Libero justo laoreet sit amet cursus sit amet.', '2023-08-24 00:41:07', 1),
(18, 'Olivia', 'mailabc9@gmail.com', 'subject9', 'Ultrices gravida dictum fusce ut. Libero justo laoreet sit amet cursus sit amet.', '2023-08-24 00:41:07', 1),
(19, 'Olivia', 'mailabc10@gmail.com', 'subject10', 'Ultrices gravida dictum fusce ut. Libero justo laoreet sit amet cursus sit amet.', '2023-08-24 00:41:07', 1),
(20, 'Sarah', 'mailabc11@gmail.com', 'subject11', 'Ultrices gravida dictum fusce ut. Libero justo laoreet sit amet cursus sit amet.', '2023-09-24 00:41:07', 1),
(21, 'Amelia', 'mailabc12@gmail.com', 'subject12', 'Ultrices gravida dictum fusce ut. Libero justo laoreet sit amet cursus sit amet.', '2023-10-24 00:41:07', 1),
(22, 'Jessica', 'mailabc13@gmail.com', 'subject13', 'Ultrices gravida dictum fusce ut. Libero justo laoreet sit amet cursus sit amet.', '2023-10-24 00:41:07', 1),
(23, 'Emma', 'mailabc14@gmail.com', 'subject14', 'Ultrices gravida dictum fusce ut. Libero justo laoreet sit amet cursus sit amet.', '2023-11-24 00:41:07', 1),
(24, 'Ethan', 'mailabc15@gmail.com', 'subject15', 'Ultrices gravida dictum fusce ut. Libero justo laoreet sit amet cursus sit amet.', '2023-11-24 00:41:07', 1),
(25, 'Mohammed', 'mailabc16@gmail.com', 'subject16', 'Ultrices gravida dictum fusce ut. Libero justo laoreet sit amet cursus sit amet.', '2023-11-24 00:41:07', 1),
(26, 'James', 'mailabc17@gmail.com', 'subject17', 'Ultrices gravida dictum fusce ut. Libero justo laoreet sit amet cursus sit amet.', '2023-11-24 00:41:07', 1),
(27, 'Amelia', 'mailabc18@gmail.com', 'subject18', 'Ultrices gravida dictum fusce ut. Libero justo laoreet sit amet cursus sit amet.', '2023-11-24 00:41:07', 1),
(28, 'Olivia', 'mailabc19@gmail.com', 'subject19', 'Ultrices gravida dictum fusce ut. Libero justo laoreet sit amet cursus sit amet.', '2023-11-24 00:41:07', 1),
(29, 'Ethan', 'mailabc20@gmail.com', 'subject20', 'Ultrices gravida dictum fusce ut. Libero justo laoreet sit amet cursus sit amet.', '2023-11-24 00:41:07', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adm`
--
ALTER TABLE `adm`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `adm`
--
ALTER TABLE `adm`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
