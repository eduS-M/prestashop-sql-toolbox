-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 28-01-2022 a las 13:58:49
-- Versión del servidor: 5.7.36-cll-lve
-- Versión de PHP: 7.3.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `wwwmanar_devps`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ps_zone`
--

CREATE TABLE `ps_zone` (
  `id_zone` int(10) UNSIGNED NOT NULL,
  `name` varchar(64) NOT NULL,
  `active` tinyint(1) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ps_zone`
--

INSERT INTO `ps_zone` (`id_zone`, `name`, `active`) VALUES
(9, 'ZONA 1', 1),
(10, 'ZONA 2', 1),
(11, 'ZONA 3', 1),
(12, 'ZONA 4', 1),
(13, 'ZONA 5', 1),
(14, 'ZONA 6', 1),
(15, 'ZONA 7', 1),
(16, 'ZONA 8', 1),
(17, 'ZONA 9', 1),
(18, 'ZONA 10', 1),
(19, 'ZONA 11', 1),
(20, 'ZONA 12', 1),
(21, 'ZONA 13', 1),
(22, 'ZONA 14', 1),
(23, 'ZONA 15', 1),
(24, 'ZONA 16', 1),
(25, 'ZONA 17', 1),
(26, 'ZONA 18', 1),
(27, 'ZONA 19', 1),
(28, 'ZONA 20', 1),
(29, 'ZONA 21', 1),
(30, 'ZONA 22', 1),
(31, 'South America', 1),
(32, 'ZONA 23', 1),
(33, 'Chile', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `ps_zone`
--
ALTER TABLE `ps_zone`
  ADD PRIMARY KEY (`id_zone`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `ps_zone`
--
ALTER TABLE `ps_zone`
  MODIFY `id_zone` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
