-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 03, 2025 at 11:51 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Lanchonete`
--

-- --------------------------------------------------------

--
-- Table structure for table `Carrinho`
--

CREATE TABLE `Carrinho` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Item`
--

CREATE TABLE `Item` (
  `id` int(10) UNSIGNED NOT NULL,
  `nome` varchar(45) NOT NULL,
  `categoria` enum('comida','bebida','sobremesa') NOT NULL,
  `preco` decimal(10,2) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1 = disponível, 0 = indisponível',
  `qtdEstoque` int(11) NOT NULL DEFAULT 0,
  `imagem` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Item`
--

INSERT INTO `Item` (`id`, `nome`, `categoria`, `preco`, `status`, `qtdEstoque`, `imagem`) VALUES
(8, 'milagre i need', 'comida', 1.00, 1, 1, '/home/waldemar/Desktop/imagensRestaurante/seqso.png'),
(9, 'agua', 'comida', 12.00, 1, 12, '/home/waldemar/Desktop/imagensRestaurante/paiaço.jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `ItemCarrinho`
--

CREATE TABLE `ItemCarrinho` (
  `itemCarrinhoId` int(11) NOT NULL,
  `idItem` int(10) UNSIGNED NOT NULL,
  `idCarrinho` int(11) NOT NULL,
  `qtdItem` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Pedido`
--

CREATE TABLE `Pedido` (
  `id` int(11) NOT NULL,
  `valorTotal` decimal(10,2) NOT NULL,
  `idCarrinho` int(11) NOT NULL,
  `uuidCliente` varchar(36) DEFAULT NULL,
  `status` varchar(20) DEFAULT 'Em andamento'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Carrinho`
--
ALTER TABLE `Carrinho`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Item`
--
ALTER TABLE `Item`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ItemCarrinho`
--
ALTER TABLE `ItemCarrinho`
  ADD PRIMARY KEY (`itemCarrinhoId`),
  ADD KEY `fk_Item_Carrinho_ItemId` (`idItem`),
  ADD KEY `fk_Item_Carrinho_CarrinhoId` (`idCarrinho`);

--
-- Indexes for table `Pedido`
--
ALTER TABLE `Pedido`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_pedido_carrinho` (`idCarrinho`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Carrinho`
--
ALTER TABLE `Carrinho`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Item`
--
ALTER TABLE `Item`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `ItemCarrinho`
--
ALTER TABLE `ItemCarrinho`
  MODIFY `itemCarrinhoId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Pedido`
--
ALTER TABLE `Pedido`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ItemCarrinho`
--
ALTER TABLE `ItemCarrinho`
  ADD CONSTRAINT `fk_Item_Carrinho_CarrinhoId` FOREIGN KEY (`idCarrinho`) REFERENCES `Carrinho` (`id`),
  ADD CONSTRAINT `fk_Item_Carrinho_ItemId` FOREIGN KEY (`idItem`) REFERENCES `Item` (`id`);

--
-- Constraints for table `Pedido`
--
ALTER TABLE `Pedido`
  ADD CONSTRAINT `fk_pedido_carrinho` FOREIGN KEY (`idCarrinho`) REFERENCES `Carrinho` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
