-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Tempo de geração: 27-Set-2022 às 14:46
-- Versão do servidor: 10.4.10-MariaDB
-- versão do PHP: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `fecifron`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `adhoc`
--

DROP TABLE IF EXISTS `adhoc`;
CREATE TABLE IF NOT EXISTS `adhoc` (
  `nome` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`nome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `administrador`
--

DROP TABLE IF EXISTS `administrador`;
CREATE TABLE IF NOT EXISTS `administrador` (
  `senha` varchar(255) DEFAULT NULL,
  `fk_usuario` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`fk_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `administrador`
--

INSERT INTO `administrador` (`senha`, `fk_usuario`) VALUES
('$2y$10$oibsDD2CWj1Rz5Era.JZVeuZFio0bWRc36x1rJU0RsiNjxDIZAXme', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `area`
--

DROP TABLE IF EXISTS `area`;
CREATE TABLE IF NOT EXISTS `area` (
  `id_area` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  PRIMARY KEY (`id_area`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `area`
--

INSERT INTO `area` (`id_area`, `nome`) VALUES
(1, 'Ciências Biológicas e da Saúde'),
(2, 'Ciências Exatas e da Terra'),
(3, 'Ciências Humanas, Sociais Aplicadas e Linguística'),
(4, 'Ciências Agrárias e Engenharias'),
(5, 'Multidisciplinar');

-- --------------------------------------------------------

--
-- Estrutura da tabela `area_avaliador`
--

DROP TABLE IF EXISTS `area_avaliador`;
CREATE TABLE IF NOT EXISTS `area_avaliador` (
  `fk_area` tinyint(3) UNSIGNED NOT NULL,
  `fk_usuario` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`fk_area`,`fk_usuario`),
  KEY `fk_area_has_avaliador_area1_idx` (`fk_area`),
  KEY `fk_area_avaliador_avaliador1_idx` (`fk_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `avaliacao`
--

DROP TABLE IF EXISTS `avaliacao`;
CREATE TABLE IF NOT EXISTS `avaliacao` (
  `id_avaliacao` int(11) NOT NULL AUTO_INCREMENT,
  `fk_projeto` int(11) NOT NULL,
  `n1` int(11) DEFAULT NULL,
  `n2` int(11) DEFAULT NULL,
  `n3` int(11) DEFAULT NULL,
  `n4` int(11) DEFAULT NULL,
  `n5` int(11) DEFAULT NULL,
  `n6` int(11) DEFAULT NULL,
  `n7` int(11) DEFAULT NULL,
  `n8` int(11) DEFAULT NULL,
  `n9` int(11) DEFAULT NULL,
  `n10` int(11) DEFAULT NULL,
  `fk_usuario` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id_avaliacao`,`fk_usuario`),
  KEY `fk_avaliacao_projeto1_idx` (`fk_projeto`),
  KEY `fk_avaliacao_avaliador1_idx` (`fk_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `avaliador`
--

DROP TABLE IF EXISTS `avaliador`;
CREATE TABLE IF NOT EXISTS `avaliador` (
  `fk_usuario` int(10) UNSIGNED NOT NULL,
  `senha` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`fk_usuario`),
  KEY `fk_avaliador_usuario1_idx` (`fk_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `instituicao`
--

DROP TABLE IF EXISTS `instituicao`;
CREATE TABLE IF NOT EXISTS `instituicao` (
  `id_instituicao` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  PRIMARY KEY (`id_instituicao`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `instituicao`
--

INSERT INTO `instituicao` (`id_instituicao`, `nome`) VALUES
(1, 'IFMS');


-- --------------------------------------------------------

--
-- Estrutura da tabela `projeto`
--

DROP TABLE IF EXISTS `projeto`;
CREATE TABLE IF NOT EXISTS `projeto` (
  `id_projeto` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(200) NOT NULL,
  `nivel` tinyint(11) NOT NULL,
  `eixo` tinyint(4) NOT NULL,
  `convidado` tinyint(4) DEFAULT 0,
  `ano` smallint(6) DEFAULT NULL,
  `fk_area` tinyint(3) UNSIGNED NOT NULL,
  `num_aval` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id_projeto`),
  KEY `fk_projeto_area1_idx` (`fk_area`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `projeto_usuario`
--

DROP TABLE IF EXISTS `projeto_usuario`;
CREATE TABLE IF NOT EXISTS `projeto_usuario` (
  `fk_projeto` int(11) NOT NULL,
  `fk_usuario` int(10) UNSIGNED NOT NULL,
  `tipo` tinyint(3) UNSIGNED NOT NULL,
  PRIMARY KEY (`fk_projeto`,`fk_usuario`),
  KEY `fk_projeto_has_usuario_usuario1_idx` (`fk_usuario`),
  KEY `fk_projeto_has_usuario_projeto1_idx` (`fk_projeto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
  `id_usuario` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `email` varchar(60) NOT NULL,
  `fk_instituicao` tinyint(3) UNSIGNED NOT NULL,
  PRIMARY KEY (`id_usuario`),
  KEY `fk_usuario_instituicao1_idx` (`fk_instituicao`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `nome`, `email`, `fk_instituicao`) VALUES
(1, 'administrador', 'admin', 1);

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `administrador`
--
ALTER TABLE `administrador`
  ADD CONSTRAINT `fk_administrador_usuario1` FOREIGN KEY (`fk_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `area_avaliador`
--
ALTER TABLE `area_avaliador`
  ADD CONSTRAINT `fk_area_avaliador_avaliador1` FOREIGN KEY (`fk_usuario`) REFERENCES `avaliador` (`fk_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_area_has_avaliador_area1` FOREIGN KEY (`fk_area`) REFERENCES `area` (`id_area`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `avaliacao`
--
ALTER TABLE `avaliacao`
  ADD CONSTRAINT `fk_avaliacao_avaliador1` FOREIGN KEY (`fk_usuario`) REFERENCES `avaliador` (`fk_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_avaliacao_projeto1` FOREIGN KEY (`fk_projeto`) REFERENCES `projeto` (`id_projeto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `avaliador`
--
ALTER TABLE `avaliador`
  ADD CONSTRAINT `fk_avaliador_usuario1` FOREIGN KEY (`fk_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `projeto`
--
ALTER TABLE `projeto`
  ADD CONSTRAINT `fk_projeto_area1` FOREIGN KEY (`fk_area`) REFERENCES `area` (`id_area`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `projeto_usuario`
--
ALTER TABLE `projeto_usuario`
  ADD CONSTRAINT `fk_projeto_has_usuario_projeto1` FOREIGN KEY (`fk_projeto`) REFERENCES `projeto` (`id_projeto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_projeto_has_usuario_usuario1` FOREIGN KEY (`fk_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_usuario_instituicao1` FOREIGN KEY (`fk_instituicao`) REFERENCES `instituicao` (`id_instituicao`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
