-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 24, 2018 at 12:45 AM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `dblutte`
--

-- --------------------------------------------------------

--
-- Table structure for table `detailcombat`
--

CREATE TABLE IF NOT EXISTS `detailcombat` (
  `iddetail` int(11) NOT NULL AUTO_INCREMENT,
  `combat` int(11) NOT NULL,
  `lutteur` int(11) NOT NULL,
  `libelle` varchar(150) NOT NULL,
  PRIMARY KEY (`iddetail`),
  KEY `combat` (`combat`),
  KEY `lutteur` (`lutteur`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `lutteur`
--

CREATE TABLE IF NOT EXISTS `lutteur` (
  `idlutteur` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(80) NOT NULL,
  `prenom` varchar(80) NOT NULL,
  `dateNaiss` date NOT NULL,
  `tel` varchar(15) NOT NULL,
  `poids` int(11) NOT NULL,
  `surnom` varchar(80) NOT NULL,
  PRIMARY KEY (`idlutteur`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `lutteur`
--

INSERT INTO `lutteur` (`idlutteur`, `nom`, `prenom`, `dateNaiss`, `tel`, `poids`, `surnom`) VALUES
(1, 'diop', 'pape', '2018-04-03', '778522525', 90, 'malaw'),
(2, 'balde', 'mamadou', '2018-04-11', '774505656', 80, 'mame');

-- --------------------------------------------------------

--
-- Table structure for table `planifcombat`
--

CREATE TABLE IF NOT EXISTS `planifcombat` (
  `idcombat` int(11) NOT NULL AUTO_INCREMENT,
  `dateCombat` date NOT NULL,
  `lieu` varchar(80) NOT NULL,
  `heure` time NOT NULL,
  `lutteurA` int(11) NOT NULL,
  `lutteurB` int(11) NOT NULL,
  PRIMARY KEY (`idcombat`),
  KEY `lutteurA` (`lutteurA`),
  KEY `lutteurB` (`lutteurB`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `resultat`
--

CREATE TABLE IF NOT EXISTS `resultat` (
  `idresult` int(11) NOT NULL AUTO_INCREMENT,
  `idcombat` int(11) NOT NULL,
  `resultat` varchar(120) NOT NULL,
  `vainqueur` int(11) NOT NULL,
  `duree` int(11) NOT NULL,
  PRIMARY KEY (`idresult`),
  KEY `idcombat` (`idcombat`),
  KEY `vainqueur` (`vainqueur`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `detailcombat`
--
ALTER TABLE `detailcombat`
  ADD CONSTRAINT `detailcombat_ibfk_1` FOREIGN KEY (`combat`) REFERENCES `planifcombat` (`idcombat`),
  ADD CONSTRAINT `detailcombat_ibfk_2` FOREIGN KEY (`lutteur`) REFERENCES `lutteur` (`idlutteur`);

--
-- Constraints for table `planifcombat`
--
ALTER TABLE `planifcombat`
  ADD CONSTRAINT `planifcombat_ibfk_1` FOREIGN KEY (`lutteurA`) REFERENCES `lutteur` (`idlutteur`),
  ADD CONSTRAINT `planifcombat_ibfk_2` FOREIGN KEY (`lutteurB`) REFERENCES `lutteur` (`idlutteur`);

--
-- Constraints for table `resultat`
--
ALTER TABLE `resultat`
  ADD CONSTRAINT `resultat_ibfk_1` FOREIGN KEY (`idcombat`) REFERENCES `planifcombat` (`idcombat`),
  ADD CONSTRAINT `resultat_ibfk_2` FOREIGN KEY (`vainqueur`) REFERENCES `lutteur` (`idlutteur`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
