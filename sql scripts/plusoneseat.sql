-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 12, 2016 at 04:29 PM
-- Server version: 5.7.9
-- PHP Version: 5.6.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `plusoneseat`
--

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
CREATE TABLE IF NOT EXISTS `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(45) NOT NULL,
  `time` datetime NOT NULL,
  `event` int(11) NOT NULL,
  `user` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `event_idx` (`event`),
  KEY `user_idx` (`user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `continents`
--

DROP TABLE IF EXISTS `continents`;
CREATE TABLE IF NOT EXISTS `continents` (
  `code` varchar(2) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `continents`
--

INSERT INTO `continents` (`code`, `name`) VALUES
('AF', 'Africa'),
('AN', 'Antarctica'),
('AS', 'Asia'),
('EU', 'Europe'),
('NA', 'North America'),
('OC', 'Oceania'),
('SA', 'South America');

-- --------------------------------------------------------

DROP TABLE IF EXISTS `country`;
CREATE TABLE IF NOT EXISTS `country` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `iso` char(2) NOT NULL,
  `name` varchar(80) NOT NULL,
  `nicename` varchar(80) NOT NULL,
  `iso3` char(3) DEFAULT NULL,
  `numcode` smallint(6) DEFAULT NULL,
  `phonecode` int(5) NOT NULL,
  `continent` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=254 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`, `continent`) VALUES
(1, 'AF', 'AFGHANISTAN', 'Afghanistan', 'AFG', 4, 93, 'Asia'),
(2, 'AL', 'ALBANIA', 'Albania', 'ALB', 8, 355, 'Europe'),
(3, 'DZ', 'ALGERIA', 'Algeria', 'DZA', 12, 213, 'Africa'),
(4, 'AS', 'AMERICAN SAMOA', 'American Samoa', 'ASM', 16, 1684, 'Australia'),
(5, 'AD', 'ANDORRA', 'Andorra', 'AND', 20, 376, 'Europe'),
(6, 'AO', 'ANGOLA', 'Angola', 'AGO', 24, 244, 'Africa'),
(7, 'AI', 'ANGUILLA', 'Anguilla', 'AIA', 660, 1264, 'North America'),
(8, 'AQ', 'ANTARCTICA', 'Antarctica', NULL, NULL, 0, 'Antarctica'),
(9, 'AG', 'ANTIGUA AND BARBUDA', 'Antigua and Barbuda', 'ATG', 28, 1268, 'North America'),
(10, 'AR', 'ARGENTINA', 'Argentina', 'ARG', 32, 54, 'South America'),
(11, 'AM', 'ARMENIA', 'Armenia', 'ARM', 51, 374, 'Europe'),
(12, 'AW', 'ARUBA', 'Aruba', 'ABW', 533, 297, 'North America'),
(13, 'AU', 'AUSTRALIA', 'Australia', 'AUS', 36, 61, 'Australia'),
(14, 'AT', 'AUSTRIA', 'Austria', 'AUT', 40, 43, 'Europe'),
(15, 'AZ', 'AZERBAIJAN', 'Azerbaijan', 'AZE', 31, 994, 'Europe'),
(16, 'BS', 'BAHAMAS', 'Bahamas', 'BHS', 44, 1242, 'North America'),
(17, 'BH', 'BAHRAIN', 'Bahrain', 'BHR', 48, 973, 'Asia'),
(18, 'BD', 'BANGLADESH', 'Bangladesh', 'BGD', 50, 880, 'Asia'),
(19, 'BB', 'BARBADOS', 'Barbados', 'BRB', 52, 1246, 'North America'),
(20, 'BY', 'BELARUS', 'Belarus', 'BLR', 112, 375, 'Europe'),
(21, 'BE', 'BELGIUM', 'Belgium', 'BEL', 56, 32, 'Europe'),
(22, 'BZ', 'BELIZE', 'Belize', 'BLZ', 84, 501, 'North America'),
(23, 'BJ', 'BENIN', 'Benin', 'BEN', 204, 229, 'Africa'),
(24, 'BM', 'BERMUDA', 'Bermuda', 'BMU', 60, 1441, 'North America'),
(25, 'BT', 'BHUTAN', 'Bhutan', 'BTN', 64, 975, 'Asia'),
(26, 'BO', 'BOLIVIA', 'Bolivia', 'BOL', 68, 591, 'South America'),
(27, 'BA', 'BOSNIA AND HERZEGOVINA', 'Bosnia and Herzegovina', 'BIH', 70, 387, 'Europe'),
(28, 'BW', 'BOTSWANA', 'Botswana', 'BWA', 72, 267, 'Africa'),
(29, 'BV', 'BOUVET ISLAND', 'Bouvet Island', NULL, NULL, 0, 'Europe'),
(30, 'BR', 'BRAZIL', 'Brazil', 'BRA', 76, 55, 'South AMerica'),
(31, 'IO', 'BRITISH INDIAN OCEAN TERRITORY', 'British Indian Ocean Territory', NULL, NULL, 246, 'Africa'),
(32, 'BN', 'BRUNEI DARUSSALAM', 'Brunei Darussalam', 'BRN', 96, 673, 'Asia'),
(33, 'BG', 'BULGARIA', 'Bulgaria', 'BGR', 100, 359, 'Europe'),
(34, 'BF', 'BURKINA FASO', 'Burkina Faso', 'BFA', 854, 226, 'Africa'),
(35, 'BI', 'BURUNDI', 'Burundi', 'BDI', 108, 257, 'Africa'),
(36, 'KH', 'CAMBODIA', 'Cambodia', 'KHM', 116, 855, 'Asia'),
(37, 'CM', 'CAMEROON', 'Cameroon', 'CMR', 120, 237, 'Africa'),
(38, 'CA', 'CANADA', 'Canada', 'CAN', 124, 1, 'North America'),
(39, 'CV', 'CAPE VERDE', 'Cape Verde', 'CPV', 132, 238, 'Africa'),
(40, 'KY', 'CAYMAN ISLANDS', 'Cayman Islands', 'CYM', 136, 1345, 'North America'),
(41, 'CF', 'CENTRAL AFRICAN REPUBLIC', 'Central African Republic', 'CAF', 140, 236, 'Africa'),
(42, 'TD', 'CHAD', 'Chad', 'TCD', 148, 235, 'Africa'),
(43, 'CL', 'CHILE', 'Chile', 'CHL', 152, 56, 'South America'),
(44, 'CN', 'CHINA', 'China', 'CHN', 156, 86, 'Asia'),
(45, 'CX', 'CHRISTMAS ISLAND', 'Christmas Island', NULL, NULL, 61, 'Australia'),
(46, 'CC', 'COCOS (KEELING) ISLANDS', 'Cocos (Keeling) Islands', NULL, NULL, 672, 'Australia'),
(47, 'CO', 'COLOMBIA', 'Colombia', 'COL', 170, 57, 'South America'),
(48, 'KM', 'COMOROS', 'Comoros', 'COM', 174, 269, 'Africa'),
(49, 'CG', 'CONGO', 'Congo', 'COG', 178, 242, 'Africa'),
(50, 'CD', 'CONGO, THE DEMOCRATIC REPUBLIC OF THE', 'Congo, the Democratic Republic of the', 'COD', 180, 242, 'Africa'),
(51, 'CK', 'COOK ISLANDS', 'Cook Islands', 'COK', 184, 682, 'Australia'),
(52, 'CR', 'COSTA RICA', 'Costa Rica', 'CRI', 188, 506, 'North America'),
(53, 'CI', 'COTE D`IVOIRE', 'Cote D`Ivoire', 'CIV', 384, 225, 'Africa'),
(54, 'HR', 'CROATIA', 'Croatia', 'HRV', 191, 385, 'Europe'),
(55, 'CU', 'CUBA', 'Cuba', 'CUB', 192, 53, 'South America'),
(56, 'CY', 'CYPRUS', 'Cyprus', 'CYP', 196, 357, 'Europe'),
(57, 'CZ', 'CZECH REPUBLIC', 'Czech Republic', 'CZE', 203, 420, 'Europe'),
(58, 'DK', 'DENMARK', 'Denmark', 'DNK', 208, 45, 'Europe'),
(59, 'DJ', 'DJIBOUTI', 'Djibouti', 'DJI', 262, 253, 'Africa'),
(60, 'DM', 'DOMINICA', 'Dominica', 'DMA', 212, 1767, 'North America'),
(61, 'DO', 'DOMINICAN REPUBLIC', 'Dominican Republic', 'DOM', 214, 1809, 'North America'),
(62, 'EC', 'ECUADOR', 'Ecuador', 'ECU', 218, 593, 'South America'),
(63, 'EG', 'EGYPT', 'Egypt', 'EGY', 818, 20, 'Africa'),
(64, 'SV', 'EL SALVADOR', 'El Salvador', 'SLV', 222, 503, 'South America'),
(65, 'GQ', 'EQUATORIAL GUINEA', 'Equatorial Guinea', 'GNQ', 226, 240, 'Africa'),
(66, 'ER', 'ERITREA', 'Eritrea', 'ERI', 232, 291, 'Africa'),
(67, 'EE', 'ESTONIA', 'Estonia', 'EST', 233, 372, 'Europe'),
(68, 'ET', 'ETHIOPIA', 'Ethiopia', 'ETH', 231, 251, 'Africa'),
(69, 'FK', 'FALKLAND ISLANDS (MALVINAS)', 'Falkland Islands (Malvinas)', 'FLK', 238, 500, 'South America'),
(70, 'FO', 'FAROE ISLANDS', 'Faroe Islands', 'FRO', 234, 298, 'Europe'),
(71, 'FJ', 'FIJI', 'Fiji', 'FJI', 242, 679, 'Australia'),
(72, 'FI', 'FINLAND', 'Finland', 'FIN', 246, 358, 'Europe'),
(73, 'FR', 'FRANCE', 'France', 'FRA', 250, 33, 'Europe'),
(74, 'GF', 'FRENCH GUIANA', 'French Guiana', 'GUF', 254, 594, 'South America'),
(75, 'PF', 'FRENCH POLYNESIA', 'French Polynesia', 'PYF', 258, 689, 'Australia'),
(76, 'TF', 'FRENCH SOUTHERN TERRITORIES', 'French Southern Territories', NULL, NULL, 0, 'Antarctica'),
(77, 'GA', 'GABON', 'Gabon', 'GAB', 266, 241, 'Africa'),
(78, 'GM', 'GAMBIA', 'Gambia', 'GMB', 270, 220, 'Africa'),
(79, 'GE', 'GEORGIA', 'Georgia', 'GEO', 268, 995, 'Europe'),
(80, 'DE', 'GERMANY', 'Germany', 'DEU', 276, 49, 'Europe'),
(81, 'GH', 'GHANA', 'Ghana', 'GHA', 288, 233, 'Africa'),
(82, 'GI', 'GIBRALTAR', 'Gibraltar', 'GIB', 292, 350, 'Europe'),
(83, 'GR', 'GREECE', 'Greece', 'GRC', 300, 30, 'Europe'),
(84, 'GL', 'GREENLAND', 'Greenland', 'GRL', 304, 299, 'North America'),
(85, 'GD', 'GRENADA', 'Grenada', 'GRD', 308, 1473, 'North America'),
(86, 'GP', 'GUADELOUPE', 'Guadeloupe', 'GLP', 312, 590, 'North America'),
(87, 'GU', 'GUAM', 'Guam', 'GUM', 316, 1671, 'Australia'),
(88, 'GT', 'GUATEMALA', 'Guatemala', 'GTM', 320, 502, 'North America'),
(89, 'GN', 'GUINEA', 'Guinea', 'GIN', 324, 224, 'Africa'),
(90, 'GW', 'GUINEA-BISSAU', 'Guinea-Bissau', 'GNB', 624, 245, 'Africa'),
(91, 'GY', 'GUYANA', 'Guyana', 'GUY', 328, 592, 'South America'),
(92, 'HT', 'HAITI', 'Haiti', 'HTI', 332, 509, 'North America'),
(93, 'HM', 'HEARD ISLAND AND MCDONALD ISLANDS', 'Heard Island and Mcdonald Islands', NULL, NULL, 0, 'Antarctica'),
(94, 'VA', 'HOLY SEE (VATICAN CITY STATE)', 'Holy See (Vatican City State)', 'VAT', 336, 39, 'Europe'),
(95, 'HN', 'HONDURAS', 'Honduras', 'HND', 340, 504, 'North America'),
(96, 'HK', 'HONG KONG', 'Hong Kong', 'HKG', 344, 852, 'Asia'),
(97, 'HU', 'HUNGARY', 'Hungary', 'HUN', 348, 36, 'Europe'),
(98, 'IS', 'ICELAND', 'Iceland', 'ISL', 352, 354, 'Europe'),
(99, 'IN', 'INDIA', 'India', 'IND', 356, 91, 'Asia'),
(100, 'ID', 'INDONESIA', 'Indonesia', 'IDN', 360, 62, 'Asia'),
(101, 'IR', 'IRAN, ISLAMIC REPUBLIC OF', 'Iran, Islamic Republic of', 'IRN', 364, 98, 'Asia'),
(102, 'IQ', 'IRAQ', 'Iraq', 'IRQ', 368, 964, 'Asia'),
(103, 'IE', 'IRELAND', 'Ireland', 'IRL', 372, 353, 'Europe'),
(104, 'IL', 'ISRAEL', 'Israel', 'ISR', 376, 972, 'Asia'),
(105, 'IT', 'ITALY', 'Italy', 'ITA', 380, 39, 'Europe'),
(106, 'JM', 'JAMAICA', 'Jamaica', 'JAM', 388, 1876, 'North America'),
(107, 'JP', 'JAPAN', 'Japan', 'JPN', 392, 81, 'Asia'),
(108, 'JO', 'JORDAN', 'Jordan', 'JOR', 400, 962, 'Asia'),
(109, 'KZ', 'KAZAKHSTAN', 'Kazakhstan', 'KAZ', 398, 7, 'Asia'),
(110, 'KE', 'KENYA', 'Kenya', 'KEN', 404, 254, 'Africa'),
(111, 'KI', 'KIRIBATI', 'Kiribati', 'KIR', 296, 686, 'Australia'),
(112, 'KP', 'KOREA, DEMOCRATIC PEOPLE`S REPUBLIC OF', 'Korea, Democratic People`s Republic of', 'PRK', 408, 850, 'Asia'),
(113, 'KR', 'KOREA, REPUBLIC OF', 'Korea, Republic of', 'KOR', 410, 82, 'Asia'),
(114, 'KW', 'KUWAIT', 'Kuwait', 'KWT', 414, 965, 'Asia'),
(115, 'KG', 'KYRGYZSTAN', 'Kyrgyzstan', 'KGZ', 417, 996, 'Asia'),
(116, 'LA', 'LAO PEOPLE`S DEMOCRATIC REPUBLIC', 'Lao People`s Democratic Republic', 'LAO', 418, 856, 'Asia'),
(117, 'LV', 'LATVIA', 'Latvia', 'LVA', 428, 371, 'Europe'),
(118, 'LB', 'LEBANON', 'Lebanon', 'LBN', 422, 961, 'Asia'),
(119, 'LS', 'LESOTHO', 'Lesotho', 'LSO', 426, 266, 'Africa'),
(120, 'LR', 'LIBERIA', 'Liberia', 'LBR', 430, 231, 'Africa'),
(121, 'LY', 'LIBYAN ARAB JAMAHIRIYA', 'Libyan Arab Jamahiriya', 'LBY', 434, 218, 'Africa'),
(122, 'LI', 'LIECHTENSTEIN', 'Liechtenstein', 'LIE', 438, 423, 'Europe'),
(123, 'LT', 'LITHUANIA', 'Lithuania', 'LTU', 440, 370, 'Europe'),
(124, 'LU', 'LUXEMBOURG', 'Luxembourg', 'LUX', 442, 352, 'Europe'),
(125, 'MO', 'MACAO', 'Macao', 'MAC', 446, 853, 'Asia'),
(126, 'MK', 'MACEDONIA, THE FORMER YUGOSLAV REPUBLIC OF', 'Macedonia, the Former Yugoslav Republic of', 'MKD', 807, 389, 'Europe'),
(127, 'MG', 'MADAGASCAR', 'Madagascar', 'MDG', 450, 261, 'Africa'),
(128, 'MW', 'MALAWI', 'Malawi', 'MWI', 454, 265, 'Africa'),
(129, 'MY', 'MALAYSIA', 'Malaysia', 'MYS', 458, 60, 'Asia'),
(130, 'MV', 'MALDIVES', 'Maldives', 'MDV', 462, 960, 'Asia'),
(131, 'ML', 'MALI', 'Mali', 'MLI', 466, 223, 'Africa'),
(132, 'MT', 'MALTA', 'Malta', 'MLT', 470, 356, 'Europe'),
(133, 'MH', 'MARSHALL ISLANDS', 'Marshall Islands', 'MHL', 584, 692, 'Australia'),
(134, 'MQ', 'MARTINIQUE', 'Martinique', 'MTQ', 474, 596, 'North America'),
(135, 'MR', 'MAURITANIA', 'Mauritania', 'MRT', 478, 222, 'Africa'),
(136, 'MU', 'MAURITIUS', 'Mauritius', 'MUS', 480, 230, 'Africa'),
(137, 'YT', 'MAYOTTE', 'Mayotte', NULL, NULL, 269, 'Asia'),
(138, 'MX', 'MEXICO', 'Mexico', 'MEX', 484, 52, 'North America'),
(139, 'FM', 'MICRONESIA, FEDERATED STATES OF', 'Micronesia, Federated States of', 'FSM', 583, 691, 'Australia'),
(140, 'MD', 'MOLDOVA, REPUBLIC OF', 'Moldova, Republic of', 'MDA', 498, 373, 'Europe'),
(141, 'MC', 'MONACO', 'Monaco', 'MCO', 492, 377, 'Europe'),
(142, 'MN', 'MONGOLIA', 'Mongolia', 'MNG', 496, 976, 'Asia'),
(143, 'MS', 'MONTSERRAT', 'Montserrat', 'MSR', 500, 1664, 'North America'),
(144, 'MA', 'MOROCCO', 'Morocco', 'MAR', 504, 212, 'Africa'),
(145, 'MZ', 'MOZAMBIQUE', 'Mozambique', 'MOZ', 508, 258, 'Africa'),
(146, 'MM', 'MYANMAR', 'Myanmar', 'MMR', 104, 95, 'Asia'),
(147, 'NA', 'NAMIBIA', 'Namibia', 'NAM', 516, 264, 'Africa'),
(148, 'NR', 'NAURU', 'Nauru', 'NRU', 520, 674, 'Australia'),
(149, 'NP', 'NEPAL', 'Nepal', 'NPL', 524, 977, 'Asia'),
(150, 'NL', 'NETHERLANDS', 'Netherlands', 'NLD', 528, 31, 'Europe'),
(151, 'AN', 'NETHERLANDS ANTILLES', 'Netherlands Antilles', 'ANT', 530, 599, 'North America'),
(152, 'NC', 'NEW CALEDONIA', 'New Caledonia', 'NCL', 540, 687, 'Australia'),
(153, 'NZ', 'NEW ZEALAND', 'New Zealand', 'NZL', 554, 64, 'Australia'),
(154, 'NI', 'NICARAGUA', 'Nicaragua', 'NIC', 558, 505, 'North America'),
(155, 'NE', 'NIGER', 'Niger', 'NER', 562, 227, 'Africa'),
(156, 'NG', 'NIGERIA', 'Nigeria', 'NGA', 566, 234, 'Africa'),
(157, 'NU', 'NIUE', 'Niue', 'NIU', 570, 683, 'Australia'),
(158, 'NF', 'NORFOLK ISLAND', 'Norfolk Island', 'NFK', 574, 672, 'Australia'),
(159, 'MP', 'NORTHERN MARIANA ISLANDS', 'Northern Mariana Islands', 'MNP', 580, 1670, 'Australia'),
(160, 'NO', 'NORWAY', 'Norway', 'NOR', 578, 47, 'Europe'),
(161, 'OM', 'OMAN', 'Oman', 'OMN', 512, 968, 'Asia'),
(162, 'PK', 'PAKISTAN', 'Pakistan', 'PAK', 586, 92, 'Asia'),
(163, 'PW', 'PALAU', 'Palau', 'PLW', 585, 680, 'Australia'),
(164, 'PS', 'PALESTINIAN TERRITORY, OCCUPIED', 'Palestinian Territory, Occupied', NULL, NULL, 970, 'Asia'),
(165, 'PA', 'PANAMA', 'Panama', 'PAN', 591, 507, 'North America'),
(166, 'PG', 'PAPUA NEW GUINEA', 'Papua New Guinea', 'PNG', 598, 675, 'Australia'),
(167, 'PY', 'PARAGUAY', 'Paraguay', 'PRY', 600, 595, 'South America'),
(168, 'PE', 'PERU', 'Peru', 'PER', 604, 51, 'South America'),
(169, 'PH', 'PHILIPPINES', 'Philippines', 'PHL', 608, 63, 'Asia'),
(170, 'PN', 'PITCAIRN', 'Pitcairn', 'PCN', 612, 0, 'Australia'),
(171, 'PL', 'POLAND', 'Poland', 'POL', 616, 48, 'Europe'),
(172, 'PT', 'PORTUGAL', 'Portugal', 'PRT', 620, 351, 'Europe'),
(173, 'PR', 'PUERTO RICO', 'Puerto Rico', 'PRI', 630, 1787, 'North America'),
(174, 'QA', 'QATAR', 'Qatar', 'QAT', 634, 974, 'Asia'),
(175, 'RE', 'REUNION', 'Reunion', 'REU', 638, 262, 'Africa'),
(176, 'RO', 'ROMANIA', 'Romania', 'ROM', 642, 40, 'Europe'),
(177, 'RU', 'RUSSIAN FEDERATION', 'Russian Federation', 'RUS', 643, 70, 'Europe'),
(178, 'RW', 'RWANDA', 'Rwanda', 'RWA', 646, 250, 'Africa'),
(179, 'SH', 'SAINT HELENA', 'Saint Helena', 'SHN', 654, 290, 'Africa'),
(180, 'KN', 'SAINT KITTS AND NEVIS', 'Saint Kitts and Nevis', 'KNA', 659, 1869, 'North America'),
(181, 'LC', 'SAINT LUCIA', 'Saint Lucia', 'LCA', 662, 1758, 'North America'),
(182, 'PM', 'SAINT PIERRE AND MIQUELON', 'Saint Pierre and Miquelon', 'SPM', 666, 508, 'North America'),
(183, 'VC', 'SAINT VINCENT AND THE GRENADINES', 'Saint Vincent and the Grenadines', 'VCT', 670, 1784, 'North America'),
(184, 'WS', 'SAMOA', 'Samoa', 'WSM', 882, 684, 'Australia'),
(185, 'SM', 'SAN MARINO', 'San Marino', 'SMR', 674, 378, 'Europe'),
(186, 'ST', 'SAO TOME AND PRINCIPE', 'Sao Tome and Principe', 'STP', 678, 239, 'Africa'),
(187, 'SA', 'SAUDI ARABIA', 'Saudi Arabia', 'SAU', 682, 966, 'Asia'),
(188, 'SN', 'SENEGAL', 'Senegal', 'SEN', 686, 221, 'Africa'),
(189, 'CS', 'SERBIA AND MONTENEGRO', 'Serbia and Montenegro', NULL, NULL, 381, 'Europe'),
(190, 'SC', 'SEYCHELLES', 'Seychelles', 'SYC', 690, 248, 'Africa'),
(191, 'SL', 'SIERRA LEONE', 'Sierra Leone', 'SLE', 694, 232, 'Africa'),
(192, 'SG', 'SINGAPORE', 'Singapore', 'SGP', 702, 65, 'Asia'),
(193, 'SK', 'SLOVAKIA', 'Slovakia', 'SVK', 703, 421, 'Europe'),
(194, 'SI', 'SLOVENIA', 'Slovenia', 'SVN', 705, 386, 'Europe'),
(195, 'SB', 'SOLOMON ISLANDS', 'Solomon Islands', 'SLB', 90, 677, 'Australia'),
(196, 'SO', 'SOMALIA', 'Somalia', 'SOM', 706, 252, 'Africa'),
(197, 'ZA', 'SOUTH AFRICA', 'South Africa', 'ZAF', 710, 27, 'Africa'),
(198, 'GS', 'SOUTH GEORGIA AND THE SOUTH SANDWICH ISLANDS', 'South Georgia and the South Sandwich Islands', NULL, NULL, 0, 'Antarctica'),
(199, 'ES', 'SPAIN', 'Spain', 'ESP', 724, 34, 'Europe'),
(200, 'LK', 'SRI LANKA', 'Sri Lanka', 'LKA', 144, 94, 'Asia'),
(201, 'SD', 'SUDAN', 'Sudan', 'SDN', 736, 249, 'Africa'),
(202, 'SR', 'SURINAME', 'Suriname', 'SUR', 740, 597, 'South America'),
(203, 'SJ', 'SVALBARD AND JAN MAYEN', 'Svalbard and Jan Mayen', 'SJM', 744, 47, 'Europe'),
(204, 'SZ', 'SWAZILAND', 'Swaziland', 'SWZ', 748, 268, 'Africa'),
(205, 'SE', 'SWEDEN', 'Sweden', 'SWE', 752, 46, 'Europe'),
(206, 'CH', 'SWITZERLAND', 'Switzerland', 'CHE', 756, 41, 'Europe'),
(207, 'SY', 'SYRIAN ARAB REPUBLIC', 'Syrian Arab Republic', 'SYR', 760, 963, 'Asia'),
(208, 'TW', 'TAIWAN, PROVINCE OF CHINA', 'Taiwan, Province of China', 'TWN', 158, 886, 'Asia'),
(209, 'TJ', 'TAJIKISTAN', 'Tajikistan', 'TJK', 762, 992, 'Asia'),
(210, 'TZ', 'TANZANIA, UNITED REPUBLIC OF', 'Tanzania, United Republic of', 'TZA', 834, 255, 'Africa'),
(211, 'TH', 'THAILAND', 'Thailand', 'THA', 764, 66, 'Asia'),
(212, 'TL', 'TIMOR-LESTE', 'Timor-Leste', NULL, NULL, 670, 'Asia'),
(213, 'TG', 'TOGO', 'Togo', 'TGO', 768, 228, 'Africa'),
(214, 'TK', 'TOKELAU', 'Tokelau', 'TKL', 772, 690, 'Australia'),
(215, 'TO', 'TONGA', 'Tonga', 'TON', 776, 676, 'Australia'),
(216, 'TT', 'TRINIDAD AND TOBAGO', 'Trinidad and Tobago', 'TTO', 780, 1868, 'North America'),
(217, 'TN', 'TUNISIA', 'Tunisia', 'TUN', 788, 216, 'Asia'),
(218, 'TR', 'TURKEY', 'Turkey', 'TUR', 792, 90, 'Europe'),
(219, 'TM', 'TURKMENISTAN', 'Turkmenistan', 'TKM', 795, 7370, 'Asia'),
(220, 'TC', 'TURKS AND CAICOS ISLANDS', 'Turks and Caicos Islands', 'TCA', 796, 1649, 'North America'),
(221, 'TV', 'TUVALU', 'Tuvalu', 'TUV', 798, 688, 'Australia'),
(222, 'UG', 'UGANDA', 'Uganda', 'UGA', 800, 256, 'Africa'),
(223, 'UA', 'UKRAINE', 'Ukraine', 'UKR', 804, 380, 'Europe'),
(224, 'AE', 'UNITED ARAB EMIRATES', 'United Arab Emirates', 'ARE', 784, 971, 'Asia'),
(225, 'GB', 'UNITED KINGDOM', 'United Kingdom', 'GBR', 826, 44, 'Europe'),
(226, 'US', 'UNITED STATES', 'United States', 'USA', 840, 1, 'North America'),
(227, 'UM', 'UNITED STATES MINOR OUTLYING ISLANDS', 'United States Minor Outlying Islands', NULL, NULL, 1, 'Australia'),
(228, 'UY', 'URUGUAY', 'Uruguay', 'URY', 858, 598, 'South America'),
(229, 'UZ', 'UZBEKISTAN', 'Uzbekistan', 'UZB', 860, 998, 'Asia'),
(230, 'VU', 'VANUATU', 'Vanuatu', 'VUT', 548, 678, 'Australia'),
(231, 'VE', 'VENEZUELA', 'Venezuela', 'VEN', 862, 58, 'South America'),
(232, 'VN', 'VIETNAM', 'Vietnam', 'VNM', 704, 84, 'Asia'),
(233, 'VG', 'VIRGIN ISLANDS, BRITISH', 'Virgin Islands, British', 'VGB', 92, 1284, 'North America'),
(234, 'VI', 'VIRGIN ISLANDS, U.S.', 'Virgin Islands, U.s.', 'VIR', 850, 1340, 'North America'),
(235, 'WF', 'WALLIS AND FUTUNA', 'Wallis and Futuna', 'WLF', 876, 681, 'Australia'),
(236, 'EH', 'WESTERN SAHARA', 'Western Sahara', 'ESH', 732, 212, 'Africa'),
(237, 'YE', 'YEMEN', 'Yemen', 'YEM', 887, 967, 'Asia'),
(238, 'ZM', 'ZAMBIA', 'Zambia', 'ZMB', 894, 260, 'Africa'),
(239, 'ZW', 'ZIMBABWE', 'Zimbabwe', 'ZWE', 716, 263, 'Africa'),
(240, 'RS', 'SERBIA', 'Serbia', 'SRB', 688, 381, 'Europe'),
(241, 'AP', 'ASIA PACIFIC REGION', 'Asia / Pacific Region', '0', 0, 0, 'Asia'),
(242, 'ME', 'MONTENEGRO', 'Montenegro', 'MNE', 499, 382, 'Europe'),
(243, 'AX', 'ALAND ISLANDS', 'Aland Islands', 'ALA', 248, 358, 'Europe'),
(244, 'BQ', 'BONAIRE, SINT EUSTATIUS AND SABA', 'Bonaire, Sint Eustatius and Saba', 'BES', 535, 599, 'South America'),
(245, 'CW', 'CURACAO', 'Curacao', 'CUW', 531, 599, 'North America'),
(246, 'GG', 'GUERNSEY', 'Guernsey', 'GGY', 831, 44, 'Europe'),
(247, 'IM', 'ISLE OF MAN', 'Isle of Man', 'IMN', 833, 44, 'Europe'),
(248, 'JE', 'JERSEY', 'Jersey', 'JEY', 832, 44, 'Europe'),
(249, 'XK', 'KOSOVO', 'Kosovo', '---', 0, 381, 'Europe'),
(250, 'BL', 'SAINT BARTHELEMY', 'Saint Barthelemy', 'BLM', 652, 590, 'North America'),
(251, 'MF', 'SAINT MARTIN', 'Saint Martin', 'MAF', 663, 590, 'North America'),
(252, 'SX', 'SINT MAARTEN', 'Sint Maarten', 'SXM', 534, 1, 'North America'),
(253, 'SS', 'SOUTH SUDAN', 'South Sudan', 'SSD', 728, 211, 'Africa');
-- --------------------------------------------------------

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
CREATE TABLE IF NOT EXISTS `course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_meal_offer` int(11) NOT NULL,
  `course_type` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_meal_offer` (`id_meal_offer`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `course_option`
--

DROP TABLE IF EXISTS `course_option`;
CREATE TABLE IF NOT EXISTS `course_option` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_option` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `course_option`
--

INSERT INTO `course_option` (`id`, `course_option`) VALUES
(1, 'Single Course'),
(2, 'Starter/Desert | Main Course'),
(3, 'Starter | Main Course | Desert'),
(4, 'Starter | Main Course | Desert | Custom Name');

-- --------------------------------------------------------

--
-- Table structure for table `dish`
--

DROP TABLE IF EXISTS `dish`;
CREATE TABLE IF NOT EXISTS `dish` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_course` int(11) NOT NULL,
  `id_dish_type` int(11) NOT NULL,
  `ingredients` varchar(100) NOT NULL,
  `main_dish` tinyint(1) NOT NULL,
  `dish_name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_course` (`id_course`),
  KEY `id_dish_type` (`id_dish_type`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `dish_type`
--

DROP TABLE IF EXISTS `dish_type`;
CREATE TABLE IF NOT EXISTS `dish_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `dish_type`
--

INSERT INTO `dish_type` (`id`, `name`) VALUES
(1, 'Red Meat'),
(2, 'White Meat'),
(3, 'Seafood'),
(4, 'Vegetables'),
(5, 'Fabaceae');

-- --------------------------------------------------------

--
-- Table structure for table `drink`
--

DROP TABLE IF EXISTS `drink`;
CREATE TABLE IF NOT EXISTS `drink` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `alcoholic` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `drink`
--

INSERT INTO `drink` (`id`, `name`, `alcoholic`) VALUES
(1, 'Beer', 0),
(2, 'Wine', 0),
(3, 'High-Alcoho', 0),
(4, 'Juice', 0),
(5, 'Water', 0),
(6, 'Gaseous Dri', 0),
(7, 'Cocktails', 0),
(8, 'Beer', 1),
(9, 'Wine', 1),
(10, 'High-alchoh', 1),
(11, 'Cocktail', 1),
(12, 'Water', 0),
(13, 'Juice', 0),
(14, 'Gaseous Dri', 0),
(15, 'Beer', 1),
(16, 'Wine', 1),
(17, 'High Alchoholic', 1),
(18, 'Cocktail', 1),
(19, 'Water', 0),
(20, 'Juice', 0),
(21, 'Gaseous Drink', 0);

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

DROP TABLE IF EXISTS `event`;
CREATE TABLE IF NOT EXISTS `event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(500) DEFAULT NULL,
  `location` int(11) NOT NULL,
  `host` int(11) NOT NULL,
  `time` datetime NOT NULL,
  `menu` int(11) NOT NULL,
  `price` decimal(10,0) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `location_idx` (`location`),
  KEY `host_idx` (`host`),
  KEY `menu_fk` (`menu`),
  KEY `price_idx` (`price`),
  KEY `time_idx` (`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `guest`
--

DROP TABLE IF EXISTS `guest`;
CREATE TABLE IF NOT EXISTS `guest` (
  `event` int(11) NOT NULL,
  `guest` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`event`,`guest`),
  KEY `guest_idx` (`guest`),
  KEY `event_idx` (`event`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `interests`
--

DROP TABLE IF EXISTS `interests`;
CREATE TABLE IF NOT EXISTS `interests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `interest` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `interests`
--

INSERT INTO `interests` (`id`, `interest`) VALUES
(1, 'Sports'),
(2, 'Music'),
(3, 'Science'),
(4, 'Technology'),
(5, 'Education'),
(6, 'Games'),
(7, 'Animals'),
(8, 'Art'),
(9, 'Design'),
(10, 'Automobiles'),
(11, 'Economics'),
(12, 'Movies'),
(13, 'Social'),
(14, 'Responsibilities'),
(15, 'Entettainment'),
(16, 'Food'),
(17, 'Politics'),
(18, 'All');

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
CREATE TABLE IF NOT EXISTS `languages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` char(49) DEFAULT NULL,
  `iso_639-1` char(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `name`, `iso_639-1`) VALUES
(31, 'Finnish', 'fi'),
(32, 'Fiji', 'fj'),
(33, 'Faeroese', 'fo'),
(34, 'French', 'fr'),
(35, 'Frisian', 'fy'),
(36, 'Irish', 'ga'),
(37, 'Scots/Gaelic', 'gd'),
(38, 'Galician', 'gl'),
(39, 'Guarani', 'gn'),
(40, 'Gujarati', 'gu'),
(41, 'Hausa', 'ha'),
(42, 'Hindi', 'hi'),
(43, 'Croatian', 'hr'),
(44, 'Hungarian', 'hu'),
(45, 'Armenian', 'hy'),
(46, 'Interlingua', 'ia'),
(47, 'Interlingue', 'ie'),
(48, 'Inupiak', 'ik'),
(49, 'Indonesian', 'in'),
(50, 'Icelandic', 'is'),
(51, 'Italian', 'it'),
(52, 'Hebrew', 'iw'),
(53, 'Japanese', 'ja'),
(54, 'Yiddish', 'ji'),
(55, 'Javanese', 'jw'),
(56, 'Georgian', 'ka'),
(57, 'Kazakh', 'kk'),
(58, 'Greenlandic', 'kl'),
(59, 'Cambodian', 'km'),
(60, 'Kannada', 'kn'),
(61, 'Korean', 'ko'),
(62, 'Kashmiri', 'ks'),
(63, 'Kurdish', 'ku'),
(64, 'Kirghiz', 'ky'),
(65, 'Latin', 'la'),
(66, 'Lingala', 'ln'),
(67, 'Laothian', 'lo'),
(68, 'Lithuanian', 'lt'),
(69, 'Latvian/Lettish', 'lv'),
(70, 'Malagasy', 'mg'),
(71, 'Maori', 'mi'),
(72, 'Macedonian', 'mk'),
(73, 'Malayalam', 'ml'),
(74, 'Mongolian', 'mn'),
(75, 'Moldavian', 'mo'),
(76, 'Marathi', 'mr'),
(77, 'Malay', 'ms'),
(78, 'Maltese', 'mt'),
(79, 'Burmese', 'my'),
(80, 'Nauru', 'na'),
(81, 'Nepali', 'ne'),
(82, 'Dutch', 'nl'),
(83, 'Norwegian', 'no'),
(84, 'Occitan', 'oc'),
(85, '(Afan)/Oromoor/Oriya', 'om'),
(86, 'Punjabi', 'pa'),
(87, 'Polish', 'pl'),
(88, 'Pashto/Pushto', 'ps'),
(89, 'Portuguese', 'pt'),
(90, 'Quechua', 'qu');

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
CREATE TABLE IF NOT EXISTS `location` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `address` varchar(45) NOT NULL,
  `city` varchar(30) NOT NULL,
  `country` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `location_index` (`latitude`,`longitude`),
  KEY `address_index` (`address`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `meal_drinks`
--

DROP TABLE IF EXISTS `meal_drinks`;
CREATE TABLE IF NOT EXISTS `meal_drinks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_meal_offer` int(11) NOT NULL,
  `id_drink` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_meal_offer` (`id_meal_offer`),
  KEY `id_drink` (`id_drink`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `meal_offer`
--

DROP TABLE IF EXISTS `meal_offer`;
CREATE TABLE IF NOT EXISTS `meal_offer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `meal_type` varchar(20) NOT NULL,
  `meal_name` varchar(100) NOT NULL,
  `continent_id` varchar(2) NOT NULL,
  `country_id` int(11) NOT NULL,
  `description` varchar(300) DEFAULT NULL,
  `min_seats` int(11) NOT NULL,
  `max_seats` int(11) NOT NULL,
  `price_per_seat` float NOT NULL,
  `meal_date` varchar(20) NOT NULL,
  `start_time` varchar(10) NOT NULL,
  `course_option` int(11) NOT NULL,
  `end_time` varchar(10) NOT NULL,
  `donation_type` varchar(20) NOT NULL,
  `number_of_donations` int(11) NOT NULL,
  `currency` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `country_id` (`country_id`),
  KEY `course_option` (`course_option`),
  KEY `meal_type` (`meal_type`),
  KEY `continent_id` (`continent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `meal_photos`
--

DROP TABLE IF EXISTS `meal_photos`;
CREATE TABLE IF NOT EXISTS `meal_photos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_meal_offer` int(11) NOT NULL,
  `photo` varchar(500) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_meal_offer` (`id_meal_offer`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `meal_type`
--

DROP TABLE IF EXISTS `meal_type`;
CREATE TABLE IF NOT EXISTS `meal_type` (
  `type_name` varchar(10) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `meal_type`
--

INSERT INTO `meal_type` (`type_name`, `id`) VALUES
('Breakfast', 1),
('Brunch', 2),
('Lunch', 3),
('Dinner', 4);

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
CREATE TABLE IF NOT EXISTS `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `course_number` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
CREATE TABLE IF NOT EXISTS `message` (
  `content` varchar(500) NOT NULL,
  `time` datetime NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sender` int(11) NOT NULL,
  `receiver` int(11) NOT NULL,
  PRIMARY KEY (`id`,`sender`,`receiver`),
  KEY `sender_idx` (`sender`),
  KEY `receiver_idx` (`receiver`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `picture`
--

DROP TABLE IF EXISTS `picture`;
CREATE TABLE IF NOT EXISTS `picture` (
  `id` int(11) NOT NULL,
  `file_location` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `rating`
--

DROP TABLE IF EXISTS `rating`;
CREATE TABLE IF NOT EXISTS `rating` (
  `rating` decimal(10,0) NOT NULL,
  `comment` varchar(45) NOT NULL,
  `time` datetime NOT NULL,
  `reviewer` int(11) NOT NULL,
  `rating_type` int(11) NOT NULL,
  `reviewee` int(11) NOT NULL,
  PRIMARY KEY (`reviewer`,`reviewee`),
  KEY `reviewer_idx` (`reviewer`),
  KEY `reviewee_idx` (`reviewee`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `subscriber`
--

DROP TABLE IF EXISTS `subscriber`;
CREATE TABLE IF NOT EXISTS `subscriber` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `subscriber`
--

INSERT INTO `subscriber` (`id`, `email`) VALUES
(8, 'cagilaygen@gmail.com'),
(7, 'milos.colic@elfak.rs'),
(13, 'molly.johnson273@gmail.com'),
(9, 'yeldasebnemeker@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
CREATE TABLE IF NOT EXISTS `tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(20) DEFAULT NULL,
  `lastname` varchar(20) DEFAULT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(45) NOT NULL,
  `country` varchar(25) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `birth_location` varchar(50) DEFAULT NULL,
  `city` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `location_idx` (`country`),
  KEY `location` (`country`),
  KEY `birth_location` (`birth_location`),
  KEY `country` (`country`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `firstname`, `lastname`, `email`, `password`, `country`, `description`, `gender`, `birthday`, `birth_location`, `city`) VALUES
(1, 'Milica', 'Jovanovic', 'kikice010@gmail.com', 'kikice', 'Italy', 'Bella ragazza :P', 'Female', '2014-07-01', 'Pirot, Serbia', 'Milano'),
(2, NULL, NULL, 'plusoneseat', 'p1s', NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_education`
--

DROP TABLE IF EXISTS `user_education`;
CREATE TABLE IF NOT EXISTS `user_education` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `degree` varchar(50) NOT NULL,
  `university` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_user` (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_education`
--

INSERT INTO `user_education` (`id`, `id_user`, `degree`, `university`) VALUES
(9, 1, 'Master', 'Politecnico di Torino');

-- --------------------------------------------------------

--
-- Table structure for table `user_has_picture`
--

DROP TABLE IF EXISTS `user_has_picture`;
CREATE TABLE IF NOT EXISTS `user_has_picture` (
  `user_id` int(11) NOT NULL,
  `picture_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`picture_id`),
  KEY `fk_user_has_picture_picture1_idx` (`picture_id`),
  KEY `fk_user_has_picture_user1_idx` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user_interests`
--

DROP TABLE IF EXISTS `user_interests`;
CREATE TABLE IF NOT EXISTS `user_interests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `id_interests` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_user` (`id_user`),
  KEY `id_interests` (`id_interests`),
  KEY `id_interests_2` (`id_interests`),
  KEY `id_interests_3` (`id_interests`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_interests`
--

INSERT INTO `user_interests` (`id`, `id_user`, `id_interests`) VALUES
(9, 1, 3),
(10, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `user_languages`
--

DROP TABLE IF EXISTS `user_languages`;
CREATE TABLE IF NOT EXISTS `user_languages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `id_language` int(11) NOT NULL,
  `level` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_user` (`id_user`),
  KEY `language` (`id_language`),
  KEY `id_language` (`id_language`),
  KEY `id_language_2` (`id_language`),
  KEY `id_language_3` (`id_language`),
  KEY `id_language_4` (`id_language`),
  KEY `id_language_5` (`id_language`),
  KEY `id_language_6` (`id_language`),
  KEY `id_language_7` (`id_language`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_languages`
--

INSERT INTO `user_languages` (`id`, `id_user`, `id_language`, `level`) VALUES
(12, 1, 32, 'Basic');

-- --------------------------------------------------------

--
-- Table structure for table `user_phonenumbers`
--

DROP TABLE IF EXISTS `user_phonenumbers`;
CREATE TABLE IF NOT EXISTS `user_phonenumbers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `country_code` int(11) NOT NULL,
  `phonenumber` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_user` (`id_user`),
  KEY `country_code` (`country_code`),
  KEY `country_code_2` (`country_code`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_phonenumbers`
--

INSERT INTO `user_phonenumbers` (`id`, `id_user`, `country_code`, `phonenumber`) VALUES
(5, 1, 93, '55555555'),
(6, 1, 93, '333');

-- --------------------------------------------------------

--
-- Table structure for table `user_work`
--

DROP TABLE IF EXISTS `user_work`;
CREATE TABLE IF NOT EXISTS `user_work` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `job` varchar(50) NOT NULL,
  `city` varchar(30) NOT NULL,
  `country` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_user` (`id_user`),
  KEY `id_user_2` (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_work`
--

INSERT INTO `user_work` (`id`, `id_user`, `job`, `city`, `country`) VALUES
(4, 1, 'Software Developer', 'Torino', 'Italy');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `fk_comment_event1` FOREIGN KEY (`event`) REFERENCES `event` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_comment_user1` FOREIGN KEY (`user`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `course`
--
ALTER TABLE `course`
  ADD CONSTRAINT `course_ibfk_1` FOREIGN KEY (`id_meal_offer`) REFERENCES `meal_offer` (`id`);

--
-- Constraints for table `dish`
--
ALTER TABLE `dish`
  ADD CONSTRAINT `dish_ibfk_1` FOREIGN KEY (`id_course`) REFERENCES `course` (`id`),
  ADD CONSTRAINT `dish_ibfk_2` FOREIGN KEY (`id_dish_type`) REFERENCES `dish_type` (`id`);

--
-- Constraints for table `event`
--
ALTER TABLE `event`
  ADD CONSTRAINT `fk_event_location1` FOREIGN KEY (`location`) REFERENCES `location` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_event_menu_type1` FOREIGN KEY (`menu`) REFERENCES `menu` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_event_user1` FOREIGN KEY (`host`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `guest`
--
ALTER TABLE `guest`
  ADD CONSTRAINT `fk_event_has_user_event1` FOREIGN KEY (`event`) REFERENCES `event` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_event_has_user_user1` FOREIGN KEY (`guest`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `meal_drinks`
--
ALTER TABLE `meal_drinks`
  ADD CONSTRAINT `meal_drinks_ibfk_1` FOREIGN KEY (`id_meal_offer`) REFERENCES `meal_offer` (`id`),
  ADD CONSTRAINT `meal_drinks_ibfk_2` FOREIGN KEY (`id_drink`) REFERENCES `drink` (`id`);

--
-- Constraints for table `meal_offer`
--
ALTER TABLE `meal_offer`
  ADD CONSTRAINT `meal_offer_ibfk_1` FOREIGN KEY (`continent_id`) REFERENCES `continents` (`code`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `meal_offer_ibfk_3` FOREIGN KEY (`course_option`) REFERENCES `course_option` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `meal_offer_ibfk_5` FOREIGN KEY (`country_id`) REFERENCES `country` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `meal_photos`
--
ALTER TABLE `meal_photos`
  ADD CONSTRAINT `meal_photos_ibfk_1` FOREIGN KEY (`id_meal_offer`) REFERENCES `meal_offer` (`id`);

--
-- Constraints for table `message`
--
ALTER TABLE `message`
  ADD CONSTRAINT `fk_message_user_a` FOREIGN KEY (`sender`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_message_user_b` FOREIGN KEY (`receiver`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `rating`
--
ALTER TABLE `rating`
  ADD CONSTRAINT `fk_rating_user1` FOREIGN KEY (`reviewer`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_rating_user2` FOREIGN KEY (`reviewee`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `user_education`
--
ALTER TABLE `user_education`
  ADD CONSTRAINT `user_education_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `user_has_picture`
--
ALTER TABLE `user_has_picture`
  ADD CONSTRAINT `fk_user_has_picture_picture1` FOREIGN KEY (`picture_id`) REFERENCES `picture` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_user_has_picture_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `user_interests`
--
ALTER TABLE `user_interests`
  ADD CONSTRAINT `user_interests_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `user_interests_ibfk_2` FOREIGN KEY (`id_interests`) REFERENCES `interests` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `user_languages`
--
ALTER TABLE `user_languages`
  ADD CONSTRAINT `user_languages_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `user_languages_ibfk_2` FOREIGN KEY (`id_language`) REFERENCES `languages` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `user_phonenumbers`
--
ALTER TABLE `user_phonenumbers`
  ADD CONSTRAINT `user_phonenumbers_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `user_phonenumbers_ibfk_2` FOREIGN KEY (`country_code`) REFERENCES `country` (`id`);

--
-- Constraints for table `user_work`
--
ALTER TABLE `user_work`
  ADD CONSTRAINT `user_work_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
