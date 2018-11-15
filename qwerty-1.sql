-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-11-2018 a las 03:47:03
-- Versión del servidor: 10.1.32-MariaDB
-- Versión de PHP: 7.2.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `qwerty`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contact`
--

CREATE TABLE `contact` (
  `id` int(11) NOT NULL,
  `firstName` varchar(30) NOT NULL,
  `lastName` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `contact`
--

INSERT INTO `contact` (`id`, `firstName`, `lastName`) VALUES
(1, 'Sergio', 'Gonzalez Cadena'),
(5, 'Laura', 'Portillo'),
(6, 'Daniel', 'Melchor'),
(7, 'Daniel', 'Melchor'),
(14, 'Hectar', 'Bararjas'),
(21, 'pedro', 'gonzalez'),
(23, 'Mencho', 'Daniel'),
(24, 'Juan', 'Perez');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `email`
--

CREATE TABLE `email` (
  `id_email` int(11) NOT NULL,
  `email` varchar(30) NOT NULL,
  `id_contact` int(11) NOT NULL,
  `type_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `email`
--

INSERT INTO `email` (`id_email`, `email`, `id_contact`, `type_id`) VALUES
(11, 'xd@gmail.com', 5, 1),
(15, 'sergio1999.com@gmail.com', 1, 2),
(19, 'elhector@gmail.com', 14, 2),
(30, 'mencho@gmail.com', 24, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `emailtype`
--

CREATE TABLE `emailtype` (
  `type_id` int(11) NOT NULL,
  `description` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `emailtype`
--

INSERT INTO `emailtype` (`type_id`, `description`) VALUES
(1, 'Work'),
(2, 'Personal'),
(3, 'School');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `phone`
--

CREATE TABLE `phone` (
  `id_phone` int(11) NOT NULL,
  `number` int(15) NOT NULL,
  `id_contact` int(11) NOT NULL,
  `type_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `phone`
--

INSERT INTO `phone` (`id_phone`, `number`, `id_contact`, `type_id`) VALUES
(13, 664599800, 1, 1),
(17, 664117094, 1, 2),
(19, 64645646, 14, 1),
(27, 5555555, 23, 1),
(28, 64645646, 24, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `phonenumbertype`
--

CREATE TABLE `phonenumbertype` (
  `type_id` int(11) NOT NULL,
  `description` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `phonenumbertype`
--

INSERT INTO `phonenumbertype` (`type_id`, `description`) VALUES
(1, 'Mobile'),
(2, 'Home');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id_roles` varchar(5) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id_roles`, `name`) VALUES
('admin', 'Administrator'),
('user', 'User');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id_user` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `photo` varchar(30) NOT NULL,
  `id_roles` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id_user`, `name`, `password`, `photo`, `id_roles`) VALUES
('jsmith', 'John Smith', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'jsmith.png', 'ADMIN'),
('mjones', 'Mary Jones', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'mjones.png', 'USER'),
('sgc', 'sergio Gonzalez', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'sergio.jpg', 'ADMIN'),
('sjhonson', 'Steve Jhnson', '6f96fc73915afdc861d5e9d7eaac08d2144f52b9', 'steve.png', 'USER'),
('t', 't', '1234', 't.png', 'USER');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `email`
--
ALTER TABLE `email`
  ADD PRIMARY KEY (`id_email`),
  ADD KEY `id_contact` (`id_contact`);

--
-- Indices de la tabla `emailtype`
--
ALTER TABLE `emailtype`
  ADD PRIMARY KEY (`type_id`);

--
-- Indices de la tabla `phone`
--
ALTER TABLE `phone`
  ADD PRIMARY KEY (`id_phone`),
  ADD KEY `id_contact` (`id_contact`),
  ADD KEY `type_id` (`type_id`);

--
-- Indices de la tabla `phonenumbertype`
--
ALTER TABLE `phonenumbertype`
  ADD PRIMARY KEY (`type_id`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id_roles`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `email`
--
ALTER TABLE `email`
  MODIFY `id_email` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `emailtype`
--
ALTER TABLE `emailtype`
  MODIFY `type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `phone`
--
ALTER TABLE `phone`
  MODIFY `id_phone` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT de la tabla `phonenumbertype`
--
ALTER TABLE `phonenumbertype`
  MODIFY `type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `email`
--
ALTER TABLE `email`
  ADD CONSTRAINT `email_ibfk_1` FOREIGN KEY (`id_contact`) REFERENCES `contact` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `phone`
--
ALTER TABLE `phone`
  ADD CONSTRAINT `phone_ibfk_1` FOREIGN KEY (`id_contact`) REFERENCES `contact` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `phone_ibfk_2` FOREIGN KEY (`type_id`) REFERENCES `phonenumbertype` (`type_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
