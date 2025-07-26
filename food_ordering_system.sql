SET GLOBAL sql_mode = '';
CREATE TABLE `order_details` (
`customer_first_name` varchar(30)
,`menu_id` int(11)
,`menu_name` varchar(100)
);


CREATE TABLE `tblcustomer` (
  `customer_id` int(11) NOT NULL,
  `customer_first_name` varchar(30) NOT NULL,
  `customer_last_name` varchar(30) NOT NULL,
  `customer_email` varchar(50) NOT NULL,
  `customer_phone_number` varchar(15) NOT NULL,
  `customer_username` varchar(30) NOT NULL,
  `customer_password` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO `tblcustomer` (`customer_id`, `customer_first_name`, `customer_last_name`, `customer_email`, `customer_phone_number`, `customer_username`, `customer_password`) VALUES
(1, 'Ishani', 'Bhat', 'ishanibhat4@gmail.com', '9980456245', 'ishani_bhat4', 'ilovefood'),
(2, 'Ayesha', 'Bhatt', 'ayesha@gmail.com', '8937461290', 'ayesha5', 'quwy3'),
(3, 'Rohan', 'Singh', 'rohan@gmail.com', '7384625416', 'rohan3', 'hude4'),
(4, 'Rhysand', 'Archaeron', 'Rhys_Feyre', '1234567890', 'night_court', 'aijeyb5'),
(5, 'Feyre', 'Archaeron', 'feyre@yahoo.com', '9980456249', 'feyre5', 'hbdyuegryg7');




CREATE TABLE `tblmenu` (
  `menu_id` int(11) NOT NULL,
  `menu_name` varchar(100) NOT NULL,
  `price` float NOT NULL,
  `menu_type_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblmenu`
--

INSERT INTO `tblmenu` (`menu_id`, `menu_name`, `price`, `menu_type_id`) VALUES
(1, 'Idly', 15, 1),
(2, 'Masala Dosa', 30, 1),
(3, 'Poha', 40, 1),
(4, 'Pulav', 60, 2),
(5, 'Fried Rice', 80, 2),
(6, 'South Indian Meals', 100, 2),
(7, 'Samosa', 15, 3),
(8, 'Jalebi ', 20, 3),
(9, 'Naan and Paneer Butter Masaala', 200, 4),
(10, 'North Indian Meals', 200, 4),
(11, 'Veg Biryani', 120, 4);

-- --------------------------------------------------------

--
-- Table structure for table `tblmenutype`
--

CREATE TABLE `tblmenutype` (
  `menu_type_id` int(11) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblmenutype`
--

INSERT INTO `tblmenutype` (`menu_type_id`, `description`) VALUES
(1, 'Breakfast-To be served in the morning, not beyond 11 AM.'),
(2, 'Lunch-To be served in the afternoon, not beyond 3 PM.'),
(3, 'Snacks-To be served in the evening, not beyond 7 PM.'),
(4, 'Dinner-To be served at night, not beyond 10 PM.');

-- --------------------------------------------------------

--
-- Table structure for table `tblorder`
--

CREATE TABLE `tblorder` (
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `order_date` date NOT NULL,
  `order_time` datetime,
  `menu_type_id` int(11) DEFAULT NULL,
  `menu_id` int(11) DEFAULT NULL,
  `processed_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblorder`
--

INSERT INTO `tblorder` (`order_id`, `customer_id`, `order_date`, `order_time`, `menu_type_id`, `menu_id`, `processed_by`) VALUES
(1, 5, '2022-11-02', '2022-11-02 21:06:24', 2, 4, 6),
(2, 4, '2022-11-02', '2022-11-02 20:06:24', 2, 4, 4),
(3, 2, '2022-11-28', NULL, 3, 7, 3),
(4, 3, '2022-11-28', NULL, 1, 2, 1),
(5, 3, '2022-11-28', '2022-11-28 14:03:23', 3, 8, 4),
(6, 2, '2022-11-28', '2022-11-28 15:59:20', 4, 10, 3),
(7, 3, '2022-11-29', '2022-11-29 04:48:28', 1, 1, 6),
(8, 5, '2022-11-29', '2022-11-29 09:27:58', 2, 6, 5),
(9, 5, '2022-11-29', '2022-11-29 14:38:12', 2, 5, 5),
(10, 5, '2022-11-29', '2022-11-29 22:20:25', 4, 10, 6),
(11, 1, '2022-11-30', '2022-11-30 10:35:58', 1, 5, 1),
(12, 4, '2022-11-30', '2022-11-30 12:53:56', 2, 5, 4);

-- Table structure for table `tblpayment`
--

CREATE TABLE `tblpayment` (
  `payment_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `amount` float NOT NULL,
  `processed_by` int(11) NOT NULL,
  `menu_id1` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblpayment`
--

INSERT INTO `tblpayment` (`payment_id`, `order_id`, `amount`, `processed_by`, `menu_id1`) VALUES
(1, 1, 240, 1, NULL),
(2, 2, 200, 4, NULL),
(3, 3, 15, 2, NULL),
(4, 4, 30, 1, 2),
(5, 5, 20, 4, 8),
(6, 6, 200, 4, 9),
(7, 7, 15, 6, 1),
(8, 8, 100, 5, 6),
(9, 9, 80, 5, 5),
(10, 10, 200, 6, 10);

-- --------------------------------------------------------

--
-- Table structure for table `tbluser`
--

CREATE TABLE `tbluser` (
  `user_id` int(11) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `contact` varchar(50) NOT NULL,
  `email_address` varchar(50) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbluser`
--

INSERT INTO `tbluser` (`user_id`, `full_name`, `contact`, `email_address`, `username`, `password`) VALUES
(1, 'Harshitha', '7895426987', 'harshitha@gmail.com', 'harshitha_1', 'hdeyt67'),
(2, 'Anisha ', '8745912385', 'anisha@gmail.com', 'anisha5', 'hduet67'),
(3, 'Karthik', '9257489638', 'karthik89@gmail.com', 'karthik6', 'jihurt8'),
(4, 'Dhruva', '9548793254', 'dhruva5@gmail.com', 'dhruvi', 'ihtteu78'),
(5, 'Anirudh', '8965742394', 'anirudh69@gmail.com', 'anirudh7', 'shyench9'),
(6, 'Dhanvin', '8657412978', 'dhanvin@gmail.com', 'dhanvin_snooze', 'djuehfy78');

-- --------------------------------------------------------


ALTER TABLE `tblcustomer`
  ADD PRIMARY KEY (`customer_id`);

ALTER TABLE `tblmenu`
  ADD PRIMARY KEY (`menu_id`),
  ADD KEY `tblmenu_ibfk_1` (`menu_type_id`);


ALTER TABLE `tblmenutype`
  ADD PRIMARY KEY (`menu_type_id`);


ALTER TABLE `tblorder`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `tblorder_ibfk_2` (`customer_id`),
  ADD KEY `fkey` (`menu_type_id`),
  ADD KEY `fkey6` (`menu_id`),
  ADD KEY `tblorder_ibfk_1` (`processed_by`);


ALTER TABLE `tblpayment`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `order_id` (`order_id`,`processed_by`),
  ADD KEY `processed_by` (`processed_by`),
  ADD KEY `fkey9` (`menu_id1`);


ALTER TABLE `tbluser`
  ADD PRIMARY KEY (`user_id`);

--
ALTER TABLE `tblmenu`
  ADD CONSTRAINT `tblmenu_ibfk_1` FOREIGN KEY (`menu_type_id`) REFERENCES `tblmenutype` (`menu_type_id`);


ALTER TABLE `tblorder`
  ADD CONSTRAINT `fkey` FOREIGN KEY (`menu_type_id`) REFERENCES `tblmenutype` (`menu_type_id`),
  ADD CONSTRAINT `fkey6` FOREIGN KEY (`menu_id`) REFERENCES `tblmenu` (`menu_id`),
  ADD CONSTRAINT `tblorder_ibfk_1` FOREIGN KEY (`processed_by`) REFERENCES `tbluser` (`user_id`),
  ADD CONSTRAINT `tblorder_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `tblcustomer` (`customer_id`);

--
-- Constraints for table `tblpayment`
--
ALTER TABLE `tblpayment`
  ADD CONSTRAINT `fkey9` FOREIGN KEY (`menu_id1`) REFERENCES `tblmenu` (`menu_id`),
  ADD CONSTRAINT `tblpayment_ibfk_1` FOREIGN KEY (`processed_by`) REFERENCES `tbluser` (`user_id`),
  ADD CONSTRAINT `tblpayment_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `tblorder` (`order_id`);
COMMIT;
SET SQL_SAFE_UPDATES = 0;


UPDATE tbluser
SET contact='9980456245'
where full_name='Anisha'
DELETE FROM tbluser 
WHERE full_name='Karthik' ;




CREATE INDEX cust_id
ON tblorder(customer_id);

SELECT tblorder.customer_id,tblpayment.amount FROM tblorder,tblpayment where tblorder.order_id=tblpayment.order_id;





