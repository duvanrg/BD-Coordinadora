-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-12-2023 a las 18:34:59
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `coordinadora`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `branchoffice`
--

CREATE TABLE `branchoffice` (
  `Id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `ContactId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `city`
--

CREATE TABLE `city` (
  `Id` int(11) NOT NULL,
  `NameCity` varchar(40) NOT NULL,
  `RegionId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `Id` int(11) NOT NULL,
  `ContactId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contact`
--

CREATE TABLE `contact` (
  `Id` int(11) NOT NULL,
  `PostalCodeId` int(11) NOT NULL,
  `PhonePrimary` varchar(20) NOT NULL,
  `PhoneSecundary` varchar(20) DEFAULT NULL,
  `Address` varchar(50) NOT NULL,
  `Email` varchar(40) NOT NULL,
  `Fax` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `country`
--

CREATE TABLE `country` (
  `Id` int(11) NOT NULL,
  `nameCountry` int(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detailproduct`
--

CREATE TABLE `detailproduct` (
  `Id` int(11) NOT NULL,
  `SellingPrice` int(11) NOT NULL,
  `Dimensions` varchar(11) NOT NULL,
  `Desciption` text NOT NULL,
  `Image` varchar(30) NOT NULL,
  `SupplierId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `employee`
--

CREATE TABLE `employee` (
  `Id` int(11) NOT NULL,
  `ContactId` int(11) NOT NULL,
  `OfficeId` int(11) NOT NULL,
  `BossId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `location`
--

CREATE TABLE `location` (
  `Id` int(11) NOT NULL,
  `CurrentId` int(11) NOT NULL,
  `OriginId` int(11) NOT NULL,
  `DestinationId` int(11) NOT NULL,
  `Coords` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `methodpayment`
--

CREATE TABLE `methodpayment` (
  `Id` int(11) NOT NULL,
  `Method` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `order`
--

CREATE TABLE `order` (
  `Id` int(11) NOT NULL,
  `DatesId` int(11) NOT NULL,
  `ClientId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orderdates`
--

CREATE TABLE `orderdates` (
  `Id` int(11) NOT NULL,
  `OrderDate` date NOT NULL,
  `ExpectDate` date NOT NULL,
  `DeliveryDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orderdetail`
--

CREATE TABLE `orderdetail` (
  `Id` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `Price` int(11) NOT NULL,
  `ProducId` int(11) NOT NULL,
  `OrderId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `payment`
--

CREATE TABLE `payment` (
  `Id` int(11) NOT NULL,
  `TranstionId` varchar(20) NOT NULL,
  `PaymentDate` date NOT NULL,
  `Total` int(11) NOT NULL,
  `ClientId` int(11) NOT NULL,
  `MethodId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `person`
--

CREATE TABLE `person` (
  `Id` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `LastName2` varchar(50) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `PersonType` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persontype`
--

CREATE TABLE `persontype` (
  `Id` int(11) NOT NULL,
  `type` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `postalcode`
--

CREATE TABLE `postalcode` (
  `Id` int(11) NOT NULL,
  `CityId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `product`
--

CREATE TABLE `product` (
  `Id` int(11) NOT NULL,
  `Name` varchar(40) NOT NULL,
  `DetailsProductId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `refreshtoken`
--

CREATE TABLE `refreshtoken` (
  `Id` int(11) NOT NULL,
  `Token` varchar(50) NOT NULL,
  `Expires` date NOT NULL,
  `Created` date NOT NULL,
  `Revoked` date NOT NULL,
  `UserId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `region`
--

CREATE TABLE `region` (
  `Id` int(11) NOT NULL,
  `NameRegion` varchar(40) NOT NULL,
  `CountryId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `Id` int(11) NOT NULL,
  `rolName` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `shipping`
--

CREATE TABLE `shipping` (
  `Id` int(11) NOT NULL,
  `InfoShipping` text NOT NULL,
  `StatusId` int(11) NOT NULL,
  `LocationId` int(11) NOT NULL,
  `TypeShipingId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `status`
--

CREATE TABLE `status` (
  `Id` int(11) NOT NULL,
  `NameStatus` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `supplier`
--

CREATE TABLE `supplier` (
  `Id` int(11) NOT NULL,
  `Phone` varchar(20) NOT NULL,
  `ContactId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `typeshiping`
--

CREATE TABLE `typeshiping` (
  `TypeShiping` int(11) NOT NULL,
  `NameShipping` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `Id` int(11) NOT NULL,
  `UserName` varchar(50) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Pasword` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `userrol`
--

CREATE TABLE `userrol` (
  `UsuarioId` int(11) NOT NULL,
  `RolId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `branchoffice`
--
ALTER TABLE `branchoffice`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `ContactId` (`ContactId`),
  ADD KEY `ContactId_2` (`ContactId`);

--
-- Indices de la tabla `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `RegionId` (`RegionId`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `ContactId` (`ContactId`);

--
-- Indices de la tabla `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `PostalCodeId` (`PostalCodeId`);

--
-- Indices de la tabla `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `detailproduct`
--
ALTER TABLE `detailproduct`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `SupplierId` (`SupplierId`);

--
-- Indices de la tabla `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `PersonId` (`ContactId`,`OfficeId`,`BossId`),
  ADD KEY `OfficeId` (`OfficeId`),
  ADD KEY `BossId` (`BossId`);

--
-- Indices de la tabla `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `CurrentId` (`CurrentId`,`OriginId`,`DestinationId`),
  ADD KEY `OriginId` (`OriginId`),
  ADD KEY `DestinationId` (`DestinationId`);

--
-- Indices de la tabla `methodpayment`
--
ALTER TABLE `methodpayment`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `EmployeeId` (`ClientId`),
  ADD KEY `ClientId` (`ClientId`),
  ADD KEY `DatesId` (`DatesId`);

--
-- Indices de la tabla `orderdates`
--
ALTER TABLE `orderdates`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `orderdetail`
--
ALTER TABLE `orderdetail`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `ProducId` (`ProducId`,`OrderId`),
  ADD KEY `OrderId` (`OrderId`);

--
-- Indices de la tabla `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `ClientId` (`ClientId`,`MethodId`),
  ADD KEY `MethodId` (`MethodId`);

--
-- Indices de la tabla `person`
--
ALTER TABLE `person`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `PersonType` (`PersonType`);

--
-- Indices de la tabla `persontype`
--
ALTER TABLE `persontype`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `postalcode`
--
ALTER TABLE `postalcode`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `CityId` (`CityId`);

--
-- Indices de la tabla `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `refreshtoken`
--
ALTER TABLE `refreshtoken`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `UserId` (`UserId`);

--
-- Indices de la tabla `region`
--
ALTER TABLE `region`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `CountryId` (`CountryId`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `shipping`
--
ALTER TABLE `shipping`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `StatusId` (`StatusId`,`LocationId`,`TypeShipingId`),
  ADD KEY `LocationId` (`LocationId`),
  ADD KEY `TypeShipingId` (`TypeShipingId`);

--
-- Indices de la tabla `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `ContactId` (`ContactId`);

--
-- Indices de la tabla `typeshiping`
--
ALTER TABLE `typeshiping`
  ADD PRIMARY KEY (`TypeShiping`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- Indices de la tabla `userrol`
--
ALTER TABLE `userrol`
  ADD PRIMARY KEY (`UsuarioId`),
  ADD KEY `RolId` (`RolId`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `branchoffice`
--
ALTER TABLE `branchoffice`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `city`
--
ALTER TABLE `city`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `contact`
--
ALTER TABLE `contact`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `country`
--
ALTER TABLE `country`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `employee`
--
ALTER TABLE `employee`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `methodpayment`
--
ALTER TABLE `methodpayment`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `order`
--
ALTER TABLE `order`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `orderdetail`
--
ALTER TABLE `orderdetail`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `person`
--
ALTER TABLE `person`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `persontype`
--
ALTER TABLE `persontype`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `postalcode`
--
ALTER TABLE `postalcode`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `product`
--
ALTER TABLE `product`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `refreshtoken`
--
ALTER TABLE `refreshtoken`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `region`
--
ALTER TABLE `region`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `shipping`
--
ALTER TABLE `shipping`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `supplier`
--
ALTER TABLE `supplier`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `typeshiping`
--
ALTER TABLE `typeshiping`
  MODIFY `TypeShiping` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `branchoffice`
--
ALTER TABLE `branchoffice`
  ADD CONSTRAINT `branchoffice_ibfk_1` FOREIGN KEY (`ContactId`) REFERENCES `contact` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `branchoffice_ibfk_2` FOREIGN KEY (`Id`) REFERENCES `detailproduct` (`SupplierId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `city`
--
ALTER TABLE `city`
  ADD CONSTRAINT `city_ibfk_1` FOREIGN KEY (`RegionId`) REFERENCES `region` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`ContactId`) REFERENCES `contact` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cliente_ibfk_2` FOREIGN KEY (`Id`) REFERENCES `user` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `detailproduct`
--
ALTER TABLE `detailproduct`
  ADD CONSTRAINT `detailproduct_ibfk_1` FOREIGN KEY (`Id`) REFERENCES `product` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `location`
--
ALTER TABLE `location`
  ADD CONSTRAINT `location_ibfk_1` FOREIGN KEY (`CurrentId`) REFERENCES `contact` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `location_ibfk_2` FOREIGN KEY (`OriginId`) REFERENCES `contact` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `location_ibfk_3` FOREIGN KEY (`DestinationId`) REFERENCES `contact` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_ibfk_1` FOREIGN KEY (`ClientId`) REFERENCES `cliente` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `orderdates`
--
ALTER TABLE `orderdates`
  ADD CONSTRAINT `orderdates_ibfk_1` FOREIGN KEY (`Id`) REFERENCES `order` (`DatesId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `orderdetail`
--
ALTER TABLE `orderdetail`
  ADD CONSTRAINT `orderdetail_ibfk_1` FOREIGN KEY (`OrderId`) REFERENCES `order` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orderdetail_ibfk_2` FOREIGN KEY (`ProducId`) REFERENCES `product` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`ClientId`) REFERENCES `cliente` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `payment_ibfk_2` FOREIGN KEY (`MethodId`) REFERENCES `methodpayment` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `persontype`
--
ALTER TABLE `persontype`
  ADD CONSTRAINT `persontype_ibfk_1` FOREIGN KEY (`Id`) REFERENCES `person` (`PersonType`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `postalcode`
--
ALTER TABLE `postalcode`
  ADD CONSTRAINT `postalcode_ibfk_1` FOREIGN KEY (`CityId`) REFERENCES `city` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `postalcode_ibfk_2` FOREIGN KEY (`Id`) REFERENCES `contact` (`PostalCodeId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `refreshtoken`
--
ALTER TABLE `refreshtoken`
  ADD CONSTRAINT `refreshtoken_ibfk_1` FOREIGN KEY (`UserId`) REFERENCES `user` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `region`
--
ALTER TABLE `region`
  ADD CONSTRAINT `region_ibfk_1` FOREIGN KEY (`CountryId`) REFERENCES `country` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `rol`
--
ALTER TABLE `rol`
  ADD CONSTRAINT `rol_ibfk_1` FOREIGN KEY (`Id`) REFERENCES `userrol` (`RolId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `shipping`
--
ALTER TABLE `shipping`
  ADD CONSTRAINT `shipping_ibfk_1` FOREIGN KEY (`Id`) REFERENCES `order` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `shipping_ibfk_2` FOREIGN KEY (`LocationId`) REFERENCES `location` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `shipping_ibfk_3` FOREIGN KEY (`StatusId`) REFERENCES `status` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `shipping_ibfk_4` FOREIGN KEY (`TypeShipingId`) REFERENCES `typeshiping` (`TypeShiping`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `userrol`
--
ALTER TABLE `userrol`
  ADD CONSTRAINT `userrol_ibfk_1` FOREIGN KEY (`UsuarioId`) REFERENCES `user` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
