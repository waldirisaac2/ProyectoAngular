-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-11-2019 a las 15:08:33
-- Versión del servidor: 10.4.8-MariaDB
-- Versión de PHP: 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `cristian`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `apellido` varchar(200) NOT NULL,
  `telefono` varchar(17) NOT NULL,
  `direccion` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `nombre`, `apellido`, `telefono`, `direccion`) VALUES
(1, 'Jose', 'Garcia', '09737483', 'Peru 1978'),
(2, 'Maria', 'Gonzales', '09987624', 'Peru 1978'),
(3, 'Jose', 'Garcia', '09737483', 'Peru 1978'),
(4, 'Maria', 'Gonzales', '09987624', 'Peru 1978'),
(5, 'Marcos', 'Aloicio', '090584152', 'Ansina 901'),
(6, 'Lorenzo', 'Esquer', '09987633', 'Ansina 901');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentarios`
--

CREATE TABLE `comentarios` (
  `id` int(11) NOT NULL COMMENT 'el id sera unico y correlativo',
  `Comentario_Fecha` date DEFAULT NULL COMMENT 'se registrara la fecha donde se mando el comentario',
  `Comentario_Estado` varchar(2) DEFAULT NULL COMMENT 'si: si esque a sido atendido, no: si aun no a sido atendido',
  `Comentario_Tipo` varchar(50) DEFAULT NULL COMMENT 'que tipo de comentario es ejem: felicitacion',
  `Comentario_Descripcion` varchar(400) DEFAULT NULL COMMENT 'sugerencia de la persona',
  `Persona_Id` int(11) DEFAULT NULL COMMENT 'el id sera unico y correlativo'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `comentarios`
--

INSERT INTO `comentarios` (`id`, `Comentario_Fecha`, `Comentario_Estado`, `Comentario_Tipo`, `Comentario_Descripcion`, `Persona_Id`) VALUES
(1, '2019-11-15', 'no', 'RECLAMO', 'la velocidad de la pagina esta muy lenta', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `curso`
--

CREATE TABLE `curso` (
  `id` int(11) NOT NULL COMMENT 'el id sera unico y correlativo',
  `Curso_Nombre` varchar(50) NOT NULL,
  `Curso_Tipo` varchar(100) DEFAULT NULL COMMENT 'el tipo del curso que hara',
  `Curso_Lugar` varchar(100) DEFAULT NULL COMMENT 'lugar donde se realizo el curso',
  `Curso_Modalidad` varchar(50) DEFAULT NULL COMMENT 'en que modalidad se esta yendo ejem: asistente',
  `Curso_Fecha` date DEFAULT NULL COMMENT 'enque fecha se hizo el curso',
  `Persona_Id` int(11) DEFAULT NULL COMMENT 'el id sera unico y correlativo'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `curso`
--

INSERT INTO `curso` (`id`, `Curso_Nombre`, `Curso_Tipo`, `Curso_Lugar`, `Curso_Modalidad`, `Curso_Fecha`, `Persona_Id`) VALUES
(1, 'BASE DE DATOS', 'CAPACITACION', 'JULIACA', 'OIYENTE', '2018-10-28', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `egresado`
--

CREATE TABLE `egresado` (
  `id` int(11) NOT NULL COMMENT 'el id sera unico y correlativo',
  `Egre_Fecha_Egreso` date DEFAULT NULL COMMENT 'año enque el que termino la carrera',
  `Egre_Fecha_Ingreso` date DEFAULT NULL COMMENT 'año en el que ingreso a estudiar la carrera',
  `Egresado_Codigo_U` varchar(15) DEFAULT NULL COMMENT 'el codigo de estudiante que tiene la persona',
  `Egresado_Filial` varchar(100) DEFAULT NULL COMMENT 'el lugar donde ah egresado la persona',
  `Escuela_Profesional_Id` int(11) NOT NULL,
  `Persona_Id` int(11) DEFAULT NULL COMMENT 'el id sera unico y correlativo'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `egresado`
--

INSERT INTO `egresado` (`id`, `Egre_Fecha_Egreso`, `Egre_Fecha_Ingreso`, `Egresado_Codigo_U`, `Egresado_Filial`, `Escuela_Profesional_Id`, `Persona_Id`) VALUES
(1, '2018-11-15', '2013-11-15', '201811294', 'JULIACA', 1, 1);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `egresadodatos`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `egresadodatos` (
`id` int(11)
,`Egresado_Codigo_U` varchar(15)
,`Persona_Ap_Paterno` varchar(50)
,`Persona_AP_Materno` varchar(50)
,`Persona_Nombre` varchar(50)
,`Per_Nro_Documento` varchar(10)
,`Persona_Celular` varchar(15)
,`Egre_Fecha_Egreso` date
,`Escuela_Profesional_Id` int(11)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa`
--

CREATE TABLE `empresa` (
  `id` int(11) NOT NULL COMMENT 'el id sera unico y correlativo',
  `Empresa_Nombre` varchar(20) DEFAULT NULL COMMENT 'nombre de la empresa',
  `Empresa_Rubro` varchar(100) DEFAULT NULL COMMENT 'a que se dedica la empresa',
  `Empresa_Ubicacion` varchar(20) DEFAULT NULL COMMENT 'donde esta ubicada la empresa'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `empresa`
--

INSERT INTO `empresa` (`id`, `Empresa_Nombre`, `Empresa_Rubro`, `Empresa_Ubicacion`) VALUES
(1, 'JICAR', 'PANADERIA', 'PUNO'),
(2, 'RUBY', 'TRUCHERIA', 'JULIACA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `escuela_profesional`
--

CREATE TABLE `escuela_profesional` (
  `id` int(11) NOT NULL COMMENT 'el id sera unico y correlativo',
  `Escuela_Profesional_Nombre` varchar(30) DEFAULT NULL COMMENT 'nombre de la escuela profesional',
  `Escuela_Profecional_Acre` varchar(1) DEFAULT NULL COMMENT 'S = esta acreditada\r\nN = no esta acreditada',
  `Facultad_Id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `escuela_profesional`
--

INSERT INTO `escuela_profesional` (`id`, `Escuela_Profesional_Nombre`, `Escuela_Profecional_Acre`, `Facultad_Id`) VALUES
(1, 'SISTEMAS', 'S', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `experiencia_laboral`
--

CREATE TABLE `experiencia_laboral` (
  `id` int(11) NOT NULL COMMENT 'el id sera unico y correlativo',
  `Exper_Fecha_Inicio` date DEFAULT NULL COMMENT 'fecha enque comenzo el trabajo',
  `Exper_Fecha_Fin` date DEFAULT NULL COMMENT 'fecha que termino el trabajo',
  `Empresa_Id` int(11) NOT NULL,
  `Exper_Funcion` varchar(50) NOT NULL,
  `Persona_Id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `experiencia_laboral`
--

INSERT INTO `experiencia_laboral` (`id`, `Exper_Fecha_Inicio`, `Exper_Fecha_Fin`, `Empresa_Id`, `Exper_Funcion`, `Persona_Id`) VALUES
(2, '2017-10-12', '2019-11-07', 1, 'VENDEDOR', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facultad`
--

CREATE TABLE `facultad` (
  `id` int(11) NOT NULL COMMENT 'el id sera unico y correlativo',
  `Facultad_Nombre` varchar(20) DEFAULT NULL COMMENT 'el nombre de la facultad'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `facultad`
--

INSERT INTO `facultad` (`id`, `Facultad_Nombre`) VALUES
(1, 'FIA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial`
--

CREATE TABLE `historial` (
  `id` int(11) NOT NULL COMMENT 'el id sera unico y correlativo',
  `Historial_Fecha` date DEFAULT NULL COMMENT 'fecha de registro del click',
  `Historial_Hora` time DEFAULT NULL COMMENT 'hora donde se hace el click',
  `Historial_Link` varchar(100) DEFAULT NULL COMMENT 'el link donde se hizo click',
  `Persona_Id` int(11) DEFAULT NULL COMMENT 'el id sera unico y correlativo'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_09_12_153059_create_proveedors_table', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `oferta_laboral`
--

CREATE TABLE `oferta_laboral` (
  `id` int(11) NOT NULL COMMENT 'el id sera unico y correlativo',
  `Oferta_Tipo` varchar(50) DEFAULT NULL COMMENT 'que tipo de trabajo registra',
  `Oferta_Descripcion_Re` varchar(100) DEFAULT NULL COMMENT 'describe los requisitos o perfil del trabajor',
  `Oferta_Descripcion` varchar(200) DEFAULT NULL COMMENT 'que funcion se va cumplir en el trabajo',
  `Persona_Id` int(11) DEFAULT NULL COMMENT 'el id sera unico y correlativo'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfeccionamiento_profesional`
--

CREATE TABLE `perfeccionamiento_profesional` (
  `id` int(11) NOT NULL COMMENT 'el id sera unico y correlativo',
  `Perfec_Nombre_U` varchar(20) DEFAULT NULL COMMENT 'nombre de la universidad donde estudio',
  `Perfec_Grado_actual` varchar(20) DEFAULT NULL COMMENT 'grado actual donde estudio',
  `Perfec_Fecha_Ini` date DEFAULT NULL COMMENT 'fecha en la que se inicio a estudiar',
  `Perfec_Lugar` varchar(50) DEFAULT NULL COMMENT 'lugar donde se hizo el estudio',
  `Perfec_Fech_Fin` date DEFAULT NULL COMMENT 'fecha que se termino de estudiar',
  `Persona_Id` int(11) DEFAULT NULL COMMENT 'el id sera unico y correlativo'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `id` int(11) NOT NULL COMMENT 'el id sera unico y correlativo',
  `Persona_Tipo_Doc` varchar(15) DEFAULT NULL COMMENT 'tipo de documento que tiene la persona eje: DNI',
  `Persona_Nombre` varchar(50) DEFAULT NULL COMMENT 'el nombre de la persona',
  `Persona_Celular` varchar(15) DEFAULT NULL COMMENT 'el celular de la persona',
  `Per_Nro_Documento` varchar(10) DEFAULT NULL COMMENT 'el numero de documento de identidad',
  `Persona_Telefono` varchar(15) DEFAULT NULL COMMENT 'telefono de la persona o de la casa de la persona',
  `Persona_Contraseña` varchar(20) DEFAULT NULL COMMENT 'contraseña de la persona',
  `Persona_Usuario` varchar(20) DEFAULT NULL COMMENT 'El usuario de la persona',
  `Persona_Correo` varchar(100) DEFAULT NULL COMMENT 'el correo actual de la persona',
  `Per_Fech_Nac` date DEFAULT NULL COMMENT 'fecha de nacimiento',
  `Persona_Sexo` varchar(10) DEFAULT NULL COMMENT 'si es femenino o masculino',
  `Persona_Domicilio_Actual` varchar(50) DEFAULT NULL COMMENT 'donde esque vive actualmente',
  `Persona_Pais` varchar(15) DEFAULT NULL COMMENT 'de que pais es la persona',
  `Persona_Distrito` varchar(20) DEFAULT NULL COMMENT 'de que distrito es',
  `Persona_Edad` decimal(3,0) DEFAULT NULL COMMENT 'que edad tiene actualmente',
  `Persona_Departamento` varchar(20) DEFAULT NULL COMMENT 'departamento de donde es la persona',
  `Persona_Provincia` varchar(15) DEFAULT NULL COMMENT 'provincia de donde es la persona',
  `Persona_Ap_Paterno` varchar(50) DEFAULT NULL COMMENT 'apellido paterno de la persona',
  `Persona_Estado_em` varchar(50) DEFAULT NULL COMMENT 'si esta empleado actualmente o desempleado',
  `Persona_Ap_Materno` varchar(50) DEFAULT NULL COMMENT 'apellido materno de la persona',
  `Rango_Id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`id`, `Persona_Tipo_Doc`, `Persona_Nombre`, `Persona_Celular`, `Per_Nro_Documento`, `Persona_Telefono`, `Persona_Contraseña`, `Persona_Usuario`, `Persona_Correo`, `Per_Fech_Nac`, `Persona_Sexo`, `Persona_Domicilio_Actual`, `Persona_Pais`, `Persona_Distrito`, `Persona_Edad`, `Persona_Departamento`, `Persona_Provincia`, `Persona_Ap_Paterno`, `Persona_Estado_em`, `Persona_Ap_Materno`, `Rango_Id`) VALUES
(1, 'DNI', 'JUAN', '955112643', '45842631', '4564681213', 'PAQUITO123', 'JUAN', 'juan.paco@upeu.edu.pe', '2018-11-15', 'MASCULINO', 'JULIACA', 'PERU', 'SAN ROMAN', '18', 'PUNO', 'JULIACA', 'PACO', 'EMPLEADO', 'GUTIERREZ', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedors`
--

CREATE TABLE `proveedors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rango`
--

CREATE TABLE `rango` (
  `id` int(11) NOT NULL COMMENT 'el id sera unico y correlativo',
  `Rango_Nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `rango`
--

INSERT INTO `rango` (`id`, `Rango_Nombre`) VALUES
(1, 'EGRESADO'),
(2, 'ADMINISTRADOR');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `respuesta_com`
--

CREATE TABLE `respuesta_com` (
  `id` int(11) NOT NULL,
  `Respuesta_Fecha_Ate` date DEFAULT NULL COMMENT 'comentario fecha de atencion del comentario',
  `Respuesta_Descrpcion` varchar(400) DEFAULT NULL COMMENT 'descripcion que hara el administrador',
  `Comentarios_Id` int(11) DEFAULT NULL COMMENT 'el id sera unico y correlativo',
  `Persona_Id` int(11) DEFAULT NULL COMMENT 'el id sera unico y correlativo'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura para la vista `egresadodatos`
--
DROP TABLE IF EXISTS `egresadodatos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `egresadodatos`  AS  select `a`.`id` AS `id`,`b`.`Egresado_Codigo_U` AS `Egresado_Codigo_U`,`a`.`Persona_Ap_Paterno` AS `Persona_Ap_Paterno`,`a`.`Persona_Ap_Materno` AS `Persona_AP_Materno`,`a`.`Persona_Nombre` AS `Persona_Nombre`,`a`.`Per_Nro_Documento` AS `Per_Nro_Documento`,`a`.`Persona_Celular` AS `Persona_Celular`,`b`.`Egre_Fecha_Egreso` AS `Egre_Fecha_Egreso`,`b`.`Escuela_Profesional_Id` AS `Escuela_Profesional_Id` from (`persona` `a` join `egresado` `b`) ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `persona_comentarios_fk` (`Persona_Id`);

--
-- Indices de la tabla `curso`
--
ALTER TABLE `curso`
  ADD PRIMARY KEY (`id`),
  ADD KEY `persona_ep_especialidad_fk` (`Persona_Id`);

--
-- Indices de la tabla `egresado`
--
ALTER TABLE `egresado`
  ADD PRIMARY KEY (`id`),
  ADD KEY `escuela_profesional_egresado_fk` (`Escuela_Profesional_Id`),
  ADD KEY `persona_egresado_fk` (`Persona_Id`);

--
-- Indices de la tabla `empresa`
--
ALTER TABLE `empresa`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `escuela_profesional`
--
ALTER TABLE `escuela_profesional`
  ADD PRIMARY KEY (`id`),
  ADD KEY `facultad_escuela_profesional_fk` (`Facultad_Id`);

--
-- Indices de la tabla `experiencia_laboral`
--
ALTER TABLE `experiencia_laboral`
  ADD PRIMARY KEY (`id`),
  ADD KEY `empresa_experiencia_laboral_fk` (`Empresa_Id`),
  ADD KEY `persona_experiencia_laboral_fk` (`Persona_Id`);

--
-- Indices de la tabla `facultad`
--
ALTER TABLE `facultad`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `historial`
--
ALTER TABLE `historial`
  ADD PRIMARY KEY (`id`),
  ADD KEY `persona_historial_fk` (`Persona_Id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `oferta_laboral`
--
ALTER TABLE `oferta_laboral`
  ADD PRIMARY KEY (`id`),
  ADD KEY `persona_oferta_laboral_fk` (`Persona_Id`);

--
-- Indices de la tabla `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indices de la tabla `perfeccionamiento_profesional`
--
ALTER TABLE `perfeccionamiento_profesional`
  ADD PRIMARY KEY (`id`),
  ADD KEY `persona_perfeccionamiento_profesional_fk` (`Persona_Id`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rango_persona_fk` (`Rango_Id`);

--
-- Indices de la tabla `proveedors`
--
ALTER TABLE `proveedors`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `rango`
--
ALTER TABLE `rango`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `respuesta_com`
--
ALTER TABLE `respuesta_com`
  ADD PRIMARY KEY (`id`),
  ADD KEY `persona_respuesta_com_fk` (`Persona_Id`),
  ADD KEY `comentarios_respuesta_com_fk` (`Comentarios_Id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'el id sera unico y correlativo', AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `curso`
--
ALTER TABLE `curso`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'el id sera unico y correlativo', AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `egresado`
--
ALTER TABLE `egresado`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'el id sera unico y correlativo', AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `empresa`
--
ALTER TABLE `empresa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'el id sera unico y correlativo', AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `escuela_profesional`
--
ALTER TABLE `escuela_profesional`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'el id sera unico y correlativo', AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `experiencia_laboral`
--
ALTER TABLE `experiencia_laboral`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'el id sera unico y correlativo', AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `facultad`
--
ALTER TABLE `facultad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'el id sera unico y correlativo', AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `historial`
--
ALTER TABLE `historial`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'el id sera unico y correlativo';

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `oferta_laboral`
--
ALTER TABLE `oferta_laboral`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'el id sera unico y correlativo';

--
-- AUTO_INCREMENT de la tabla `perfeccionamiento_profesional`
--
ALTER TABLE `perfeccionamiento_profesional`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'el id sera unico y correlativo';

--
-- AUTO_INCREMENT de la tabla `persona`
--
ALTER TABLE `persona`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'el id sera unico y correlativo', AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `proveedors`
--
ALTER TABLE `proveedors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `rango`
--
ALTER TABLE `rango`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'el id sera unico y correlativo', AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `respuesta_com`
--
ALTER TABLE `respuesta_com`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD CONSTRAINT `persona_comentarios_fk` FOREIGN KEY (`Persona_Id`) REFERENCES `persona` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `curso`
--
ALTER TABLE `curso`
  ADD CONSTRAINT `persona_ep_especialidad_fk` FOREIGN KEY (`Persona_Id`) REFERENCES `persona` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `egresado`
--
ALTER TABLE `egresado`
  ADD CONSTRAINT `escuela_profesional_egresado_fk` FOREIGN KEY (`Escuela_Profesional_Id`) REFERENCES `escuela_profesional` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `persona_egresado_fk` FOREIGN KEY (`Persona_Id`) REFERENCES `persona` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `escuela_profesional`
--
ALTER TABLE `escuela_profesional`
  ADD CONSTRAINT `facultad_escuela_profesional_fk` FOREIGN KEY (`Facultad_Id`) REFERENCES `facultad` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `experiencia_laboral`
--
ALTER TABLE `experiencia_laboral`
  ADD CONSTRAINT `empresa_experiencia_laboral_fk` FOREIGN KEY (`Empresa_Id`) REFERENCES `empresa` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `persona_experiencia_laboral_fk` FOREIGN KEY (`Persona_Id`) REFERENCES `persona` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `historial`
--
ALTER TABLE `historial`
  ADD CONSTRAINT `persona_historial_fk` FOREIGN KEY (`Persona_Id`) REFERENCES `persona` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `oferta_laboral`
--
ALTER TABLE `oferta_laboral`
  ADD CONSTRAINT `persona_oferta_laboral_fk` FOREIGN KEY (`Persona_Id`) REFERENCES `persona` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `perfeccionamiento_profesional`
--
ALTER TABLE `perfeccionamiento_profesional`
  ADD CONSTRAINT `persona_perfeccionamiento_profesional_fk` FOREIGN KEY (`Persona_Id`) REFERENCES `persona` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `persona`
--
ALTER TABLE `persona`
  ADD CONSTRAINT `rango_persona_fk` FOREIGN KEY (`Rango_Id`) REFERENCES `rango` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `respuesta_com`
--
ALTER TABLE `respuesta_com`
  ADD CONSTRAINT `comentarios_respuesta_com_fk` FOREIGN KEY (`Comentarios_Id`) REFERENCES `comentarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `persona_respuesta_com_fk` FOREIGN KEY (`Persona_Id`) REFERENCES `persona` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
