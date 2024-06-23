-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Tempo de geração: 18/05/2024 às 00:52
-- Versão do servidor: 8.2.0
-- Versão do PHP: 8.2.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
drop database if exists glamplan;
create database glamplan;
use glamplan;
-- Banco de dados: `glamplan`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `agenda`
--

DROP TABLE IF EXISTS `agenda`;
CREATE TABLE IF NOT EXISTS `agenda` (
  `idProfissional` int NOT NULL,
  `idCliente` int NOT NULL,
  `idServico` int NOT NULL,
  `disponibilidade` tinyint(1) NOT NULL,
  `data` date NOT NULL,
  `horaInicio` time NOT NULL,
  `horaFim` time DEFAULT NULL,
  KEY `idProfissional` (`idProfissional`),
  KEY `idCliente` (`idCliente`),
  KEY `idServico` (`idServico`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura para tabela `cliente`
--

DROP TABLE IF EXISTS `cliente`;
CREATE TABLE IF NOT EXISTS `cliente` (
  `idcliente` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(75) NOT NULL,
  `email` varchar(150) NOT NULL,
  `genero` varchar(100) NOT NULL,
  `numero` int NOT NULL,
  `senha` varchar(30) NOT NULL,
  `usuario` varchar(30) NOT NULL,
  PRIMARY KEY (`idcliente`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 ;

--
-- Despejando dados para a tabela `cliente`
--

INSERT INTO `cliente` (`idcliente`, `nome`, `email`, `genero`, `numero`, `senha`, `usuario`) VALUES
(31, 'Ana', '12200654@aluno.cotemig.com.br', 'Prefiro não dizer', 2147483647, 'Analuisa', 'anasilva');

-- --------------------------------------------------------

--
-- Estrutura para tabela `empresa`
--

DROP TABLE IF EXISTS `empresa`;
CREATE TABLE IF NOT EXISTS `empresa` (
  `idempresa` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(75) NOT NULL,
  `cnpj` int NOT NULL,
  `email` varchar(100) NOT NULL,
  `numero` int NOT NULL,
  `senha` varchar(30) NOT NULL,
  PRIMARY KEY (`idempresa`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 ;

--
-- Despejando dados para a tabela `empresa`
--

INSERT INTO `empresa` (`idempresa`, `nome`, `cnpj`, `email`, `numero`, `senha`) VALUES
(2, 'Cotemig Salões', 2147483647, 'cotemig.saloes@gmail.com', 2147483647, 'Cotemig10');

-- --------------------------------------------------------

--
-- Estrutura para tabela `historico`
--

DROP TABLE IF EXISTS `historico`;
CREATE TABLE IF NOT EXISTS `historico` (
  `valorServico` decimal(10,0) NOT NULL,
  `idProfissional` int NOT NULL,
  `idCliente` int NOT NULL,
  KEY `valorServico` (`valorServico`),
  KEY `idProfissional` (`idProfissional`),
  KEY `idCliente` (`idCliente`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura para tabela `profissional`
--

DROP TABLE IF EXISTS `profissional`;
CREATE TABLE IF NOT EXISTS `profissional` (
  `idProfissional` int NOT NULL AUTO_INCREMENT,
  `idEmpresa` int NOT NULL,
  `nome` varchar(255) NOT NULL,
  `especialidade` varchar(100) NOT NULL,
  `usuario` varchar(30) NOT NULL,
  `senha` varchar(100) NOT NULL,
  `telefone` char(11) NOT NULL,
  `cpf` char(11) NOT NULL,
  PRIMARY KEY (`idProfissional`),
  KEY `idEmpresa` (`idEmpresa`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 ;

-- --------------------------------------------------------

--
-- Estrutura para tabela `servico`
--

DROP TABLE IF EXISTS `servico`;
CREATE TABLE IF NOT EXISTS `servico` (
  `idServico` int NOT NULL AUTO_INCREMENT,
  `idProfissional` int NOT NULL,
  `duracaoMedia` time DEFAULT NULL,
  `nome` varchar(100) NOT NULL,
  `valor` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`idServico`),
  KEY `idProfissional` (`idProfissional`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;














