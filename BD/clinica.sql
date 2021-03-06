-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-01-2019 a las 05:16:00
-- Versión del servidor: 10.1.37-MariaDB
-- Versión de PHP: 5.6.39

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `clinica`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario_unidades`
--

CREATE TABLE `inventario_unidades` (
  `idInventario_Unidades` int(11) NOT NULL,
  `fk_inventarioGeneral` int(11) NOT NULL,
  `decremento` int(11) DEFAULT NULL,
  `tipo` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `inventario_unidades`
--

INSERT INTO `inventario_unidades` (`idInventario_Unidades`, `fk_inventarioGeneral`, `decremento`, `tipo`) VALUES
(1, 1, 299, 'Guantes'),
(2, 2, 99, 'Baja Lengua'),
(3, 3, 99, 'Jeringa'),
(4, 4, 200, 'Hisopos'),
(5, 5, 99, 'Algodon'),
(6, 6, 100, 'Curitas'),
(7, 7, 50, 'Gasa'),
(8, 8, 25, 'Especulo'),
(9, 9, 50, 'Mascarilla'),
(10, 10, 100, 'Aguja'),
(15, 14, 60, 'Papel Fotografi');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `receta`
--

CREATE TABLE `receta` (
  `idreceta` int(10) NOT NULL,
  `paciente` varchar(50) DEFAULT NULL,
  `receta` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `receta`
--

INSERT INTO `receta` (`idreceta`, `paciente`, `receta`) VALUES
(1, 'Carmen Alicia Najarro', '-acetaminofen 1 cada 8 horas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_usuario`
--

CREATE TABLE `tipo_usuario` (
  `id` int(10) NOT NULL,
  `tipo` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipo_usuario`
--

INSERT INTO `tipo_usuario` (`id`, `tipo`) VALUES
(1, 'Administrador'),
(2, 'Secretaria');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_bitacora`
--

CREATE TABLE `t_bitacora` (
  `id_bitacora` int(11) NOT NULL,
  `fk_usuario` int(11) NOT NULL,
  `bit_cusuario` varchar(10) DEFAULT NULL,
  `bit_cactividad` varchar(45) DEFAULT NULL,
  `bit_ffecha` date DEFAULT NULL,
  `bit_hhora` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `t_bitacora`
--

INSERT INTO `t_bitacora` (`id_bitacora`, `fk_usuario`, `bit_cusuario`, `bit_cactividad`, `bit_ffecha`, `bit_hhora`) VALUES
(1, 3, 'JoseLuis', 'Registro Empleado', '2019-01-17', '16:05:55'),
(2, 3, 'JoseLuis', 'Registro Empleado', '2019-01-17', '16:06:04'),
(3, 3, 'JoseLuis', 'Registro de Paciente', '2019-01-17', '16:24:42'),
(4, 4, 'JAvalos', 'Registro de Paciente', '2019-01-17', '19:33:33'),
(5, 4, 'JAvalos', 'Registro de Paciente', '2019-01-17', '19:39:31'),
(6, 4, 'JAvalos', 'Registro de Paciente Menor de Edad', '2019-01-17', '22:05:45'),
(8, 4, 'JAvalos', 'Registro de Paciente', '2019-01-17', '22:11:39'),
(9, 4, 'JAvalos', 'Registro de Paciente', '2019-01-18', '08:35:36'),
(10, 4, 'JAvalos', 'Registro de Paciente', '2019-01-18', '08:36:25'),
(11, 4, 'JAvalos', 'Registro de Paciente Menor de Edad', '2019-01-19', '20:15:47'),
(12, 4, 'JAvalos', 'Paciente mayor de edad modificado', '2019-01-19', '20:56:21'),
(13, 4, 'JAvalos', 'Paciente dado de Baja', '2019-01-19', '21:26:21'),
(14, 4, 'JAvalos', 'Paciente en Alta', '2019-01-20', '09:51:28'),
(15, 1, 'JAvalos', 'Se prepararon insumos', '2019-01-20', '15:44:17');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_categoria_insumo`
--

CREATE TABLE `t_categoria_insumo` (
  `idcategoria` int(10) NOT NULL,
  `nombreCategoria` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `t_categoria_insumo`
--

INSERT INTO `t_categoria_insumo` (`idcategoria`, `nombreCategoria`) VALUES
(1, 'Baja Lengua'),
(2, 'Guantes'),
(3, 'Isopos'),
(4, 'Gasa'),
(5, 'Jeringa');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_compra`
--

CREATE TABLE `t_compra` (
  `id_compra` int(11) NOT NULL,
  `fk_proveedor` int(11) NOT NULL,
  `fk_insumo` int(11) NOT NULL,
  `fecha_caducidad` date DEFAULT NULL,
  `precio_unitario` double DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `total` double DEFAULT NULL,
  `fecha_actual` date DEFAULT NULL,
  `factura` varchar(10) DEFAULT NULL,
  `subtotal` double DEFAULT NULL,
  `codigo` varchar(10) DEFAULT NULL,
  `estado` varchar(25) DEFAULT NULL,
  `reduccion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `t_compra`
--

INSERT INTO `t_compra` (`id_compra`, `fk_proveedor`, `fk_insumo`, `fecha_caducidad`, `precio_unitario`, `cantidad`, `total`, `fecha_actual`, `factura`, `subtotal`, `codigo`, `estado`, `reduccion`) VALUES
(1, 1, 13, '2019-12-30', 10.8, 100, NULL, '2019-01-07', '123456', 1080, NULL, 'Finalizado', 97),
(2, 1, 12, '2019-12-30', 5.75, 100, NULL, '2019-01-07', '123456 ', 575, NULL, 'Finalizado', 99),
(3, 1, 14, '2019-12-30', 10.7, 1, NULL, '2019-01-07', '12343', 10.7, NULL, 'Finalizado', 0),
(4, 1, 15, '2019-12-30', 3.9, 1, NULL, '2019-01-07', '12343 ', 3.9, NULL, 'Finalizado', 0),
(5, 1, 15, '2019-12-30', 7.9, 1, NULL, '2019-01-07', '3457689', 7.9, NULL, 'Finalizado', 0),
(6, 1, 16, '2019-12-30', 5.33, 1, NULL, '2019-01-07', '3423432', 5.33, NULL, 'Finalizado', 0),
(7, 1, 17, '2019-12-30', 3.22, 1, NULL, '2019-01-07', '4534534', 3.22, NULL, 'Finalizado', 0),
(8, 1, 18, '2019-12-30', 7.43, 1, NULL, '2019-01-07', '5463434', 7.43, NULL, 'Finalizado', 0),
(9, 1, 19, '2019-12-30', 30.25, 2, NULL, '2019-01-07', '5645664', 60.5, NULL, 'Finalizado', 1),
(10, 1, 20, '2019-12-30', 8.76, 2, NULL, '2019-01-07', '434342', 17.52, NULL, 'Finalizado', 1),
(11, 1, 21, '2019-12-30', 5.65, 1, NULL, '2019-01-07', '87868969', 5.65, NULL, 'Finalizado', 0),
(15, 1, 25, '2019-12-30', 35, 2, NULL, '2019-01-07', '34343243', 70, NULL, 'Finalizado', 1),
(16, 1, 20, '2019-12-30', 2.4, 1, NULL, '2019-01-15', '87676869', 2.4, NULL, 'Finalizado', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_consulta`
--

CREATE TABLE `t_consulta` (
  `idconsulta` int(11) NOT NULL,
  `fk_expediente` int(11) NOT NULL,
  `fk_enfermeria` int(11) NOT NULL,
  `con_fecha_atiende` date DEFAULT NULL,
  `con_diagnostico` text,
  `con_ref_medica` text,
  `con_cons_medica` text,
  `con_receta` text,
  `con_fecha_amenorrea` date DEFAULT NULL,
  `con_ctipo_consulta` varchar(45) DEFAULT NULL,
  `con_resul_examen` varchar(100) DEFAULT NULL,
  `enfermeria_fetal` int(10) DEFAULT NULL,
  `estado` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `t_consulta`
--

INSERT INTO `t_consulta` (`idconsulta`, `fk_expediente`, `fk_enfermeria`, `con_fecha_atiende`, `con_diagnostico`, `con_ref_medica`, `con_cons_medica`, `con_receta`, `con_fecha_amenorrea`, `con_ctipo_consulta`, `con_resul_examen`, `enfermeria_fetal`, `estado`) VALUES
(1, 1, 1, '2019-01-04', 'dolor de cabeza', NULL, NULL, NULL, '2018-12-30', 'Consulta General', NULL, NULL, NULL),
(2, 4, 4, '2019-01-07', 'dolor de cabeza', NULL, NULL, NULL, '2018-10-20', 'Consulta General', NULL, NULL, NULL),
(3, 7, 5, '2019-01-09', 'a', NULL, NULL, NULL, '2018-10-05', 'Control Prenatal', NULL, 1, 'embarazo'),
(4, 1, 6, '2019-01-15', 'Embarazo normal', NULL, NULL, NULL, '2018-10-05', 'Control Prenatal', 'nose', 2, 'embarazo'),
(5, 4, 7, '2019-01-17', '', NULL, NULL, NULL, '0000-00-00', 'Control Prenatal', '', 3, 'embarazo'),
(6, 10, 8, '2019-01-17', 'dolor de cabeza', '', '', '', '2018-10-01', 'Control Prenatal', '', 4, 'embarazo'),
(7, 3, 9, '2019-01-18', 'Infeccion en las vias urinarias', '', '', 'Uvamin 1 cada 8 horas', '2018-10-05', 'Consulta Ginecologica', '', 1, 'consulta'),
(8, 3, 10, '2019-01-18', 'Infeccion en las vias urinarias', '', '', 'Uvamin 1 cada 8 horas', '2018-05-10', 'Consulta Ginecologica', '', 1, 'consulta'),
(9, 2, 11, '2019-01-20', '', '', '', '', '0000-00-00', 'Consulta Ginecologica', '', 1, 'consulta'),
(10, 2, 12, '2019-01-20', '', '', '', '', '2018-10-05', 'Control Prenatal', '', 5, 'embarazo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_devolucion`
--

CREATE TABLE `t_devolucion` (
  `id_devolucion` int(11) NOT NULL,
  `fk_compra` int(11) NOT NULL,
  `devolver` int(11) NOT NULL,
  `razon` varchar(100) NOT NULL,
  `tipoDevolucion` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_enfermeria`
--

CREATE TABLE `t_enfermeria` (
  `id_enfermeria` int(11) NOT NULL,
  `enf_destatura` double DEFAULT NULL,
  `enf_dpeso` double DEFAULT NULL,
  `enf_dtempetarura` double DEFAULT NULL,
  `enf_cpresion` varchar(20) DEFAULT NULL,
  `enf_cpulso` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `t_enfermeria`
--

INSERT INTO `t_enfermeria` (`id_enfermeria`, `enf_destatura`, `enf_dpeso`, `enf_dtempetarura`, `enf_cpresion`, `enf_cpulso`) VALUES
(1, 70, 35, 37.5, '120/80', 90),
(2, 0, 0, 0, '', 0),
(3, 0, 0, 0, '', 0),
(4, 90, 130, 37, '120/80', 80),
(5, 90, 160, 37, '120/60', 90),
(6, 160, 95, 37, '120/80', 90),
(7, 0, 0, 0, '', 0),
(8, 0, 0, 0, '', 0),
(9, 90, 130, 37, '120/80', 90),
(10, 90, 130, 37, '120/80', 90),
(11, 0, 0, 0, '', 0),
(12, 0, 0, 0, '', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_enfermeria_fetal`
--

CREATE TABLE `t_enfermeria_fetal` (
  `id_enfermeria_fetal` int(11) NOT NULL,
  `fet_dfcf` double DEFAULT NULL,
  `fet_cactividad_fetal` varchar(45) DEFAULT NULL,
  `fet_daltura_uterina` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `t_enfermeria_fetal`
--

INSERT INTO `t_enfermeria_fetal` (`id_enfermeria_fetal`, `fet_dfcf`, `fet_cactividad_fetal`, `fet_daltura_uterina`) VALUES
(1, 0, '2', 4),
(2, 90, '3', 5),
(3, 0, '', 0),
(4, 0, '', 0),
(5, 0, '', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_examenes`
--

CREATE TABLE `t_examenes` (
  `id_examenes` int(11) NOT NULL,
  `fk_consulta` int(11) NOT NULL,
  `hematologia` varchar(400) DEFAULT NULL,
  `quimica` varchar(400) DEFAULT NULL,
  `endocrinologia` text,
  `inmunologia` varchar(400) DEFAULT NULL,
  `heces` varchar(400) DEFAULT NULL,
  `orina` varchar(400) DEFAULT NULL,
  `perfil_prenatal` varchar(400) DEFAULT NULL,
  `bacteriologia` varchar(400) DEFAULT NULL,
  `varios` varchar(400) DEFAULT NULL,
  `otros` varchar(400) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_expediente`
--

CREATE TABLE `t_expediente` (
  `id_expediente` int(11) NOT NULL,
  `fk_medico` int(11) NOT NULL,
  `fk_paciente` int(11) NOT NULL,
  `codigo` varchar(10) DEFAULT NULL,
  `fecha_registro` date DEFAULT NULL,
  `alergias` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `t_expediente`
--

INSERT INTO `t_expediente` (`id_expediente`, `fk_medico`, `fk_paciente`, `codigo`, `fecha_registro`, `alergias`) VALUES
(1, 4, 2, 'MEJI827', '2019-01-04', 'Penicilina'),
(2, 4, 1, 'NAJA724', '2019-01-04', 'ninguna'),
(3, 4, 3, 'ALAS137', '2019-01-07', 'penicilina'),
(4, 5, 4, 'CAMP442', '2019-01-07', 'acetaminofen'),
(5, 5, 5, 'GAVI861', '2019-01-07', 'mefformina'),
(6, 5, 6, 'HENR535', '2019-01-07', 'ninguna'),
(7, 5, 7, 'CHAC944', '2019-01-09', 'Amoxicilina'),
(8, 4, 8, 'MELA877', '2019-01-17', 'penicilina'),
(9, 5, 8, 'MELA877', '2019-01-17', 'penicilina'),
(10, 5, 9, 'HERN187', '2019-01-17', 'ninguna'),
(11, 5, 10, 'CENT952', '2019-01-17', 'penicilina'),
(12, 4, 11, 'LOPE785', '2019-01-17', 'acetaminofen'),
(13, 5, 12, 'AMAY842', '2019-01-17', 'ampicilina'),
(14, 4, 13, 'FLOR752', '2019-01-17', 'ninguna'),
(15, 4, 15, 'ARTI665', '2019-01-19', 'Penicilina');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_familiar`
--

CREATE TABLE `t_familiar` (
  `idfamiliar` int(10) NOT NULL,
  `familiar` varchar(500) DEFAULT NULL,
  `condGrave` varchar(200) DEFAULT NULL,
  `fk_idprenatal` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `t_familiar`
--

INSERT INTO `t_familiar` (`idfamiliar`, `familiar`, `condGrave`, `fk_idprenatal`) VALUES
(1, 'TBC', 'ninguna', 1),
(2, 'TBC,H', 'ninguna', 2),
(3, '', '', 3),
(4, 'TBC', '', 4),
(5, 'TBC', '', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_insumo`
--

CREATE TABLE `t_insumo` (
  `ins_codigo` int(11) NOT NULL,
  `ins_cnombre_comercial` varchar(30) DEFAULT NULL,
  `ins_cmarca` varchar(25) DEFAULT NULL,
  `ins_cdescripcion` text,
  `estado` int(11) DEFAULT NULL,
  `codigo` varchar(7) DEFAULT NULL,
  `presentacion` varchar(25) DEFAULT NULL,
  `unidad` int(11) DEFAULT NULL,
  `minimo` int(11) DEFAULT NULL,
  `tipo` varchar(25) NOT NULL,
  `id_categoria` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `t_insumo`
--

INSERT INTO `t_insumo` (`ins_codigo`, `ins_cnombre_comercial`, `ins_cmarca`, `ins_cdescripcion`, `estado`, `codigo`, `presentacion`, `unidad`, `minimo`, `tipo`, `id_categoria`) VALUES
(12, 'Baja Lengua', 'Medicad', 'madera de 6\" de largo', 1, 'BAJ522', 'Caja', 100, 1, 'Contable', 1),
(13, 'Guantes', 'Medicad', 'de latex color blanco con talco', 1, 'GUA645', 'Caja', 100, 1, 'Contable', 2),
(14, 'Jeringa', 'Medicad', 'Descartables con agujas de 22x 1 1/2', 1, 'JER629', 'Caja', 100, 1, 'Contable', 5),
(15, 'Hisopo', 'Medicad', 'de madera de 6\" de largo con algodon', 1, 'HIS175', 'Caja', 100, 1, 'Contable', 3),
(16, 'Algodon', 'Medicad', 'bolitas de algodon', 1, 'ALG676', 'Bolsa', 100, 1, 'Contable', 0),
(17, 'Curitas', 'MedLab', 'tela suave, facil extraccion, transpirable', 1, 'CUR942', 'Caja', 100, 1, 'Contable', 0),
(18, 'Gasa Esteril', 'Medicad', 'esteril con dimensiones de 10 cm x 10 cm', 1, 'GAS996', 'Caja', 50, 1, 'Contable', 0),
(19, 'Especulo', 'Medilab', 'vaginal desechable 16 mm de diametro ', 1, 'ESP254', 'Caja', 25, 2, 'Contable', 0),
(20, 'Mascarilla', 'MediLab', 'rectangular color celeste con 3 pliegues', 1, 'MAS583', 'Caja', 50, 1, 'Contable', 0),
(21, 'Aguja', 'Medilab', 'Intravenosa, 0,8 x 25 mm 21G 1', 1, 'AGU695', 'Caja', 100, 1, 'Contable', 0),
(25, 'Papel Fotografico', 'Medicad', ' impresion termica, satinado, 110 mm x 18 m', 1, 'PAP793', 'Resma', 60, 2, 'Contable', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_inventario`
--

CREATE TABLE `t_inventario` (
  `id_inventario` int(11) NOT NULL,
  `fk_compra` int(11) NOT NULL,
  `inv_ecantidad_actual` int(11) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `insumo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `t_inventario`
--

INSERT INTO `t_inventario` (`id_inventario`, `fk_compra`, `inv_ecantidad_actual`, `stock`, `insumo`) VALUES
(1, 1, 97, NULL, 13),
(2, 2, 99, NULL, 12),
(3, 3, 0, NULL, 14),
(4, 4, 0, NULL, 15),
(5, 6, 0, NULL, 16),
(6, 7, 0, NULL, 17),
(7, 8, 0, NULL, 18),
(8, 9, 1, NULL, 19),
(9, 10, 2, NULL, 20),
(10, 11, 0, NULL, 21),
(14, 15, 1, NULL, 25);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_llegada`
--

CREATE TABLE `t_llegada` (
  `id_llegada` int(11) NOT NULL,
  `fk_expediente` int(11) NOT NULL,
  `lleg_ffecha_atiende` date DEFAULT NULL,
  `estado` varchar(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `t_llegada`
--

INSERT INTO `t_llegada` (`id_llegada`, `fk_expediente`, `lleg_ffecha_atiende`, `estado`) VALUES
(1, 3, '2019-01-18', '2'),
(2, 1, '2019-01-19', '0'),
(3, 2, '2019-01-19', '1'),
(4, 2, '2019-01-20', '0');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_medico`
--

CREATE TABLE `t_medico` (
  `idMedico` int(11) NOT NULL,
  `med_cnombre` varchar(20) DEFAULT NULL,
  `med_capellidos` varchar(20) DEFAULT NULL,
  `med_cespecialidad` varchar(45) DEFAULT NULL,
  `fk_usuario` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `t_medico`
--

INSERT INTO `t_medico` (`idMedico`, `med_cnombre`, `med_capellidos`, `med_cespecialidad`, `fk_usuario`) VALUES
(4, 'Carolina Montenegro ', NULL, 'Ginecologico', 2),
(5, 'Jose Luis Montenegro', NULL, 'Ginecologico', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_obstetricos`
--

CREATE TABLE `t_obstetricos` (
  `idobstetricos` int(10) NOT NULL,
  `abortos` varchar(5) DEFAULT NULL,
  `embarazoEtopico` varchar(5) DEFAULT NULL,
  `partos` varchar(5) DEFAULT NULL,
  `vaginales` varchar(5) DEFAULT NULL,
  `cesareas` varchar(5) DEFAULT NULL,
  `vivo` varchar(5) DEFAULT NULL,
  `muerto` varchar(5) DEFAULT NULL,
  `planeado` varchar(5) DEFAULT NULL,
  `anticonceptivos` varchar(100) DEFAULT NULL,
  `fechaEmbarazoAnterior` date DEFAULT NULL,
  `fk_idprenatal` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `t_obstetricos`
--

INSERT INTO `t_obstetricos` (`idobstetricos`, `abortos`, `embarazoEtopico`, `partos`, `vaginales`, `cesareas`, `vivo`, `muerto`, `planeado`, `anticonceptivos`, `fechaEmbarazoAnterior`, `fk_idprenatal`) VALUES
(1, '', '', '1', '1', '', '1', '', 'Si', 'No usaba', '2018-02-23', 2),
(2, '', '', '', '', '', '', '', 'No', '', '0000-00-00', 3),
(3, '', '', '', '', '', '', '', 'No', '', '0000-00-00', 4),
(4, '', '', '', '', '', '', '', 'Si', 'Hormonal', '0000-00-00', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_paciente`
--

CREATE TABLE `t_paciente` (
  `id_paciente` int(11) NOT NULL,
  `pac_cnombre` varchar(20) DEFAULT NULL,
  `pac_capellidos` varchar(20) DEFAULT NULL,
  `pac_cdui` varchar(10) DEFAULT NULL,
  `pac_ctelefono` varchar(9) DEFAULT NULL,
  `pac_ffecha_nac` date DEFAULT NULL,
  `estado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `t_paciente`
--

INSERT INTO `t_paciente` (`id_paciente`, `pac_cnombre`, `pac_capellidos`, `pac_cdui`, `pac_ctelefono`, `pac_ffecha_nac`, `estado`) VALUES
(1, 'Carmen Alicia', 'Najarro', '23123231-2', '2345-4343', '1990-04-23', 1),
(2, 'Casey Alexandra', 'Mejia Ponce', '', '', '2015-03-30', 1),
(3, 'Laura Maria', 'Alas Palacios', '31231232-1', '7823-1231', '1990-04-12', 1),
(4, 'Josefina Judith', 'Campos Estrada', '65756754-5', '7854-6434', '1966-02-27', 1),
(5, 'Suyapa Azucena', 'Gavidia Martinez', '34543534-5', '7456-4565', '1990-02-14', 1),
(6, 'Deysi', 'Henriquez', '70707070-7', '5858-5858', '1967-03-18', 1),
(7, 'Patricia Lourdes', 'Chacon Diaz', '45435345-3', '7432-4324', '2000-02-12', 1),
(8, 'Blanca Liseth', 'Melara', '34343434-3', '2393-2232', '2000-02-10', 1),
(9, 'Madai Celina', 'Hernandez', '13437684-5', '7854-3222', '2000-02-04', 1),
(10, 'Ana Noemi', 'Centeno', '89898989-8', '2454-5445', '1990-04-01', 1),
(11, 'Tatiana Betsabe ', 'Lopez Campos', '99998987-9', '2349-4343', '1967-04-12', 1),
(12, 'Sofia Verenice', 'Amaya', '', '', '2015-06-01', 1),
(13, 'Yanci Steffany', 'Flores', '98989898-9', '2343-5454', '2000-10-05', 1),
(14, 'Jessica Abigail', 'Rodriguez', '56456454-6', '2393-3432', '2000-03-04', 1),
(15, 'Carolina Giselle', 'Artiaga', '65656456-5', '7864-6546', '2000-02-10', 1),
(16, 'Giselle Anahi', 'Rios Avalos', '', '', '2015-01-10', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_personales`
--

CREATE TABLE `t_personales` (
  `idpersonal` int(10) NOT NULL,
  `personal` varchar(500) DEFAULT NULL,
  `condGrave` varchar(200) DEFAULT NULL,
  `fk_idprenatal` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `t_personales`
--

INSERT INTO `t_personales` (`idpersonal`, `personal`, `condGrave`, `fk_idprenatal`) VALUES
(1, 'Diabe', 'ninguna', 1),
(2, 'Diabe', 'ninguna', 2),
(3, '', '', 3),
(4, 'Hiper', '', 4),
(5, 'Diabetes,Cardiopatia', '', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_prenatal`
--

CREATE TABLE `t_prenatal` (
  `idprenatal` int(11) NOT NULL,
  `fk_consulta` int(11) NOT NULL,
  `pre_ccirugias_previas` text,
  `pre_ffecha_parto` varchar(15) DEFAULT NULL,
  `pre_ctipo_riesgo` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `t_prenatal`
--

INSERT INTO `t_prenatal` (`idprenatal`, `fk_consulta`, `pre_ccirugias_previas`, `pre_ffecha_parto`, `pre_ctipo_riesgo`) VALUES
(1, 3, 'si', '2018-12-20', 'Control Prenatal'),
(2, 4, 'si', '0000-00-00', 'Control Prenatal'),
(3, 5, '', '0000-00-00', 'Bajo'),
(4, 6, '', '2019-07-08', 'Bajo'),
(5, 10, '', '12/7/2019', 'Bajo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_proveedor`
--

CREATE TABLE `t_proveedor` (
  `id_proveedor` int(11) NOT NULL,
  `pro_cnombre_empresa` varchar(30) DEFAULT NULL,
  `pro_cnombre_responsable` varchar(30) DEFAULT NULL,
  `pro_cdireccion` varchar(45) DEFAULT NULL,
  `pro_ctelefono` varchar(9) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `justificacion` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `t_proveedor`
--

INSERT INTO `t_proveedor` (`id_proveedor`, `pro_cnombre_empresa`, `pro_cnombre_responsable`, `pro_cdireccion`, `pro_ctelefono`, `estado`, `justificacion`) VALUES
(1, 'Medicad', 'Lorenzo Turcios', 'col san benito san salvador', '2345-6543', 1, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_responsable`
--

CREATE TABLE `t_responsable` (
  `idresponsable` int(11) NOT NULL,
  `t_paciente` int(11) NOT NULL,
  `res_cnombre` varchar(20) DEFAULT NULL,
  `res_capellidos` varchar(20) DEFAULT NULL,
  `res_cdui` varchar(10) DEFAULT NULL,
  `res_ctelefono` varchar(9) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `t_responsable`
--

INSERT INTO `t_responsable` (`idresponsable`, `t_paciente`, `res_cnombre`, `res_capellidos`, `res_cdui`, `res_ctelefono`, `estado`) VALUES
(1, 2, 'Beatriz', 'Ponce', '23234343-4', '2344-5435', 1),
(2, 12, 'Ana Verenice', 'Amaya', '43432432-4', '7845-4354', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `usuario` varchar(20) DEFAULT NULL,
  `password` varchar(150) DEFAULT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `last_session` datetime DEFAULT NULL,
  `activacion` int(11) DEFAULT NULL,
  `token` varchar(45) DEFAULT NULL,
  `token_password` varchar(100) DEFAULT NULL,
  `password_request` int(11) DEFAULT NULL,
  `id_tipo` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `usuario`, `password`, `nombre`, `correo`, `last_session`, `activacion`, `token`, `token_password`, `password_request`, `id_tipo`) VALUES
(1, 'DianaLo', '$2y$10$4HcRkAQxcscMh8KNuEKJfuBZS23ZgEi/yc7b8hHy1qL0jEP/5Be5.', 'Diana Carolina Lopez', 'abigailpineda93@hotmail.com', NULL, 0, '72b16a636a5225d41c0194df0df4f148', 'c143c1afc1e60c370a228523facca4c5', 1, 2),
(2, 'CaroMontenegro', '$2y$10$KgvzIkjufkuwe7epM/209OWoXp4Fbix.KUdrSfXFIHsy1yPVb.ImO', 'Carolina Montenegro Montalvo', 'pineverdi@gmail.com', '2019-01-20 22:12:10', 1, '7ee24b4d7122072ada95aa0eec601b69', '', 0, 1),
(3, 'JoseLuis', '$2y$10$4545Is77Zx1zUfn.G3EILeQ2rx3Co55Xhqe8sASU4j5Pqjr2T/Eje', 'Jose Luis Montenegro', 'deysidepineda@hotmail.com', '2019-01-20 09:34:09', 1, 'c08881f019a610aac3c2585b976e62c8', '', 0, 1),
(4, 'JAvalos', '$2y$10$hJ5FzFfvToRTjZdeTEXv2eTyfgg1911/VyxfUhtiw5CzZCmRZDFP.', 'Jesica Maria Avalos', 'abigailpineda-93@hotmail.com', '2019-01-20 21:40:21', 1, 'a2c3b9aaaa1071fa0dd8e8ddc7146cb0', '', 0, 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `inventario_unidades`
--
ALTER TABLE `inventario_unidades`
  ADD PRIMARY KEY (`idInventario_Unidades`),
  ADD KEY `fk_Inventario_Unidades_t_inventario1_idx` (`fk_inventarioGeneral`);

--
-- Indices de la tabla `receta`
--
ALTER TABLE `receta`
  ADD PRIMARY KEY (`idreceta`);

--
-- Indices de la tabla `tipo_usuario`
--
ALTER TABLE `tipo_usuario`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `t_bitacora`
--
ALTER TABLE `t_bitacora`
  ADD PRIMARY KEY (`id_bitacora`),
  ADD KEY `fk_t_bitacora_t_usuario1_idx` (`fk_usuario`);

--
-- Indices de la tabla `t_categoria_insumo`
--
ALTER TABLE `t_categoria_insumo`
  ADD PRIMARY KEY (`idcategoria`);

--
-- Indices de la tabla `t_compra`
--
ALTER TABLE `t_compra`
  ADD PRIMARY KEY (`id_compra`),
  ADD KEY `fk_t_compra_t_insumo1_idx` (`fk_insumo`),
  ADD KEY `fk_t_compra_t_proveedor1_idx` (`fk_proveedor`);

--
-- Indices de la tabla `t_consulta`
--
ALTER TABLE `t_consulta`
  ADD PRIMARY KEY (`idconsulta`),
  ADD KEY `fk_t_consulta_t_expediente1_idx` (`fk_expediente`),
  ADD KEY `fk_t_consulta_t_enfermeria1_idx` (`fk_enfermeria`),
  ADD KEY `enfermeria_fetal` (`enfermeria_fetal`);

--
-- Indices de la tabla `t_devolucion`
--
ALTER TABLE `t_devolucion`
  ADD PRIMARY KEY (`id_devolucion`),
  ADD KEY `fk_t_devolucion_t_compra1_idx` (`fk_compra`);

--
-- Indices de la tabla `t_enfermeria`
--
ALTER TABLE `t_enfermeria`
  ADD PRIMARY KEY (`id_enfermeria`);

--
-- Indices de la tabla `t_enfermeria_fetal`
--
ALTER TABLE `t_enfermeria_fetal`
  ADD PRIMARY KEY (`id_enfermeria_fetal`);

--
-- Indices de la tabla `t_examenes`
--
ALTER TABLE `t_examenes`
  ADD PRIMARY KEY (`id_examenes`),
  ADD KEY `fk_t_examenes_t_consulta1_idx` (`fk_consulta`);

--
-- Indices de la tabla `t_expediente`
--
ALTER TABLE `t_expediente`
  ADD PRIMARY KEY (`id_expediente`),
  ADD KEY `fk_t_expediente_t_medico1_idx` (`fk_medico`),
  ADD KEY `fk_t_expediente_t_paciente1_idx` (`fk_paciente`);

--
-- Indices de la tabla `t_familiar`
--
ALTER TABLE `t_familiar`
  ADD PRIMARY KEY (`idfamiliar`),
  ADD KEY `fk_idprenatal` (`fk_idprenatal`);

--
-- Indices de la tabla `t_insumo`
--
ALTER TABLE `t_insumo`
  ADD PRIMARY KEY (`ins_codigo`);

--
-- Indices de la tabla `t_inventario`
--
ALTER TABLE `t_inventario`
  ADD PRIMARY KEY (`id_inventario`),
  ADD KEY `fk_t_inventario_t_compra1_idx` (`fk_compra`),
  ADD KEY `insumo` (`insumo`);

--
-- Indices de la tabla `t_llegada`
--
ALTER TABLE `t_llegada`
  ADD PRIMARY KEY (`id_llegada`),
  ADD KEY `fk_t_llegada_t_expediente` (`fk_expediente`);

--
-- Indices de la tabla `t_medico`
--
ALTER TABLE `t_medico`
  ADD PRIMARY KEY (`idMedico`),
  ADD KEY `t_usuario` (`fk_usuario`);

--
-- Indices de la tabla `t_obstetricos`
--
ALTER TABLE `t_obstetricos`
  ADD PRIMARY KEY (`idobstetricos`),
  ADD KEY `fk_idprenata` (`fk_idprenatal`);

--
-- Indices de la tabla `t_paciente`
--
ALTER TABLE `t_paciente`
  ADD PRIMARY KEY (`id_paciente`);

--
-- Indices de la tabla `t_personales`
--
ALTER TABLE `t_personales`
  ADD PRIMARY KEY (`idpersonal`),
  ADD KEY `fk_prenatal` (`fk_idprenatal`);

--
-- Indices de la tabla `t_prenatal`
--
ALTER TABLE `t_prenatal`
  ADD PRIMARY KEY (`idprenatal`),
  ADD KEY `fk_t_prenatal_t_consulta1_idx` (`fk_consulta`);

--
-- Indices de la tabla `t_proveedor`
--
ALTER TABLE `t_proveedor`
  ADD PRIMARY KEY (`id_proveedor`);

--
-- Indices de la tabla `t_responsable`
--
ALTER TABLE `t_responsable`
  ADD PRIMARY KEY (`idresponsable`),
  ADD KEY `fk_t_responsable_t_paciente1_idx` (`t_paciente`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idtipo` (`id_tipo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `inventario_unidades`
--
ALTER TABLE `inventario_unidades`
  MODIFY `idInventario_Unidades` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `receta`
--
ALTER TABLE `receta`
  MODIFY `idreceta` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tipo_usuario`
--
ALTER TABLE `tipo_usuario`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `t_bitacora`
--
ALTER TABLE `t_bitacora`
  MODIFY `id_bitacora` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `t_categoria_insumo`
--
ALTER TABLE `t_categoria_insumo`
  MODIFY `idcategoria` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `t_compra`
--
ALTER TABLE `t_compra`
  MODIFY `id_compra` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `t_consulta`
--
ALTER TABLE `t_consulta`
  MODIFY `idconsulta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `t_devolucion`
--
ALTER TABLE `t_devolucion`
  MODIFY `id_devolucion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `t_enfermeria`
--
ALTER TABLE `t_enfermeria`
  MODIFY `id_enfermeria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `t_enfermeria_fetal`
--
ALTER TABLE `t_enfermeria_fetal`
  MODIFY `id_enfermeria_fetal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `t_examenes`
--
ALTER TABLE `t_examenes`
  MODIFY `id_examenes` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `t_expediente`
--
ALTER TABLE `t_expediente`
  MODIFY `id_expediente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `t_familiar`
--
ALTER TABLE `t_familiar`
  MODIFY `idfamiliar` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `t_insumo`
--
ALTER TABLE `t_insumo`
  MODIFY `ins_codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `t_inventario`
--
ALTER TABLE `t_inventario`
  MODIFY `id_inventario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `t_llegada`
--
ALTER TABLE `t_llegada`
  MODIFY `id_llegada` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `t_medico`
--
ALTER TABLE `t_medico`
  MODIFY `idMedico` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `t_obstetricos`
--
ALTER TABLE `t_obstetricos`
  MODIFY `idobstetricos` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `t_paciente`
--
ALTER TABLE `t_paciente`
  MODIFY `id_paciente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `t_personales`
--
ALTER TABLE `t_personales`
  MODIFY `idpersonal` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `t_prenatal`
--
ALTER TABLE `t_prenatal`
  MODIFY `idprenatal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `t_proveedor`
--
ALTER TABLE `t_proveedor`
  MODIFY `id_proveedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `t_responsable`
--
ALTER TABLE `t_responsable`
  MODIFY `idresponsable` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `inventario_unidades`
--
ALTER TABLE `inventario_unidades`
  ADD CONSTRAINT `fk_Inventario_Unidades_t_inventario1` FOREIGN KEY (`fk_inventarioGeneral`) REFERENCES `t_inventario` (`id_inventario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `t_bitacora`
--
ALTER TABLE `t_bitacora`
  ADD CONSTRAINT `fk_t_bitacora_t_usuario1` FOREIGN KEY (`fk_usuario`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `t_compra`
--
ALTER TABLE `t_compra`
  ADD CONSTRAINT `fk_t_compra_t_insumo1` FOREIGN KEY (`fk_insumo`) REFERENCES `t_insumo` (`ins_codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_t_compra_t_proveedor1` FOREIGN KEY (`fk_proveedor`) REFERENCES `t_proveedor` (`id_proveedor`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `t_consulta`
--
ALTER TABLE `t_consulta`
  ADD CONSTRAINT `enfermeria_fetal` FOREIGN KEY (`enfermeria_fetal`) REFERENCES `t_enfermeria_fetal` (`id_enfermeria_fetal`),
  ADD CONSTRAINT `fk_t_consulta_t_enfermeria1` FOREIGN KEY (`fk_enfermeria`) REFERENCES `t_enfermeria` (`id_enfermeria`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_t_consulta_t_expediente1` FOREIGN KEY (`fk_expediente`) REFERENCES `t_expediente` (`id_expediente`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `t_devolucion`
--
ALTER TABLE `t_devolucion`
  ADD CONSTRAINT `fk_t_devolucion_t_compra1` FOREIGN KEY (`fk_compra`) REFERENCES `t_compra` (`id_compra`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `t_examenes`
--
ALTER TABLE `t_examenes`
  ADD CONSTRAINT `fk_t_examenes_t_consulta1` FOREIGN KEY (`fk_consulta`) REFERENCES `t_consulta` (`idconsulta`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `t_expediente`
--
ALTER TABLE `t_expediente`
  ADD CONSTRAINT `fk_t_expediente_t_medico1` FOREIGN KEY (`fk_medico`) REFERENCES `t_medico` (`idMedico`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_t_expediente_t_paciente1` FOREIGN KEY (`fk_paciente`) REFERENCES `t_paciente` (`id_paciente`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `t_familiar`
--
ALTER TABLE `t_familiar`
  ADD CONSTRAINT `fk_idprenatal` FOREIGN KEY (`fk_idprenatal`) REFERENCES `t_prenatal` (`idprenatal`);

--
-- Filtros para la tabla `t_inventario`
--
ALTER TABLE `t_inventario`
  ADD CONSTRAINT `fk_t_inventario_t_compra1` FOREIGN KEY (`fk_compra`) REFERENCES `t_compra` (`id_compra`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `insumo` FOREIGN KEY (`insumo`) REFERENCES `t_insumo` (`ins_codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `t_llegada`
--
ALTER TABLE `t_llegada`
  ADD CONSTRAINT `fk_t_llegada_t_expediente` FOREIGN KEY (`fk_expediente`) REFERENCES `t_expediente` (`id_expediente`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `t_medico`
--
ALTER TABLE `t_medico`
  ADD CONSTRAINT `t_usuario` FOREIGN KEY (`fk_usuario`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `t_obstetricos`
--
ALTER TABLE `t_obstetricos`
  ADD CONSTRAINT `fk_idprenata` FOREIGN KEY (`fk_idprenatal`) REFERENCES `t_prenatal` (`idprenatal`);

--
-- Filtros para la tabla `t_personales`
--
ALTER TABLE `t_personales`
  ADD CONSTRAINT `fk_prenatal` FOREIGN KEY (`fk_idprenatal`) REFERENCES `t_prenatal` (`idprenatal`);

--
-- Filtros para la tabla `t_prenatal`
--
ALTER TABLE `t_prenatal`
  ADD CONSTRAINT `fk_t_prenatal_t_consulta1` FOREIGN KEY (`fk_consulta`) REFERENCES `t_consulta` (`idconsulta`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `t_responsable`
--
ALTER TABLE `t_responsable`
  ADD CONSTRAINT `fk_t_responsable_t_paciente1` FOREIGN KEY (`t_paciente`) REFERENCES `t_paciente` (`id_paciente`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `idtipo` FOREIGN KEY (`id_tipo`) REFERENCES `tipo_usuario` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
