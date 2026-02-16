-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 28-01-2022 a las 13:58:38
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
-- Estructura de tabla para la tabla `ps_country`
--

CREATE TABLE `ps_country` (
  `id_country` int(10) UNSIGNED NOT NULL,
  `id_zone` int(10) UNSIGNED NOT NULL,
  `id_currency` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `iso_code` varchar(3) NOT NULL,
  `call_prefix` int(10) NOT NULL DEFAULT '0',
  `active` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `contains_states` tinyint(1) NOT NULL DEFAULT '0',
  `need_identification_number` tinyint(1) NOT NULL DEFAULT '0',
  `need_zip_code` tinyint(1) NOT NULL DEFAULT '1',
  `zip_code_format` varchar(12) NOT NULL DEFAULT '',
  `display_tax_label` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ps_country`
--

INSERT INTO `ps_country` (`id_country`, `id_zone`, `id_currency`, `iso_code`, `call_prefix`, `active`, `contains_states`, `need_identification_number`, `need_zip_code`, `zip_code_format`, `display_tax_label`) VALUES
(245, 26, 0, 'II', 57, 1, 1, 0, 0, '', 1),
(246, 27, 0, 'AN', 55, 1, 1, 0, 0, '', 1),
(247, 13, 0, 'III', 52, 1, 1, 0, 0, '', 1),
(248, 14, 0, 'CO', 53, 1, 1, 0, 0, '', 1),
(249, 10, 0, 'VS', 32, 1, 1, 0, 0, '', 1),
(250, 10, 0, 'VI', 72, 1, 1, 0, 0, '', 1),
(251, 11, 0, 'VII', 73, 1, 1, 0, 0, '', 1),
(252, 12, 0, 'BB', 42, 1, 1, 0, 0, '', 1),
(253, 17, 0, 'IX', 45, 1, 1, 0, 0, '', 1),
(254, 18, 0, 'XIV', 65, 1, 1, 0, 0, '', 1),
(255, 29, 0, 'AI', 67, 1, 1, 0, 0, '', 1),
(256, 29, 0, 'XII', 61, 1, 1, 0, 0, '', 1),
(257, 9, 0, 'RM', 2, 1, 1, 0, 0, '', 1),
(258, 18, 0, 'XX', 63, 1, 1, 0, 0, '', 1),
(259, 26, 0, 'AP', 58, 1, 1, 0, 0, '', 1),
(260, 31, 0, 'CL', 56, 0, 1, 0, 0, '', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `ps_country`
--
ALTER TABLE `ps_country`
  ADD PRIMARY KEY (`id_country`),
  ADD KEY `country_iso_code` (`iso_code`),
  ADD KEY `country_` (`id_zone`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `ps_country`
--
ALTER TABLE `ps_country`
  MODIFY `id_country` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=261;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
