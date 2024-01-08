-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3325
-- Generation Time: Jan 08, 2024 at 07:13 PM
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
  `last_login` varchar(30) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1 COMMENT '0 - delete\r\n1 - new\r\n2 - activate\r\n3 - deactivate',
  `type` int(11) NOT NULL COMMENT '0 - admin\r\n1 - employee',
  `acc_created` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `adm`
--

INSERT INTO `adm` (`id`, `first_name`, `last_name`, `user_name`, `pass_word`, `address`, `dob`, `gender`, `date_time`, `last_login`, `status`, `type`, `acc_created`) VALUES
(17, 'Kavi', 'Kumar', 'kavi@gmail.com', '$1$4$6Z4CCz8N7S9Ac.QyQHwN7/', 'Mumbai', '2023-11-07', 'male', '2024-01-07 18:06:15', '2023-11-15 05:26:01', 2, 0, '2023-08-20 10:30:37'),
(18, 'Kshitij', 'Naik', 'kshitij@gmail.com', '$1$4$6Z4CCz8N7S9Ac.QyQHwN7/', 'Goa', '2001-01-01', 'male', '2024-01-07 18:07:18', '2024-01-07 22:19:46', 2, 0, '2023-08-20 11:35:20'),
(20, 'Vijay', 'Shah', 'vijay@gmail.com', '$1$4$b2m8/JQITYFtj7hf9w3iW/', 'Delhi', '2001-01-10', 'male', '2024-01-07 18:07:33', '2023-11-16 05:26:01', 3, 0, '2023-08-20 12:36:30'),
(21, 'Rohan', 'Manik', 'rohan@gmail.com', '$1$4$b2m8/JQITYFtj7hf9w3iW/', 'Mangalore', '2001-01-29', 'male', '2024-01-07 18:07:49', '2023-11-17 05:26:01', 0, 0, '2023-08-20 14:37:37'),
(22, 'Daniel', 'Jones', 'dan@gmail.com', '$1$4$FVNjk5rzaAs4o3HoloHy8/', 'Panjim', '2001-02-08', 'male', '2024-01-07 18:08:03', '2023-11-18 05:26:01', 2, 0, '2023-08-20 15:38:25'),
(23, 'Sohan', 'Kumar', 'sohan@gmail.com', '$1$4$FVNjk5rzaAs4o3HoloHy8/', 'Surat', '2001-02-18', 'male', '2024-01-07 18:08:32', '2023-11-19 05:26:01', 3, 0, ' 2023-08-20 16:39:18'),
(24, 'Karthik', 'Sharma', 'kk@kk.kk', '$1$4$6Z4CCz8N7S9Ac.QyQHwN7/', 'Chennai', '2001-02-18', 'male', '2024-01-07 23:02:13', '2024-01-08 04:32:13', 1, 0, '2023-11-30 16:39:12'),
(25, 'Vibhav ', 'Borkar', 'vi@vi.vi', '$1$4$6Z4CCz8N7S9Ac.QyQHwN7/', 'Pune', '2002-02-28', 'male', '2024-01-07 17:57:37', '2023-11-24 05:26:01', 1, 0, '2023-11-31 17:25:23'),
(27, 'Sahil', 'S', 'ss@ss.ss', '$1$4$6Z4CCz8N7S9Ac.QyQHwN7/', 'wdhcvw', '2024-01-01', 'male', '2024-01-07 22:21:34', '2024-01-07 22:04:29', 1, 0, '2024-01-06 20:58:14'),
(28, 'hbvjevefvt', 'brgb gr', 'vn@fe.ff', '$1$4$6Z4CCz8N7S9Ac.QyQHwN7/', 'hefbvj', '2024-01-02', 'male', '2024-01-07 22:43:32', '2024-01-08 04:13:32', 1, 0, '2024-01-08 04:13:32'),
(29, 'fyurv', 'crw', 'aaa@aa.a', '$1$4$6Z4CCz8N7S9Ac.QyQHwN7/', 'ygbu', '2024-01-01', 'male', '2024-01-07 22:45:14', '2024-01-08 04:15:13', 2, 0, '2024-01-08 04:14:47');

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
(16, 'Jane', 'mailabc7@gmail.com', 'subject7', 'Ultrices gravida dictum fusce ut. Libero justo laoreet sit amet cursus sit amet.', '2024-01-07 15:19:45', 2),
(17, 'Emily', 'mailabc8@gmail.com', 'subject8', 'Ultrices gravida dictum fusce ut. Libero justo laoreet sit amet cursus sit amet.', '2023-08-24 00:41:07', 1),
(18, 'Olivia', 'mailabc9@gmail.com', 'subject9', 'Ultrices gravida dictum fusce ut. Libero justo laoreet sit amet cursus sit amet.', '2023-08-24 00:41:07', 1),
(19, 'Olivia', 'mailabc10@gmail.com', 'subject10', 'Ultrices gravida dictum fusce ut. Libero justo laoreet sit amet cursus sit amet.', '2023-08-24 00:41:07', 1),
(20, 'Sarah', 'mailabc11@gmail.com', 'subject11', 'Ultrices gravida dictum fusce ut. Libero justo laoreet sit amet cursus sit amet.', '2023-09-24 00:41:07', 1),
(21, 'Amelia', 'mailabc12@gmail.com', 'subject12', 'Ultrices gravida dictum fusce ut. Libero justo laoreet sit amet cursus sit amet.', '2023-12-22 07:32:19', 2),
(22, 'Jessica', 'mailabc13@gmail.com', 'subject13', 'Ultrices gravida dictum fusce ut. Libero justo laoreet sit amet cursus sit amet.', '2023-10-24 00:41:07', 1),
(23, 'Emma', 'mailabc14@gmail.com', 'subject14', 'Ultrices gravida dictum fusce ut. Libero justo laoreet sit amet cursus sit amet.', '2023-11-24 00:41:07', 1),
(24, 'Ethan', 'mailabc15@gmail.com', 'subject15', 'Ultrices gravida dictum fusce ut. Libero justo laoreet sit amet cursus sit amet.', '2023-11-24 00:41:07', 1),
(25, 'Mohammed', 'mailabc16@gmail.com', 'subject16', 'Ultrices gravida dictum fusce ut. Libero justo laoreet sit amet cursus sit amet.', '2023-11-24 00:41:07', 1),
(26, 'James', 'mailabc17@gmail.com', 'subject17', 'Ultrices gravida dictum fusce ut. Libero justo laoreet sit amet cursus sit amet.', '2023-11-24 00:41:07', 1),
(27, 'Amelia', 'mailabc18@gmail.com', 'subject18', 'Ultrices gravida dictum fusce ut. Libero justo laoreet sit amet cursus sit amet.', '2024-01-07 14:58:45', 2),
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
