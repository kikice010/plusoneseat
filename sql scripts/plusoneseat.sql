-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Oct 28, 2016 at 06:29 PM
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
  `code` char(2) NOT NULL COMMENT 'Continent code',
  `name` varchar(255) DEFAULT NULL,
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

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
CREATE TABLE IF NOT EXISTS `country` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `iso` char(2) NOT NULL,
  `name` varchar(80) NOT NULL,
  `nicename` varchar(80) NOT NULL,
  `iso3` char(3) DEFAULT NULL,
  `numcode` smallint(6) DEFAULT NULL,
  `phonecode` int(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=254 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES
(1, 'AF', 'AFGHANISTAN', 'Afghanistan', 'AFG', 4, 93),
(2, 'AL', 'ALBANIA', 'Albania', 'ALB', 8, 355),
(3, 'DZ', 'ALGERIA', 'Algeria', 'DZA', 12, 213),
(4, 'AS', 'AMERICAN SAMOA', 'American Samoa', 'ASM', 16, 1684),
(5, 'AD', 'ANDORRA', 'Andorra', 'AND', 20, 376),
(6, 'AO', 'ANGOLA', 'Angola', 'AGO', 24, 244),
(7, 'AI', 'ANGUILLA', 'Anguilla', 'AIA', 660, 1264),
(8, 'AQ', 'ANTARCTICA', 'Antarctica', NULL, NULL, 0),
(9, 'AG', 'ANTIGUA AND BARBUDA', 'Antigua and Barbuda', 'ATG', 28, 1268),
(10, 'AR', 'ARGENTINA', 'Argentina', 'ARG', 32, 54),
(11, 'AM', 'ARMENIA', 'Armenia', 'ARM', 51, 374),
(12, 'AW', 'ARUBA', 'Aruba', 'ABW', 533, 297),
(13, 'AU', 'AUSTRALIA', 'Australia', 'AUS', 36, 61),
(14, 'AT', 'AUSTRIA', 'Austria', 'AUT', 40, 43),
(15, 'AZ', 'AZERBAIJAN', 'Azerbaijan', 'AZE', 31, 994),
(16, 'BS', 'BAHAMAS', 'Bahamas', 'BHS', 44, 1242),
(17, 'BH', 'BAHRAIN', 'Bahrain', 'BHR', 48, 973),
(18, 'BD', 'BANGLADESH', 'Bangladesh', 'BGD', 50, 880),
(19, 'BB', 'BARBADOS', 'Barbados', 'BRB', 52, 1246),
(20, 'BY', 'BELARUS', 'Belarus', 'BLR', 112, 375),
(21, 'BE', 'BELGIUM', 'Belgium', 'BEL', 56, 32),
(22, 'BZ', 'BELIZE', 'Belize', 'BLZ', 84, 501),
(23, 'BJ', 'BENIN', 'Benin', 'BEN', 204, 229),
(24, 'BM', 'BERMUDA', 'Bermuda', 'BMU', 60, 1441),
(25, 'BT', 'BHUTAN', 'Bhutan', 'BTN', 64, 975),
(26, 'BO', 'BOLIVIA', 'Bolivia', 'BOL', 68, 591),
(27, 'BA', 'BOSNIA AND HERZEGOVINA', 'Bosnia and Herzegovina', 'BIH', 70, 387),
(28, 'BW', 'BOTSWANA', 'Botswana', 'BWA', 72, 267),
(29, 'BV', 'BOUVET ISLAND', 'Bouvet Island', NULL, NULL, 0),
(30, 'BR', 'BRAZIL', 'Brazil', 'BRA', 76, 55),
(31, 'IO', 'BRITISH INDIAN OCEAN TERRITORY', 'British Indian Ocean Territory', NULL, NULL, 246),
(32, 'BN', 'BRUNEI DARUSSALAM', 'Brunei Darussalam', 'BRN', 96, 673),
(33, 'BG', 'BULGARIA', 'Bulgaria', 'BGR', 100, 359),
(34, 'BF', 'BURKINA FASO', 'Burkina Faso', 'BFA', 854, 226),
(35, 'BI', 'BURUNDI', 'Burundi', 'BDI', 108, 257),
(36, 'KH', 'CAMBODIA', 'Cambodia', 'KHM', 116, 855),
(37, 'CM', 'CAMEROON', 'Cameroon', 'CMR', 120, 237),
(38, 'CA', 'CANADA', 'Canada', 'CAN', 124, 1),
(39, 'CV', 'CAPE VERDE', 'Cape Verde', 'CPV', 132, 238),
(40, 'KY', 'CAYMAN ISLANDS', 'Cayman Islands', 'CYM', 136, 1345),
(41, 'CF', 'CENTRAL AFRICAN REPUBLIC', 'Central African Republic', 'CAF', 140, 236),
(42, 'TD', 'CHAD', 'Chad', 'TCD', 148, 235),
(43, 'CL', 'CHILE', 'Chile', 'CHL', 152, 56),
(44, 'CN', 'CHINA', 'China', 'CHN', 156, 86),
(45, 'CX', 'CHRISTMAS ISLAND', 'Christmas Island', NULL, NULL, 61),
(46, 'CC', 'COCOS (KEELING) ISLANDS', 'Cocos (Keeling) Islands', NULL, NULL, 672),
(47, 'CO', 'COLOMBIA', 'Colombia', 'COL', 170, 57),
(48, 'KM', 'COMOROS', 'Comoros', 'COM', 174, 269),
(49, 'CG', 'CONGO', 'Congo', 'COG', 178, 242),
(50, 'CD', 'CONGO, THE DEMOCRATIC REPUBLIC OF THE', 'Congo, the Democratic Republic of the', 'COD', 180, 242),
(51, 'CK', 'COOK ISLANDS', 'Cook Islands', 'COK', 184, 682),
(52, 'CR', 'COSTA RICA', 'Costa Rica', 'CRI', 188, 506),
(53, 'CI', 'COTE D''IVOIRE', 'Cote D''Ivoire', 'CIV', 384, 225),
(54, 'HR', 'CROATIA', 'Croatia', 'HRV', 191, 385),
(55, 'CU', 'CUBA', 'Cuba', 'CUB', 192, 53),
(56, 'CY', 'CYPRUS', 'Cyprus', 'CYP', 196, 357),
(57, 'CZ', 'CZECH REPUBLIC', 'Czech Republic', 'CZE', 203, 420),
(58, 'DK', 'DENMARK', 'Denmark', 'DNK', 208, 45),
(59, 'DJ', 'DJIBOUTI', 'Djibouti', 'DJI', 262, 253),
(60, 'DM', 'DOMINICA', 'Dominica', 'DMA', 212, 1767),
(61, 'DO', 'DOMINICAN REPUBLIC', 'Dominican Republic', 'DOM', 214, 1809),
(62, 'EC', 'ECUADOR', 'Ecuador', 'ECU', 218, 593),
(63, 'EG', 'EGYPT', 'Egypt', 'EGY', 818, 20),
(64, 'SV', 'EL SALVADOR', 'El Salvador', 'SLV', 222, 503),
(65, 'GQ', 'EQUATORIAL GUINEA', 'Equatorial Guinea', 'GNQ', 226, 240),
(66, 'ER', 'ERITREA', 'Eritrea', 'ERI', 232, 291),
(67, 'EE', 'ESTONIA', 'Estonia', 'EST', 233, 372),
(68, 'ET', 'ETHIOPIA', 'Ethiopia', 'ETH', 231, 251),
(69, 'FK', 'FALKLAND ISLANDS (MALVINAS)', 'Falkland Islands (Malvinas)', 'FLK', 238, 500),
(70, 'FO', 'FAROE ISLANDS', 'Faroe Islands', 'FRO', 234, 298),
(71, 'FJ', 'FIJI', 'Fiji', 'FJI', 242, 679),
(72, 'FI', 'FINLAND', 'Finland', 'FIN', 246, 358),
(73, 'FR', 'FRANCE', 'France', 'FRA', 250, 33),
(74, 'GF', 'FRENCH GUIANA', 'French Guiana', 'GUF', 254, 594),
(75, 'PF', 'FRENCH POLYNESIA', 'French Polynesia', 'PYF', 258, 689),
(76, 'TF', 'FRENCH SOUTHERN TERRITORIES', 'French Southern Territories', NULL, NULL, 0),
(77, 'GA', 'GABON', 'Gabon', 'GAB', 266, 241),
(78, 'GM', 'GAMBIA', 'Gambia', 'GMB', 270, 220),
(79, 'GE', 'GEORGIA', 'Georgia', 'GEO', 268, 995),
(80, 'DE', 'GERMANY', 'Germany', 'DEU', 276, 49),
(81, 'GH', 'GHANA', 'Ghana', 'GHA', 288, 233),
(82, 'GI', 'GIBRALTAR', 'Gibraltar', 'GIB', 292, 350),
(83, 'GR', 'GREECE', 'Greece', 'GRC', 300, 30),
(84, 'GL', 'GREENLAND', 'Greenland', 'GRL', 304, 299),
(85, 'GD', 'GRENADA', 'Grenada', 'GRD', 308, 1473),
(86, 'GP', 'GUADELOUPE', 'Guadeloupe', 'GLP', 312, 590),
(87, 'GU', 'GUAM', 'Guam', 'GUM', 316, 1671),
(88, 'GT', 'GUATEMALA', 'Guatemala', 'GTM', 320, 502),
(89, 'GN', 'GUINEA', 'Guinea', 'GIN', 324, 224),
(90, 'GW', 'GUINEA-BISSAU', 'Guinea-Bissau', 'GNB', 624, 245),
(91, 'GY', 'GUYANA', 'Guyana', 'GUY', 328, 592),
(92, 'HT', 'HAITI', 'Haiti', 'HTI', 332, 509),
(93, 'HM', 'HEARD ISLAND AND MCDONALD ISLANDS', 'Heard Island and Mcdonald Islands', NULL, NULL, 0),
(94, 'VA', 'HOLY SEE (VATICAN CITY STATE)', 'Holy See (Vatican City State)', 'VAT', 336, 39),
(95, 'HN', 'HONDURAS', 'Honduras', 'HND', 340, 504),
(96, 'HK', 'HONG KONG', 'Hong Kong', 'HKG', 344, 852),
(97, 'HU', 'HUNGARY', 'Hungary', 'HUN', 348, 36),
(98, 'IS', 'ICELAND', 'Iceland', 'ISL', 352, 354),
(99, 'IN', 'INDIA', 'India', 'IND', 356, 91),
(100, 'ID', 'INDONESIA', 'Indonesia', 'IDN', 360, 62),
(101, 'IR', 'IRAN, ISLAMIC REPUBLIC OF', 'Iran, Islamic Republic of', 'IRN', 364, 98),
(102, 'IQ', 'IRAQ', 'Iraq', 'IRQ', 368, 964),
(103, 'IE', 'IRELAND', 'Ireland', 'IRL', 372, 353),
(104, 'IL', 'ISRAEL', 'Israel', 'ISR', 376, 972),
(105, 'IT', 'ITALY', 'Italy', 'ITA', 380, 39),
(106, 'JM', 'JAMAICA', 'Jamaica', 'JAM', 388, 1876),
(107, 'JP', 'JAPAN', 'Japan', 'JPN', 392, 81),
(108, 'JO', 'JORDAN', 'Jordan', 'JOR', 400, 962),
(109, 'KZ', 'KAZAKHSTAN', 'Kazakhstan', 'KAZ', 398, 7),
(110, 'KE', 'KENYA', 'Kenya', 'KEN', 404, 254),
(111, 'KI', 'KIRIBATI', 'Kiribati', 'KIR', 296, 686),
(112, 'KP', 'KOREA, DEMOCRATIC PEOPLE''S REPUBLIC OF', 'Korea, Democratic People''s Republic of', 'PRK', 408, 850),
(113, 'KR', 'KOREA, REPUBLIC OF', 'Korea, Republic of', 'KOR', 410, 82),
(114, 'KW', 'KUWAIT', 'Kuwait', 'KWT', 414, 965),
(115, 'KG', 'KYRGYZSTAN', 'Kyrgyzstan', 'KGZ', 417, 996),
(116, 'LA', 'LAO PEOPLE''S DEMOCRATIC REPUBLIC', 'Lao People''s Democratic Republic', 'LAO', 418, 856),
(117, 'LV', 'LATVIA', 'Latvia', 'LVA', 428, 371),
(118, 'LB', 'LEBANON', 'Lebanon', 'LBN', 422, 961),
(119, 'LS', 'LESOTHO', 'Lesotho', 'LSO', 426, 266),
(120, 'LR', 'LIBERIA', 'Liberia', 'LBR', 430, 231),
(121, 'LY', 'LIBYAN ARAB JAMAHIRIYA', 'Libyan Arab Jamahiriya', 'LBY', 434, 218),
(122, 'LI', 'LIECHTENSTEIN', 'Liechtenstein', 'LIE', 438, 423),
(123, 'LT', 'LITHUANIA', 'Lithuania', 'LTU', 440, 370),
(124, 'LU', 'LUXEMBOURG', 'Luxembourg', 'LUX', 442, 352),
(125, 'MO', 'MACAO', 'Macao', 'MAC', 446, 853),
(126, 'MK', 'MACEDONIA, THE FORMER YUGOSLAV REPUBLIC OF', 'Macedonia, the Former Yugoslav Republic of', 'MKD', 807, 389),
(127, 'MG', 'MADAGASCAR', 'Madagascar', 'MDG', 450, 261),
(128, 'MW', 'MALAWI', 'Malawi', 'MWI', 454, 265),
(129, 'MY', 'MALAYSIA', 'Malaysia', 'MYS', 458, 60),
(130, 'MV', 'MALDIVES', 'Maldives', 'MDV', 462, 960),
(131, 'ML', 'MALI', 'Mali', 'MLI', 466, 223),
(132, 'MT', 'MALTA', 'Malta', 'MLT', 470, 356),
(133, 'MH', 'MARSHALL ISLANDS', 'Marshall Islands', 'MHL', 584, 692),
(134, 'MQ', 'MARTINIQUE', 'Martinique', 'MTQ', 474, 596),
(135, 'MR', 'MAURITANIA', 'Mauritania', 'MRT', 478, 222),
(136, 'MU', 'MAURITIUS', 'Mauritius', 'MUS', 480, 230),
(137, 'YT', 'MAYOTTE', 'Mayotte', NULL, NULL, 269),
(138, 'MX', 'MEXICO', 'Mexico', 'MEX', 484, 52),
(139, 'FM', 'MICRONESIA, FEDERATED STATES OF', 'Micronesia, Federated States of', 'FSM', 583, 691),
(140, 'MD', 'MOLDOVA, REPUBLIC OF', 'Moldova, Republic of', 'MDA', 498, 373),
(141, 'MC', 'MONACO', 'Monaco', 'MCO', 492, 377),
(142, 'MN', 'MONGOLIA', 'Mongolia', 'MNG', 496, 976),
(143, 'MS', 'MONTSERRAT', 'Montserrat', 'MSR', 500, 1664),
(144, 'MA', 'MOROCCO', 'Morocco', 'MAR', 504, 212),
(145, 'MZ', 'MOZAMBIQUE', 'Mozambique', 'MOZ', 508, 258),
(146, 'MM', 'MYANMAR', 'Myanmar', 'MMR', 104, 95),
(147, 'NA', 'NAMIBIA', 'Namibia', 'NAM', 516, 264),
(148, 'NR', 'NAURU', 'Nauru', 'NRU', 520, 674),
(149, 'NP', 'NEPAL', 'Nepal', 'NPL', 524, 977),
(150, 'NL', 'NETHERLANDS', 'Netherlands', 'NLD', 528, 31),
(151, 'AN', 'NETHERLANDS ANTILLES', 'Netherlands Antilles', 'ANT', 530, 599),
(152, 'NC', 'NEW CALEDONIA', 'New Caledonia', 'NCL', 540, 687),
(153, 'NZ', 'NEW ZEALAND', 'New Zealand', 'NZL', 554, 64),
(154, 'NI', 'NICARAGUA', 'Nicaragua', 'NIC', 558, 505),
(155, 'NE', 'NIGER', 'Niger', 'NER', 562, 227),
(156, 'NG', 'NIGERIA', 'Nigeria', 'NGA', 566, 234),
(157, 'NU', 'NIUE', 'Niue', 'NIU', 570, 683),
(158, 'NF', 'NORFOLK ISLAND', 'Norfolk Island', 'NFK', 574, 672),
(159, 'MP', 'NORTHERN MARIANA ISLANDS', 'Northern Mariana Islands', 'MNP', 580, 1670),
(160, 'NO', 'NORWAY', 'Norway', 'NOR', 578, 47),
(161, 'OM', 'OMAN', 'Oman', 'OMN', 512, 968),
(162, 'PK', 'PAKISTAN', 'Pakistan', 'PAK', 586, 92),
(163, 'PW', 'PALAU', 'Palau', 'PLW', 585, 680),
(164, 'PS', 'PALESTINIAN TERRITORY, OCCUPIED', 'Palestinian Territory, Occupied', NULL, NULL, 970),
(165, 'PA', 'PANAMA', 'Panama', 'PAN', 591, 507),
(166, 'PG', 'PAPUA NEW GUINEA', 'Papua New Guinea', 'PNG', 598, 675),
(167, 'PY', 'PARAGUAY', 'Paraguay', 'PRY', 600, 595),
(168, 'PE', 'PERU', 'Peru', 'PER', 604, 51),
(169, 'PH', 'PHILIPPINES', 'Philippines', 'PHL', 608, 63),
(170, 'PN', 'PITCAIRN', 'Pitcairn', 'PCN', 612, 0),
(171, 'PL', 'POLAND', 'Poland', 'POL', 616, 48),
(172, 'PT', 'PORTUGAL', 'Portugal', 'PRT', 620, 351),
(173, 'PR', 'PUERTO RICO', 'Puerto Rico', 'PRI', 630, 1787),
(174, 'QA', 'QATAR', 'Qatar', 'QAT', 634, 974),
(175, 'RE', 'REUNION', 'Reunion', 'REU', 638, 262),
(176, 'RO', 'ROMANIA', 'Romania', 'ROM', 642, 40),
(177, 'RU', 'RUSSIAN FEDERATION', 'Russian Federation', 'RUS', 643, 70),
(178, 'RW', 'RWANDA', 'Rwanda', 'RWA', 646, 250),
(179, 'SH', 'SAINT HELENA', 'Saint Helena', 'SHN', 654, 290),
(180, 'KN', 'SAINT KITTS AND NEVIS', 'Saint Kitts and Nevis', 'KNA', 659, 1869),
(181, 'LC', 'SAINT LUCIA', 'Saint Lucia', 'LCA', 662, 1758),
(182, 'PM', 'SAINT PIERRE AND MIQUELON', 'Saint Pierre and Miquelon', 'SPM', 666, 508),
(183, 'VC', 'SAINT VINCENT AND THE GRENADINES', 'Saint Vincent and the Grenadines', 'VCT', 670, 1784),
(184, 'WS', 'SAMOA', 'Samoa', 'WSM', 882, 684),
(185, 'SM', 'SAN MARINO', 'San Marino', 'SMR', 674, 378),
(186, 'ST', 'SAO TOME AND PRINCIPE', 'Sao Tome and Principe', 'STP', 678, 239),
(187, 'SA', 'SAUDI ARABIA', 'Saudi Arabia', 'SAU', 682, 966),
(188, 'SN', 'SENEGAL', 'Senegal', 'SEN', 686, 221),
(189, 'CS', 'SERBIA AND MONTENEGRO', 'Serbia and Montenegro', NULL, NULL, 381),
(190, 'SC', 'SEYCHELLES', 'Seychelles', 'SYC', 690, 248),
(191, 'SL', 'SIERRA LEONE', 'Sierra Leone', 'SLE', 694, 232),
(192, 'SG', 'SINGAPORE', 'Singapore', 'SGP', 702, 65),
(193, 'SK', 'SLOVAKIA', 'Slovakia', 'SVK', 703, 421),
(194, 'SI', 'SLOVENIA', 'Slovenia', 'SVN', 705, 386),
(195, 'SB', 'SOLOMON ISLANDS', 'Solomon Islands', 'SLB', 90, 677),
(196, 'SO', 'SOMALIA', 'Somalia', 'SOM', 706, 252),
(197, 'ZA', 'SOUTH AFRICA', 'South Africa', 'ZAF', 710, 27),
(198, 'GS', 'SOUTH GEORGIA AND THE SOUTH SANDWICH ISLANDS', 'South Georgia and the South Sandwich Islands', NULL, NULL, 0),
(199, 'ES', 'SPAIN', 'Spain', 'ESP', 724, 34),
(200, 'LK', 'SRI LANKA', 'Sri Lanka', 'LKA', 144, 94),
(201, 'SD', 'SUDAN', 'Sudan', 'SDN', 736, 249),
(202, 'SR', 'SURINAME', 'Suriname', 'SUR', 740, 597),
(203, 'SJ', 'SVALBARD AND JAN MAYEN', 'Svalbard and Jan Mayen', 'SJM', 744, 47),
(204, 'SZ', 'SWAZILAND', 'Swaziland', 'SWZ', 748, 268),
(205, 'SE', 'SWEDEN', 'Sweden', 'SWE', 752, 46),
(206, 'CH', 'SWITZERLAND', 'Switzerland', 'CHE', 756, 41),
(207, 'SY', 'SYRIAN ARAB REPUBLIC', 'Syrian Arab Republic', 'SYR', 760, 963),
(208, 'TW', 'TAIWAN, PROVINCE OF CHINA', 'Taiwan, Province of China', 'TWN', 158, 886),
(209, 'TJ', 'TAJIKISTAN', 'Tajikistan', 'TJK', 762, 992),
(210, 'TZ', 'TANZANIA, UNITED REPUBLIC OF', 'Tanzania, United Republic of', 'TZA', 834, 255),
(211, 'TH', 'THAILAND', 'Thailand', 'THA', 764, 66),
(212, 'TL', 'TIMOR-LESTE', 'Timor-Leste', NULL, NULL, 670),
(213, 'TG', 'TOGO', 'Togo', 'TGO', 768, 228),
(214, 'TK', 'TOKELAU', 'Tokelau', 'TKL', 772, 690),
(215, 'TO', 'TONGA', 'Tonga', 'TON', 776, 676),
(216, 'TT', 'TRINIDAD AND TOBAGO', 'Trinidad and Tobago', 'TTO', 780, 1868),
(217, 'TN', 'TUNISIA', 'Tunisia', 'TUN', 788, 216),
(218, 'TR', 'TURKEY', 'Turkey', 'TUR', 792, 90),
(219, 'TM', 'TURKMENISTAN', 'Turkmenistan', 'TKM', 795, 7370),
(220, 'TC', 'TURKS AND CAICOS ISLANDS', 'Turks and Caicos Islands', 'TCA', 796, 1649),
(221, 'TV', 'TUVALU', 'Tuvalu', 'TUV', 798, 688),
(222, 'UG', 'UGANDA', 'Uganda', 'UGA', 800, 256),
(223, 'UA', 'UKRAINE', 'Ukraine', 'UKR', 804, 380),
(224, 'AE', 'UNITED ARAB EMIRATES', 'United Arab Emirates', 'ARE', 784, 971),
(225, 'GB', 'UNITED KINGDOM', 'United Kingdom', 'GBR', 826, 44),
(226, 'US', 'UNITED STATES', 'United States', 'USA', 840, 1),
(227, 'UM', 'UNITED STATES MINOR OUTLYING ISLANDS', 'United States Minor Outlying Islands', NULL, NULL, 1),
(228, 'UY', 'URUGUAY', 'Uruguay', 'URY', 858, 598),
(229, 'UZ', 'UZBEKISTAN', 'Uzbekistan', 'UZB', 860, 998),
(230, 'VU', 'VANUATU', 'Vanuatu', 'VUT', 548, 678),
(231, 'VE', 'VENEZUELA', 'Venezuela', 'VEN', 862, 58),
(232, 'VN', 'VIET NAM', 'Viet Nam', 'VNM', 704, 84),
(233, 'VG', 'VIRGIN ISLANDS, BRITISH', 'Virgin Islands, British', 'VGB', 92, 1284),
(234, 'VI', 'VIRGIN ISLANDS, U.S.', 'Virgin Islands, U.s.', 'VIR', 850, 1340),
(235, 'WF', 'WALLIS AND FUTUNA', 'Wallis and Futuna', 'WLF', 876, 681),
(236, 'EH', 'WESTERN SAHARA', 'Western Sahara', 'ESH', 732, 212),
(237, 'YE', 'YEMEN', 'Yemen', 'YEM', 887, 967),
(238, 'ZM', 'ZAMBIA', 'Zambia', 'ZMB', 894, 260),
(239, 'ZW', 'ZIMBABWE', 'Zimbabwe', 'ZWE', 716, 263),
(240, 'RS', 'SERBIA', 'Serbia', 'SRB', 688, 381),
(241, 'AP', 'ASIA PACIFIC REGION', 'Asia / Pacific Region', '0', 0, 0),
(242, 'ME', 'MONTENEGRO', 'Montenegro', 'MNE', 499, 382),
(243, 'AX', 'ALAND ISLANDS', 'Aland Islands', 'ALA', 248, 358),
(244, 'BQ', 'BONAIRE, SINT EUSTATIUS AND SABA', 'Bonaire, Sint Eustatius and Saba', 'BES', 535, 599),
(245, 'CW', 'CURACAO', 'Curacao', 'CUW', 531, 599),
(246, 'GG', 'GUERNSEY', 'Guernsey', 'GGY', 831, 44),
(247, 'IM', 'ISLE OF MAN', 'Isle of Man', 'IMN', 833, 44),
(248, 'JE', 'JERSEY', 'Jersey', 'JEY', 832, 44),
(249, 'XK', 'KOSOVO', 'Kosovo', '---', 0, 381),
(250, 'BL', 'SAINT BARTHELEMY', 'Saint Barthelemy', 'BLM', 652, 590),
(251, 'MF', 'SAINT MARTIN', 'Saint Martin', 'MAF', 663, 590),
(252, 'SX', 'SINT MAARTEN', 'Sint Maarten', 'SXM', 534, 1),
(253, 'SS', 'SOUTH SUDAN', 'South Sudan', 'SSD', 728, 211);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `id` int(11) NOT NULL,
  `id_course` int(11) NOT NULL,
  `id_dish_type` int(11) NOT NULL,
  `ingredients` varchar(100) NOT NULL,
  `main_dish` tinyint(1) NOT NULL,
  `dish_name` varchar(30) NOT NULL,
  KEY `id_course` (`id_course`),
  KEY `id_dish_type` (`id_dish_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `drink_name` varchar(20) NOT NULL,
  `alcoholic` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `drink`
--

INSERT INTO `drink` (`id`, `drink_name`, `alcoholic`) VALUES
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
  `name` char(49) CHARACTER SET utf8 DEFAULT NULL,
  `iso_639-1` char(2) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `meal_offer`
--

DROP TABLE IF EXISTS `meal_offer`;
CREATE TABLE IF NOT EXISTS `meal_offer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `meal_type` int(11) NOT NULL,
  `meal_name` varchar(100) NOT NULL,
  `continent_id` char(2) NOT NULL,
  `country_id` int(11) NOT NULL,
  `description` varchar(300) DEFAULT NULL,
  `min_seats` int(11) NOT NULL,
  `max_seats` int(11) NOT NULL,
  `price_per_seat` float NOT NULL,
  `date` date NOT NULL,
  `start_time` time NOT NULL,
  `course_option` int(11) NOT NULL,
  `end_time` time NOT NULL,
  `donation_type` varchar(20) NOT NULL,
  `number_of_donations` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `continent_id` (`continent_id`,`country_id`,`course_option`),
  KEY `continent_id_2` (`continent_id`),
  KEY `country_id` (`country_id`),
  KEY `course_option` (`course_option`),
  KEY `continent_id_3` (`continent_id`,`country_id`,`course_option`),
  KEY `meal_type` (`meal_type`),
  KEY `course_option_2` (`course_option`),
  KEY `continent_id_4` (`continent_id`),
  KEY `country_id_2` (`country_id`),
  KEY `meal_type_2` (`meal_type`),
  KEY `course_option_3` (`course_option`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `city` varchar(25) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `location_idx` (`country`),
  KEY `location` (`country`),
  KEY `birth_location` (`birth_location`),
  KEY `country` (`country`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `firstname`, `lastname`, `email`, `password`, `country`, `description`, `gender`, `birthday`, `birth_location`, `city`) VALUES
(1, 'Milica', 'bla', 'kikice010@gmail.com', 'kikice', 'Italy', 'Bella ragazza :P', 'Female', '2014-07-01', 'Pirot, Serbia', 'Milano');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_education`
--

INSERT INTO `user_education` (`id`, `id_user`, `degree`, `university`) VALUES
(1, 1, 'Master', 'Politecnico di Milano'),
(2, 1, 'Bachelor', 'University of Electronics');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_interests`
--

INSERT INTO `user_interests` (`id`, `id_user`, `id_interests`) VALUES
(1, 1, 1),
(2, 1, 2);

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_languages`
--

INSERT INTO `user_languages` (`id`, `id_user`, `id_language`, `level`) VALUES
(1, 1, 31, 'Intermediate');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_phonenumbers`
--

INSERT INTO `user_phonenumbers` (`id`, `id_user`, `country_code`, `phonenumber`) VALUES
(1, 1, 1, '55555555'),
(2, 1, 1, '11111111');

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_work`
--

INSERT INTO `user_work` (`id`, `id_user`, `job`, `city`, `country`) VALUES
(1, 1, 'Software Developer', 'Milan', 'Italy');

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
  ADD CONSTRAINT `meal_offer_ibfk_1` FOREIGN KEY (`continent_id`) REFERENCES `continents` (`code`),
  ADD CONSTRAINT `meal_offer_ibfk_3` FOREIGN KEY (`course_option`) REFERENCES `course_option` (`id`),
  ADD CONSTRAINT `meal_offer_ibfk_4` FOREIGN KEY (`meal_type`) REFERENCES `meal_type` (`id`),
  ADD CONSTRAINT `meal_offer_ibfk_5` FOREIGN KEY (`country_id`) REFERENCES `country` (`id`);

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
