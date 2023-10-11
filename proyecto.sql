-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 11-10-2023 a las 16:49:11
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `proyecto`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `ID` int(11) NOT NULL,
  `Nombre` varchar(40) NOT NULL,
  `Descripcion` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`ID`, `Nombre`, `Descripcion`) VALUES
(2, 'Gama baja', 'Tienen procesadores menos potentes, menos memoria RAM y almacenamiento limitado.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `RUT` int(11) NOT NULL,
  `Nombre` varchar(40) NOT NULL,
  `Telefono` int(8) NOT NULL,
  `Direccion` varchar(100) NOT NULL,
  `Contraseña` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`RUT`, `Nombre`, `Telefono`, `Direccion`, `Contraseña`) VALUES
(1, 'maria mercedes', 875766, 'calle martin barroso', 0),
(4, 'marcos arancibia', 8237823, 'Calle benemeritos', 0),
(5, 'Sandy palacios', 829382, 'Calle benemeritos', 0),
(18, 'jose', 856454, 'calle martin barroso', 1207),
(23, 'aldo soto', 782718, 'Calle jorge tasakis', 987),
(24, 'marcos arancibia', 71821, 'calle libertadores', 783),
(26, 'elias', 76565, 'Calle benemeritos', 767),
(27, 'Gama baja', 6464, 'calle los olivos', 5453),
(28, 'fernando Mendoza', 728378, 'calle libertadores', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalla_venta`
--

CREATE TABLE `detalla_venta` (
  `ID` int(11) NOT NULL,
  `Id_venta` int(11) NOT NULL,
  `Id_producto` int(11) NOT NULL,
  `Cantidad` int(20) NOT NULL,
  `Precio` float NOT NULL,
  `Total` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `ID` int(11) NOT NULL,
  `Id_proveedor` int(11) NOT NULL,
  `Nombre` varchar(40) NOT NULL,
  `Precio` float NOT NULL,
  `Stock` int(100) NOT NULL,
  `Id_categoria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`ID`, `Id_proveedor`, `Nombre`, `Precio`, `Stock`, `Id_categoria`) VALUES
(6, 11, 'Samsung A20', 1300, 97, 2),
(7, 12, 'Samsung A31', 1400, 47, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `RUT` int(11) NOT NULL,
  `Nombre` varchar(40) NOT NULL,
  `Telefono` int(8) NOT NULL,
  `Direccion` varchar(40) NOT NULL,
  `Web` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`RUT`, `Nombre`, `Telefono`, `Direccion`, `Web`) VALUES
(11, 'pedro juarez', 7283728, 'calle jacinto delfin', 'pedro@gmail'),
(12, 'pedro', 7986587, 'crevaux', 'pedro.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `ID` int(11) NOT NULL,
  `Fecha` date NOT NULL,
  `Monto_total` int(10) NOT NULL,
  `Descuento` int(10) NOT NULL,
  `Id_cliente` int(11) NOT NULL,
  `Id_producto` int(11) NOT NULL,
  `Cantidad` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`ID`, `Fecha`, `Monto_total`, `Descuento`, `Id_cliente`, `Id_producto`, `Cantidad`) VALUES
(12, '2023-09-01', 1400, 0, 4, 7, 0),
(13, '2023-09-09', 1400, 0, 5, 7, 0),
(14, '2023-09-11', 1400, 100, 1, 7, 1),
(15, '2023-09-11', 1300, 50, 1, 6, 1),
(16, '2023-09-11', 1300, 0, 5, 6, 1),
(17, '2023-09-13', 1300, 100, 5, 6, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`RUT`);

--
-- Indices de la tabla `detalla_venta`
--
ALTER TABLE `detalla_venta`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Id_venta` (`Id_venta`),
  ADD KEY `Id_producto` (`Id_producto`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Id_proveedor` (`Id_proveedor`),
  ADD KEY `Id_categoria` (`Id_categoria`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`RUT`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Id_cliente` (`Id_cliente`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `RUT` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT de la tabla `detalla_venta`
--
ALTER TABLE `detalla_venta`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `RUT` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalla_venta`
--
ALTER TABLE `detalla_venta`
  ADD CONSTRAINT `detalla_venta_ibfk_1` FOREIGN KEY (`Id_venta`) REFERENCES `ventas` (`ID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `detalla_venta_ibfk_2` FOREIGN KEY (`Id_producto`) REFERENCES `producto` (`ID`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`Id_proveedor`) REFERENCES `proveedor` (`RUT`) ON UPDATE CASCADE,
  ADD CONSTRAINT `producto_ibfk_2` FOREIGN KEY (`Id_categoria`) REFERENCES `categoria` (`ID`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `ventas_ibfk_2` FOREIGN KEY (`Id_cliente`) REFERENCES `cliente` (`RUT`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
