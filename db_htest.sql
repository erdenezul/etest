-- phpMyAdmin SQL Dump
-- version 2.11.7
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 25, 2010 at 06:41 PM
-- Server version: 5.1.31
-- PHP Version: 5.2.6-3ubuntu4.4

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `htest`
--

-- --------------------------------------------------------

--
-- Table structure for table `Answer`
--

CREATE TABLE IF NOT EXISTS `Answer` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `answer` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `point` double DEFAULT NULL,
  `multiplechoice_id` bigint(20) DEFAULT NULL,
  `multipleresponse_id` bigint(20) DEFAULT NULL,
  `question_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK752F2BDE4177079F` (`multipleresponse_id`),
  KEY `FK752F2BDE4040A8DF` (`multiplechoice_id`),
  KEY `FK752F2BDE127391EA` (`question_id`),
  KEY `FK752F2BDE332D3C8A` (`question_id`),
  KEY `FK752F2BDEC13EF45F` (`question_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=200 ;

--
-- Dumping data for table `Answer`
--

INSERT INTO `Answer` (`id`, `answer`, `point`, `multiplechoice_id`, `multipleresponse_id`, `question_id`) VALUES
(137, 'dvadf ', 0, NULL, NULL, 88),
(138, 'rqwe rqwe ', 1, NULL, NULL, 88),
(139, 'rqt', 0, NULL, NULL, 88),
(140, 'wer', 0, NULL, NULL, 88),
(144, 'dvas', 0, NULL, NULL, 90),
(145, 'sdfa efwe ', 1, NULL, NULL, 90),
(146, 'werqwer q', 0, NULL, NULL, 90),
(147, ' werfqwe r', 0, NULL, NULL, 91),
(148, 'qwrqwe', 0, NULL, NULL, 91),
(149, 'dfa sf', 1, NULL, NULL, 91),
(150, 'yje t', 0, NULL, NULL, 92),
(151, 'rgtwert', 0, NULL, NULL, 92),
(152, 'ert yerty', 1, NULL, NULL, 92),
(153, ' wertqw ', 1, NULL, NULL, 93),
(154, 'fdg s', 0, NULL, NULL, 93),
(155, 'rqw', 0, NULL, NULL, 94),
(156, 'efaqw er', 1, NULL, NULL, 94),
(157, 'oy', 1, NULL, NULL, 94),
(158, 'dgrg', 0, NULL, NULL, 95),
(159, ' qwerq', 1, NULL, NULL, 95),
(160, ' wertq er', 0, NULL, NULL, 95),
(161, 'wet qre', 0, NULL, NULL, 96),
(162, 'drsag eraqw', 1, NULL, NULL, 96),
(163, 'er qwet q', 1, NULL, NULL, 96),
(180, '3', 0, NULL, NULL, 118),
(181, '2', 1, NULL, NULL, 118),
(182, '63', 0, NULL, NULL, 119),
(183, '64', 1, NULL, NULL, 119),
(184, '58', -2, NULL, NULL, 121),
(185, '57', 1, NULL, NULL, 121),
(186, '54+3', 1, NULL, NULL, 121),
(187, 'x=25', 1, NULL, NULL, 124),
(188, 'x=24', 0, NULL, NULL, 124),
(189, 'false', 1, NULL, NULL, 125),
(190, 'true', 0, NULL, NULL, 125),
(191, 'алдаа', 1, NULL, NULL, 127),
(192, 'алдаагүй', 0, NULL, NULL, 127),
(193, 'магадгүй', -1, NULL, NULL, 128),
(194, 'болно', 1, NULL, NULL, 128),
(195, 'болохгүй', 0, NULL, NULL, 128),
(196, 'override', 0, NULL, NULL, 129),
(197, 'not override', 1, NULL, NULL, 129),
(198, 'false', 1, NULL, NULL, 130),
(199, 'true', 0, NULL, NULL, 130);

-- --------------------------------------------------------

--
-- Table structure for table `Difficulty`
--

CREATE TABLE IF NOT EXISTS `Difficulty` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `Difficulty`
--

INSERT INTO `Difficulty` (`id`, `description`) VALUES
(1, 'Хөнгөн'),
(2, 'Дунд'),
(3, 'Хүнд');

-- --------------------------------------------------------

--
-- Table structure for table `ExamType`
--

CREATE TABLE IF NOT EXISTS `ExamType` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `ExamType`
--

INSERT INTO `ExamType` (`id`, `description`) VALUES
(1, '30 онооны'),
(2, 'Сорил - 1'),
(3, 'Сорил - 2');

-- --------------------------------------------------------

--
-- Table structure for table `FillInBlank`
--

CREATE TABLE IF NOT EXISTS `FillInBlank` (
  `fillinblank_id` bigint(20) NOT NULL,
  PRIMARY KEY (`fillinblank_id`),
  KEY `FK1DB6A40C11EFC619` (`fillinblank_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `FillInBlank`
--

INSERT INTO `FillInBlank` (`fillinblank_id`) VALUES
(116),
(117);

-- --------------------------------------------------------

--
-- Table structure for table `Grade`
--

CREATE TABLE IF NOT EXISTS `Grade` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `explanation` varchar(255) DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  `relativeScore` int(11) DEFAULT NULL,
  `student_id` bigint(20) DEFAULT NULL,
  `variant_id` bigint(20) DEFAULT NULL,
  `submitted` bit(1) DEFAULT NULL,
  `start` datetime DEFAULT NULL,
  `lastClick` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `variant` (`variant_id`),
  KEY `student` (`student_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=136 ;

--
-- Dumping data for table `Grade`
--

INSERT INTO `Grade` (`id`, `explanation`, `score`, `relativeScore`, `student_id`, `variant_id`, `submitted`, `start`, `lastClick`) VALUES
(135, NULL, NULL, 0, 2, 132, NULL, NULL, NULL),
(134, NULL, NULL, 0, 3, 131, NULL, NULL, NULL),
(133, NULL, 0, 0, 13, 131, '', '2009-12-29 17:15:16', NULL),
(132, NULL, NULL, 0, 3, 129, NULL, NULL, NULL),
(131, NULL, NULL, 0, 13, 130, NULL, NULL, NULL),
(130, NULL, NULL, 0, 2, 129, NULL, NULL, NULL),
(129, NULL, 0, 0, 13, 127, NULL, NULL, NULL),
(128, NULL, 0, 0, 2, 127, NULL, NULL, NULL),
(127, NULL, 4, 30, 3, 127, '', '2009-12-26 09:59:28', '2009-12-26 10:00:32'),
(126, NULL, 4, 24, 13, 125, '', '2009-12-29 17:12:12', '2009-12-29 17:13:05'),
(125, NULL, 5, 30, 3, 126, '', '2009-12-26 06:00:35', '2009-12-26 11:14:15'),
(124, NULL, 0, 0, 2, 125, NULL, NULL, NULL),
(123, NULL, 3, 30, 3, 123, '', '2009-12-26 05:43:03', '2009-12-26 05:43:45'),
(121, NULL, 0, 0, 2, 123, NULL, NULL, NULL),
(122, NULL, 0, 0, 13, 124, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `Lesson`
--

CREATE TABLE IF NOT EXISTS `Lesson` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `lessonName` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `Lesson`
--

INSERT INTO `Lesson` (`id`, `code`, `lessonName`) VALUES
(1, 'D.SW202', 'Programming Basic'),
(2, 'D.SW203', 'Объект Хандалтат програмчлал'),
(3, 'D.SW204', 'Өгөгдлийн бүтэц ба Алгоритм'),
(4, 'D.SW207', 'Database Base theory'),
(5, 'D.SW208', 'System Requirements and Design');

-- --------------------------------------------------------

--
-- Table structure for table `MultipleChoice`
--

CREATE TABLE IF NOT EXISTS `MultipleChoice` (
  `multiplechoice_id` bigint(20) NOT NULL,
  PRIMARY KEY (`multiplechoice_id`),
  KEY `FKE250EFF1CE5260B4` (`multiplechoice_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `MultipleChoice`
--

INSERT INTO `MultipleChoice` (`multiplechoice_id`) VALUES
(90),
(95),
(118),
(119),
(125),
(127),
(128),
(130);

-- --------------------------------------------------------

--
-- Table structure for table `MultipleResponse`
--

CREATE TABLE IF NOT EXISTS `MultipleResponse` (
  `multipleresponse_id` bigint(20) NOT NULL,
  PRIMARY KEY (`multipleresponse_id`),
  KEY `FK108F5291F0426A14` (`multipleresponse_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `MultipleResponse`
--

INSERT INTO `MultipleResponse` (`multipleresponse_id`) VALUES
(88),
(91),
(92),
(93),
(94),
(96),
(121),
(124),
(129);

-- --------------------------------------------------------

--
-- Table structure for table `Protocol`
--

CREATE TABLE IF NOT EXISTS `Protocol` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) DEFAULT NULL,
  `test_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKC8E4F2B8A42C1F5F` (`test_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=91 ;

--
-- Dumping data for table `Protocol`
--

INSERT INTO `Protocol` (`id`, `content`, `test_id`) VALUES
(50, NULL, NULL),
(49, NULL, NULL),
(48, NULL, NULL),
(79, NULL, NULL),
(46, NULL, NULL),
(76, NULL, NULL),
(44, NULL, NULL),
(42, NULL, NULL),
(90, NULL, NULL),
(40, NULL, NULL),
(75, NULL, NULL),
(38, NULL, NULL),
(80, NULL, NULL),
(36, NULL, NULL),
(77, NULL, NULL),
(52, NULL, NULL),
(53, NULL, NULL),
(84, NULL, NULL),
(55, NULL, NULL),
(56, NULL, NULL),
(88, NULL, NULL),
(58, NULL, NULL),
(83, NULL, NULL),
(60, NULL, NULL),
(78, NULL, NULL),
(62, NULL, NULL),
(86, NULL, NULL),
(64, NULL, NULL),
(89, NULL, NULL),
(66, NULL, NULL),
(87, NULL, NULL),
(68, NULL, NULL),
(81, NULL, NULL),
(70, NULL, NULL),
(71, NULL, NULL),
(85, NULL, NULL),
(73, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `Question`
--

CREATE TABLE IF NOT EXISTS `Question` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `question` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `topic_id` bigint(20) DEFAULT NULL,
  `difficult` bigint(20) DEFAULT NULL,
  `ufile_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKBE5CA00642C25F5E` (`difficult`),
  KEY `FKBE5CA006ECA2BD15` (`topic_id`),
  KEY `FKBE5CA0066CA071F5` (`ufile_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=132 ;

--
-- Dumping data for table `Question`
--

INSERT INTO `Question` (`id`, `question`, `topic_id`, `difficult`, `ufile_id`) VALUES
(95, 'dca sdef gsgsxf hsed gawerfw', 2, 1, NULL),
(96, 'fg sdrgkj a;eri qo;eirqtjeriothlqvweuithcq', 2, 1, NULL),
(94, 'df awef aweif huszop;dfk aweior jqwer qw', 2, 1, NULL),
(93, 'gsdf gser twqe rtgsdfgsv dfgcvergvcwet', 2, 1, NULL),
(92, 'bsd rfgser gserf awerf mjub lryik yukrtyjrty', 2, 1, NULL),
(91, 'fvm,n df.kgjn erkgj qwerf qwer qweqw w ', 2, 1, NULL),
(90, 'ge jrgk jerhgi uqer tqwerwqef qwecfqwc', 2, 1, NULL),
(88, 'djfkh alf auilwergh asdfga wer tqwert ', 2, 1, NULL),
(118, 'Олон сонголтоос нэгийг нь дугуйлна уу? 1+1=...', 1, 1, 4),
(119, '8*8=?', 1, 1, NULL),
(120, '9*9+9=90', 1, 1, 4),
(121, '7*7+8', 1, 1, NULL),
(122, '2==2&&1!=2||3!=2', 1, 1, NULL),
(123, 'hello=x; x==hello', 1, 1, NULL),
(124, '10*10=25*3+x', 1, 1, NULL),
(125, '2**2!=2+2', 1, 1, NULL),
(126, 'class A extends B; A=B', 4, 1, NULL),
(127, 'animal = cat;\r\ncat = animal;', 4, 1, NULL),
(128, 'class person extends employee;', 4, 1, NULL),
(129, 'class a extends b; a.shout()==b.shout();', 1, 1, NULL),
(130, 'animal == person', 4, 1, NULL),
(131, 'Удамшил нь ДНК-тэй төстэй', 4, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `QuestionOrder`
--

CREATE TABLE IF NOT EXISTS `QuestionOrder` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `orderNumber` int(11) DEFAULT NULL,
  `question_id` bigint(20) DEFAULT NULL,
  `grade_id` bigint(20) DEFAULT NULL,
  `answered` bit(1) DEFAULT NULL,
  `point` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKF1530AE82A51DC15` (`grade_id`),
  KEY `FKF1530AE8C13EF45F` (`question_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=978 ;

--
-- Dumping data for table `QuestionOrder`
--

INSERT INTO `QuestionOrder` (`id`, `orderNumber`, `question_id`, `grade_id`, `answered`, `point`) VALUES
(498, 1, 82, 74, NULL, NULL),
(499, 0, 79, 74, NULL, NULL),
(500, 3, 80, 74, NULL, NULL),
(501, 2, 78, 74, NULL, NULL),
(502, 1, 82, 75, '', 0),
(503, 2, 78, 75, '', 1),
(504, 3, 80, 75, '', 0),
(505, 0, 79, 75, '', 0),
(506, 4, 81, 76, '', 1),
(507, 3, 86, 76, '', 0),
(508, 1, 80, 76, '', 1),
(509, 2, 79, 76, '', 1),
(510, 5, 84, 76, '', 1),
(511, 0, 82, 76, '', 0),
(512, 1, 82, 77, NULL, NULL),
(513, 2, 80, 77, NULL, NULL),
(514, 4, 85, 77, NULL, NULL),
(515, 0, 87, 77, NULL, NULL),
(516, 3, 79, 77, NULL, NULL),
(517, 13, 83, 78, '', 1),
(518, 0, 96, 78, '', 1),
(519, 7, 85, 78, '', 0),
(520, 2, 93, 78, '', 0),
(521, 11, 90, 78, '', 0),
(522, 4, 89, 78, '', 0),
(523, 6, 92, 78, '', 0),
(524, 8, 84, 78, '', 0),
(525, 9, 95, 78, '', 0),
(526, 12, 86, 78, '', 0),
(527, 3, 94, 78, '', 0),
(528, 1, 79, 78, '', 1),
(529, 10, 80, 78, '', 0),
(530, 5, 87, 78, '', 0),
(531, 13, 83, 79, NULL, NULL),
(532, 9, 95, 79, NULL, NULL),
(533, 11, 90, 79, NULL, NULL),
(534, 5, 87, 79, NULL, NULL),
(535, 12, 86, 79, NULL, NULL),
(536, 10, 80, 79, NULL, NULL),
(537, 3, 94, 79, NULL, NULL),
(538, 1, 79, 79, NULL, NULL),
(539, 2, 93, 79, NULL, NULL),
(540, 4, 89, 79, NULL, NULL),
(541, 7, 85, 79, NULL, NULL),
(542, 6, 92, 79, NULL, NULL),
(543, 0, 96, 79, NULL, NULL),
(544, 8, 84, 79, NULL, NULL),
(545, 3, 82, 80, '', 1),
(546, 5, 96, 80, '', 1),
(547, 6, 93, 80, '', 1),
(548, 2, 85, 80, '', 0),
(549, 7, 92, 80, '', 1),
(550, 1, 86, 80, '', 0),
(551, 8, 91, 80, '', 0),
(552, 4, 87, 80, '', 0),
(553, 0, 80, 80, '', 0),
(554, 0, 80, 81, '', 0),
(555, 6, 93, 81, '', 0),
(556, 5, 96, 81, '', 1),
(557, 2, 85, 81, '', 0),
(558, 4, 87, 81, '', 0),
(559, 1, 86, 81, '', 0),
(560, 3, 82, 81, '', 0),
(561, 8, 91, 81, '', 0),
(562, 7, 92, 81, '', 0),
(563, 5, 93, 82, '', 1),
(564, 4, 95, 82, '', 1),
(565, 0, 78, 82, '', 0),
(566, 7, 85, 82, '', 0),
(567, 3, 86, 82, '', 0),
(568, 2, 92, 82, '', 1),
(569, 8, 88, 82, '', 0),
(570, 1, 84, 82, '', 1),
(571, 6, 79, 82, '', 0),
(572, 8, 87, 83, '\0', NULL),
(573, 2, 81, 83, '\0', NULL),
(574, 7, 91, 83, '\0', NULL),
(575, 5, 80, 83, '\0', NULL),
(576, 3, 82, 83, '\0', NULL),
(577, 4, 96, 83, '\0', NULL),
(578, 6, 89, 83, '\0', NULL),
(579, 1, 94, 83, '\0', NULL),
(580, 0, 90, 83, '\0', NULL),
(581, 4, 78, 84, '\0', NULL),
(582, 3, 96, 84, '\0', NULL),
(583, 8, 85, 84, '\0', NULL),
(584, 1, 82, 84, '\0', NULL),
(585, 0, 84, 84, '\0', NULL),
(586, 2, 95, 84, '\0', NULL),
(587, 6, 92, 84, '\0', NULL),
(588, 7, 89, 84, '\0', NULL),
(589, 5, 88, 84, '\0', NULL),
(590, 3, 96, 85, '\0', NULL),
(591, 6, 92, 85, '\0', NULL),
(592, 0, 84, 85, '\0', NULL),
(593, 2, 95, 85, '\0', NULL),
(594, 1, 82, 85, '\0', NULL),
(595, 4, 78, 85, '\0', NULL),
(596, 8, 85, 85, '\0', NULL),
(597, 7, 89, 85, '\0', NULL),
(598, 5, 88, 85, '\0', NULL),
(599, 3, 81, 86, '', 1),
(600, 2, 86, 86, '', 0),
(601, 1, 99, 86, '', 0),
(602, 7, 83, 86, '', 1),
(603, 9, 101, 86, '', 0),
(604, 10, 78, 86, '', 0),
(605, 0, 80, 86, '', 0),
(606, 5, 98, 86, '', 0),
(607, 6, 102, 86, '', 0),
(608, 4, 105, 86, '', 0),
(609, 8, 89, 86, '', 1),
(610, 10, 78, 87, '\0', NULL),
(611, 6, 102, 87, '\0', NULL),
(612, 8, 89, 87, '\0', NULL),
(613, 2, 86, 87, '\0', NULL),
(614, 9, 101, 87, '\0', NULL),
(615, 0, 80, 87, '\0', NULL),
(616, 5, 98, 87, '\0', NULL),
(617, 7, 83, 87, '\0', NULL),
(618, 1, 99, 87, '\0', NULL),
(619, 4, 105, 87, '\0', NULL),
(620, 3, 81, 87, '\0', NULL),
(621, 1, 111, 88, '\0', NULL),
(622, 0, 112, 88, '\0', NULL),
(623, 1, 111, 89, '\0', NULL),
(624, 0, 112, 89, '\0', NULL),
(625, 0, 113, 90, '\0', NULL),
(626, 0, 113, 91, '', 0),
(627, 11, 85, 92, '\0', NULL),
(628, 9, 100, 92, '\0', NULL),
(629, 8, 103, 92, '\0', NULL),
(630, 4, 108, 92, '\0', NULL),
(631, 0, 99, 92, '\0', NULL),
(632, 7, 105, 92, '\0', NULL),
(633, 6, 97, 92, '\0', NULL),
(634, 2, 106, 92, '\0', NULL),
(635, 10, 84, 92, '\0', NULL),
(636, 3, 78, 92, '\0', NULL),
(637, 1, 86, 92, '\0', NULL),
(638, 5, 114, 92, '\0', NULL),
(639, 10, 84, 93, '\0', NULL),
(640, 1, 86, 93, '\0', NULL),
(641, 9, 100, 93, '\0', NULL),
(642, 8, 103, 93, '\0', NULL),
(643, 5, 114, 93, '\0', NULL),
(644, 3, 78, 93, '\0', NULL),
(645, 6, 97, 93, '\0', NULL),
(646, 2, 106, 93, '\0', NULL),
(647, 11, 85, 93, '\0', NULL),
(648, 7, 105, 93, '\0', NULL),
(649, 0, 99, 93, '\0', NULL),
(650, 4, 108, 93, '\0', NULL),
(651, 5, 104, 94, '\0', NULL),
(652, 2, 86, 94, '\0', NULL),
(653, 11, 80, 94, '\0', NULL),
(654, 7, 87, 94, '\0', NULL),
(655, 10, 98, 94, '\0', NULL),
(656, 9, 84, 94, '\0', NULL),
(657, 1, 106, 94, '\0', NULL),
(658, 3, 82, 94, '\0', NULL),
(659, 0, 83, 94, '\0', NULL),
(660, 8, 101, 94, '\0', NULL),
(661, 6, 107, 94, '\0', NULL),
(662, 4, 114, 94, '\0', NULL),
(663, 11, 80, 95, '\0', NULL),
(664, 7, 87, 95, '\0', NULL),
(665, 9, 84, 95, '\0', NULL),
(666, 6, 107, 95, '\0', NULL),
(667, 1, 106, 95, '\0', NULL),
(668, 0, 83, 95, '\0', NULL),
(669, 5, 104, 95, '\0', NULL),
(670, 8, 101, 95, '\0', NULL),
(671, 2, 86, 95, '\0', NULL),
(672, 4, 114, 95, '\0', NULL),
(673, 10, 98, 95, '\0', NULL),
(674, 3, 82, 95, '\0', NULL),
(675, 11, 85, 96, '\0', NULL),
(676, 5, 82, 96, '\0', NULL),
(677, 3, 83, 96, '\0', NULL),
(678, 2, 103, 96, '\0', NULL),
(679, 4, 114, 96, '\0', NULL),
(680, 9, 98, 96, '\0', NULL),
(681, 1, 79, 96, '\0', NULL),
(682, 8, 105, 96, '\0', NULL),
(683, 6, 87, 96, '\0', NULL),
(684, 10, 86, 96, '\0', NULL),
(685, 7, 106, 96, '\0', NULL),
(686, 0, 107, 96, '\0', NULL),
(687, 8, 105, 97, '\0', NULL),
(688, 11, 85, 97, '\0', NULL),
(689, 1, 79, 97, '\0', NULL),
(690, 2, 103, 97, '\0', NULL),
(691, 9, 98, 97, '\0', NULL),
(692, 10, 86, 97, '\0', NULL),
(693, 6, 87, 97, '\0', NULL),
(694, 3, 83, 97, '\0', NULL),
(695, 0, 107, 97, '\0', NULL),
(696, 7, 106, 97, '\0', NULL),
(697, 5, 82, 97, '\0', NULL),
(698, 4, 114, 97, '\0', NULL),
(699, 9, 99, 98, '', 0),
(700, 2, 78, 98, '', 0),
(701, 1, 102, 98, '', 0),
(702, 7, 114, 98, '', 0),
(703, 5, 103, 98, '', 0),
(704, 0, 98, 98, '', 0),
(705, 8, 104, 98, '', 0),
(706, 3, 87, 98, '', 0),
(707, 4, 108, 98, '', 0),
(708, 11, 79, 98, '', 0),
(709, 10, 81, 98, '', 0),
(710, 6, 85, 98, '', 0),
(711, 7, 114, 99, '', 0),
(712, 1, 102, 99, '', 0),
(713, 10, 81, 99, '', 0),
(714, 9, 99, 99, '', 0),
(715, 0, 98, 99, '', 0),
(716, 6, 85, 99, '', 0),
(717, 5, 103, 99, '', 0),
(718, 4, 108, 99, '', 0),
(719, 3, 87, 99, '', 0),
(720, 11, 79, 99, '', 1),
(721, 8, 104, 99, '', 0),
(722, 2, 78, 99, '', 1),
(723, 6, 84, 100, '\0', NULL),
(724, 7, 102, 100, '\0', NULL),
(725, 2, 97, 100, '\0', NULL),
(726, 10, 114, 100, '\0', NULL),
(727, 3, 86, 100, '\0', NULL),
(728, 5, 78, 100, '\0', NULL),
(729, 0, 80, 100, '\0', NULL),
(730, 4, 79, 100, '\0', NULL),
(731, 11, 104, 100, '\0', NULL),
(732, 9, 105, 100, '\0', NULL),
(733, 1, 89, 100, '\0', NULL),
(734, 8, 82, 100, '\0', NULL),
(735, 4, 79, 101, '\0', NULL),
(736, 0, 80, 101, '\0', NULL),
(737, 3, 86, 101, '\0', NULL),
(738, 1, 89, 101, '\0', NULL),
(739, 11, 104, 101, '\0', NULL),
(740, 8, 82, 101, '\0', NULL),
(741, 9, 105, 101, '\0', NULL),
(742, 6, 84, 101, '\0', NULL),
(743, 5, 78, 101, '\0', NULL),
(744, 7, 102, 101, '\0', NULL),
(745, 10, 114, 101, '\0', NULL),
(746, 2, 97, 101, '\0', NULL),
(747, 6, 84, 102, '', 1),
(748, 10, 114, 102, '', 0),
(749, 1, 89, 102, '', 1),
(750, 11, 104, 102, '', 0),
(751, 8, 82, 102, '', 1),
(752, 5, 78, 102, '', 1),
(753, 3, 86, 102, '', 0),
(754, 0, 80, 102, '', 1),
(755, 7, 102, 102, '', 0),
(756, 9, 105, 102, '', 0),
(757, 2, 97, 102, '', 1),
(758, 4, 79, 102, '', 1),
(759, 1, 84, 103, '\0', NULL),
(760, 11, 103, 103, '\0', NULL),
(761, 5, 83, 103, '\0', NULL),
(762, 6, 104, 103, '\0', NULL),
(763, 8, 108, 103, '\0', NULL),
(764, 4, 99, 103, '\0', NULL),
(765, 10, 98, 103, '\0', NULL),
(766, 3, 107, 103, '\0', NULL),
(767, 2, 89, 103, '\0', NULL),
(768, 0, 86, 103, '\0', NULL),
(769, 7, 79, 103, '\0', NULL),
(770, 9, 87, 103, '\0', NULL),
(771, 1, 84, 104, '', 1),
(772, 11, 103, 104, '', 0),
(773, 7, 79, 104, '', 1),
(774, 0, 86, 104, '', 0),
(775, 5, 83, 104, '', 1),
(776, 6, 104, 104, '', 0),
(777, 10, 98, 104, '', 1),
(778, 4, 99, 104, '', 1),
(779, 3, 107, 104, '', 1),
(780, 8, 108, 104, '', 0),
(781, 2, 89, 104, '', 1),
(782, 9, 87, 104, '', 0),
(783, 3, 107, 105, '\0', NULL),
(784, 6, 104, 105, '\0', NULL),
(785, 11, 103, 105, '\0', NULL),
(786, 8, 108, 105, '\0', NULL),
(787, 0, 86, 105, '\0', NULL),
(788, 7, 79, 105, '\0', NULL),
(789, 4, 99, 105, '\0', NULL),
(790, 5, 83, 105, '\0', NULL),
(791, 9, 87, 105, '\0', NULL),
(792, 1, 84, 105, '\0', NULL),
(793, 10, 98, 105, '\0', NULL),
(794, 2, 89, 105, '\0', NULL),
(795, 6, 98, 106, '\0', NULL),
(796, 4, 89, 106, '\0', NULL),
(797, 8, 87, 106, '\0', NULL),
(798, 9, 107, 106, '\0', NULL),
(799, 10, 100, 106, '\0', NULL),
(800, 2, 86, 106, '\0', NULL),
(801, 7, 85, 106, '\0', NULL),
(802, 5, 105, 106, '\0', NULL),
(803, 3, 84, 106, '\0', NULL),
(804, 0, 102, 106, '\0', NULL),
(805, 11, 79, 106, '\0', NULL),
(806, 1, 83, 106, '\0', NULL),
(807, 6, 98, 107, '\0', NULL),
(808, 2, 86, 107, '\0', NULL),
(809, 8, 87, 107, '\0', NULL),
(810, 9, 107, 107, '\0', NULL),
(811, 0, 102, 107, '\0', NULL),
(812, 1, 83, 107, '\0', NULL),
(813, 3, 84, 107, '\0', NULL),
(814, 10, 100, 107, '\0', NULL),
(815, 5, 105, 107, '\0', NULL),
(816, 11, 79, 107, '\0', NULL),
(817, 7, 85, 107, '\0', NULL),
(818, 4, 89, 107, '\0', NULL),
(819, 10, 100, 108, '\0', NULL),
(820, 8, 87, 108, '\0', NULL),
(821, 3, 84, 108, '\0', NULL),
(822, 2, 86, 108, '\0', NULL),
(823, 4, 89, 108, '\0', NULL),
(824, 9, 107, 108, '\0', NULL),
(825, 7, 85, 108, '\0', NULL),
(826, 5, 105, 108, '\0', NULL),
(827, 0, 102, 108, '', 0),
(828, 11, 79, 108, '\0', NULL),
(829, 6, 98, 108, '\0', NULL),
(830, 1, 83, 108, '\0', NULL),
(831, 0, 116, 109, '\0', NULL),
(832, 0, 116, 110, '\0', NULL),
(833, 0, 116, 111, '\0', NULL),
(834, 1, 124, 112, '', 0),
(835, 5, 119, 112, '', 1),
(836, 0, 127, 112, '', 0),
(837, 3, 122, 112, '', 1),
(838, 4, 126, 112, '', 1),
(839, 2, 118, 112, '', 1),
(840, 5, 119, 113, '', 1),
(841, 3, 122, 113, '', 1),
(842, 4, 126, 113, '', 1),
(843, 1, 124, 113, '', 1),
(844, 2, 118, 113, '', 1),
(845, 0, 127, 113, '', 1),
(846, 0, 127, 114, '\0', NULL),
(847, 5, 119, 114, '\0', NULL),
(848, 2, 118, 114, '\0', NULL),
(849, 3, 122, 114, '\0', NULL),
(850, 4, 126, 114, '\0', NULL),
(851, 1, 124, 114, '\0', NULL),
(852, 5, 119, 115, '', 1),
(853, 3, 130, 115, '', 1),
(854, 4, 124, 115, '', 1),
(855, 2, 121, 115, '', 1),
(856, 1, 118, 115, '', 1),
(857, 0, 127, 115, '', 1),
(858, 5, 123, 116, '', 1),
(859, 4, 129, 116, '', 0),
(860, 3, 120, 116, '', 1),
(861, 2, 122, 116, '', 0),
(862, 1, 126, 116, '', 0),
(863, 0, 128, 116, '', 0),
(864, 4, 124, 117, '\0', NULL),
(865, 3, 130, 117, '\0', NULL),
(866, 0, 127, 117, '\0', NULL),
(867, 1, 118, 117, '\0', NULL),
(868, 2, 121, 117, '\0', NULL),
(869, 5, 119, 117, '\0', NULL),
(870, 4, 121, 118, '\0', NULL),
(871, 2, 126, 118, '\0', NULL),
(872, 0, 129, 118, '\0', NULL),
(873, 1, 118, 118, '\0', NULL),
(874, 3, 130, 118, '\0', NULL),
(875, 5, 120, 118, '\0', NULL),
(876, 5, 120, 119, '\0', NULL),
(877, 2, 126, 119, '\0', NULL),
(878, 4, 121, 119, '\0', NULL),
(879, 3, 130, 119, '\0', NULL),
(880, 1, 118, 119, '\0', NULL),
(881, 0, 129, 119, '\0', NULL),
(882, 1, 118, 120, '\0', NULL),
(883, 5, 120, 120, '\0', NULL),
(884, 2, 126, 120, '\0', NULL),
(885, 4, 121, 120, '\0', NULL),
(886, 3, 130, 120, '\0', NULL),
(887, 0, 129, 120, '\0', NULL),
(888, 4, 129, 121, '\0', NULL),
(889, 0, 126, 121, '\0', NULL),
(890, 2, 124, 121, '\0', NULL),
(891, 1, 128, 121, '\0', NULL),
(892, 5, 123, 121, '\0', NULL),
(893, 3, 125, 121, '\0', NULL),
(894, 5, 120, 122, '\0', NULL),
(895, 4, 131, 122, '\0', NULL),
(896, 3, 122, 122, '\0', NULL),
(897, 2, 119, 122, '\0', NULL),
(898, 1, 127, 122, '\0', NULL),
(899, 0, 118, 122, '\0', NULL),
(900, 2, 124, 123, '', 1),
(901, 5, 123, 123, '', 1),
(902, 4, 129, 123, '', 0),
(903, 0, 126, 123, '', 1),
(904, 3, 125, 123, '', 0),
(905, 1, 128, 123, '', 0),
(906, 0, 118, 124, '\0', NULL),
(907, 1, 129, 124, '\0', NULL),
(908, 4, 123, 124, '\0', NULL),
(909, 2, 131, 124, '\0', NULL),
(910, 5, 125, 124, '\0', NULL),
(911, 3, 126, 124, '\0', NULL),
(912, 1, 130, 125, '', 1),
(913, 5, 121, 125, '', 1),
(914, 0, 128, 125, '', 1),
(915, 2, 124, 125, '', 1),
(916, 3, 119, 125, '', 1),
(917, 4, 120, 125, '', 0),
(918, 1, 129, 126, '', 1),
(919, 0, 118, 126, '', 1),
(920, 2, 131, 126, '', 0),
(921, 4, 123, 126, '', 0),
(922, 5, 125, 126, '', 1),
(923, 3, 126, 126, '', 1),
(924, 4, 130, 127, '', 1),
(925, 3, 128, 127, '', 1),
(926, 2, 121, 127, '', 1),
(927, 0, 123, 127, '', 0),
(928, 5, 122, 127, '', 0),
(929, 1, 118, 127, '', 1),
(930, 5, 122, 128, '\0', NULL),
(931, 3, 128, 128, '\0', NULL),
(932, 2, 121, 128, '\0', NULL),
(933, 1, 118, 128, '\0', NULL),
(934, 0, 123, 128, '\0', NULL),
(935, 4, 130, 128, '\0', NULL),
(936, 5, 122, 129, '\0', NULL),
(937, 0, 123, 129, '\0', NULL),
(938, 4, 130, 129, '\0', NULL),
(939, 1, 118, 129, '\0', NULL),
(940, 3, 128, 129, '\0', NULL),
(941, 2, 121, 129, '\0', NULL),
(942, 4, 125, 130, '\0', NULL),
(943, 3, 121, 130, '\0', NULL),
(944, 2, 129, 130, '\0', NULL),
(945, 5, 124, 130, '\0', NULL),
(946, 1, 130, 130, '\0', NULL),
(947, 0, 127, 130, '\0', NULL),
(948, 1, 120, 131, '\0', NULL),
(949, 4, 128, 131, '\0', NULL),
(950, 2, 123, 131, '\0', NULL),
(951, 5, 131, 131, '\0', NULL),
(952, 3, 122, 131, '\0', NULL),
(953, 0, 118, 131, '\0', NULL),
(954, 2, 129, 132, '\0', NULL),
(955, 1, 130, 132, '\0', NULL),
(956, 5, 124, 132, '\0', NULL),
(957, 0, 127, 132, '\0', NULL),
(958, 4, 125, 132, '\0', NULL),
(959, 3, 121, 132, '\0', NULL),
(960, 4, 123, 133, '\0', NULL),
(961, 5, 124, 133, '\0', NULL),
(962, 2, 128, 133, '\0', NULL),
(963, 1, 126, 133, '\0', NULL),
(964, 3, 121, 133, '\0', NULL),
(965, 0, 125, 133, '\0', NULL),
(966, 5, 124, 134, '\0', NULL),
(967, 0, 125, 134, '\0', NULL),
(968, 3, 121, 134, '\0', NULL),
(969, 2, 128, 134, '\0', NULL),
(970, 4, 123, 134, '\0', NULL),
(971, 1, 126, 134, '\0', NULL),
(972, 4, 129, 135, '\0', NULL),
(973, 0, 122, 135, '\0', NULL),
(974, 3, 118, 135, '\0', NULL),
(975, 5, 127, 135, '\0', NULL),
(976, 2, 120, 135, '\0', NULL),
(977, 1, 130, 135, '\0', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `Rooms`
--

CREATE TABLE IF NOT EXISTS `Rooms` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `networkaddress` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `Rooms`
--

INSERT INTO `Rooms` (`id`, `description`, `networkaddress`) VALUES
(1, '202 laboratory', '172.16.1.0/24'),
(2, '126 laboratory', '172.16.2.0/24');

-- --------------------------------------------------------

--
-- Table structure for table `StudentLesson`
--

CREATE TABLE IF NOT EXISTS `StudentLesson` (
  `student_id` bigint(20) NOT NULL,
  `lesson_id` bigint(20) NOT NULL,
  PRIMARY KEY (`lesson_id`,`student_id`),
  KEY `FKEBB9733317038ED5` (`student_id`),
  KEY `FKEBB973339906705F` (`lesson_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `StudentLesson`
--

INSERT INTO `StudentLesson` (`student_id`, `lesson_id`) VALUES
(2, 2),
(3, 2),
(13, 2),
(3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `Students`
--

CREATE TABLE IF NOT EXISTS `Students` (
  `student_id` bigint(20) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`student_id`),
  KEY `FK73AC29B870A7F35E` (`student_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Students`
--

INSERT INTO `Students` (`student_id`, `code`, `firstName`, `lastName`) VALUES
(2, 'D.SW06D103', 'Hannah', 'Montana'),
(3, 'D.PT09D999', 'Chris', 'Josh'),
(13, 'newbie', 'newbie', 'N');

-- --------------------------------------------------------

--
-- Table structure for table `SystemUsers`
--

CREATE TABLE IF NOT EXISTS `SystemUsers` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userName` varchar(255) NOT NULL,
  `pass` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `SystemUsers`
--

INSERT INTO `SystemUsers` (`id`, `userName`, `pass`) VALUES
(1, 'D.SW40', 'huder'),
(2, 'D.SW06D103', 'mongol'),
(3, 'D.PT09D999', 'mongol'),
(13, 'newbie', 'newbie');

-- --------------------------------------------------------

--
-- Table structure for table `TeacherLesson`
--

CREATE TABLE IF NOT EXISTS `TeacherLesson` (
  `teacher_id` bigint(20) NOT NULL,
  `lesson_id` bigint(20) NOT NULL,
  PRIMARY KEY (`lesson_id`,`teacher_id`),
  KEY `teacher_id` (`teacher_id`),
  KEY `lesson_id` (`lesson_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `TeacherLesson`
--

INSERT INTO `TeacherLesson` (`teacher_id`, `lesson_id`) VALUES
(1, 2),
(1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `Teachers`
--

CREATE TABLE IF NOT EXISTS `Teachers` (
  `teacher_id` bigint(20) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastName` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`teacher_id`),
  KEY `FK9FE214F1670FF457` (`teacher_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Teachers`
--

INSERT INTO `Teachers` (`teacher_id`, `code`, `firstName`, `lastName`) VALUES
(1, 'D.SW40', 'Хүдэр', 'Алтангэрэл');

-- --------------------------------------------------------

--
-- Table structure for table `Test`
--

CREATE TABLE IF NOT EXISTS `Test` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `durationInMinute` int(11) DEFAULT NULL,
  `startDate` datetime DEFAULT NULL,
  `endDate` datetime DEFAULT NULL,
  `isRegisterStudentAtRuntime` bit(1) DEFAULT NULL,
  `isStartFromLogin` bit(1) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `examtype_id` bigint(20) DEFAULT NULL,
  `protocol_id` bigint(20) DEFAULT NULL,
  `lesson_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK27B8B279D69F1F` (`protocol_id`),
  KEY `FK27B8B29906705F` (`lesson_id`),
  KEY `FK27B8B2B74FFF9F` (`examtype_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=74 ;

--
-- Dumping data for table `Test`
--

INSERT INTO `Test` (`id`, `description`, `durationInMinute`, `startDate`, `endDate`, `isRegisterStudentAtRuntime`, `isStartFromLogin`, `state`, `examtype_id`, `protocol_id`, `lesson_id`) VALUES
(73, '', 45, '2009-12-01 00:00:11', '2009-12-31 00:00:11', '\0', '\0', 0, 1, 90, 2),
(70, '', 10, '2009-12-01 00:00:41', '2009-12-31 00:00:41', '\0', '\0', 0, 1, 84, 2),
(71, '', 23, '2009-12-01 00:00:13', '2009-12-31 00:00:13', '\0', '\0', 0, 2, 86, 2),
(72, '', 34, '2009-12-01 00:00:26', '2009-12-31 00:00:26', '\0', '\0', 0, 3, 88, 2);

-- --------------------------------------------------------

--
-- Table structure for table `TestRoom`
--

CREATE TABLE IF NOT EXISTS `TestRoom` (
  `test_id` bigint(20) NOT NULL,
  `room_id` bigint(20) NOT NULL,
  PRIMARY KEY (`test_id`,`room_id`),
  KEY `FKBF7F04AD77D527B2` (`room_id`),
  KEY `FKBF7F04ADA42C1F5F` (`test_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `TestRoom`
--

INSERT INTO `TestRoom` (`test_id`, `room_id`) VALUES
(1, -1),
(2, -1),
(3, -1),
(39, 1),
(66, 1),
(67, 1),
(68, 1),
(70, -1),
(70, 1),
(70, 2),
(71, 1),
(72, 1),
(73, -1),
(73, 1),
(73, 2);

-- --------------------------------------------------------

--
-- Table structure for table `Topic`
--

CREATE TABLE IF NOT EXISTS `Topic` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `lesson_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK4D3DD0F9906705F` (`lesson_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `Topic`
--

INSERT INTO `Topic` (`id`, `description`, `lesson_id`) VALUES
(1, 'Encapsulation', 2),
(4, 'Удамшил', 2),
(5, 'Мод', 3);

-- --------------------------------------------------------

--
-- Table structure for table `TrueFalse`
--

CREATE TABLE IF NOT EXISTS `TrueFalse` (
  `truefalse_id` bigint(20) NOT NULL,
  `value` bit(1) DEFAULT NULL,
  `point` double DEFAULT NULL,
  PRIMARY KEY (`truefalse_id`),
  KEY `FKC6551C15A46FB990` (`truefalse_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `TrueFalse`
--

INSERT INTO `TrueFalse` (`truefalse_id`, `value`, `point`) VALUES
(131, '', 1),
(126, '', 1),
(123, '', 1),
(122, '\0', 1),
(120, '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `UFile`
--

CREATE TABLE IF NOT EXISTS `UFile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fileName` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `fileType` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `teacher_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK4CF3771279ED975` (`teacher_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `UFile`
--

INSERT INTO `UFile` (`id`, `fileName`, `fileType`, `name`, `url`, `teacher_id`) VALUES
(1, 'ЭЗО.odt', 'Зураг', 'sdasd', 'XUTlZTuGfxqcIfvtLTrv.odt', NULL),
(2, 'Translation.odt', 'Зураг', 'Орчуулга', 'ARtWgkljwmdSWAVIDCkh.odt', NULL),
(7, '0109e1a52c54thumb.png', 'Зураг', 'Graphic', 'gCwWvjNyBIYMlEBDxeTm.png', NULL),
(4, 'blackboard.jpg', 'Зураг', 'Самбар', 'HbOLHWXQEyGBMQQErTIy.jpg', 1),
(6, 'mexicana_light.jpg', 'Зураг', 'Нууц ', 'kqPgEJCgEHLaEwTVJYGo.jpg', 1),
(8, 'Michael Jackson-Billie Jean-30th Anniversary Special.flv', 'Видео', 'MJ forever', 'hQJbRUFuZEPKXLToDjRx.flv', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `Variant`
--

CREATE TABLE IF NOT EXISTS `Variant` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `test_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK7155A865A42C1F5F` (`test_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=133 ;

--
-- Dumping data for table `Variant`
--

INSERT INTO `Variant` (`id`, `test_id`) VALUES
(98, 53),
(122, 68),
(121, 68),
(93, 47),
(127, 71),
(128, 71),
(119, 67),
(120, 67),
(117, 66),
(118, 66),
(129, 72),
(132, 73),
(125, 70),
(126, 70),
(130, 72),
(131, 73),
(112, 62);

-- --------------------------------------------------------

--
-- Table structure for table `VariantQuestions`
--

CREATE TABLE IF NOT EXISTS `VariantQuestions` (
  `variant_id` bigint(20) NOT NULL,
  `question_id` bigint(20) NOT NULL,
  PRIMARY KEY (`variant_id`,`question_id`),
  KEY `FKDEB85A683AF27295` (`variant_id`),
  KEY `FKDEB85A68C13EF45F` (`question_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `VariantQuestions`
--

INSERT INTO `VariantQuestions` (`variant_id`, `question_id`) VALUES
(117, 118),
(117, 119),
(117, 122),
(117, 124),
(117, 126),
(117, 127),
(118, 120),
(118, 123),
(118, 125),
(118, 128),
(118, 129),
(118, 130),
(119, 118),
(119, 119),
(119, 121),
(119, 124),
(119, 127),
(119, 130),
(120, 120),
(120, 122),
(120, 123),
(120, 126),
(120, 128),
(120, 129),
(121, 118),
(121, 120),
(121, 121),
(121, 126),
(121, 129),
(121, 130),
(122, 119),
(122, 122),
(122, 123),
(122, 125),
(122, 127),
(122, 128),
(125, 118),
(125, 123),
(125, 125),
(125, 126),
(125, 129),
(125, 131),
(126, 119),
(126, 120),
(126, 121),
(126, 124),
(126, 128),
(126, 130),
(127, 118),
(127, 121),
(127, 122),
(127, 123),
(127, 128),
(127, 130),
(128, 119),
(128, 120),
(128, 124),
(128, 126),
(128, 129),
(128, 131),
(129, 121),
(129, 124),
(129, 125),
(129, 127),
(129, 129),
(129, 130),
(130, 118),
(130, 120),
(130, 122),
(130, 123),
(130, 128),
(130, 131),
(131, 121),
(131, 123),
(131, 124),
(131, 125),
(131, 126),
(131, 128),
(132, 118),
(132, 120),
(132, 122),
(132, 127),
(132, 129),
(132, 130);
