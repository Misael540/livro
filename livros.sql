-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 28-Out-2020 às 05:29
-- Versão do servidor: 10.1.37-MariaDB
-- versão do PHP: 7.3.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `base`
--
CREATE DATABASE IF NOT EXISTS `base` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `base`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `bases`
--

CREATE TABLE `bases` (
  `id` int(11) NOT NULL,
  `category` varchar(256) NOT NULL,
  `color` varchar(10) NOT NULL,
  `precent` int(10) NOT NULL,
  `type` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `bases`
--

INSERT INTO `bases` (`id`, `category`, `color`, `precent`, `type`) VALUES
(1, '4', '#2b9032', 100, 1),
(2, '3', '#ffa200', 50, 1),
(3, '1', '#ff1800', 30, 1),
(4, '2', '#48be6d', 85, 1),
(5, '1', '#f39826', 50, 2),
(6, '2', '#f40023', 27, 2),
(7, '3', '#329001', 90, 2),
(8, '4', '#329001', 85, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `cards`
--

CREATE TABLE `cards` (
  `cardId` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `categoryId` int(11) NOT NULL DEFAULT '1',
  `cardUsed` int(11) NOT NULL DEFAULT '0',
  `cardContent` varchar(512) NOT NULL,
  `cardNum` varchar(20) NOT NULL,
  `cardMon` varchar(10) NOT NULL,
  `cardYea` varchar(10) NOT NULL,
  `cardCvv` varchar(10) DEFAULT NULL,
  `cardCou` varchar(128) NOT NULL,
  `CardState` varchar(255) NOT NULL,
  `CardCity` varchar(255) NOT NULL,
  `CardZip` varchar(255) NOT NULL,
  `cardSpliter` varchar(11) NOT NULL,
  `cardNumPost` int(11) NOT NULL,
  `cardMonPost` int(11) NOT NULL,
  `cardYeaPost` int(11) NOT NULL,
  `cardCvvPost` int(11) NOT NULL,
  `cardCouPost` int(11) NOT NULL,
  `CardStatePost` int(11) NOT NULL,
  `CardCityPost` int(11) NOT NULL,
  `CardZipPost` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `price` varchar(11) NOT NULL DEFAULT '0',
  `seller` int(11) NOT NULL DEFAULT '1',
  `sellerprc` varchar(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `category`
--

CREATE TABLE `category` (
  `categoryId` int(11) NOT NULL,
  `categoryName` varchar(256) NOT NULL,
  `categoryInfo` text NOT NULL,
  `categoryPrice` double NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `category`
--

INSERT INTO `category` (`categoryId`, `categoryName`, `categoryInfo`, `categoryPrice`) VALUES
(1, 'USBASE01', 'seller1/seller2', 3.5),
(2, 'USBASE02', 'EXAMPLE2', 2),
(3, 'EUBASE4', 'EXAMPLE3', 0),
(4, 'MIXDBCVV', 'for admin', 0),
(5, 'TEST category', 'for admin', 0),
(6, 'TEST categoryz', 'for admin', 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `dumpcategory`
--

CREATE TABLE `dumpcategory` (
  `categoryId` int(11) NOT NULL,
  `categoryName` varchar(256) NOT NULL,
  `categoryInfo` text NOT NULL,
  `categoryPrice` double NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `dumpcategory`
--

INSERT INTO `dumpcategory` (`categoryId`, `categoryName`, `categoryInfo`, `categoryPrice`) VALUES
(1, 'USA DUMPS', 'great valid', 30),
(2, 'NO RUSSIAN DUMPS', 'skimmer', 150),
(3, 'JACKPOS DB', 'example)', 0),
(4, 'EUBASE[100%]', '101% valid', 0),
(6, 'emty cay', 'emty cay', 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `dumps`
--

CREATE TABLE `dumps` (
  `dumpId` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `categoryId` int(11) NOT NULL DEFAULT '1',
  `dumpUsed` int(11) NOT NULL DEFAULT '0',
  `dumpContent` varchar(512) NOT NULL,
  `dumpNum` varchar(20) NOT NULL,
  `dumpMon` varchar(10) NOT NULL,
  `dumpYea` varchar(10) NOT NULL,
  `dumpCou` varchar(128) NOT NULL,
  `dumpcode` int(11) NOT NULL,
  `dumptype` varchar(255) NOT NULL DEFAULT '-',
  `dumpclass` varchar(255) NOT NULL DEFAULT '-',
  `dumplevel` varchar(255) NOT NULL DEFAULT '-',
  `dumpbank` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  `price` varchar(11) NOT NULL,
  `seller` int(11) NOT NULL DEFAULT '1',
  `sellerprc` varchar(11) NOT NULL DEFAULT '0',
  `pack` int(11) DEFAULT '0',
  `checkermsg` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `faq`
--

CREATE TABLE `faq` (
  `categoryId` int(11) NOT NULL,
  `categoryName` varchar(256) NOT NULL,
  `categoryIcon` varchar(256) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `faq`
--

INSERT INTO `faq` (`categoryId`, `categoryName`, `categoryIcon`) VALUES
(8, 'Deposit', 'fa fa-money'),
(7, 'Rules', 'fa fa-bullhorn'),
(12, 'Checker', 'fa fa-credit-card');

-- --------------------------------------------------------

--
-- Estrutura da tabela `news`
--

CREATE TABLE `news` (
  `id` int(11) NOT NULL,
  `date` varchar(11) NOT NULL,
  `color` varchar(10) NOT NULL,
  `text` varchar(255) NOT NULL,
  `category` int(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `news`
--

INSERT INTO `news` (`id`, `date`, `color`, `text`, `category`) VALUES
(1, '23.09.2014', '#555555', 'ADDED BASE [USA DUMPS]', 1),
(2, '24.09.2014', '#555', 'ADDED BASE [NO RUSSIAN DUMPS]', 1),
(3, '25.09.2014', '#555555', 'ADDED BASE [JACKPOS DB]', 1),
(4, '29.09.2014', '#427dd9', 'ADDED BASE [EUBASE[100%]] - 100% VALID', 1),
(5, '25.09.2014', '#555', 'ADDED BASE [USBASE01]', 2),
(6, '26.09.2014', '#555', 'ADDED BASE [USBASE02]', 2),
(7, '27.09.2014', '#509626', 'BEST EU CVV --> [EUBASE4]', 2),
(8, '28.09.2014', '#bf3535', 'SUPER BIG UPDATE [MIXDBCVV]', 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `orders`
--

CREATE TABLE `orders` (
  `orderId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `approved` int(11) NOT NULL DEFAULT '0',
  `orderTotal` double NOT NULL DEFAULT '0',
  `orderDate` datetime NOT NULL,
  `wallet` varchar(255) NOT NULL,
  `walletbalance` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `btcvalue` varchar(100) NOT NULL DEFAULT 'no',
  `btcreceived` varchar(100) NOT NULL,
  `txhash` varchar(255) NOT NULL,
  `confirmations` varchar(100) NOT NULL,
  `uorderid` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `packs`
--

CREATE TABLE `packs` (
  `Id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `categoryId` int(11) NOT NULL DEFAULT '0',
  `type` varchar(255) NOT NULL DEFAULT '0',
  `level` varchar(255) NOT NULL DEFAULT '0',
  `class` varchar(255) NOT NULL DEFAULT '0',
  `code` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `comment1` varchar(255) NOT NULL,
  `comment2` varchar(255) NOT NULL,
  `Used` int(11) NOT NULL DEFAULT '0',
  `country` varchar(512) NOT NULL,
  `value` int(11) NOT NULL,
  `price` varchar(11) NOT NULL DEFAULT '0',
  `norefund` int(11) NOT NULL DEFAULT '0',
  `seller` int(11) NOT NULL DEFAULT '1',
  `sellerprc` varchar(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `questions`
--

CREATE TABLE `questions` (
  `Id` int(11) NOT NULL,
  `question` varchar(256) NOT NULL,
  `answer` varchar(6256) NOT NULL,
  `categoryId` double NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `questions`
--

INSERT INTO `questions` (`Id`, `question`, `answer`, `categoryId`) VALUES
(10, 'How much time will be credited money in account?', 'Deposit process goes automatically. It usually takes ~10 minutes.\r\n<br>\r\n<font color=\"red\">Wait for 4 block confirmations! Don\'t ask support every 5 minutes.</font>', 8),
(9, 'Main Rules', '<font color=\"green\"><b>√</b></font> <font color=\"black\"> Price for CVV starts from <b>3$</b></font><br>\r\n<font color=\"green\"><b>√</b></font> <font color=\"black\"> Price for dumps starts from <b>10$</b></font><br>\r\n<font color=\"green\"><b><b>√</b></b></font> <font color=\"black\"> Fast automatic payment methods</font><br>\r\n<font color=\"green\"><b>√</b></font> <font color=\"black\"> Frequent UPDATES</font><br>\r\n<font color=\"green\"><b>√</b></font> <font color=\"black\"> Instant stuff delivery</font><br>\r\n<font color=\"green\"><b>√</b></font> <font color=\"black\"> Replace lost/stolen/hold/card error</font><br>\r\n<font color=\"green\"><b>√</b></font> <font color=\"black\"> Fully secure. No logging. No IP tracking</font><br>\r\n<font color=\"green\"><b>√</b></font> <font color=\"black\"> Ticket support contacting</font><br>\r\n<font color=\"green\"><b>√</b></font> <font color=\"black\"> Jabber supporting</font><br>\r\n<font color=\"green\"><b>√</b></font> <font color=\"black\"> Selection of dumps with bin, country, type</font><br>\r\n<font color=\"green\"><b>√</b></font> <font color=\"black\"> Individual approach to each customer</font><br>\r\n<font color=\"red\"><b><b>x</b></b></font> <font color=\"gray\"> NO money back</font><br>\r\n<font color=\"red\"><b>x</b></font> <font color=\"gray\"> NO dumps with pin</font><br>\r\n<font color=\"red\"><b>x</b></font> <font color=\"gray\"> NO any free test</font>', 7),
(16, 'What payment methods are available?', 'Bitcoin and Perfect Money.\r\nDon\'t ask about WU and Webmoney, use exchange services.', 8),
(17, 'Checker said \"UNKNOWN\"', 'It\'s not a refunded way, we replace only DEAD cards.\r\nBut if you know that card not valid - ask support please.', 12),
(18, 'How much time to check?', '<b>60 minutes</b> for dumps and <b>10 minutes</b> for CC.', 12);

-- --------------------------------------------------------

--
-- Estrutura da tabela `salepack`
--

CREATE TABLE `salepack` (
  `id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `used` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `categoryname` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `level` varchar(255) NOT NULL,
  `class` varchar(255) DEFAULT NULL,
  `code` varchar(255) NOT NULL,
  `comment1` varchar(255) NOT NULL,
  `comment2` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `value` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `seller` int(11) NOT NULL,
  `sellerprc` varchar(11) NOT NULL DEFAULT '0',
  `refund` varchar(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `settings`
--

CREATE TABLE `settings` (
  `settingId` int(11) NOT NULL,
  `settingName` varchar(256) NOT NULL,
  `settingInfo` varchar(256) NOT NULL,
  `settingValue` varchar(256) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `settings`
--

INSERT INTO `settings` (`settingId`, `settingName`, `settingInfo`, `settingValue`) VALUES
(1, 'SiteName', 'SiteName', 'CvvDump.com'),
(2, 'Buy&Check', 'Buy&Check', '0'),
(3, 'adminEmail', 'Admin email', 'admin@localhost.com'),
(4, 'homeUrl', 'Site home url', 'http://cvvdump.com/'),
(5, 'currency_code', 'Currency code', 'USD'),
(6, 'currency_symb', 'Currency symbol', '$'),
(7, 'merchant', 'PM ACCOUNT', 'U0004759'),
(8, 'storename', 'PM STORE NAME', 'BestShop'),
(9, 'securityword', 'ALTERNATE PM PASS strtoupper(md5($password)', '80F632EBFE5295A9F8933E360EB382DF'),
(10, 'themeadmin', 'Admin Template', 'theme_black_green.css'),
(11, 'themeusr', 'User Template', 'theme_navy.css'),
(12, 'CheckerPrice', 'Checker Price (0.1 - [dot!])', '0.3'),
(13, 'checktime', 'Time for Check(min)', '10'),
(14, 'blockchain_root', 'Blockchain Root', 'http://blockchain.info/'),
(15, 'blockchain_secret', 'Blockchain random Secret Key', 'RANDOM'),
(16, 'my_bitcoin_address', 'Bitcoin Address', '17ioSud7ha1B2Xjhu5oPPcGChWZY86nPLu'),
(17, 'mindeposit', 'Minimal Deposit', '10'),
(18, 'pmdeposit', 'Deposit PM', '1'),
(19, 'btcdeposit', 'Deposit BTC', '1'),
(20, 'Dump_Buy&Check', 'Dump Buy&Check', '0'),
(21, 'dumpchecktime', 'Dump check Time', '60'),
(22, 'saledump', 'Sale Dumps', '1'),
(23, 'salecc', 'Sale CC', '1'),
(24, 'dumpchecker', 'Dump Checker', 'dumpchecker.php'),
(25, 'CCchecker', 'CC Checker', 'checker.php'),
(26, 'packs', 'Sale Packs', '1'),
(27, 'logo', 'Logo[html]', 'CVV <i class=\"fa fa-credit-card\"></i> DUMP'),
(28, 'salecheck', 'CC Checker', '1'),
(29, 'btcspeed', 'Bitcoin Speed', '1'),
(30, 'btconfirm', 'BTC Confirmations', '2'),
(31, 'bcguid', 'Blockchain GUID', '400000000-0000-4000-0000-00000000000'),
(32, 'bcmainpass', 'Blockchain Main Password', 'password'),
(33, 'UPMUSD', 'Unitaco PM USD', '1'),
(34, 'UWMZ', 'Unitaco WMZ', '1'),
(35, 'UPAYMERZ', 'Unitaco PAYMER Z', '1'),
(36, 'UMERCH', 'Unitaco MERCHANT', 'MERCH'),
(37, 'UPASS', 'Unitaco Password', 'PASSWORD');

-- --------------------------------------------------------

--
-- Estrutura da tabela `support`
--

CREATE TABLE `support` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date_msg` datetime NOT NULL,
  `read_msg` int(11) NOT NULL,
  `msg` text NOT NULL,
  `msgfrom` int(11) NOT NULL,
  `read_msg_admin` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `types`
--

CREATE TABLE `types` (
  `typeId` int(11) NOT NULL,
  `typeName` varchar(128) NOT NULL,
  `typeColor` varchar(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `types`
--

INSERT INTO `types` (`typeId`, `typeName`, `typeColor`) VALUES
(1, 'Admin', '#ff0000'),
(2, 'Member', '#000000'),
(3, 'Seller', '#42aaff');

-- --------------------------------------------------------

--
-- Estrutura da tabela `users`
--

CREATE TABLE `users` (
  `userId` int(11) NOT NULL,
  `username` varchar(128) NOT NULL,
  `password` varchar(128) NOT NULL,
  `jabber` varchar(256) NOT NULL,
  `typeId` int(11) NOT NULL DEFAULT '2',
  `credit` double NOT NULL DEFAULT '0',
  `paids` varchar(50) NOT NULL DEFAULT '0',
  `regDate` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `users`
--

INSERT INTO `users` (`userId`, `username`, `password`, `jabber`, `typeId`, `credit`, `paids`, `regDate`) VALUES
(1, 'admin', '200ceb26807d6bf99fd6f4f0d1ca54d4', 'p9i9n2@0nl1ne.at', 1, 145.5, '0', 1277164490);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bases`
--
ALTER TABLE `bases`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cards`
--
ALTER TABLE `cards`
  ADD PRIMARY KEY (`cardId`),
  ADD UNIQUE KEY `cardContent` (`cardContent`),
  ADD UNIQUE KEY `cardNum` (`cardNum`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`categoryId`),
  ADD UNIQUE KEY `categoryName` (`categoryName`);

--
-- Indexes for table `dumpcategory`
--
ALTER TABLE `dumpcategory`
  ADD PRIMARY KEY (`categoryId`),
  ADD UNIQUE KEY `categoryName` (`categoryName`);

--
-- Indexes for table `dumps`
--
ALTER TABLE `dumps`
  ADD PRIMARY KEY (`dumpId`),
  ADD UNIQUE KEY `dumpContent` (`dumpContent`),
  ADD UNIQUE KEY `dumpNum` (`dumpNum`);

--
-- Indexes for table `faq`
--
ALTER TABLE `faq`
  ADD PRIMARY KEY (`categoryId`),
  ADD UNIQUE KEY `categoryName` (`categoryName`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`orderId`);

--
-- Indexes for table `packs`
--
ALTER TABLE `packs`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `question` (`question`);

--
-- Indexes for table `salepack`
--
ALTER TABLE `salepack`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`settingId`),
  ADD UNIQUE KEY `settingName` (`settingName`);

--
-- Indexes for table `support`
--
ALTER TABLE `support`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `types`
--
ALTER TABLE `types`
  ADD PRIMARY KEY (`typeId`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userId`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bases`
--
ALTER TABLE `bases`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `cards`
--
ALTER TABLE `cards`
  MODIFY `cardId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `categoryId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `dumpcategory`
--
ALTER TABLE `dumpcategory`
  MODIFY `categoryId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `dumps`
--
ALTER TABLE `dumps`
  MODIFY `dumpId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faq`
--
ALTER TABLE `faq`
  MODIFY `categoryId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `orderId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `packs`
--
ALTER TABLE `packs`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `salepack`
--
ALTER TABLE `salepack`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `settingId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `support`
--
ALTER TABLE `support`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `types`
--
ALTER TABLE `types`
  MODIFY `typeId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `userId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- Database: `base_db`
--
CREATE DATABASE IF NOT EXISTS `base_db` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `base_db`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `usuario` text NOT NULL,
  `senha` varchar(255) NOT NULL,
  `tipo` text NOT NULL,
  `saldo` text NOT NULL,
  `email` text NOT NULL,
  `username` text NOT NULL,
  `id` int(11) NOT NULL,
  `criado` text NOT NULL,
  `ultimoacesso` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `usuarios`
--

INSERT INTO `usuarios` (`usuario`, `senha`, `tipo`, `saldo`, `email`, `username`, `id`, `criado`, `ultimoacesso`) VALUES
('', '', '', '', '', '', 0, '', '10/02/199'),
('teste1', 'teste1', 'Vendedor', '10.00', 'teste@gmail.com', 'Vendedor1', 1, '', '10/02/1191');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_2` (`id`),
  ADD KEY `id` (`id`);
--
-- Database: `cpdb`
--
CREATE DATABASE IF NOT EXISTS `cpdb` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `cpdb`;
--
-- Database: `drat_alves`
--
CREATE DATABASE IF NOT EXISTS `drat_alves` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `drat_alves`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `ip_updater`
--

CREATE TABLE `ip_updater` (
  `ID` int(11) NOT NULL,
  `New_IP` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `ip_updater`
--

INSERT INTO `ip_updater` (`ID`, `New_IP`) VALUES
(1, '138.117.220.78');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ip_updater`
--
ALTER TABLE `ip_updater`
  ADD PRIMARY KEY (`ID`);
--
-- Database: `livros`
--
CREATE DATABASE IF NOT EXISTS `livros` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `livros`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `livros`
--

CREATE TABLE `livros` (
  `id` mediumint(9) NOT NULL,
  `nome` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `categoria` varchar(320) COLLATE utf8_unicode_ci DEFAULT NULL,
  `imagem` varchar(320) COLLATE utf8_unicode_ci DEFAULT NULL,
  `autor` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tipo` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `livros`
--

INSERT INTO `livros` (`id`, `nome`, `categoria`, `imagem`, `autor`, `tipo`, `status`) VALUES
(1, 'Batman. Universo', 'Quadrinhos', './photos/batman.jpg', 'Brian Michael Bendis', 'Capa dura', 1),
(80, 'Orgulho e Preconceito', 'Romance', 'https://images-na.ssl-images-amazon.com/images/I/81B4W8NI5CL.jpg', 'Jane Austen', 'Capa comum', 1),
(81, 'Dom Casmurro', 'Romance, FicÃ§Ã£o, MemÃ³rias', 'https://www.grupoescolar.com/galeria/fotos/FE48C49E5.jpg', 'Machado de Assis', 'Capa dura', 1),
(91, 'O Ãšltimo Desejo', 'Romance, Literatura fantÃ¡stica, Alta fantasia', 'https://images-na.ssl-images-amazon.com/images/I/510I0sJK1 L._SX330_BO1,204,203,200_.jpg', 'Andrzej Sapkowski', 'EdiÃ§Ã£o econÃ´mica', 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `login`
--

CREATE TABLE `login` (
  `id` mediumint(9) NOT NULL,
  `level` int(1) DEFAULT NULL,
  `email` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(42) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `login`
--

INSERT INTO `login` (`id`, `level`, `email`, `password`) VALUES
(1, 10, 'admin1@site.com', '202cb962ac59075b964b07152d234b70');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `livros`
--
ALTER TABLE `livros`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `livros`
--
ALTER TABLE `livros`
  MODIFY `id` mediumint(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `id` mediumint(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Database: `magazine`
--
CREATE DATABASE IF NOT EXISTS `magazine` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `magazine`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `infocc`
--

CREATE TABLE `infocc` (
  `id` int(11) DEFAULT NULL,
  `Outros` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `infocc`
--

INSERT INTO `infocc` (`id`, `Outros`) VALUES
(NULL, '{\"Imagem-produto\":\"/smartphone-motorola-g7-play-32gb-indigo-4g-2gb-ram-tela-57-cam-13mp-cam-selfie-8mp/magazineluiza/155549300/d2457e9f08834f0cbec9874e4640bbce.jpg\",\"Preco-produto\":\"659,90\",\"Nome-produto\":\"Smartphone Motorola G7 Play 32GB Indigo 4G - 2GB RAM Tela 5,7u201d Cu00e2m. 13MP + Cu00e2m. Selfie 8MP\",\"email\":\"abilio_silva@gmail.com\",\"cpf\":\"22233366638\",\"fullName\":\"Vanessa Heloisa Monteiro\",\"birthDate\":\"10/02/1987\",\"password\":\"cadastro\",\"zipcode\":\"65068076\",\"address\":\"1u00aa Travessa Conselheiro Hilton Rodrigues\",\"number\":\"32\",\"complement\":\"\",\"bairro\":\"Divinu00e9ia\",\"reference\":\"casa verde\",\"city\":\"Su00e3o Luu00eds\",\"state\":\"MA\",\"telephone\":\"(98) 98380-0143\",\"cardnumber\":\"5307801747647204\",\"expirationMonth\":\"1\",\"expirationYear\":\"2027\",\"CVC\":\"123\",\"parcela-usada\":\"1\",\"senha-card\":\"12345\"}');

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtos`
--

CREATE TABLE `produtos` (
  `visitas` int(11) NOT NULL,
  `link` text NOT NULL,
  `preco` text NOT NULL,
  `nome` text NOT NULL,
  `foto` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `produtos`
--

INSERT INTO `produtos` (`visitas`, `link`, `preco`, `nome`, `foto`) VALUES
(2, '/smartphone-motorola-g7-play-32gb-indigo-4g-2gb-ram-tela-57-cam-13mp-cam-selfie-8mp/p/155549300/te/mtgp/', '659,90', 'Smartphone Motorola G7 Play 32GB Indigo 4G - 2GB RAM Tela 5,7â€ CÃ¢m. 13MP + CÃ¢m. Selfie 8MP', 'https://a-static.mlcdn.com.br/618x463/smartphone-motorola-g7-play-32gb-indigo-4g-2gb-ram-tela-57-cam-13mp-cam-selfie-8mp/magazineluiza/155549300/d2457e9f08834f0cbec9874e4640bbce.jpg');

-- --------------------------------------------------------

--
-- Estrutura da tabela `users`
--

CREATE TABLE `users` (
  `visitas` int(100) NOT NULL DEFAULT '0',
  `usuario` varchar(1000) NOT NULL,
  `senha` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `users`
--

INSERT INTO `users` (`visitas`, `usuario`, `senha`) VALUES
(2, '4LV3S', 'Senha123');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `infocc`
--
ALTER TABLE `infocc`
  ADD UNIQUE KEY `id_3` (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `id_2` (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`visitas`),
  ADD UNIQUE KEY `id_3` (`visitas`),
  ADD KEY `usuario` (`usuario`(255)),
  ADD KEY `usuario_2` (`usuario`(255)),
  ADD KEY `id` (`visitas`),
  ADD KEY `id_2` (`visitas`);
--
-- Database: `neutrino`
--
CREATE DATABASE IF NOT EXISTS `neutrino` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `neutrino`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `admin_config`
--

CREATE TABLE `admin_config` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(70) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `admin_config`
--

INSERT INTO `admin_config` (`id`, `name`) VALUES
(1, 'checked'),
(2, 'checked'),
(3, '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `banned`
--

CREATE TABLE `banned` (
  `id` int(10) UNSIGNED NOT NULL,
  `ip` varchar(25) NOT NULL,
  `useragent` text NOT NULL,
  `ref` text NOT NULL,
  `reason` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `banned`
--

INSERT INTO `banned` (`id`, `ip`, `useragent`, `ref`, `reason`) VALUES
(1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36 OPR/58.0.3135.107', 'EMPTY', 'Wrong connect method'),
(2, '192.168.0.112', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36 OPR/58.0.3135.107', 'EMPTY', 'Wrong connect method');

-- --------------------------------------------------------

--
-- Estrutura da tabela `botnet_bots`
--

CREATE TABLE `botnet_bots` (
  `bot_uid` varchar(255) NOT NULL DEFAULT '',
  `bot_os` text NOT NULL,
  `bot_priv` text NOT NULL,
  `bot_name` text NOT NULL,
  `bot_version` text NOT NULL,
  `bot_ip` text NOT NULL,
  `bot_av` text NOT NULL,
  `bot_time` text NOT NULL,
  `bot_lifetime` text NOT NULL,
  `bot_date` text NOT NULL,
  `bot_country` text NOT NULL,
  `bot_comment` text NOT NULL,
  `bot_build_id` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `botnet_bots`
--

INSERT INTO `botnet_bots` (`bot_uid`, `bot_os`, `bot_priv`, `bot_name`, `bot_version`, `bot_ip`, `bot_av`, `bot_time`, `bot_lifetime`, `bot_date`, `bot_country`, `bot_comment`, `bot_build_id`) VALUES
('4d1b9831396e78f0dc720e9974008535', 'Windows%207%20(64-bit)', '0', 'NExWM1MgOiA0TFYzUy1QQyA6IDRMVjNTLVBD', '5.1', '192.168.0.108', 'N%2FA', '1556341645', '22.03.2019', '2019-04-27 07:07:25', 'O1', '', 'NONE');

-- --------------------------------------------------------

--
-- Estrutura da tabela `botnet_config`
--

CREATE TABLE `botnet_config` (
  `refresh_id` varchar(128) NOT NULL,
  `refresh_rate` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `botnet_config`
--

INSERT INTO `botnet_config` (`refresh_id`, `refresh_rate`) VALUES
('1401076386715766', '5');

-- --------------------------------------------------------

--
-- Estrutura da tabela `botnet_dumps`
--

CREATE TABLE `botnet_dumps` (
  `bot_uid` text NOT NULL,
  `bot_ip` text NOT NULL,
  `track_type` text NOT NULL,
  `track_data` text NOT NULL,
  `process_name` text NOT NULL,
  `bot_date` text NOT NULL,
  `bot_time` text NOT NULL,
  `track_hash` varchar(32) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `botnet_ff`
--

CREATE TABLE `botnet_ff` (
  `bot_ip` text NOT NULL,
  `bot_uid` text NOT NULL,
  `bot_host` text NOT NULL,
  `bot_form` text NOT NULL,
  `bot_form_hash` varchar(32) NOT NULL DEFAULT '',
  `bot_browser` text NOT NULL,
  `bot_date` text,
  `bot_time` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `botnet_files`
--

CREATE TABLE `botnet_files` (
  `bot_uid` text NOT NULL,
  `bot_ip` text NOT NULL,
  `file_path` text NOT NULL,
  `file_size` int(11) NOT NULL,
  `file_data` text NOT NULL,
  `file_hash` varchar(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `botnet_logs`
--

CREATE TABLE `botnet_logs` (
  `bot_uid` text NOT NULL,
  `bot_ip` text NOT NULL,
  `event_name` text NOT NULL,
  `event_text` text NOT NULL,
  `event_date_time` text NOT NULL,
  `event_hash` varchar(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `botnet_plugin`
--

CREATE TABLE `botnet_plugin` (
  `event_name` text NOT NULL,
  `event_text` text NOT NULL,
  `event_date_time` text NOT NULL,
  `event_hash` varchar(32) NOT NULL,
  `bot_ip` text NOT NULL,
  `bot_uid` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `botnet_proxy`
--

CREATE TABLE `botnet_proxy` (
  `bot_uid` text NOT NULL,
  `bot_ip` varchar(32) NOT NULL,
  `bc_ip` text NOT NULL,
  `bc_port` text NOT NULL,
  `bot_date` text NOT NULL,
  `bot_country` text NOT NULL,
  `proxy_hash` varchar(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `botnet_tasks`
--

CREATE TABLE `botnet_tasks` (
  `id` int(10) UNSIGNED NOT NULL,
  `task_id` text NOT NULL,
  `task_date` text NOT NULL,
  `tasks_pref` text NOT NULL,
  `command` text NOT NULL,
  `tasks_postf` text NOT NULL,
  `status` text NOT NULL,
  `by_user` text NOT NULL,
  `execs` text NOT NULL,
  `needexecs` text NOT NULL,
  `failed` text NOT NULL,
  `given` text NOT NULL,
  `bots` text NOT NULL,
  `build_id` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `formgrabber_host`
--

CREATE TABLE `formgrabber_host` (
  `id` int(11) NOT NULL,
  `hostnames` text COLLATE utf8_unicode_ci NOT NULL,
  `block` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `formgrabber_host`
--

INSERT INTO `formgrabber_host` (`id`, `hostnames`, `block`) VALUES
(0, 'capture_all', 'safebrowsing.google.com\r\nclients1.google.com\r\nclients2.google.com\r\nclients3.google.com\r\nclients4.google.com\r\nocsp.digicert.com\r\nocsp.comodoca4.com\r\nocsp.comodoca.com\r\n.microsoft.com\r\ntiles.services.mozilla.com\r\nservices.mozilla.com\r\n.mcafee.com\r\nvs.mcafeeasap.com\r\nscan.pchealthadvisor.com\r\navg.com\r\nrrs.symantec.com\r\nsjremetrics.java.com\r\nyahoo.com/hjsal	\r\n.msg.yahoo.com\r\ngames.yahoo.com\r\n.toolbar.yahoo.com\r\nquery.yahoo.com\r\nyahoo.com/pjsal\r\neBayISAPI.dll?VISuperSize&item=\r\nbeap.bc.yahoo.com\r\n.mail.yahoo.com/ws/mail/v1/formrpc?appid=YahooMailClassic\r\n.mail.yahoo.com/dc/troubleLoading\r\n.mail.yahoo.com/mc/compose\r\nmail.yahoo.com/mc/showFolder\r\nmail.yahoo.com/mc/showMessage\r\ninstallerstats.yahoo.com\r\nlogin.yahoo.com/openid/op/start\r\nmail.yahoo.com/mc/showFolder\r\nyahoo.com/mc/showMessage\r\nmail.yahoo.com/mc/compose\r\naddress.mail.yahoo.com/yab\r\naddress.yahoo.com\r\nanalytics.yahoo.com\r\ngeo.yahoo.com\r\nnews.yahoo.com\r\nmessages.finance.yahoo.com\r\ninstallerstats.yahoo.com\r\nmail.yahoo.com/ws/\r\nmail.yahoo.com/dc/\r\nsports.yahoo.com\r\nomg.yahoo.com\r\nshine.yahoo.com\r\ndesktop.google\r\ndesign60.weatherbug.com\r\noogle.com/tbproxy/\r\noogle.com/mail/channel/\r\noogle.com/bookmarks\r\ngle-analytics.com/collect\r\nmaps.google\r\nnews.google\r\ngoogleapis.com\r\noogle.com/u/0/\r\noogle.com/u/1/\r\noogle.com/u/2/\r\noogle.com/u/3/\r\noogle.com/u/4/\r\noogle.com/a/\r\noogle.com/b/\r\nogle.com/_/n/\r\nogle.com/_/initialdata\r\noogle.com/_/photos\r\noogle.com/mail/h/\r\noogle.com/mail/u/\r\noogle.com/_/jserror\r\noogle.com/_/diagnostics\r\noogle.com/_/socialgraph\r\noogle.com/_/savetz\r\noogle.com/_/profiles\r\noogle.com/_/og/promos\r\noogle.com/analytics/web/\r\noogle.com/bind\r\noogle.com/client-channel/channel/\r\noogle.com/cloudsearch/\r\noogle.com/document/\r\noogle.com/dr\r\noogle.com/act\r\noogle.com/pref\r\noogle.com/cp\r\noogle.com/drive/\r\noogle.com/o/oauth2/\r\noogle.com/picker/\r\noogle.com/stat\r\noogle.com/spreadsheets/\r\noogle.com/uploadstats\r\noogle.com/upload/\r\noogle.com/talkgadget\r\noogle.com/translate\r\noogle.com/voice/v1/\r\noogle.com/vr\r\noogle.com/_vti_bin\r\napis.google\r\noogle.com/mail/?ui\r\noogle.com/calendar\r\nogle.com/logos/\r\noglevideo.com\r\noglesyndication.com/activeview\r\nreddit.com/api/\r\ngeo.opera.com\r\n.com/do/mail/message/\r\nhttpcs.msg.yahoo.com/\r\npnrws.skype.com/api\r\nmail.aol.com\r\ndailymotion.com/cookie/\r\netsy.com/s2/service/\r\netsy.com/api/\r\netsy.com/people/\r\netsy.com/add_favorite\r\netsy.com/search\r\nconnect.facebook.com/widgets\r\nupload.facebook.com\r\nconnect.facebook.com\r\napi.facebook.com\r\napps.facebook.com\r\ngraph.facebook.com\r\nfacebook.mafiawars.com\r\nfacebook.com/ads/\r\nfacebook.com/alite/push/log.php\r\nfacebook.com/ajax/\r\nfacebook.com/bookmark/\r\nfacebook.com/chat/\r\nfacebook.com/connect/\r\nfacebook.com/checkpoint/\r\nfacebook.com/crop_profile_pic.php\r\nfacebook.com/editnote.php\r\nfacebook.com/ego/feed/\r\nfacebook.com/dialog/\r\nfacebook.com/events/\r\nfacebook.com/friends\r\nfacebook.com/find-friends/\r\nfacebook.com/growth/\r\nfacebook.com/intl/\r\nfacebook.com/logout\r\nfacebook.com/mobile/\r\nfacebook.com/photos/\r\nfacebook.com/video/\r\nfacebook.com/plugins/\r\nfacebook.com/people/\r\nfacebook.com/privacy/selector/\r\nfacebook.com/profile/picture/\r\nfacebook.com/pubcontent/\r\nfacebook.com/requests/friends/ajax/\r\nfacebook.com/residence/\r\nfacebook.com/roadblock/\r\nfacebook.com/stickers/\r\nfacebook.com/search/live_conversation/\r\nfacebook.com/structured_suggestion/\r\nfacebook.com/timeline/\r\nfacebook.com/tr/\r\nfacebook.com/translations/\r\ninstagram.com/query/\r\ninstagram.com/client_action/\r\nflickr.com/fragment\r\nflickr.com/photo\r\nflickr.com/mail/write\r\nflickr.com/groups\r\nflickr.com/services\r\nflickr.com/people/\r\ntwitter.com/logout\r\ntwitter.com/i/\r\nlinkedin.com/lite/\r\nlinkedin.com/connections\r\nlinkedin.com/people/\r\nlinkedin.com/languageSelector\r\nlinkedin.com/home?trk\r\nlinkedin.com/wvmx/\r\nmyspace.com/beacon/\r\nmyspace.com/ajax/\r\nok.ru/app\r\nok.ru/gwtlog\r\nok.ru/?cmd\r\nok.ru/dk\r\nok.ru/feed\r\nok.ru/game\r\nok.ru/profile\r\nok.ru/push\r\nplayer.vimeo.com\r\nsgsapps.com\r\nmyfarmvillage.com\r\napi.connect.facebook.com\r\nupload.youtube.com\r\nyoutube.com/addto_ajax\r\nyoutube.com/annotations\r\nyoutube.com/api/\r\nyoutube.com/channel_ajax\r\nyoutube.com/comment_voting\r\nyoutube.com/comments_ajax\r\nyoutube.com/comment_servlet\r\nyoutube.com/inbox_ajax\r\nyoutube.com/live_stats\r\nyoutube.com/logout\r\nyoutube.com/metadata_ajax\r\nyoutube.com/playlist_video_ajax\r\nyoutube.com/subscription_ajax\r\nyoutube.com/set_awesome\r\nyoutube.com/video_info_ajax\r\nyoutube.com/video_response_upload\r\nyoutube.com/watch_actions_ajax\r\nyoutube.com/watch_fragments_ajax\r\nyoutube.com/watch_promo_ajax\r\nnetzero.net/webmail\r\nnetmail.verizon.com/netmail/driver\r\nverizon.com/webmail/driver\r\nidp.comcast.net/idp\r\noptimum.net/mail/dd\r\nwww.msn.com/?wa=wsignin1.0\r\nusers.storage.live.com/users/\r\naccount.live.com/API/\r\nmail.live.com/mail/mail.fpp\r\nmail.live.com/mail/options\r\nmail.live.com/ol/\r\nmail.live.com/Handlers/\r\nofficeapps.live.com/wv/\r\nlive.com/mail/SilverlightAttachmentUploader\r\nlive.com/c.gif\r\nlive.com/Handlers/\r\ncox.net/dashboard\r\nenhanced.charter.net\r\npost.craigslist.org\r\namazon.com/gp/history/\r\namazon.com/gp/charity/\r\namazon.com/gp/deal/\r\namazon.com/gp/gw/\r\namazon.com/gp/product/\r\namazon.com/gp/redirection/\r\namazon.com/gp/quick-abn-finder/\r\namazon.com/gp/registry/wishlist/');

-- --------------------------------------------------------

--
-- Estrutura da tabela `p_layer`
--

CREATE TABLE `p_layer` (
  `layer_url` varchar(128) NOT NULL DEFAULT '',
  `layer_cktime` text NOT NULL,
  `layer_ckdate` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `users`
--

CREATE TABLE `users` (
  `uid` varchar(64) DEFAULT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `password` varchar(64) NOT NULL DEFAULT '',
  `hash` varchar(64) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `users`
--

INSERT INTO `users` (`uid`, `username`, `password`, `hash`) VALUES
('admin', '4LV3S', 'bc0259c5c27fea4a09afb897d581c970', 'cef1cd2a89d103197f5fe6de28c1a6ca');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_config`
--
ALTER TABLE `admin_config`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `banned`
--
ALTER TABLE `banned`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `botnet_bots`
--
ALTER TABLE `botnet_bots`
  ADD PRIMARY KEY (`bot_uid`);

--
-- Indexes for table `botnet_config`
--
ALTER TABLE `botnet_config`
  ADD UNIQUE KEY `refresh_id` (`refresh_id`);

--
-- Indexes for table `botnet_dumps`
--
ALTER TABLE `botnet_dumps`
  ADD PRIMARY KEY (`track_hash`);

--
-- Indexes for table `botnet_ff`
--
ALTER TABLE `botnet_ff`
  ADD PRIMARY KEY (`bot_form_hash`);

--
-- Indexes for table `botnet_files`
--
ALTER TABLE `botnet_files`
  ADD UNIQUE KEY `file_hash` (`file_hash`);

--
-- Indexes for table `botnet_logs`
--
ALTER TABLE `botnet_logs`
  ADD UNIQUE KEY `event_hash` (`event_hash`);

--
-- Indexes for table `botnet_plugin`
--
ALTER TABLE `botnet_plugin`
  ADD UNIQUE KEY `plugin_hash` (`event_hash`);

--
-- Indexes for table `botnet_proxy`
--
ALTER TABLE `botnet_proxy`
  ADD PRIMARY KEY (`bot_ip`);

--
-- Indexes for table `botnet_tasks`
--
ALTER TABLE `botnet_tasks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `formgrabber_host`
--
ALTER TABLE `formgrabber_host`
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `p_layer`
--
ALTER TABLE `p_layer`
  ADD PRIMARY KEY (`layer_url`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_config`
--
ALTER TABLE `admin_config`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `banned`
--
ALTER TABLE `banned`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `botnet_tasks`
--
ALTER TABLE `botnet_tasks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=273;
--
-- Database: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(11) NOT NULL,
  `dbase` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `query` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_length` text COLLATE utf8_bin,
  `col_collation` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) COLLATE utf8_bin DEFAULT '',
  `col_default` text COLLATE utf8_bin
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `column_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `settings_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `export_type` varchar(10) COLLATE utf8_bin NOT NULL,
  `template_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `template_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sqlquery` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Extraindo dados da tabela `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"livros\",\"table\":\"livros\"},{\"db\":\"livros\",\"table\":\"login\"},{\"db\":\"base_db\",\"table\":\"usuarios\"},{\"db\":\"magazine\",\"table\":\"users\"},{\"db\":\"magazine\",\"table\":\"produtos\"},{\"db\":\"magazine\",\"table\":\"infocc\"},{\"db\":\"drat_alves\",\"table\":\"ip_updater\"},{\"db\":\"cpdb\",\"table\":\"cp_users\"},{\"db\":\"cpdb\",\"table\":\"botnet_list\"},{\"db\":\"cpdb\",\"table\":\"botnet_reports\"}]');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT '0',
  `x` float UNSIGNED NOT NULL DEFAULT '0',
  `y` float UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `prefs` text COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

--
-- Extraindo dados da tabela `pma__table_uiprefs`
--

INSERT INTO `pma__table_uiprefs` (`username`, `db_name`, `table_name`, `prefs`, `last_update`) VALUES
('root', 'base_db', 'usuarios', '{\"sorted_col\":\"`usuarios`.`ultimoacesso`  ASC\"}', '2020-01-02 05:34:59');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text COLLATE utf8_bin NOT NULL,
  `schema_sql` text COLLATE utf8_bin,
  `data_sql` longtext COLLATE utf8_bin,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') COLLATE utf8_bin DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `config_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Extraindo dados da tabela `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2020-10-28 04:29:11', '{\"lang\":\"pt\",\"Console\\/Mode\":\"collapse\",\"NavigationWidth\":241}');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL,
  `tab` varchar(64) COLLATE utf8_bin NOT NULL,
  `allowed` enum('Y','N') COLLATE utf8_bin NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indexes for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indexes for table `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indexes for table `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indexes for table `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indexes for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indexes for table `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indexes for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indexes for table `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indexes for table `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indexes for table `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indexes for table `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indexes for table `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indexes for table `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Database: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
