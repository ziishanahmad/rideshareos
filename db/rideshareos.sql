-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 22, 2021 at 08:46 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.3.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rideshareos`
--

-- --------------------------------------------------------

--
-- Table structure for table `drivers`
--

CREATE TABLE `drivers` (
  `driver_id` int(11) NOT NULL,
  `email` varchar(255) COLLATE utf8_bin NOT NULL,
  `phone` varchar(20) COLLATE utf8_bin NOT NULL,
  `password` varchar(255) COLLATE utf8_bin NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `driver_current_location`
--

CREATE TABLE `driver_current_location` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `latitude` varchar(50) COLLATE utf8_bin NOT NULL,
  `longitude` varchar(50) COLLATE utf8_bin NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `driver_location_log`
--

CREATE TABLE `driver_location_log` (
  `driver_location_log_id` int(11) NOT NULL,
  `driver_id` int(11) NOT NULL,
  `latitude` float NOT NULL,
  `longitude` float NOT NULL,
  `is_in_ride` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `driver_statuses`
--

CREATE TABLE `driver_statuses` (
  `driver_status_id` int(3) NOT NULL,
  `driver_status_name` varchar(100) COLLATE utf8_bin NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `driver_statuses`
--

INSERT INTO `driver_statuses` (`driver_status_id`, `driver_status_name`, `created_at`, `updated_at`) VALUES
(1, 'offline', '2021-09-21 14:11:03', '2021-09-21 14:11:03'),
(2, 'online', '2021-09-21 14:11:03', '2021-09-21 14:11:03'),
(3, 'pre-ride', '2021-09-21 14:11:21', '2021-09-21 14:11:21'),
(4, 'in-ride', '2021-09-21 14:11:21', '2021-09-21 14:11:21');

-- --------------------------------------------------------

--
-- Table structure for table `driver_statuses_logs`
--

CREATE TABLE `driver_statuses_logs` (
  `driver_statuses_log_id` int(11) NOT NULL,
  `ride_request_id` int(11) NOT NULL,
  `driver_status_id` int(3) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `passengers`
--

CREATE TABLE `passengers` (
  `passenger_id` int(11) NOT NULL,
  `email` varchar(255) COLLATE utf8_bin NOT NULL,
  `phone` varchar(20) COLLATE utf8_bin NOT NULL,
  `password` varchar(255) COLLATE utf8_bin NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `passenger_current_location`
--

CREATE TABLE `passenger_current_location` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `latitude` varchar(50) COLLATE utf8_bin NOT NULL,
  `longitude` varchar(50) COLLATE utf8_bin NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `passenger_location_log`
--

CREATE TABLE `passenger_location_log` (
  `passenger_location_log_id` int(11) NOT NULL,
  `passenger_id` int(11) NOT NULL,
  `latitude` float NOT NULL,
  `longitude` float NOT NULL,
  `is_in_ride` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `passenger_statuses`
--

CREATE TABLE `passenger_statuses` (
  `passenger_status_id` int(3) NOT NULL,
  `passenger_status_name` varchar(100) COLLATE utf8_bin NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `passenger_statuses`
--

INSERT INTO `passenger_statuses` (`passenger_status_id`, `passenger_status_name`, `created_at`, `updated_at`) VALUES
(1, 'offline', '2021-09-21 14:15:06', '2021-09-21 14:15:06'),
(2, 'online', '2021-09-21 14:15:06', '2021-09-21 14:15:06'),
(3, 'looking_for_driver', '2021-09-21 14:15:06', '2021-09-21 14:15:06'),
(4, 'waiting_for_driver', '2021-09-21 14:15:06', '2021-09-21 14:15:06'),
(5, 'in-ride', '2021-09-21 14:15:58', '2021-09-21 14:15:58');

-- --------------------------------------------------------

--
-- Table structure for table `passenger_statuses_logs`
--

CREATE TABLE `passenger_statuses_logs` (
  `passenger_statuses_log_id` int(11) NOT NULL,
  `ride_request_id` int(11) NOT NULL,
  `passenger_status_id` int(3) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `ride_location_log`
--

CREATE TABLE `ride_location_log` (
  `ride_location_log_id` int(11) NOT NULL,
  `ride_request_id` int(11) NOT NULL,
  `latitude` float NOT NULL,
  `longitude` float NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `ride_requests`
--

CREATE TABLE `ride_requests` (
  `ride_request_id` int(11) NOT NULL,
  `passenger_id` int(11) NOT NULL,
  `driver_id` int(11) NOT NULL,
  `pickup_latitude` varchar(100) COLLATE utf8_bin NOT NULL,
  `pickup_longitude` varchar(100) COLLATE utf8_bin NOT NULL,
  `dropoff_latitude` varchar(100) COLLATE utf8_bin NOT NULL,
  `dropoff_longitude` varchar(100) COLLATE utf8_bin NOT NULL,
  `is_scheduled` int(1) NOT NULL DEFAULT 0,
  `scheduled_time` datetime NOT NULL,
  `ride_status_id` int(3) NOT NULL,
  `passenger_status_id` int(3) NOT NULL,
  `driver_status_id` int(3) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `ride_statuses`
--

CREATE TABLE `ride_statuses` (
  `ride_status_id` int(3) NOT NULL,
  `ride_status_name` varchar(100) COLLATE utf8_bin NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `ride_statuses`
--

INSERT INTO `ride_statuses` (`ride_status_id`, `ride_status_name`, `created_at`, `updated_at`) VALUES
(1, 'request_initiated', '2021-09-21 14:17:00', '2021-09-21 14:17:00'),
(2, 'accepted_by_driver', '2021-09-21 14:17:00', '2021-09-21 14:17:00'),
(3, 'pre-ride', '2021-09-21 14:18:30', '2021-09-21 14:18:30'),
(4, 'in-ride', '2021-09-21 14:18:30', '2021-09-21 14:18:30'),
(5, 'billing-completed', '2021-09-21 14:19:06', '2021-09-21 14:19:06'),
(6, 'ride-ended', '2021-09-21 14:19:06', '2021-09-21 14:19:06'),
(7, 'canceled_by_driver', '2021-09-21 17:38:27', '2021-09-21 17:38:27'),
(8, 'canceled_by_passenger', '2021-09-21 17:38:27', '2021-09-21 17:38:27');

-- --------------------------------------------------------

--
-- Table structure for table `ride_statuses_logs`
--

CREATE TABLE `ride_statuses_logs` (
  `ride_statuses_log_id` int(11) NOT NULL,
  `ride_request_id` int(11) NOT NULL,
  `ride_status_id` int(3) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `drivers`
--
ALTER TABLE `drivers`
  ADD PRIMARY KEY (`driver_id`);

--
-- Indexes for table `driver_current_location`
--
ALTER TABLE `driver_current_location`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `driver_location_log`
--
ALTER TABLE `driver_location_log`
  ADD PRIMARY KEY (`driver_location_log_id`);

--
-- Indexes for table `driver_statuses`
--
ALTER TABLE `driver_statuses`
  ADD PRIMARY KEY (`driver_status_id`);

--
-- Indexes for table `driver_statuses_logs`
--
ALTER TABLE `driver_statuses_logs`
  ADD PRIMARY KEY (`driver_statuses_log_id`);

--
-- Indexes for table `passengers`
--
ALTER TABLE `passengers`
  ADD PRIMARY KEY (`passenger_id`);

--
-- Indexes for table `passenger_current_location`
--
ALTER TABLE `passenger_current_location`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `passenger_location_log`
--
ALTER TABLE `passenger_location_log`
  ADD PRIMARY KEY (`passenger_location_log_id`);

--
-- Indexes for table `passenger_statuses`
--
ALTER TABLE `passenger_statuses`
  ADD PRIMARY KEY (`passenger_status_id`);

--
-- Indexes for table `passenger_statuses_logs`
--
ALTER TABLE `passenger_statuses_logs`
  ADD PRIMARY KEY (`passenger_statuses_log_id`);

--
-- Indexes for table `ride_location_log`
--
ALTER TABLE `ride_location_log`
  ADD PRIMARY KEY (`ride_location_log_id`);

--
-- Indexes for table `ride_requests`
--
ALTER TABLE `ride_requests`
  ADD PRIMARY KEY (`ride_request_id`);

--
-- Indexes for table `ride_statuses`
--
ALTER TABLE `ride_statuses`
  ADD PRIMARY KEY (`ride_status_id`);

--
-- Indexes for table `ride_statuses_logs`
--
ALTER TABLE `ride_statuses_logs`
  ADD PRIMARY KEY (`ride_statuses_log_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `drivers`
--
ALTER TABLE `drivers`
  MODIFY `driver_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `driver_current_location`
--
ALTER TABLE `driver_current_location`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `driver_location_log`
--
ALTER TABLE `driver_location_log`
  MODIFY `driver_location_log_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `driver_statuses`
--
ALTER TABLE `driver_statuses`
  MODIFY `driver_status_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `driver_statuses_logs`
--
ALTER TABLE `driver_statuses_logs`
  MODIFY `driver_statuses_log_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `passengers`
--
ALTER TABLE `passengers`
  MODIFY `passenger_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `passenger_current_location`
--
ALTER TABLE `passenger_current_location`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `passenger_location_log`
--
ALTER TABLE `passenger_location_log`
  MODIFY `passenger_location_log_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `passenger_statuses`
--
ALTER TABLE `passenger_statuses`
  MODIFY `passenger_status_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `passenger_statuses_logs`
--
ALTER TABLE `passenger_statuses_logs`
  MODIFY `passenger_statuses_log_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ride_location_log`
--
ALTER TABLE `ride_location_log`
  MODIFY `ride_location_log_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ride_requests`
--
ALTER TABLE `ride_requests`
  MODIFY `ride_request_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ride_statuses`
--
ALTER TABLE `ride_statuses`
  MODIFY `ride_status_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `ride_statuses_logs`
--
ALTER TABLE `ride_statuses_logs`
  MODIFY `ride_statuses_log_id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
