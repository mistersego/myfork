-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 17-04-2022 a las 19:22:39
-- Versión del servidor: 5.7.24
-- Versión de PHP: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bad115`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aprobacion`
--

CREATE TABLE `aprobacion` (
  `Id_Aprobacion` int(11) NOT NULL,
  `Id_Usuario` int(11) NOT NULL,
  `Id_UsuarioAprueba` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `areas`
--

CREATE TABLE `areas` (
  `Id_Area` int(11) NOT NULL,
  `Id_AreaRRHH` int(11) NOT NULL,
  `NOMBREAREA` varchar(200) NOT NULL,
  `ID_EMPRESA` int(11) NOT NULL,
  `ACTIVA` tinyint(4) NOT NULL,
  `PRORRATEADA` tinyint(4) NOT NULL,
  `CENTROCOSTOSMULTIPLE` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auditoria`
--

CREATE TABLE `auditoria` (
  `Id_LogAuditoria` bigint(20) NOT NULL COMMENT 'Llave primaria para de la tabla',
  `Tipo` varchar(5) NOT NULL,
  `Tabla` varchar(150) NOT NULL COMMENT 'Nombre de la tabla',
  `Campos` varchar(300) DEFAULT NULL,
  `Antes` varchar(4000) NOT NULL COMMENT 'Detalle de campos y registros antes del cambio',
  `Despues` varchar(4000) NOT NULL COMMENT 'Detalle de campos y registros después del cambio',
  `FechaEvento` datetime(3) NOT NULL COMMENT 'Fecha en la que se realiza la acción',
  `IdentificadorUsuario` varchar(20) NOT NULL COMMENT 'Identificador del usuario',
  `CampoLlavePrimaria` varchar(300) DEFAULT NULL,
  `ValorLlavePrimaria` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$320000$qkGTJAa0Mpo4KPqiYphtun$SAJh6goVIVSxB7TPGYbMN8cD5YjCZHgFIJTLDfyarn0=', '2022-04-17 19:05:44.683779', 1, 'root', '', '', 'root@root.com', 1, 1, '2022-04-12 05:44:51.355803');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bodegas`
--

CREATE TABLE `bodegas` (
  `Id_Bodega` int(11) NOT NULL COMMENT 'Llave primaria de la tabla',
  `Id_TipoBodega` int(11) NOT NULL COMMENT 'Llave foránea para el tipo de bodega',
  `Id_Pais` int(11) NOT NULL COMMENT 'Llave foránea para el país',
  `Id_Municipio` int(11) NOT NULL COMMENT 'Llave foránea para el municipio',
  `Id_Sucursal` int(11) DEFAULT NULL,
  `Nombre` varchar(50) NOT NULL COMMENT 'Identificador de la bodega',
  `CentroCostos` varchar(50) NOT NULL COMMENT 'Texto para el centro de costos',
  `Direccion` varchar(500) NOT NULL COMMENT 'Ubicacion geográfica para la bodega',
  `Habilitada` tinyint(4) NOT NULL COMMENT 'Bandera para habilitar o deshabilitar la bodega',
  `UsuarioCrea` varchar(20) NOT NULL COMMENT 'Identificador del usuario que ingresa el registro',
  `UsuarioModifica` varchar(20) DEFAULT NULL COMMENT 'Identificador del usuario que actualiza el registro',
  `Id_Bodega_Anterior` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `condicionespago`
--

CREATE TABLE `condicionespago` (
  `Id_CondicionPago` int(11) NOT NULL,
  `Nombre` varchar(150) NOT NULL,
  `Activa` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamentos`
--

CREATE TABLE `departamentos` (
  `Id_Departamento` int(11) NOT NULL COMMENT 'Llave primaria para de la tabla',
  `Nombre` varchar(50) NOT NULL COMMENT 'Identificador del departamento'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamentosempresa`
--

CREATE TABLE `departamentosempresa` (
  `Id_DptoEmpresa` int(11) NOT NULL,
  `Id_Empresa` int(11) DEFAULT NULL,
  `Id_Area` int(11) DEFAULT NULL,
  `Id_DptoRRHH` int(11) NOT NULL,
  `ID_EMPRESA_RRHH` int(11) NOT NULL,
  `ID_AREA_RRHH` int(11) NOT NULL,
  `NOMBREDEPARTAMENTO` varchar(50) NOT NULL,
  `DESCRIPCION` varchar(500) DEFAULT NULL,
  `CCMULTIPLE` tinyint(4) DEFAULT NULL,
  `id_Catalogo_Cuenta` int(11) DEFAULT NULL,
  `id_CentroCosto` int(11) DEFAULT NULL,
  `CUENTACONTABLE` varchar(200) DEFAULT NULL,
  `CENTROCOSTOS` varchar(200) DEFAULT NULL,
  `MANO_OBRA_DIRECTA` tinyint(4) NOT NULL,
  `CCINDEPENDIENTE` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2022-04-12 18:40:59.891374', '1', 'Categoria 1', 1, '[{\"added\": {}}]', 7, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(7, 'productos', 'categoriaproducto'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2022-04-12 05:42:44.796515'),
(2, 'auth', '0001_initial', '2022-04-12 05:42:47.908190'),
(3, 'admin', '0001_initial', '2022-04-12 05:42:48.242296'),
(4, 'admin', '0002_logentry_remove_auto_add', '2022-04-12 05:42:48.255261'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2022-04-12 05:42:48.268227'),
(6, 'contenttypes', '0002_remove_content_type_name', '2022-04-12 05:42:48.551468'),
(7, 'auth', '0002_alter_permission_name_max_length', '2022-04-12 05:42:48.593357'),
(8, 'auth', '0003_alter_user_email_max_length', '2022-04-12 05:42:48.636242'),
(9, 'auth', '0004_alter_user_username_opts', '2022-04-12 05:42:48.657186'),
(10, 'auth', '0005_alter_user_last_login_null', '2022-04-12 05:42:48.819751'),
(11, 'auth', '0006_require_contenttypes_0002', '2022-04-12 05:42:48.834711'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2022-04-12 05:42:48.853660'),
(13, 'auth', '0008_alter_user_username_max_length', '2022-04-12 05:42:48.895548'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2022-04-12 05:42:48.938433'),
(15, 'auth', '0010_alter_group_name_max_length', '2022-04-12 05:42:48.980321'),
(16, 'auth', '0011_update_proxy_permissions', '2022-04-12 05:42:49.002262'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2022-04-12 05:42:49.039164'),
(18, 'sessions', '0001_initial', '2022-04-12 05:42:49.186769');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('igjzisexyy9m1qzq0ezvna75z5fzeqkj', '.eJxVjDsOwjAQBe_iGlm7jj8xJX3OYK29Dg4gR4qTCnF3EikFtDPz3lsE2tYStpaXMLG4ChSXXxYpPXM9BD-o3meZ5rouU5RHIk_b5DBzft3O9u-gUCv72idFSaOB6DpU6GBM5DsYHeQ-W03WeYccFbDVSnNvk9mxYoSIFpQRny_GOjbK:1ne9Km:jWxnKrHBjrrbf6mVBqs_juN3HPFbelIonBc7GltiYpE', '2022-04-26 05:45:00.213106'),
('ti8oms7fkzq6r12m0qsfnis7h7w1xnd9', '.eJxVjDsOwjAQBe_iGlm7jj8xJX3OYK29Dg4gR4qTCnF3EikFtDPz3lsE2tYStpaXMLG4ChSXXxYpPXM9BD-o3meZ5rouU5RHIk_b5DBzft3O9u-gUCv72idFSaOB6DpU6GBM5DsYHeQ-W03WeYccFbDVSnNvk9mxYoSIFpQRny_GOjbK:1ngADQ:d-vFpxl6bKRaip_7DF_qN6uAXKBe16uzVfgCr-t2X6Y', '2022-05-01 19:05:44.692756');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `documentosproveedor`
--

CREATE TABLE `documentosproveedor` (
  `Id_TipoDocProveedor` int(11) NOT NULL COMMENT 'Llave primaria de la tabla',
  `Id_TipoDocumento` int(11) NOT NULL COMMENT 'Llave foránea del tipo de documento',
  `Id_Proveedor` int(11) NOT NULL COMMENT 'Llave foránea del proveedor',
  `NumeroDocumento` varchar(100) NOT NULL COMMENT 'Cadena con el Número de Documento'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresas`
--

CREATE TABLE `empresas` (
  `Id_Empresa` int(11) NOT NULL,
  `Id_EmpresaRRHHWeb` int(11) DEFAULT NULL,
  `Abreviatura` varchar(50) NOT NULL,
  `NumeroRegistro` varchar(50) DEFAULT NULL,
  `NIT` varchar(50) DEFAULT NULL,
  `Id_Giro` int(11) DEFAULT NULL,
  `Direccion` varchar(500) DEFAULT NULL,
  `UrlImgLogo` longtext,
  `Logo` longblob,
  `NumeroISSS` varchar(60) DEFAULT NULL,
  `CentroTrabajo` varchar(50) DEFAULT NULL,
  `HorasLaborales` varchar(50) DEFAULT NULL,
  `ISSSSCodigos` varchar(50) DEFAULT NULL,
  `Telefono` varchar(25) DEFAULT NULL,
  `Siglas` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entregas`
--

CREATE TABLE `entregas` (
  `Id_Entrega` int(11) NOT NULL COMMENT 'Llave primaria de la tabla',
  `Id_Departamento` int(11) NOT NULL COMMENT 'Llave foránea del departamento al que se le hará al entrega',
  `Id_Requision` int(11) DEFAULT NULL COMMENT 'Llave foránea de la requisición',
  `Id_UsuarioCrea` int(11) DEFAULT '2',
  `Id_Bodega` int(11) DEFAULT NULL,
  `Codigo` varchar(50) NOT NULL COMMENT 'Identificador de la lista de compras',
  `FechaListo` datetime(3) DEFAULT NULL COMMENT 'Fecha/hora en que se marca como "listo para entrega"',
  `FechaCreacion` datetime(3) NOT NULL,
  `UsuarioCrea` varchar(20) NOT NULL COMMENT 'Identificador del usuario que ingresa el registro',
  `UsuarioModifica` varchar(20) DEFAULT NULL COMMENT 'Identificador del usuario que actualiza el registro',
  `Cerrada` tinyint(4) DEFAULT '1',
  `ProcesadoFlota` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entregasdetalles`
--

CREATE TABLE `entregasdetalles` (
  `Id_EntregaDetalle` int(11) NOT NULL,
  `Id_Entrega` int(11) NOT NULL,
  `Id_RequsicionDet` int(11) NOT NULL,
  `Id_BodegaSale` int(11) NOT NULL,
  `Cantidad` decimal(18,4) NOT NULL,
  `Anulado` tinyint(4) NOT NULL DEFAULT '0',
  `NvaCantidad` decimal(18,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estadosrequisicion`
--

CREATE TABLE `estadosrequisicion` (
  `Id_EstadoRequisicion` int(11) NOT NULL,
  `Estado` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `giros`
--

CREATE TABLE `giros` (
  `Id_Giro` int(11) NOT NULL,
  `Id_GiroSubCategoria` int(11) NOT NULL COMMENT 'Llave foránea para la categoría del giro',
  `Codigo` varchar(10) DEFAULT NULL,
  `Giro` varchar(250) NOT NULL,
  `UsuarioCrea` varchar(20) NOT NULL,
  `UsuarioModifica` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `giroscategorias`
--

CREATE TABLE `giroscategorias` (
  `Id_GiroCategoria` int(11) NOT NULL COMMENT 'Llave primaria del giro',
  `Categoria` varchar(150) NOT NULL COMMENT 'Identificador de la categoría del giro'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `girossubcategorias`
--

CREATE TABLE `girossubcategorias` (
  `Id_GiroSubCat` int(11) NOT NULL COMMENT 'Llave primaria de la tabla',
  `Id_Categoria` int(11) NOT NULL,
  `Nombre` varchar(150) NOT NULL COMMENT 'Identificador de la sub categoría'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historialrequisiciones`
--

CREATE TABLE `historialrequisiciones` (
  `Id_HistorialReq` int(11) NOT NULL,
  `Id_Requisicion` int(11) NOT NULL,
  `Id_EstadoRequisicion` int(11) NOT NULL,
  `Id_Usuario` int(11) NOT NULL,
  `FechaInicio` datetime(3) NOT NULL,
  `FechaFin` datetime(3) DEFAULT NULL,
  `Observaciones` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingresos`
--

CREATE TABLE `ingresos` (
  `Id_Ingreso` int(11) NOT NULL COMMENT 'Llave primaria de la tabla',
  `Id_TipoDocumento` int(11) NOT NULL COMMENT 'Llave foránea del tipo de documento',
  `Id_TipoMovimiento` int(11) NOT NULL COMMENT 'Llave foránea con el tipo de movimiento',
  `Id_BodegaIngresa` int(11) NOT NULL COMMENT 'Llave foránea con la bodega a la que ingresará',
  `Id_UsuarioCrea` int(11) NOT NULL,
  `Id_UsuarioGenera` int(11) DEFAULT NULL,
  `Codigo` varchar(50) NOT NULL,
  `FechaIngreso` datetime(3) NOT NULL COMMENT 'Fecha/hora del ingreso según factura',
  `FechaRegistro` datetime(3) DEFAULT NULL COMMENT 'Fecha del servidor en la que genera el registro',
  `FechaGenerado` datetime(3) DEFAULT NULL,
  `FechaNota` datetime(3) DEFAULT NULL,
  `NumeroDoc` varchar(50) DEFAULT NULL COMMENT 'Secuencia alfanumérica para el número de documento',
  `Anulado` tinyint(4) NOT NULL,
  `Generado` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Bandera que indicará si el ingreso se agregó al inventario',
  `NotaPendiente` tinyint(4) NOT NULL DEFAULT '0',
  `NumeroNota` varchar(500) DEFAULT NULL,
  `Adjunto` longtext,
  `Id_OrdenCompra` int(11) DEFAULT NULL,
  `ProveedorEvaluado` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingresosdetalles`
--

CREATE TABLE `ingresosdetalles` (
  `Id_IngresoDetalle` int(11) NOT NULL COMMENT 'Llave primaria de la tabla',
  `Id_Ingreso` int(11) NOT NULL COMMENT 'Llave foránea del ingreso',
  `Id_Producto` int(11) DEFAULT NULL COMMENT 'Llave foránea del producto',
  `Id_OrdenCompraDet` int(11) DEFAULT NULL,
  `Cantidad` decimal(18,4) NOT NULL COMMENT 'Proporción que se ingresará',
  `PrecioUnitario` decimal(18,4) NOT NULL COMMENT 'Precio según factura',
  `Adjunto` longtext,
  `Id_Proveedor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menus`
--

CREATE TABLE `menus` (
  `Id_Menu` int(11) NOT NULL COMMENT 'Llave primaria para de la tabla',
  `Nombre` varchar(50) NOT NULL COMMENT 'Identificador del menú',
  `Url` varchar(50) DEFAULT NULL COMMENT 'Dirección relativa del menú a partir del nodo raíz',
  `Id_MenuPadre` int(11) DEFAULT NULL COMMENT 'Llave foránea del menú en caso de agrupar otros',
  `Id_MenuPadrePermiso` int(11) DEFAULT NULL COMMENT 'Llave foránea del menú del que heredará los permisos',
  `FormAsociado` tinyint(4) NOT NULL COMMENT 'Indica si tienen un formulario asociado',
  `Habilitado` tinyint(4) NOT NULL COMMENT 'Bandera que indica si el menú está o no habilitado',
  `AsignableInicio` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'bandera para determinar si podrá ser página de inicio de un perfil',
  `Orden` int(11) DEFAULT NULL COMMENT 'Establece el orden en el que se presentarán las opciones',
  `Icono` varchar(100) DEFAULT NULL COMMENT 'Nombre de glyphicon al que pertenecerá',
  `Administrable` tinyint(4) DEFAULT '1' COMMENT 'Bandera que establece si aparecerá en la sección de permisos'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `municipios`
--

CREATE TABLE `municipios` (
  `Id_Municipio` int(11) NOT NULL COMMENT 'Llave primaria del municipio',
  `Id_Departamento` int(11) NOT NULL COMMENT 'Llave foránea del departamento',
  `Nombre` varchar(50) NOT NULL COMMENT 'Identificador del municipio'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `naturalezajuridica`
--

CREATE TABLE `naturalezajuridica` (
  `Id_NaturalezaJuridica` int(11) NOT NULL COMMENT 'Llave primaria de la tabla',
  `Nombre` varchar(50) NOT NULL COMMENT 'Identificador de la naturaleza jurídica'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `niveles`
--

CREATE TABLE `niveles` (
  `Id_Nivel` int(11) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Nivel` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nivelesaprueba`
--

CREATE TABLE `nivelesaprueba` (
  `Id_NivelAprueba` int(11) NOT NULL,
  `Id_Usuario` int(11) NOT NULL,
  `Id_UsuarioAprueba` int(11) NOT NULL,
  `Id_Nivel` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ordenescompra`
--

CREATE TABLE `ordenescompra` (
  `Id_OrdenCompra` int(11) NOT NULL COMMENT 'Llave primaria de la tabla',
  `Id_Solicitud` int(11) DEFAULT NULL COMMENT 'Llave foránea de la solicitud',
  `Id_UsuarioCrea` int(11) NOT NULL,
  `Id_DptoEmpresa` int(11) NOT NULL,
  `Id_UsuarioAprueba` int(11) DEFAULT NULL,
  `Codigo` varchar(20) DEFAULT NULL,
  `Observaciones` varchar(4000) DEFAULT NULL COMMENT 'Campo para agregar comentarios/observaciones',
  `Anulada` tinyint(4) NOT NULL COMMENT 'Bandera que indica si la orden de compra ha sido anulada',
  `Pagada` tinyint(4) NOT NULL COMMENT 'Bandera que indica si se realizó el pago',
  `FechaCrea` datetime(3) NOT NULL,
  `FechaAprueba` datetime(3) DEFAULT NULL,
  `UsuarioCrea` varchar(20) NOT NULL COMMENT 'Identificador del usuario que ingresa el registro',
  `UsuarioModifica` varchar(20) DEFAULT NULL COMMENT 'Fecha/hora de actualización',
  `Aprobada` tinyint(4) DEFAULT NULL,
  `FueraPresupuesto` tinyint(4) DEFAULT '0',
  `IncluyeIVA` tinyint(4) DEFAULT '0',
  `ValorIVA` decimal(18,4) DEFAULT NULL,
  `Impresa` tinyint(4) NOT NULL DEFAULT '0',
  `FechaUltimaImpresion` datetime(3) DEFAULT NULL,
  `Revision` tinyint(4) DEFAULT '0',
  `Id_Requisicion` int(11) DEFAULT NULL,
  `ACorregir` tinyint(4) DEFAULT '0',
  `ObservacionCorreccion` varchar(1000) DEFAULT NULL,
  `Id_EstadoActual` int(11) DEFAULT NULL,
  `FechaFueraPresupuesto` datetime(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ordenescompracomplemento`
--

CREATE TABLE `ordenescompracomplemento` (
  `Id_OrdenComplemento` int(11) NOT NULL,
  `Id_OrdenCompra` int(11) DEFAULT NULL,
  `Id_Proveedor` int(11) NOT NULL,
  `Id_CondicionPago` int(11) DEFAULT NULL,
  `Adjunto` longtext,
  `Seleccionado` tinyint(4) NOT NULL DEFAULT '0',
  `Id_TipoDocIVA` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ordenescompradetalle`
--

CREATE TABLE `ordenescompradetalle` (
  `Id_OrdenCompraDet` int(11) NOT NULL COMMENT 'Llave primaria de la tabla',
  `Id_OrdenCompra` int(11) NOT NULL,
  `Id_SolicitudDetalle` int(11) DEFAULT NULL COMMENT 'Llave foránea del detalle de la solicitud',
  `Id_Proveedor` int(11) NOT NULL,
  `Id_CondicionPago` int(11) DEFAULT NULL,
  `Adjunto` longtext,
  `Cantidad` decimal(18,4) NOT NULL COMMENT 'Magnitud de lo que se comprará',
  `Precio` decimal(18,6) DEFAULT NULL COMMENT 'Costo del producto a adquirirse',
  `MontoFueraPresupuesto` decimal(18,6) DEFAULT NULL,
  `Seleccionada` tinyint(4) NOT NULL DEFAULT '0',
  `Disponibilidad` decimal(18,4) NOT NULL,
  `Id_Producto` int(11) DEFAULT NULL,
  `Correlativo` int(11) DEFAULT '0',
  `Id_RequisicionDet` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ordenescompraestados`
--

CREATE TABLE `ordenescompraestados` (
  `Id_OrdenCompraEstado` int(11) NOT NULL,
  `Estado` varchar(50) NOT NULL,
  `Orden` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paises`
--

CREATE TABLE `paises` (
  `Id_Pais` int(11) NOT NULL,
  `CodigoPais` varchar(3) NOT NULL DEFAULT '',
  `Nombre` varchar(52) NOT NULL DEFAULT '',
  `Continente` varchar(50) NOT NULL DEFAULT 'América',
  `Region` varchar(26) NOT NULL DEFAULT '',
  `NombreLocal` varchar(45) NOT NULL DEFAULT '',
  `Gobierno` varchar(45) NOT NULL DEFAULT '',
  `Codigo2` varchar(2) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `parametros`
--

CREATE TABLE `parametros` (
  `Id_Parametro` int(11) NOT NULL COMMENT 'Llave primaria de la tabla',
  `Codigo` varchar(50) NOT NULL COMMENT 'Combinación de caracteres única',
  `Nombre` varchar(150) NOT NULL COMMENT 'Identificador de los parámetros',
  `Descripcion` longtext NOT NULL COMMENT 'Texto para explicar el parámetro',
  `ValorNumerico` decimal(18,4) DEFAULT NULL COMMENT 'Magnitud numérica que almacenará el parámetro',
  `ValorAlfanumerico` varchar(500) DEFAULT NULL COMMENT 'Cadena que contendrá el valor del parámetro',
  `Oculto` tinyint(4) NOT NULL COMMENT 'Bandera para que el parámetro sea manipulable en un mantenimiento'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfiles`
--

CREATE TABLE `perfiles` (
  `Id_Perfil` int(11) NOT NULL COMMENT 'Llave primaria para de la tabla',
  `Nombre` varchar(50) NOT NULL COMMENT 'Texto que identificará el perfil',
  `Descripcion` longtext NOT NULL COMMENT 'Detalle del perfil',
  `Id_MenuPorDefecto` int(11) NOT NULL COMMENT 'Llave foránea para el menu de inicio',
  `Habilitado` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'Bandera que establece si el perfil está o no habilitado'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisosperfil`
--

CREATE TABLE `permisosperfil` (
  `Id_PerfilPermiso` int(11) NOT NULL COMMENT 'Llave primaria para de la tabla',
  `Id_Menu` int(11) NOT NULL COMMENT 'Llave foránea del menú al que se aplicará los permisos',
  `Id_Perfil` int(11) NOT NULL COMMENT 'Llave foránea del perfil a asignarle el permiso',
  `Escritura` tinyint(4) NOT NULL COMMENT 'Bandera para conceder/denegar la escritura',
  `Eliminacion` tinyint(4) NOT NULL COMMENT 'Bandera para conceder/denegar la eliminación'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `Id_Producto` int(11) NOT NULL COMMENT 'Llave primaria para de la tabla',
  `Nombre` varchar(200) NOT NULL COMMENT 'Contiene el texto identificador del producto',
  `Codigo` varchar(50) NOT NULL COMMENT 'Combinación de caracteres única representativos del producto',
  `CodBarra` varchar(100) DEFAULT NULL COMMENT 'Combinación de caracteres única para crear el código de barras',
  `Id_UnidadMedIngreso` int(11) NOT NULL COMMENT 'Llave foránea para la unidad de medida de ingreso',
  `Id_UnidadMedSalida` int(11) NOT NULL COMMENT 'Llave foránea para la unidad de medida de entrega',
  `Id_Empresa` int(11) DEFAULT NULL,
  `EquivalenteCompra` decimal(18,4) DEFAULT NULL,
  `EquivalenteSalida` decimal(18,4) DEFAULT NULL,
  `Id_SubCategoria` int(11) NOT NULL COMMENT 'Llave foránea para la sub categoría',
  `Descripcion` longtext COMMENT 'Detalle de las características del producto',
  `FechaCreacion` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT 'Fecha/hora en la que se inserta el registro',
  `Habilitado` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'Bandera que permitirá que el producto esté o no disponible',
  `Autorizacion` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Bandera que indicará si previo a la entrega, deberá concederse permiso',
  `MaxAdquisicion` decimal(15,4) DEFAULT NULL COMMENT 'Cantidad que al sobre pasarse, deberá pasar por autorización',
  `ExistenciaMaxima` decimal(18,4) DEFAULT NULL,
  `ExistenciaMinima` decimal(18,4) DEFAULT NULL,
  `UltimoPrecioCompra` decimal(15,4) NOT NULL DEFAULT '0.0000' COMMENT 'Indica el precio unitario de la última compra realizada',
  `CodContable` varchar(20) DEFAULT NULL COMMENT 'Código contable para la Nueva Avícola',
  `UsuarioCrea` varchar(20) NOT NULL COMMENT 'Identificador del usuario que ingresa el registro',
  `UsuarioModifica` varchar(20) DEFAULT NULL COMMENT 'Identificador del usuario que actualiza el registro',
  `PrecioCosto` decimal(18,4) DEFAULT '0.0000' COMMENT 'Costo promedio del producto'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productoscategorias`
--

CREATE TABLE `productoscategorias` (
  `Id_CategoriaProd` int(11) NOT NULL COMMENT 'Llave primaria para de la tabla',
  `Nombre` varchar(50) NOT NULL COMMENT 'Identificador de la categoría',
  `Codigo` varchar(10) DEFAULT NULL,
  `Habilitada` tinyint(4) NOT NULL COMMENT 'Bandera para habilitar o deshabilitar la categoría',
  `Autorizacion` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Bandera que indicará si previo a la entrega, deberá concederse permiso',
  `Flota` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `productoscategorias`
--

INSERT INTO `productoscategorias` (`Id_CategoriaProd`, `Nombre`, `Codigo`, `Habilitada`, `Autorizacion`, `Flota`) VALUES
(1, 'Categoria 1', 'CAT1', 1, 0, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productosexistencia`
--

CREATE TABLE `productosexistencia` (
  `Id_ProdExistencia` bigint(20) NOT NULL COMMENT 'Llave primaria para de la tabla',
  `Id_Producto` int(11) NOT NULL COMMENT 'Llave foránea para el producto',
  `Id_Bodega` int(11) NOT NULL COMMENT 'Llave foránea para la bodega',
  `Existencia` decimal(18,4) NOT NULL COMMENT 'Cantidad actual del producto',
  `FechaActualizacion` datetime(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productossubcategorias`
--

CREATE TABLE `productossubcategorias` (
  `Id_ProdSubCat` int(11) NOT NULL COMMENT 'Llave primaria para de la tabla',
  `Id_CategoriaProd` int(11) NOT NULL COMMENT 'Llave foránea de la categoría',
  `Nombre` varchar(75) NOT NULL COMMENT 'Identificador de la sub categoría',
  `Codigo` varchar(20) DEFAULT NULL COMMENT 'Combinación alfanumérica',
  `Habilitada` tinyint(4) NOT NULL COMMENT 'Bandera que habilitará o deshabilitará la sub categoría',
  `Autorizacion` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Bandera que indicará si previo a la entrega, deberá concederse permiso'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `Id_Proveedor` int(11) NOT NULL COMMENT 'Llave primaria de la tabla',
  `Id_Municipio` int(11) DEFAULT NULL COMMENT 'Llave foránea del municipio',
  `Id_TipoRecaudacion` int(11) DEFAULT NULL COMMENT 'Percepción o retención',
  `Id_Naturaleza` int(11) DEFAULT NULL COMMENT 'Llave foránea de la naturaleza del proveedor',
  `Id_Pais` int(11) DEFAULT NULL COMMENT 'Llave foránea con el país de orígen del proveedor',
  `Id_Giro` int(11) DEFAULT NULL COMMENT 'Llave foránea con el giro',
  `Id_Empresa` int(11) DEFAULT NULL,
  `Id_TipoContacto` int(11) DEFAULT NULL,
  `Nombre` varchar(150) DEFAULT NULL COMMENT 'Identificador del proveedor',
  `Alias` varchar(150) DEFAULT NULL COMMENT 'Campo opcional al nombre',
  `NIT` varchar(50) DEFAULT NULL COMMENT 'Secuencia con el Número Único de Identificación Tributaria',
  `DUI` varchar(50) DEFAULT NULL COMMENT 'Secuencia con el número de Documento Único de Identifación',
  `Contacto` varchar(150) DEFAULT NULL,
  `Celular` varchar(10) DEFAULT NULL,
  `Telefono` varchar(50) DEFAULT NULL,
  `Email` varchar(150) DEFAULT NULL,
  `RazonSocial` varchar(150) DEFAULT NULL COMMENT 'Identificador de la razón social',
  `NoRegistro` varchar(30) DEFAULT NULL COMMENT 'Clave alfanumérica para la cuenta',
  `Direccion` longtext COMMENT 'Localización geográfica',
  `Habilitado` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'Bandera que establece si está o no habilitado',
  `CuentaIva` varchar(50) DEFAULT NULL COMMENT 'Identificador para el número de IVA',
  `CuentaIvaVenta` varchar(50) DEFAULT NULL COMMENT 'Identificador para el número de IVA para la venta',
  `EsInternacional` tinyint(4) NOT NULL DEFAULT '1',
  `Id_TipoContribuyente` int(11) DEFAULT NULL,
  `CuentaContable` varchar(50) DEFAULT NULL,
  `FechaCrea` datetime(3) DEFAULT NULL,
  `Cargo` varchar(100) DEFAULT NULL,
  `Posicion` varchar(100) DEFAULT NULL,
  `Firma` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedoresevaluaciones`
--

CREATE TABLE `proveedoresevaluaciones` (
  `Id_ProvEvaluacion` int(11) NOT NULL,
  `Id_Ingreso` int(11) NOT NULL,
  `FechaCrea` datetime(3) NOT NULL,
  `Id_UsuarioCrea` int(11) NOT NULL,
  `Observaciones` varchar(450) DEFAULT NULL,
  `Id_Proveedor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedoresevaluacionesdetalles`
--

CREATE TABLE `proveedoresevaluacionesdetalles` (
  `Id_ProvEvaluacionDetalle` int(11) NOT NULL,
  `Id_ProvEvaluacion` int(11) NOT NULL,
  `Id_Variable` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedoresindicadores`
--

CREATE TABLE `proveedoresindicadores` (
  `Id_Indicador` int(11) NOT NULL,
  `Nombre` varchar(150) NOT NULL,
  `Habilitado` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedoresreferencias`
--

CREATE TABLE `proveedoresreferencias` (
  `Id_ProveedorContacto` int(11) NOT NULL COMMENT 'Llave primaria con el',
  `Id_Proveedor` int(11) NOT NULL COMMENT 'Llave foránea del proveedor',
  `Id_TipoContacto` int(11) NOT NULL,
  `Nombre` varchar(150) NOT NULL COMMENT 'Identificador del proveedor',
  `Habilitado` tinyint(4) NOT NULL COMMENT 'Bandera que establece si el contacto está habilitado',
  `Email` varchar(500) DEFAULT NULL,
  `Telefono` varchar(500) DEFAULT NULL,
  `Observaciones` varchar(150) DEFAULT NULL COMMENT 'Campo para comentarios',
  `ValorNegocio` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedoresvariables`
--

CREATE TABLE `proveedoresvariables` (
  `Id_VariableIndicador` int(11) NOT NULL,
  `Id_Indicador` int(11) NOT NULL,
  `Descripcion` varchar(250) NOT NULL,
  `Ponderacion` varchar(100) DEFAULT NULL,
  `Orden` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `requisicionesautoriza`
--

CREATE TABLE `requisicionesautoriza` (
  `Id_AutorizacionReq` int(11) NOT NULL,
  `Id_Departamento` int(11) NOT NULL,
  `Id_Usuario` int(11) NOT NULL,
  `Habilitado` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `requisicionesclasificacion`
--

CREATE TABLE `requisicionesclasificacion` (
  `Id_ClasificacionReq` int(11) NOT NULL,
  `NombreClasi` varchar(150) NOT NULL,
  `CadenaProductos` longtext NOT NULL,
  `Habilitada` tinyint(4) NOT NULL,
  `Id_Empresa` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `requisicionesdetalles`
--

CREATE TABLE `requisicionesdetalles` (
  `Id_RequsicionDet` int(11) NOT NULL COMMENT 'Llave primara de la tabla',
  `Id_Requisicion` int(11) NOT NULL COMMENT 'Llave foránea de la requisición maestra',
  `Id_Producto` int(11) NOT NULL COMMENT 'Llave foránea del producto',
  `CantSolicitada` decimal(18,4) NOT NULL COMMENT 'Cantidad solicitada',
  `CantEntregada` decimal(18,4) DEFAULT NULL COMMENT 'CantidadEntregada',
  `Adjunto` longtext,
  `Anulado` tinyint(4) DEFAULT '0',
  `Precio` decimal(18,6) DEFAULT NULL,
  `FueraPresupuesto` decimal(18,6) DEFAULT NULL,
  `Id_Proveedor` int(11) DEFAULT NULL,
  `Id_CentroCosto` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `requsiciones`
--

CREATE TABLE `requsiciones` (
  `Id_Requisicion` int(11) NOT NULL,
  `Id_Departamento` int(11) NOT NULL,
  `Id_EstadoActual` int(11) NOT NULL,
  `Id_UsuarioRequisicion` int(11) NOT NULL,
  `Id_UsuarioCrea` int(11) NOT NULL,
  `FechaCreacion` datetime(3) NOT NULL,
  `Codigo` varchar(20) NOT NULL,
  `Pendiente` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'Establece si hay detalles que no se han entregado',
  `UsoEn` varchar(500) DEFAULT NULL,
  `Id_EmpresaDestino` int(11) DEFAULT NULL,
  `Id_Clasificacion` int(11) DEFAULT NULL,
  `FechaPrimeraImp` datetime(3) DEFAULT NULL,
  `Compra` tinyint(4) DEFAULT '1',
  `Proc_Flota` tinyint(4) DEFAULT NULL,
  `Urgente` tinyint(4) DEFAULT NULL,
  `Fecha_Modificacion` datetime(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solicitudes`
--

CREATE TABLE `solicitudes` (
  `Id_Solicitud` int(11) NOT NULL COMMENT 'Llave primaria de la tabla',
  `Codigo` varchar(100) NOT NULL,
  `Fecha` datetime(3) NOT NULL COMMENT 'Fecha/hora de la solicitud',
  `Origen` varchar(1) NOT NULL DEFAULT 'C' COMMENT 'A: Requisición específica, B: Ingreso manual, C: Todas,',
  `Id_EstadoActual` int(11) NOT NULL COMMENT 'Llave foránea para el estado de la solicitud',
  `Id_UsuarioCrea` int(11) NOT NULL COMMENT 'Llave foránea para el usuario',
  `Id_Requisicion` int(11) DEFAULT NULL COMMENT 'Llave foránea de la requisición de la que proviene',
  `Observaciones` longtext COMMENT 'Comentarios sobre un estado específico',
  `UsuarioCrea` varchar(20) NOT NULL COMMENT 'Identificador del usuario que ingresa el registro',
  `UsuarioModifica` varchar(20) DEFAULT NULL COMMENT 'Identificador del usuario que actualiza el registro'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solicitudesdetalles`
--

CREATE TABLE `solicitudesdetalles` (
  `Id_SolicitudDetalle` int(11) NOT NULL COMMENT 'Llave primaria de la tabla',
  `Id_Solicitud` int(11) NOT NULL COMMENT 'Llave foránea de la solicitud padre',
  `Id_RequisicionDetalle` int(11) DEFAULT NULL COMMENT 'Llave foránea del detalle de la requisición',
  `Cantidad` decimal(18,4) NOT NULL COMMENT 'Proporción que se ingresará'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solicitudesdocumentos`
--

CREATE TABLE `solicitudesdocumentos` (
  `Id_SolicitudDoc` int(11) NOT NULL COMMENT 'Llave primaria de la tabla',
  `Id_TipoDocumentoSol` int(11) NOT NULL COMMENT 'Llave foránea para el tipo de documento',
  `Id_Usuario` int(11) NOT NULL COMMENT 'Llave foránea para el usuario que adjunta el documento',
  `RutaDocumento` varchar(500) NOT NULL COMMENT 'Dirección relativa incluyendo nombre del archivo',
  `Seleccionado` tinyint(4) NOT NULL COMMENT 'Bandera para indicar que el documento fue seleccionado para',
  `Observaciones` longtext NOT NULL COMMENT 'Texto para anotaciones del documento'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solicitudesestados`
--

CREATE TABLE `solicitudesestados` (
  `Id_EstadoSolicitud` int(11) NOT NULL COMMENT 'Llave primaria de la tabla',
  `Estado` varchar(50) NOT NULL COMMENT 'Identificador del estado'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solicitudeshistorial`
--

CREATE TABLE `solicitudeshistorial` (
  `Id_HistorialSol` bigint(20) NOT NULL COMMENT 'Llave primaria de la tabla',
  `Id_Solicitud` int(11) NOT NULL COMMENT 'Llave foránea de la solicitud',
  `Id_Usuario` int(11) NOT NULL COMMENT 'Llave foránea del usuario que inicia es estado',
  `Id_EstadoSolicitud` int(11) NOT NULL,
  `FechaInicio` datetime(3) NOT NULL COMMENT 'Fecha/hora en que se realiza la acción',
  `FechaFin` datetime(3) DEFAULT NULL,
  `Observacion` varchar(500) DEFAULT NULL COMMENT 'Campo para comentarios'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sucursales`
--

CREATE TABLE `sucursales` (
  `Id_Sucursal` int(11) NOT NULL,
  `Id_SucursalRRHHWeb` int(11) DEFAULT NULL,
  `Id_Empresa` int(11) NOT NULL,
  `Id_EmpresaRRHH` int(11) DEFAULT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Observacion` varchar(100) DEFAULT NULL,
  `Activa` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `telefonosproveedor`
--

CREATE TABLE `telefonosproveedor` (
  `Id_TelProveedor` int(11) NOT NULL COMMENT 'Llave primaria de la tabla',
  `Id_Proveedor` int(11) NOT NULL,
  `Id_TipoLinea` int(11) NOT NULL COMMENT 'Llave foránea del tipo de línea',
  `Telefono` varchar(30) NOT NULL COMMENT 'Número telefónico'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiposbodega`
--

CREATE TABLE `tiposbodega` (
  `Id_TipoBodega` int(11) NOT NULL COMMENT 'Llave primaria de la tabla',
  `Nombre` varchar(50) NOT NULL COMMENT 'Identificador del tipo de bodega'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiposcontribuyente`
--

CREATE TABLE `tiposcontribuyente` (
  `Id_TipoContribuyente` int(11) NOT NULL,
  `TipoContribuyente` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiposdocumentos`
--

CREATE TABLE `tiposdocumentos` (
  `Id_TipoDocumento` int(11) NOT NULL,
  `Nombre` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiposdocumentosinv`
--

CREATE TABLE `tiposdocumentosinv` (
  `Id_TipoDocInventario` int(11) NOT NULL COMMENT 'Llave primaria de la tabla',
  `Nombre` varchar(50) NOT NULL COMMENT 'Identificador del tipo de documento',
  `Facturacion` tinyint(4) DEFAULT NULL COMMENT 'Bandera que indica si es documento para facturación',
  `Egreso` tinyint(4) DEFAULT NULL COMMENT 'Bandera que indica si es documento es para egreso',
  `Ingreso` tinyint(4) DEFAULT NULL COMMENT 'Bandera que indica si es documento de ingreso',
  `Ajuste` tinyint(4) DEFAULT NULL COMMENT 'Bandera que indica si es documento de ajuste',
  `Afectacion` varchar(10) DEFAULT NULL COMMENT 'Factor negativo para ingresos y positivo para salidas'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiposdocumentosiva`
--

CREATE TABLE `tiposdocumentosiva` (
  `Id_TipoDocIVA` int(11) NOT NULL,
  `TipoDocumento` varchar(100) NOT NULL,
  `Habilitado` tinyint(4) NOT NULL,
  `IVA` decimal(18,4) DEFAULT NULL,
  `AplicaIVA` tinyint(4) DEFAULT NULL,
  `AplicaRetencion13` tinyint(4) DEFAULT NULL,
  `Abreviatura` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiposdocumentossol`
--

CREATE TABLE `tiposdocumentossol` (
  `Id_TiposDocSol` int(11) NOT NULL COMMENT 'Llave primaria de la tabla',
  `Nombre` varchar(50) NOT NULL COMMENT 'Identificador para el tipo de documento'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiposlineas`
--

CREATE TABLE `tiposlineas` (
  `Id_TipoLinea` int(11) NOT NULL COMMENT 'Llave primaria de la tabla',
  `Nombre` varchar(50) NOT NULL COMMENT 'Identificador del tipo de línea'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiposmovimientosinv`
--

CREATE TABLE `tiposmovimientosinv` (
  `Id_TipoMovInven` int(11) NOT NULL COMMENT 'Llave primaria para de la tabla',
  `Nombre` varchar(50) NOT NULL COMMENT 'Identificador de la tabla',
  `EntradaSalida` smallint(6) NOT NULL COMMENT 'Factor negativo para ingresos y positivo para salidas'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiposrecaudacion`
--

CREATE TABLE `tiposrecaudacion` (
  `Id_TipoRecaudacion` int(11) NOT NULL COMMENT 'Llave primaria de la tabla',
  `TipoRecaudacion` varchar(50) NOT NULL COMMENT 'Identificador para percepción o retención'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiposreferencias`
--

CREATE TABLE `tiposreferencias` (
  `Id_TipoContacto` int(11) NOT NULL,
  `Nombre` varchar(200) NOT NULL,
  `Habilitado` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiposreqsubcategorias`
--

CREATE TABLE `tiposreqsubcategorias` (
  `Id_SubCatTipoReq` int(11) NOT NULL,
  `Id_ProductoSubCat` int(11) NOT NULL,
  `Id_TipoRequisicion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiposrequisicion`
--

CREATE TABLE `tiposrequisicion` (
  `Id_TipoRequisicion` int(11) NOT NULL,
  `Id_Empresa` int(11) NOT NULL,
  `Nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `traslados`
--

CREATE TABLE `traslados` (
  `Id_Traslado` bigint(20) NOT NULL COMMENT 'Llave primaria de la tabla',
  `Id_UsuarioCrea` int(11) NOT NULL COMMENT 'Llave foránea del usuario que crea',
  `Id_Entrega` int(11) DEFAULT NULL,
  `Observacion` varchar(500) NOT NULL COMMENT 'Comentario del traslado',
  `Fecha` datetime(3) NOT NULL COMMENT 'Fecha/hora de la transacción',
  `SubTotal` decimal(18,4) NOT NULL COMMENT 'Monto de la transacción',
  `UsuarioCrea` varchar(20) NOT NULL COMMENT 'Identificador del usuario que ingresa el registro',
  `UsuarioModifica` varchar(20) DEFAULT NULL COMMENT 'Identificador del usuario que modifica el registro',
  `Generada` tinyint(4) NOT NULL COMMENT 'Bandera que indica si el registro fue generado',
  `FechaCrea` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trasladosdetalles`
--

CREATE TABLE `trasladosdetalles` (
  `Id_TrasladoDetalle` bigint(20) NOT NULL COMMENT 'Llave prmaria de la tabla',
  `Id_Traslado` bigint(20) NOT NULL COMMENT 'Llave foránea del traslado padre',
  `Id_Producto` int(11) NOT NULL COMMENT 'Llave foránea del producto',
  `Id_BodegaSale` int(11) NOT NULL COMMENT 'Llave foránea de la bodega de la que salen los suministros',
  `Id_BodegaEntra` int(11) DEFAULT NULL COMMENT 'Llave foránea de la bodega a la que ingresan los suministros',
  `Cantidad` decimal(18,4) NOT NULL COMMENT 'Proporción que se ingresará',
  `PrecioCosto` decimal(18,4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unidadesmedida`
--

CREATE TABLE `unidadesmedida` (
  `Id_UnidadMedida` int(11) NOT NULL COMMENT 'Llave primaria para de la tabla',
  `Nombre` varchar(50) NOT NULL COMMENT 'Identificador de la unidad de medida',
  `Siglas` varchar(10) NOT NULL COMMENT 'Forma corta para identificar la unidad de medida',
  `Habilitada` tinyint(4) NOT NULL COMMENT 'Bandera que habilita o deshabilita la unidad de medida'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `Id_Usuario` int(11) NOT NULL COMMENT 'Llave primaria para de la tabla',
  `Id_Perfil` int(11) NOT NULL COMMENT 'Llave foránea para el perfil del usuario',
  `Nombre` varchar(200) DEFAULT NULL,
  `Identificador` varchar(20) DEFAULT NULL COMMENT 'Código único de RRHH o identificador único en la tabla',
  `Habilitado` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'Bandera que establece si el usuario está o no habilitado',
  `Contrasenia` varchar(500) DEFAULT NULL COMMENT 'Cadena de caracteres con fines de seguridad',
  `EnRH` tinyint(4) DEFAULT '0' COMMENT 'Bandera que establece si sigue la estructura organizativa de RRHH o la de la base de datos',
  `Id_EmpleadoRRHH` int(11) DEFAULT NULL,
  `eMailAlternativo` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuariosaccesos`
--

CREATE TABLE `usuariosaccesos` (
  `Id_UsuarioAcceso` int(11) NOT NULL,
  `Id_Usuario` int(11) NOT NULL,
  `Id_Empresa` int(11) NOT NULL,
  `Id_Departamento` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuariosaprueban`
--

CREATE TABLE `usuariosaprueban` (
  `Id_UsuarioAprueba` int(11) NOT NULL,
  `Id_Usuario` int(11) NOT NULL,
  `Autonomo` tinyint(4) NOT NULL DEFAULT '0',
  `Rubrica` longblob
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuariossolicitan`
--

CREATE TABLE `usuariossolicitan` (
  `Id_UsuarioSolicita` int(11) NOT NULL,
  `Id_UsuarioAprueba` int(11) NOT NULL,
  `Id_Usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `aprobacion`
--
ALTER TABLE `aprobacion`
  ADD PRIMARY KEY (`Id_Aprobacion`),
  ADD KEY `FK_Aprobacion_Usuarios_Aprueba` (`Id_Usuario`);

--
-- Indices de la tabla `areas`
--
ALTER TABLE `areas`
  ADD PRIMARY KEY (`Id_Area`);

--
-- Indices de la tabla `auditoria`
--
ALTER TABLE `auditoria`
  ADD PRIMARY KEY (`Id_LogAuditoria`);

--
-- Indices de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indices de la tabla `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indices de la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indices de la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `bodegas`
--
ALTER TABLE `bodegas`
  ADD PRIMARY KEY (`Id_Bodega`),
  ADD KEY `FK_Bodegas_Municipios` (`Id_Municipio`),
  ADD KEY `FK_Bodegas_Paises` (`Id_Pais`),
  ADD KEY `FK_Bodegas_Sucursales` (`Id_Sucursal`),
  ADD KEY `FK_Bodegas_TiposBodega` (`Id_TipoBodega`);

--
-- Indices de la tabla `condicionespago`
--
ALTER TABLE `condicionespago`
  ADD PRIMARY KEY (`Id_CondicionPago`);

--
-- Indices de la tabla `departamentos`
--
ALTER TABLE `departamentos`
  ADD PRIMARY KEY (`Id_Departamento`);

--
-- Indices de la tabla `departamentosempresa`
--
ALTER TABLE `departamentosempresa`
  ADD PRIMARY KEY (`Id_DptoEmpresa`),
  ADD KEY `FK_DepartamentosEmpresa_Areas` (`Id_Area`),
  ADD KEY `FK_DepartamentosEmpresa_Empresas` (`Id_Empresa`);

--
-- Indices de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indices de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indices de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indices de la tabla `documentosproveedor`
--
ALTER TABLE `documentosproveedor`
  ADD PRIMARY KEY (`Id_TipoDocProveedor`),
  ADD KEY `FK_DocumentosProveedor_Proveedores` (`Id_Proveedor`),
  ADD KEY `FK_DocumentosProveedor_TiposDocumentos` (`Id_TipoDocumento`);

--
-- Indices de la tabla `empresas`
--
ALTER TABLE `empresas`
  ADD PRIMARY KEY (`Id_Empresa`),
  ADD KEY `FK_GRL_Empresas_Giros` (`Id_Giro`);

--
-- Indices de la tabla `entregas`
--
ALTER TABLE `entregas`
  ADD PRIMARY KEY (`Id_Entrega`),
  ADD KEY `FK_Entregas_Bodegas` (`Id_Bodega`),
  ADD KEY `FK_Entregas_DepartamentosEmpresa` (`Id_Departamento`),
  ADD KEY `FK_Entregas_Requsiciones` (`Id_Requision`),
  ADD KEY `FK_Entregas_Usuarios` (`Id_UsuarioCrea`);

--
-- Indices de la tabla `entregasdetalles`
--
ALTER TABLE `entregasdetalles`
  ADD PRIMARY KEY (`Id_EntregaDetalle`),
  ADD KEY `FK_EntregasDetalles_Bodegas` (`Id_BodegaSale`),
  ADD KEY `FK_EntregasDetalles_Entregas` (`Id_Entrega`),
  ADD KEY `FK_EntregasDetalles_RequisicionesDetalles` (`Id_RequsicionDet`);

--
-- Indices de la tabla `estadosrequisicion`
--
ALTER TABLE `estadosrequisicion`
  ADD PRIMARY KEY (`Id_EstadoRequisicion`);

--
-- Indices de la tabla `giros`
--
ALTER TABLE `giros`
  ADD PRIMARY KEY (`Id_Giro`),
  ADD KEY `FK_Giros_GirosSubCategorias` (`Id_GiroSubCategoria`);

--
-- Indices de la tabla `giroscategorias`
--
ALTER TABLE `giroscategorias`
  ADD PRIMARY KEY (`Id_GiroCategoria`);

--
-- Indices de la tabla `girossubcategorias`
--
ALTER TABLE `girossubcategorias`
  ADD PRIMARY KEY (`Id_GiroSubCat`),
  ADD KEY `FK_GirosSubCategorias_GirosCategorias` (`Id_Categoria`);

--
-- Indices de la tabla `historialrequisiciones`
--
ALTER TABLE `historialrequisiciones`
  ADD PRIMARY KEY (`Id_HistorialReq`),
  ADD KEY `FK_HistorialRequisiciones_EstadosRequisicion` (`Id_EstadoRequisicion`),
  ADD KEY `FK_HistorialRequisiciones_Requsiciones` (`Id_Requisicion`),
  ADD KEY `FK_HistorialRequisiciones_Usuarios` (`Id_Usuario`);

--
-- Indices de la tabla `ingresos`
--
ALTER TABLE `ingresos`
  ADD PRIMARY KEY (`Id_Ingreso`),
  ADD KEY `FK_Ingresos_Bodegas` (`Id_BodegaIngresa`),
  ADD KEY `FK_Ingresos_OrdenesCompra` (`Id_OrdenCompra`),
  ADD KEY `FK_Ingresos_TiposDocumentosInv` (`Id_TipoDocumento`),
  ADD KEY `FK_Ingresos_TiposMovimientosInv` (`Id_TipoMovimiento`),
  ADD KEY `FK_Ingresos_Usuarios_Crea` (`Id_UsuarioCrea`),
  ADD KEY `FK_Ingresos_Usuarios_Genera` (`Id_UsuarioGenera`);

--
-- Indices de la tabla `ingresosdetalles`
--
ALTER TABLE `ingresosdetalles`
  ADD PRIMARY KEY (`Id_IngresoDetalle`),
  ADD KEY `FK_IngresosDetalles_Ingresos` (`Id_Ingreso`),
  ADD KEY `FK_IngresosDetalles_OrdenesCompraDetalle` (`Id_OrdenCompraDet`),
  ADD KEY `FK_IngresosDetalles_Productos` (`Id_Producto`),
  ADD KEY `FK_IngresosDetalles_Proveedores` (`Id_Proveedor`);

--
-- Indices de la tabla `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`Id_Menu`);

--
-- Indices de la tabla `municipios`
--
ALTER TABLE `municipios`
  ADD PRIMARY KEY (`Id_Municipio`),
  ADD KEY `FK_Municipios_Departamentos` (`Id_Departamento`);

--
-- Indices de la tabla `naturalezajuridica`
--
ALTER TABLE `naturalezajuridica`
  ADD PRIMARY KEY (`Id_NaturalezaJuridica`);

--
-- Indices de la tabla `niveles`
--
ALTER TABLE `niveles`
  ADD PRIMARY KEY (`Id_Nivel`);

--
-- Indices de la tabla `nivelesaprueba`
--
ALTER TABLE `nivelesaprueba`
  ADD PRIMARY KEY (`Id_NivelAprueba`),
  ADD KEY `FK_NivelesAprueba_Niveles` (`Id_Nivel`),
  ADD KEY `FK_NivelesAprueba_Usuarios` (`Id_Usuario`),
  ADD KEY `FK_NivelesAprueba_UsuariosAprueba` (`Id_UsuarioAprueba`);

--
-- Indices de la tabla `ordenescompra`
--
ALTER TABLE `ordenescompra`
  ADD PRIMARY KEY (`Id_OrdenCompra`),
  ADD KEY `FK_OrdenesCompra_DepartamentosEmpresa` (`Id_DptoEmpresa`),
  ADD KEY `FK_OrdenesCompra_OrdenesCompraEstados` (`Id_EstadoActual`),
  ADD KEY `FK_OrdenesCompra_Requsiciones` (`Id_Requisicion`),
  ADD KEY `FK_OrdenesCompra_Solicitudes` (`Id_Solicitud`),
  ADD KEY `FK_OrdenesCompra_Usuarios` (`Id_UsuarioCrea`),
  ADD KEY `FK_OrdenesCompra_Usuarios1` (`Id_UsuarioAprueba`);

--
-- Indices de la tabla `ordenescompracomplemento`
--
ALTER TABLE `ordenescompracomplemento`
  ADD PRIMARY KEY (`Id_OrdenComplemento`),
  ADD KEY `FK_OrdenesCompraComplemento_CondicionesPago` (`Id_CondicionPago`),
  ADD KEY `FK_OrdenesCompraComplemento_OrdenesCompra` (`Id_OrdenCompra`),
  ADD KEY `FK_OrdenesCompraComplemento_Proveedores` (`Id_Proveedor`),
  ADD KEY `FK_OrdenesCompraComplemento_TiposDocumentosIVA` (`Id_TipoDocIVA`);

--
-- Indices de la tabla `ordenescompradetalle`
--
ALTER TABLE `ordenescompradetalle`
  ADD PRIMARY KEY (`Id_OrdenCompraDet`),
  ADD KEY `FK_OrdenesCompraDetalle_CondicionesPago` (`Id_CondicionPago`),
  ADD KEY `FK_OrdenesCompraDetalle_OrdenesCompra` (`Id_OrdenCompra`),
  ADD KEY `FK_OrdenesCompraDetalle_Productos` (`Id_Producto`),
  ADD KEY `FK_OrdenesCompraDetalle_Proveedores` (`Id_Proveedor`),
  ADD KEY `FK_OrdenesCompraDetalle_RequisicionesDetalles` (`Id_RequisicionDet`),
  ADD KEY `FK_OrdenesCompraDetalle_SolicitudesDetalles` (`Id_SolicitudDetalle`);

--
-- Indices de la tabla `ordenescompraestados`
--
ALTER TABLE `ordenescompraestados`
  ADD PRIMARY KEY (`Id_OrdenCompraEstado`);

--
-- Indices de la tabla `paises`
--
ALTER TABLE `paises`
  ADD PRIMARY KEY (`Id_Pais`),
  ADD UNIQUE KEY `AK_Paises` (`CodigoPais`);

--
-- Indices de la tabla `parametros`
--
ALTER TABLE `parametros`
  ADD PRIMARY KEY (`Id_Parametro`);

--
-- Indices de la tabla `perfiles`
--
ALTER TABLE `perfiles`
  ADD PRIMARY KEY (`Id_Perfil`),
  ADD KEY `FK_Perfiles_Menus` (`Id_MenuPorDefecto`);

--
-- Indices de la tabla `permisosperfil`
--
ALTER TABLE `permisosperfil`
  ADD PRIMARY KEY (`Id_PerfilPermiso`),
  ADD KEY `FK_PermisosPerfil_Menus` (`Id_Menu`),
  ADD KEY `FK_PermisosPerfil_Perfiles` (`Id_Perfil`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`Id_Producto`),
  ADD UNIQUE KEY `AK_Productos` (`Codigo`,`Id_Empresa`),
  ADD KEY `FK_Productos_Empresas` (`Id_Empresa`),
  ADD KEY `FK_Productos_ProductosSubCategorias` (`Id_SubCategoria`),
  ADD KEY `FK_Productos_UnidadesMedida_Ingreso` (`Id_UnidadMedIngreso`),
  ADD KEY `FK_Productos_UnidadesMedida_Salida` (`Id_UnidadMedSalida`);

--
-- Indices de la tabla `productoscategorias`
--
ALTER TABLE `productoscategorias`
  ADD PRIMARY KEY (`Id_CategoriaProd`);

--
-- Indices de la tabla `productosexistencia`
--
ALTER TABLE `productosexistencia`
  ADD PRIMARY KEY (`Id_ProdExistencia`),
  ADD KEY `FK_ProductosExistencia_Bodegas` (`Id_Bodega`),
  ADD KEY `FK_ProductosExistencia_Productos` (`Id_Producto`);

--
-- Indices de la tabla `productossubcategorias`
--
ALTER TABLE `productossubcategorias`
  ADD PRIMARY KEY (`Id_ProdSubCat`),
  ADD KEY `FK_ProductosSubCategorias_ProductosCategorias` (`Id_CategoriaProd`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`Id_Proveedor`),
  ADD KEY `FK_Proveedores_Empresas` (`Id_Empresa`),
  ADD KEY `FK_Proveedores_Giros` (`Id_Giro`),
  ADD KEY `FK_Proveedores_Municipios` (`Id_Municipio`),
  ADD KEY `FK_Proveedores_NaturalezaJuridica` (`Id_Naturaleza`),
  ADD KEY `FK_Proveedores_Paises` (`Id_Pais`),
  ADD KEY `FK_Proveedores_TiposContacto` (`Id_TipoContacto`),
  ADD KEY `FK_Proveedores_TiposContribuyente` (`Id_TipoContribuyente`),
  ADD KEY `FK_Proveedores_TiposRecaudacion` (`Id_TipoRecaudacion`);

--
-- Indices de la tabla `proveedoresevaluaciones`
--
ALTER TABLE `proveedoresevaluaciones`
  ADD PRIMARY KEY (`Id_ProvEvaluacion`),
  ADD KEY `FK_ProveedoresEvaluaciones_Ingresos` (`Id_Ingreso`),
  ADD KEY `FK_ProveedoresEvaluaciones_Proveedores` (`Id_Proveedor`);

--
-- Indices de la tabla `proveedoresevaluacionesdetalles`
--
ALTER TABLE `proveedoresevaluacionesdetalles`
  ADD PRIMARY KEY (`Id_ProvEvaluacionDetalle`),
  ADD KEY `FK_ProveedoresEvaluacionesDetalles_ProveedoresEvaluaciones` (`Id_ProvEvaluacion`),
  ADD KEY `FK_ProveedoresEvaluacionesDetalles_ProveedoresVariables` (`Id_Variable`);

--
-- Indices de la tabla `proveedoresindicadores`
--
ALTER TABLE `proveedoresindicadores`
  ADD PRIMARY KEY (`Id_Indicador`);

--
-- Indices de la tabla `proveedoresreferencias`
--
ALTER TABLE `proveedoresreferencias`
  ADD PRIMARY KEY (`Id_ProveedorContacto`),
  ADD KEY `FK_ProveedoresContactos_Proveedores` (`Id_Proveedor`),
  ADD KEY `FK_ProveedoresContactos_TiposContacto` (`Id_TipoContacto`);

--
-- Indices de la tabla `proveedoresvariables`
--
ALTER TABLE `proveedoresvariables`
  ADD PRIMARY KEY (`Id_VariableIndicador`),
  ADD KEY `FK_ProveedoresVariables_ProveedoresIndicadores` (`Id_Indicador`);

--
-- Indices de la tabla `requisicionesautoriza`
--
ALTER TABLE `requisicionesautoriza`
  ADD PRIMARY KEY (`Id_AutorizacionReq`),
  ADD KEY `FK_RequisicionesAutoriza_DepartamentosEmpresa` (`Id_Departamento`),
  ADD KEY `FK_RequisicionesAutoriza_Usuarios` (`Id_Usuario`);

--
-- Indices de la tabla `requisicionesclasificacion`
--
ALTER TABLE `requisicionesclasificacion`
  ADD PRIMARY KEY (`Id_ClasificacionReq`),
  ADD KEY `FK_RequisicionesClasificacion_Empresas` (`Id_Empresa`);

--
-- Indices de la tabla `requisicionesdetalles`
--
ALTER TABLE `requisicionesdetalles`
  ADD PRIMARY KEY (`Id_RequsicionDet`),
  ADD KEY `FK_RequisicionesDetalles_Productos` (`Id_Producto`),
  ADD KEY `FK_RequisicionesDetalles_Proveedores` (`Id_Proveedor`),
  ADD KEY `FK_RequisicionesDetalles_Requsiciones` (`Id_Requisicion`);

--
-- Indices de la tabla `requsiciones`
--
ALTER TABLE `requsiciones`
  ADD PRIMARY KEY (`Id_Requisicion`),
  ADD KEY `FK_Requsiciones_DepartamentosEmpresa` (`Id_Departamento`),
  ADD KEY `FK_Requsiciones_Empresas` (`Id_EmpresaDestino`),
  ADD KEY `FK_Requsiciones_EstadosRequisicion` (`Id_EstadoActual`),
  ADD KEY `FK_Requsiciones_RequisicionesClasificacion` (`Id_Clasificacion`),
  ADD KEY `FK_Requsiciones_Usuarios` (`Id_UsuarioCrea`),
  ADD KEY `FK_Requsiciones_Usuarios_Req` (`Id_UsuarioRequisicion`);

--
-- Indices de la tabla `solicitudes`
--
ALTER TABLE `solicitudes`
  ADD PRIMARY KEY (`Id_Solicitud`),
  ADD KEY `FK_Solicitudes_Requsiciones` (`Id_Requisicion`),
  ADD KEY `FK_Solicitudes_SolicitudesEstados` (`Id_EstadoActual`),
  ADD KEY `FK_Solicitudes_Usuarios` (`Id_UsuarioCrea`);

--
-- Indices de la tabla `solicitudesdetalles`
--
ALTER TABLE `solicitudesdetalles`
  ADD PRIMARY KEY (`Id_SolicitudDetalle`),
  ADD KEY `FK_SolicitudesDetalles_RequisicionesDetalles` (`Id_RequisicionDetalle`),
  ADD KEY `FK_SolicitudesDetalles_Solicitudes` (`Id_Solicitud`);

--
-- Indices de la tabla `solicitudesdocumentos`
--
ALTER TABLE `solicitudesdocumentos`
  ADD PRIMARY KEY (`Id_SolicitudDoc`),
  ADD KEY `FK_SolicitudesDocumentos_TiposDocumentosSol` (`Id_TipoDocumentoSol`),
  ADD KEY `FK_SolicitudesDocumentos_Usuarios` (`Id_Usuario`);

--
-- Indices de la tabla `solicitudesestados`
--
ALTER TABLE `solicitudesestados`
  ADD PRIMARY KEY (`Id_EstadoSolicitud`);

--
-- Indices de la tabla `solicitudeshistorial`
--
ALTER TABLE `solicitudeshistorial`
  ADD PRIMARY KEY (`Id_HistorialSol`),
  ADD KEY `FK_SolicitudesHistorial_Solicitudes` (`Id_Solicitud`),
  ADD KEY `FK_SolicitudesHistorial_SolicitudesEstados` (`Id_EstadoSolicitud`),
  ADD KEY `FK_SolicitudesHistorial_Usuarios` (`Id_Usuario`);

--
-- Indices de la tabla `sucursales`
--
ALTER TABLE `sucursales`
  ADD PRIMARY KEY (`Id_Sucursal`),
  ADD KEY `FK_Sucursales_GRL_Empresas` (`Id_Empresa`);

--
-- Indices de la tabla `telefonosproveedor`
--
ALTER TABLE `telefonosproveedor`
  ADD PRIMARY KEY (`Id_TelProveedor`),
  ADD KEY `FK_TelefonosProveedor_Proveedores` (`Id_Proveedor`),
  ADD KEY `FK_TelefonosProveedor_TiposLineas` (`Id_TipoLinea`);

--
-- Indices de la tabla `tiposbodega`
--
ALTER TABLE `tiposbodega`
  ADD PRIMARY KEY (`Id_TipoBodega`);

--
-- Indices de la tabla `tiposcontribuyente`
--
ALTER TABLE `tiposcontribuyente`
  ADD PRIMARY KEY (`Id_TipoContribuyente`);

--
-- Indices de la tabla `tiposdocumentos`
--
ALTER TABLE `tiposdocumentos`
  ADD PRIMARY KEY (`Id_TipoDocumento`);

--
-- Indices de la tabla `tiposdocumentosinv`
--
ALTER TABLE `tiposdocumentosinv`
  ADD PRIMARY KEY (`Id_TipoDocInventario`);

--
-- Indices de la tabla `tiposdocumentosiva`
--
ALTER TABLE `tiposdocumentosiva`
  ADD PRIMARY KEY (`Id_TipoDocIVA`);

--
-- Indices de la tabla `tiposdocumentossol`
--
ALTER TABLE `tiposdocumentossol`
  ADD PRIMARY KEY (`Id_TiposDocSol`);

--
-- Indices de la tabla `tiposlineas`
--
ALTER TABLE `tiposlineas`
  ADD PRIMARY KEY (`Id_TipoLinea`);

--
-- Indices de la tabla `tiposmovimientosinv`
--
ALTER TABLE `tiposmovimientosinv`
  ADD PRIMARY KEY (`Id_TipoMovInven`);

--
-- Indices de la tabla `tiposrecaudacion`
--
ALTER TABLE `tiposrecaudacion`
  ADD PRIMARY KEY (`Id_TipoRecaudacion`);

--
-- Indices de la tabla `tiposreferencias`
--
ALTER TABLE `tiposreferencias`
  ADD PRIMARY KEY (`Id_TipoContacto`);

--
-- Indices de la tabla `tiposreqsubcategorias`
--
ALTER TABLE `tiposreqsubcategorias`
  ADD PRIMARY KEY (`Id_SubCatTipoReq`),
  ADD KEY `FK_TiposReqSubCategorias_ProductosSubCategorias` (`Id_ProductoSubCat`),
  ADD KEY `FK_TiposReqSubCategorias_TiposRequisicion` (`Id_TipoRequisicion`);

--
-- Indices de la tabla `tiposrequisicion`
--
ALTER TABLE `tiposrequisicion`
  ADD PRIMARY KEY (`Id_TipoRequisicion`),
  ADD KEY `FK_TiposRequisicion_Empresas` (`Id_Empresa`);

--
-- Indices de la tabla `traslados`
--
ALTER TABLE `traslados`
  ADD PRIMARY KEY (`Id_Traslado`),
  ADD KEY `FK_Traslados_Entregas` (`Id_Entrega`),
  ADD KEY `FK_Traslados_Usuarios` (`Id_UsuarioCrea`);

--
-- Indices de la tabla `trasladosdetalles`
--
ALTER TABLE `trasladosdetalles`
  ADD PRIMARY KEY (`Id_TrasladoDetalle`),
  ADD KEY `FK_TrasladosDetalles_Bodegas_Ingresa` (`Id_BodegaEntra`),
  ADD KEY `FK_TrasladosDetalles_Bodegas_Sale` (`Id_BodegaSale`),
  ADD KEY `FK_TrasladosDetalles_Productos` (`Id_Producto`),
  ADD KEY `FK_TrasladosDetalles_Traslados` (`Id_Traslado`);

--
-- Indices de la tabla `unidadesmedida`
--
ALTER TABLE `unidadesmedida`
  ADD PRIMARY KEY (`Id_UnidadMedida`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`Id_Usuario`),
  ADD UNIQUE KEY `AK_Usuarios` (`Identificador`),
  ADD KEY `FK_Usuarios_Perfiles` (`Id_Perfil`);

--
-- Indices de la tabla `usuariosaccesos`
--
ALTER TABLE `usuariosaccesos`
  ADD PRIMARY KEY (`Id_UsuarioAcceso`),
  ADD KEY `FK_UsuariosAccesos_Departamentos` (`Id_Departamento`),
  ADD KEY `FK_UsuariosAccesos_Empresas` (`Id_Empresa`),
  ADD KEY `FK_UsuariosAccesos_Usuarios` (`Id_Usuario`);

--
-- Indices de la tabla `usuariosaprueban`
--
ALTER TABLE `usuariosaprueban`
  ADD PRIMARY KEY (`Id_UsuarioAprueba`),
  ADD KEY `FK_UsuariosAprueban_Usuarios` (`Id_Usuario`);

--
-- Indices de la tabla `usuariossolicitan`
--
ALTER TABLE `usuariossolicitan`
  ADD PRIMARY KEY (`Id_UsuarioSolicita`),
  ADD KEY `FK_UsuariosSolicitan_Usuarios` (`Id_Usuario`),
  ADD KEY `FK_UsuariosSolicitan_UsuariosAprueban` (`Id_UsuarioAprueba`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `aprobacion`
--
ALTER TABLE `aprobacion`
  MODIFY `Id_Aprobacion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `areas`
--
ALTER TABLE `areas`
  MODIFY `Id_Area` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auditoria`
--
ALTER TABLE `auditoria`
  MODIFY `Id_LogAuditoria` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'Llave primaria para de la tabla';

--
-- AUTO_INCREMENT de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `bodegas`
--
ALTER TABLE `bodegas`
  MODIFY `Id_Bodega` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Llave primaria de la tabla';

--
-- AUTO_INCREMENT de la tabla `condicionespago`
--
ALTER TABLE `condicionespago`
  MODIFY `Id_CondicionPago` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `departamentosempresa`
--
ALTER TABLE `departamentosempresa`
  MODIFY `Id_DptoEmpresa` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `documentosproveedor`
--
ALTER TABLE `documentosproveedor`
  MODIFY `Id_TipoDocProveedor` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Llave primaria de la tabla';

--
-- AUTO_INCREMENT de la tabla `empresas`
--
ALTER TABLE `empresas`
  MODIFY `Id_Empresa` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `entregas`
--
ALTER TABLE `entregas`
  MODIFY `Id_Entrega` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Llave primaria de la tabla';

--
-- AUTO_INCREMENT de la tabla `entregasdetalles`
--
ALTER TABLE `entregasdetalles`
  MODIFY `Id_EntregaDetalle` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `giros`
--
ALTER TABLE `giros`
  MODIFY `Id_Giro` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `girossubcategorias`
--
ALTER TABLE `girossubcategorias`
  MODIFY `Id_GiroSubCat` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Llave primaria de la tabla';

--
-- AUTO_INCREMENT de la tabla `historialrequisiciones`
--
ALTER TABLE `historialrequisiciones`
  MODIFY `Id_HistorialReq` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ingresos`
--
ALTER TABLE `ingresos`
  MODIFY `Id_Ingreso` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Llave primaria de la tabla';

--
-- AUTO_INCREMENT de la tabla `ingresosdetalles`
--
ALTER TABLE `ingresosdetalles`
  MODIFY `Id_IngresoDetalle` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Llave primaria de la tabla';

--
-- AUTO_INCREMENT de la tabla `menus`
--
ALTER TABLE `menus`
  MODIFY `Id_Menu` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Llave primaria para de la tabla';

--
-- AUTO_INCREMENT de la tabla `naturalezajuridica`
--
ALTER TABLE `naturalezajuridica`
  MODIFY `Id_NaturalezaJuridica` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Llave primaria de la tabla';

--
-- AUTO_INCREMENT de la tabla `niveles`
--
ALTER TABLE `niveles`
  MODIFY `Id_Nivel` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `nivelesaprueba`
--
ALTER TABLE `nivelesaprueba`
  MODIFY `Id_NivelAprueba` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ordenescompra`
--
ALTER TABLE `ordenescompra`
  MODIFY `Id_OrdenCompra` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Llave primaria de la tabla';

--
-- AUTO_INCREMENT de la tabla `ordenescompracomplemento`
--
ALTER TABLE `ordenescompracomplemento`
  MODIFY `Id_OrdenComplemento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ordenescompradetalle`
--
ALTER TABLE `ordenescompradetalle`
  MODIFY `Id_OrdenCompraDet` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Llave primaria de la tabla';

--
-- AUTO_INCREMENT de la tabla `paises`
--
ALTER TABLE `paises`
  MODIFY `Id_Pais` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `perfiles`
--
ALTER TABLE `perfiles`
  MODIFY `Id_Perfil` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Llave primaria para de la tabla';

--
-- AUTO_INCREMENT de la tabla `permisosperfil`
--
ALTER TABLE `permisosperfil`
  MODIFY `Id_PerfilPermiso` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Llave primaria para de la tabla';

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `Id_Producto` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Llave primaria para de la tabla';

--
-- AUTO_INCREMENT de la tabla `productoscategorias`
--
ALTER TABLE `productoscategorias`
  MODIFY `Id_CategoriaProd` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Llave primaria para de la tabla', AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `productosexistencia`
--
ALTER TABLE `productosexistencia`
  MODIFY `Id_ProdExistencia` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'Llave primaria para de la tabla';

--
-- AUTO_INCREMENT de la tabla `productossubcategorias`
--
ALTER TABLE `productossubcategorias`
  MODIFY `Id_ProdSubCat` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Llave primaria para de la tabla';

--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `Id_Proveedor` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Llave primaria de la tabla';

--
-- AUTO_INCREMENT de la tabla `proveedoresevaluaciones`
--
ALTER TABLE `proveedoresevaluaciones`
  MODIFY `Id_ProvEvaluacion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `proveedoresevaluacionesdetalles`
--
ALTER TABLE `proveedoresevaluacionesdetalles`
  MODIFY `Id_ProvEvaluacionDetalle` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `proveedoresindicadores`
--
ALTER TABLE `proveedoresindicadores`
  MODIFY `Id_Indicador` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `proveedoresreferencias`
--
ALTER TABLE `proveedoresreferencias`
  MODIFY `Id_ProveedorContacto` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Llave primaria con el';

--
-- AUTO_INCREMENT de la tabla `proveedoresvariables`
--
ALTER TABLE `proveedoresvariables`
  MODIFY `Id_VariableIndicador` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `requisicionesautoriza`
--
ALTER TABLE `requisicionesautoriza`
  MODIFY `Id_AutorizacionReq` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `requisicionesdetalles`
--
ALTER TABLE `requisicionesdetalles`
  MODIFY `Id_RequsicionDet` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Llave primara de la tabla';

--
-- AUTO_INCREMENT de la tabla `requsiciones`
--
ALTER TABLE `requsiciones`
  MODIFY `Id_Requisicion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `solicitudes`
--
ALTER TABLE `solicitudes`
  MODIFY `Id_Solicitud` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Llave primaria de la tabla';

--
-- AUTO_INCREMENT de la tabla `solicitudesdetalles`
--
ALTER TABLE `solicitudesdetalles`
  MODIFY `Id_SolicitudDetalle` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Llave primaria de la tabla';

--
-- AUTO_INCREMENT de la tabla `solicitudesdocumentos`
--
ALTER TABLE `solicitudesdocumentos`
  MODIFY `Id_SolicitudDoc` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Llave primaria de la tabla';

--
-- AUTO_INCREMENT de la tabla `solicitudesestados`
--
ALTER TABLE `solicitudesestados`
  MODIFY `Id_EstadoSolicitud` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Llave primaria de la tabla';

--
-- AUTO_INCREMENT de la tabla `solicitudeshistorial`
--
ALTER TABLE `solicitudeshistorial`
  MODIFY `Id_HistorialSol` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'Llave primaria de la tabla';

--
-- AUTO_INCREMENT de la tabla `sucursales`
--
ALTER TABLE `sucursales`
  MODIFY `Id_Sucursal` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tiposdocumentos`
--
ALTER TABLE `tiposdocumentos`
  MODIFY `Id_TipoDocumento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tiposdocumentosinv`
--
ALTER TABLE `tiposdocumentosinv`
  MODIFY `Id_TipoDocInventario` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Llave primaria de la tabla';

--
-- AUTO_INCREMENT de la tabla `tiposdocumentosiva`
--
ALTER TABLE `tiposdocumentosiva`
  MODIFY `Id_TipoDocIVA` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tiposdocumentossol`
--
ALTER TABLE `tiposdocumentossol`
  MODIFY `Id_TiposDocSol` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Llave primaria de la tabla';

--
-- AUTO_INCREMENT de la tabla `tiposlineas`
--
ALTER TABLE `tiposlineas`
  MODIFY `Id_TipoLinea` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Llave primaria de la tabla';

--
-- AUTO_INCREMENT de la tabla `tiposrecaudacion`
--
ALTER TABLE `tiposrecaudacion`
  MODIFY `Id_TipoRecaudacion` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Llave primaria de la tabla';

--
-- AUTO_INCREMENT de la tabla `tiposreferencias`
--
ALTER TABLE `tiposreferencias`
  MODIFY `Id_TipoContacto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tiposreqsubcategorias`
--
ALTER TABLE `tiposreqsubcategorias`
  MODIFY `Id_SubCatTipoReq` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tiposrequisicion`
--
ALTER TABLE `tiposrequisicion`
  MODIFY `Id_TipoRequisicion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `traslados`
--
ALTER TABLE `traslados`
  MODIFY `Id_Traslado` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'Llave primaria de la tabla';

--
-- AUTO_INCREMENT de la tabla `trasladosdetalles`
--
ALTER TABLE `trasladosdetalles`
  MODIFY `Id_TrasladoDetalle` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'Llave prmaria de la tabla';

--
-- AUTO_INCREMENT de la tabla `unidadesmedida`
--
ALTER TABLE `unidadesmedida`
  MODIFY `Id_UnidadMedida` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Llave primaria para de la tabla';

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `Id_Usuario` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Llave primaria para de la tabla';

--
-- AUTO_INCREMENT de la tabla `usuariosaccesos`
--
ALTER TABLE `usuariosaccesos`
  MODIFY `Id_UsuarioAcceso` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuariosaprueban`
--
ALTER TABLE `usuariosaprueban`
  MODIFY `Id_UsuarioAprueba` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuariossolicitan`
--
ALTER TABLE `usuariossolicitan`
  MODIFY `Id_UsuarioSolicita` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `aprobacion`
--
ALTER TABLE `aprobacion`
  ADD CONSTRAINT `FK_Aprobacion_Usuarios` FOREIGN KEY (`Id_Usuario`) REFERENCES `usuarios` (`Id_Usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_Aprobacion_Usuarios_Aprueba` FOREIGN KEY (`Id_Usuario`) REFERENCES `usuarios` (`Id_Usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Filtros para la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Filtros para la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `bodegas`
--
ALTER TABLE `bodegas`
  ADD CONSTRAINT `FK_Bodegas_Municipios` FOREIGN KEY (`Id_Municipio`) REFERENCES `municipios` (`Id_Municipio`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_Bodegas_Paises` FOREIGN KEY (`Id_Pais`) REFERENCES `paises` (`Id_Pais`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_Bodegas_Sucursales` FOREIGN KEY (`Id_Sucursal`) REFERENCES `sucursales` (`Id_Sucursal`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_Bodegas_TiposBodega` FOREIGN KEY (`Id_TipoBodega`) REFERENCES `tiposbodega` (`Id_TipoBodega`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `departamentosempresa`
--
ALTER TABLE `departamentosempresa`
  ADD CONSTRAINT `FK_DepartamentosEmpresa_Areas` FOREIGN KEY (`Id_Area`) REFERENCES `areas` (`Id_Area`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_DepartamentosEmpresa_Empresas` FOREIGN KEY (`Id_Empresa`) REFERENCES `empresas` (`Id_Empresa`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `documentosproveedor`
--
ALTER TABLE `documentosproveedor`
  ADD CONSTRAINT `FK_DocumentosProveedor_Proveedores` FOREIGN KEY (`Id_Proveedor`) REFERENCES `proveedores` (`Id_Proveedor`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_DocumentosProveedor_TiposDocumentos` FOREIGN KEY (`Id_TipoDocumento`) REFERENCES `tiposdocumentos` (`Id_TipoDocumento`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `empresas`
--
ALTER TABLE `empresas`
  ADD CONSTRAINT `FK_GRL_Empresas_Giros` FOREIGN KEY (`Id_Giro`) REFERENCES `giros` (`Id_Giro`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `entregas`
--
ALTER TABLE `entregas`
  ADD CONSTRAINT `FK_Entregas_Bodegas` FOREIGN KEY (`Id_Bodega`) REFERENCES `bodegas` (`Id_Bodega`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_Entregas_DepartamentosEmpresa` FOREIGN KEY (`Id_Departamento`) REFERENCES `departamentosempresa` (`Id_DptoEmpresa`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_Entregas_Requsiciones` FOREIGN KEY (`Id_Requision`) REFERENCES `requsiciones` (`Id_Requisicion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_Entregas_Usuarios` FOREIGN KEY (`Id_UsuarioCrea`) REFERENCES `usuarios` (`Id_Usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `entregasdetalles`
--
ALTER TABLE `entregasdetalles`
  ADD CONSTRAINT `FK_EntregasDetalles_Bodegas` FOREIGN KEY (`Id_BodegaSale`) REFERENCES `bodegas` (`Id_Bodega`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_EntregasDetalles_Entregas` FOREIGN KEY (`Id_Entrega`) REFERENCES `entregas` (`Id_Entrega`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_EntregasDetalles_RequisicionesDetalles` FOREIGN KEY (`Id_RequsicionDet`) REFERENCES `requisicionesdetalles` (`Id_RequsicionDet`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `giros`
--
ALTER TABLE `giros`
  ADD CONSTRAINT `FK_Giros_GirosSubCategorias` FOREIGN KEY (`Id_GiroSubCategoria`) REFERENCES `girossubcategorias` (`Id_GiroSubCat`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `girossubcategorias`
--
ALTER TABLE `girossubcategorias`
  ADD CONSTRAINT `FK_GirosSubCategorias_GirosCategorias` FOREIGN KEY (`Id_Categoria`) REFERENCES `giroscategorias` (`Id_GiroCategoria`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `historialrequisiciones`
--
ALTER TABLE `historialrequisiciones`
  ADD CONSTRAINT `FK_HistorialRequisiciones_EstadosRequisicion` FOREIGN KEY (`Id_EstadoRequisicion`) REFERENCES `estadosrequisicion` (`Id_EstadoRequisicion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_HistorialRequisiciones_Requsiciones` FOREIGN KEY (`Id_Requisicion`) REFERENCES `requsiciones` (`Id_Requisicion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_HistorialRequisiciones_Usuarios` FOREIGN KEY (`Id_Usuario`) REFERENCES `usuarios` (`Id_Usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `ingresos`
--
ALTER TABLE `ingresos`
  ADD CONSTRAINT `FK_Ingresos_Bodegas` FOREIGN KEY (`Id_BodegaIngresa`) REFERENCES `bodegas` (`Id_Bodega`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_Ingresos_OrdenesCompra` FOREIGN KEY (`Id_OrdenCompra`) REFERENCES `ordenescompra` (`Id_OrdenCompra`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_Ingresos_TiposDocumentosInv` FOREIGN KEY (`Id_TipoDocumento`) REFERENCES `tiposdocumentosinv` (`Id_TipoDocInventario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_Ingresos_TiposMovimientosInv` FOREIGN KEY (`Id_TipoMovimiento`) REFERENCES `tiposmovimientosinv` (`Id_TipoMovInven`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_Ingresos_Usuarios_Crea` FOREIGN KEY (`Id_UsuarioCrea`) REFERENCES `usuarios` (`Id_Usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_Ingresos_Usuarios_Genera` FOREIGN KEY (`Id_UsuarioGenera`) REFERENCES `usuarios` (`Id_Usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `ingresosdetalles`
--
ALTER TABLE `ingresosdetalles`
  ADD CONSTRAINT `FK_IngresosDetalles_Ingresos` FOREIGN KEY (`Id_Ingreso`) REFERENCES `ingresos` (`Id_Ingreso`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_IngresosDetalles_OrdenesCompraDetalle` FOREIGN KEY (`Id_OrdenCompraDet`) REFERENCES `ordenescompradetalle` (`Id_OrdenCompraDet`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_IngresosDetalles_Productos` FOREIGN KEY (`Id_Producto`) REFERENCES `productos` (`Id_Producto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_IngresosDetalles_Proveedores` FOREIGN KEY (`Id_Proveedor`) REFERENCES `proveedores` (`Id_Proveedor`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `municipios`
--
ALTER TABLE `municipios`
  ADD CONSTRAINT `FK_Municipios_Departamentos` FOREIGN KEY (`Id_Departamento`) REFERENCES `departamentos` (`Id_Departamento`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `nivelesaprueba`
--
ALTER TABLE `nivelesaprueba`
  ADD CONSTRAINT `FK_NivelesAprueba_Niveles` FOREIGN KEY (`Id_Nivel`) REFERENCES `niveles` (`Id_Nivel`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_NivelesAprueba_Usuarios` FOREIGN KEY (`Id_Usuario`) REFERENCES `usuarios` (`Id_Usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_NivelesAprueba_UsuariosAprueba` FOREIGN KEY (`Id_UsuarioAprueba`) REFERENCES `usuarios` (`Id_Usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `ordenescompra`
--
ALTER TABLE `ordenescompra`
  ADD CONSTRAINT `FK_OrdenesCompra_DepartamentosEmpresa` FOREIGN KEY (`Id_DptoEmpresa`) REFERENCES `departamentosempresa` (`Id_DptoEmpresa`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_OrdenesCompra_OrdenesCompraEstados` FOREIGN KEY (`Id_EstadoActual`) REFERENCES `ordenescompraestados` (`Id_OrdenCompraEstado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_OrdenesCompra_Requsiciones` FOREIGN KEY (`Id_Requisicion`) REFERENCES `requsiciones` (`Id_Requisicion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_OrdenesCompra_Solicitudes` FOREIGN KEY (`Id_Solicitud`) REFERENCES `solicitudes` (`Id_Solicitud`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_OrdenesCompra_Usuarios` FOREIGN KEY (`Id_UsuarioCrea`) REFERENCES `usuarios` (`Id_Usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_OrdenesCompra_Usuarios1` FOREIGN KEY (`Id_UsuarioAprueba`) REFERENCES `usuarios` (`Id_Usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `ordenescompracomplemento`
--
ALTER TABLE `ordenescompracomplemento`
  ADD CONSTRAINT `FK_OrdenesCompraComplemento_CondicionesPago` FOREIGN KEY (`Id_CondicionPago`) REFERENCES `condicionespago` (`Id_CondicionPago`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_OrdenesCompraComplemento_OrdenesCompra` FOREIGN KEY (`Id_OrdenCompra`) REFERENCES `ordenescompra` (`Id_OrdenCompra`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_OrdenesCompraComplemento_Proveedores` FOREIGN KEY (`Id_Proveedor`) REFERENCES `proveedores` (`Id_Proveedor`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_OrdenesCompraComplemento_TiposDocumentosIVA` FOREIGN KEY (`Id_TipoDocIVA`) REFERENCES `tiposdocumentosiva` (`Id_TipoDocIVA`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `ordenescompradetalle`
--
ALTER TABLE `ordenescompradetalle`
  ADD CONSTRAINT `FK_OrdenesCompraDetalle_CondicionesPago` FOREIGN KEY (`Id_CondicionPago`) REFERENCES `condicionespago` (`Id_CondicionPago`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_OrdenesCompraDetalle_OrdenesCompra` FOREIGN KEY (`Id_OrdenCompra`) REFERENCES `ordenescompra` (`Id_OrdenCompra`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_OrdenesCompraDetalle_Productos` FOREIGN KEY (`Id_Producto`) REFERENCES `productos` (`Id_Producto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_OrdenesCompraDetalle_Proveedores` FOREIGN KEY (`Id_Proveedor`) REFERENCES `proveedores` (`Id_Proveedor`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_OrdenesCompraDetalle_RequisicionesDetalles` FOREIGN KEY (`Id_RequisicionDet`) REFERENCES `requisicionesdetalles` (`Id_RequsicionDet`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_OrdenesCompraDetalle_SolicitudesDetalles` FOREIGN KEY (`Id_SolicitudDetalle`) REFERENCES `solicitudesdetalles` (`Id_SolicitudDetalle`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `perfiles`
--
ALTER TABLE `perfiles`
  ADD CONSTRAINT `FK_Perfiles_Menus` FOREIGN KEY (`Id_MenuPorDefecto`) REFERENCES `menus` (`Id_Menu`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `permisosperfil`
--
ALTER TABLE `permisosperfil`
  ADD CONSTRAINT `FK_PermisosPerfil_Menus` FOREIGN KEY (`Id_Menu`) REFERENCES `menus` (`Id_Menu`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_PermisosPerfil_Perfiles` FOREIGN KEY (`Id_Perfil`) REFERENCES `perfiles` (`Id_Perfil`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `FK_Productos_Empresas` FOREIGN KEY (`Id_Empresa`) REFERENCES `empresas` (`Id_Empresa`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_Productos_ProductosSubCategorias` FOREIGN KEY (`Id_SubCategoria`) REFERENCES `productossubcategorias` (`Id_ProdSubCat`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_Productos_UnidadesMedida_Ingreso` FOREIGN KEY (`Id_UnidadMedIngreso`) REFERENCES `unidadesmedida` (`Id_UnidadMedida`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_Productos_UnidadesMedida_Salida` FOREIGN KEY (`Id_UnidadMedSalida`) REFERENCES `unidadesmedida` (`Id_UnidadMedida`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `productosexistencia`
--
ALTER TABLE `productosexistencia`
  ADD CONSTRAINT `FK_ProductosExistencia_Bodegas` FOREIGN KEY (`Id_Bodega`) REFERENCES `bodegas` (`Id_Bodega`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_ProductosExistencia_Productos` FOREIGN KEY (`Id_Producto`) REFERENCES `productos` (`Id_Producto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `productossubcategorias`
--
ALTER TABLE `productossubcategorias`
  ADD CONSTRAINT `FK_ProductosSubCategorias_ProductosCategorias` FOREIGN KEY (`Id_CategoriaProd`) REFERENCES `productoscategorias` (`Id_CategoriaProd`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD CONSTRAINT `FK_Proveedores_Empresas` FOREIGN KEY (`Id_Empresa`) REFERENCES `empresas` (`Id_Empresa`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_Proveedores_Giros` FOREIGN KEY (`Id_Giro`) REFERENCES `giros` (`Id_Giro`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_Proveedores_Municipios` FOREIGN KEY (`Id_Municipio`) REFERENCES `municipios` (`Id_Municipio`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_Proveedores_NaturalezaJuridica` FOREIGN KEY (`Id_Naturaleza`) REFERENCES `naturalezajuridica` (`Id_NaturalezaJuridica`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_Proveedores_Paises` FOREIGN KEY (`Id_Pais`) REFERENCES `paises` (`Id_Pais`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_Proveedores_TiposContacto` FOREIGN KEY (`Id_TipoContacto`) REFERENCES `tiposreferencias` (`Id_TipoContacto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_Proveedores_TiposContribuyente` FOREIGN KEY (`Id_TipoContribuyente`) REFERENCES `tiposcontribuyente` (`Id_TipoContribuyente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_Proveedores_TiposRecaudacion` FOREIGN KEY (`Id_TipoRecaudacion`) REFERENCES `tiposrecaudacion` (`Id_TipoRecaudacion`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `proveedoresevaluaciones`
--
ALTER TABLE `proveedoresevaluaciones`
  ADD CONSTRAINT `FK_ProveedoresEvaluaciones_Ingresos` FOREIGN KEY (`Id_Ingreso`) REFERENCES `ingresos` (`Id_Ingreso`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_ProveedoresEvaluaciones_Proveedores` FOREIGN KEY (`Id_Proveedor`) REFERENCES `proveedores` (`Id_Proveedor`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `proveedoresevaluacionesdetalles`
--
ALTER TABLE `proveedoresevaluacionesdetalles`
  ADD CONSTRAINT `FK_ProveedoresEvaluacionesDetalles_ProveedoresEvaluaciones` FOREIGN KEY (`Id_ProvEvaluacion`) REFERENCES `proveedoresevaluaciones` (`Id_ProvEvaluacion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_ProveedoresEvaluacionesDetalles_ProveedoresVariables` FOREIGN KEY (`Id_Variable`) REFERENCES `proveedoresvariables` (`Id_VariableIndicador`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `proveedoresreferencias`
--
ALTER TABLE `proveedoresreferencias`
  ADD CONSTRAINT `FK_ProveedoresContactos_Proveedores` FOREIGN KEY (`Id_Proveedor`) REFERENCES `proveedores` (`Id_Proveedor`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_ProveedoresContactos_TiposContacto` FOREIGN KEY (`Id_TipoContacto`) REFERENCES `tiposreferencias` (`Id_TipoContacto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `proveedoresvariables`
--
ALTER TABLE `proveedoresvariables`
  ADD CONSTRAINT `FK_ProveedoresVariables_ProveedoresIndicadores` FOREIGN KEY (`Id_Indicador`) REFERENCES `proveedoresindicadores` (`Id_Indicador`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `requisicionesautoriza`
--
ALTER TABLE `requisicionesautoriza`
  ADD CONSTRAINT `FK_RequisicionesAutoriza_DepartamentosEmpresa` FOREIGN KEY (`Id_Departamento`) REFERENCES `departamentosempresa` (`Id_DptoEmpresa`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_RequisicionesAutoriza_Usuarios` FOREIGN KEY (`Id_Usuario`) REFERENCES `usuarios` (`Id_Usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `requisicionesclasificacion`
--
ALTER TABLE `requisicionesclasificacion`
  ADD CONSTRAINT `FK_RequisicionesClasificacion_Empresas` FOREIGN KEY (`Id_Empresa`) REFERENCES `empresas` (`Id_Empresa`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `requisicionesdetalles`
--
ALTER TABLE `requisicionesdetalles`
  ADD CONSTRAINT `FK_RequisicionesDetalles_Productos` FOREIGN KEY (`Id_Producto`) REFERENCES `productos` (`Id_Producto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_RequisicionesDetalles_Proveedores` FOREIGN KEY (`Id_Proveedor`) REFERENCES `proveedores` (`Id_Proveedor`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_RequisicionesDetalles_Requsiciones` FOREIGN KEY (`Id_Requisicion`) REFERENCES `requsiciones` (`Id_Requisicion`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `requsiciones`
--
ALTER TABLE `requsiciones`
  ADD CONSTRAINT `FK_Requsiciones_DepartamentosEmpresa` FOREIGN KEY (`Id_Departamento`) REFERENCES `departamentosempresa` (`Id_DptoEmpresa`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_Requsiciones_Empresas` FOREIGN KEY (`Id_EmpresaDestino`) REFERENCES `empresas` (`Id_Empresa`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_Requsiciones_EstadosRequisicion` FOREIGN KEY (`Id_EstadoActual`) REFERENCES `estadosrequisicion` (`Id_EstadoRequisicion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_Requsiciones_RequisicionesClasificacion` FOREIGN KEY (`Id_Clasificacion`) REFERENCES `requisicionesclasificacion` (`Id_ClasificacionReq`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_Requsiciones_Usuarios` FOREIGN KEY (`Id_UsuarioCrea`) REFERENCES `usuarios` (`Id_Usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_Requsiciones_Usuarios_Req` FOREIGN KEY (`Id_UsuarioRequisicion`) REFERENCES `usuarios` (`Id_Usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `solicitudes`
--
ALTER TABLE `solicitudes`
  ADD CONSTRAINT `FK_Solicitudes_Requsiciones` FOREIGN KEY (`Id_Requisicion`) REFERENCES `requsiciones` (`Id_Requisicion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_Solicitudes_SolicitudesEstados` FOREIGN KEY (`Id_EstadoActual`) REFERENCES `solicitudesestados` (`Id_EstadoSolicitud`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_Solicitudes_Usuarios` FOREIGN KEY (`Id_UsuarioCrea`) REFERENCES `usuarios` (`Id_Usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `solicitudesdetalles`
--
ALTER TABLE `solicitudesdetalles`
  ADD CONSTRAINT `FK_SolicitudesDetalles_RequisicionesDetalles` FOREIGN KEY (`Id_RequisicionDetalle`) REFERENCES `requisicionesdetalles` (`Id_RequsicionDet`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_SolicitudesDetalles_Solicitudes` FOREIGN KEY (`Id_Solicitud`) REFERENCES `solicitudes` (`Id_Solicitud`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `solicitudesdocumentos`
--
ALTER TABLE `solicitudesdocumentos`
  ADD CONSTRAINT `FK_SolicitudesDocumentos_TiposDocumentosSol` FOREIGN KEY (`Id_TipoDocumentoSol`) REFERENCES `tiposdocumentossol` (`Id_TiposDocSol`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_SolicitudesDocumentos_Usuarios` FOREIGN KEY (`Id_Usuario`) REFERENCES `usuarios` (`Id_Usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `solicitudeshistorial`
--
ALTER TABLE `solicitudeshistorial`
  ADD CONSTRAINT `FK_SolicitudesHistorial_Solicitudes` FOREIGN KEY (`Id_Solicitud`) REFERENCES `solicitudes` (`Id_Solicitud`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_SolicitudesHistorial_SolicitudesEstados` FOREIGN KEY (`Id_EstadoSolicitud`) REFERENCES `solicitudesestados` (`Id_EstadoSolicitud`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_SolicitudesHistorial_Usuarios` FOREIGN KEY (`Id_Usuario`) REFERENCES `usuarios` (`Id_Usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `sucursales`
--
ALTER TABLE `sucursales`
  ADD CONSTRAINT `FK_Sucursales_GRL_Empresas` FOREIGN KEY (`Id_Empresa`) REFERENCES `empresas` (`Id_Empresa`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `telefonosproveedor`
--
ALTER TABLE `telefonosproveedor`
  ADD CONSTRAINT `FK_TelefonosProveedor_Proveedores` FOREIGN KEY (`Id_Proveedor`) REFERENCES `proveedores` (`Id_Proveedor`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_TelefonosProveedor_TiposLineas` FOREIGN KEY (`Id_TipoLinea`) REFERENCES `tiposlineas` (`Id_TipoLinea`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tiposreqsubcategorias`
--
ALTER TABLE `tiposreqsubcategorias`
  ADD CONSTRAINT `FK_TiposReqSubCategorias_ProductosSubCategorias` FOREIGN KEY (`Id_ProductoSubCat`) REFERENCES `productossubcategorias` (`Id_ProdSubCat`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_TiposReqSubCategorias_TiposRequisicion` FOREIGN KEY (`Id_TipoRequisicion`) REFERENCES `tiposrequisicion` (`Id_TipoRequisicion`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tiposrequisicion`
--
ALTER TABLE `tiposrequisicion`
  ADD CONSTRAINT `FK_TiposRequisicion_Empresas` FOREIGN KEY (`Id_Empresa`) REFERENCES `empresas` (`Id_Empresa`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `traslados`
--
ALTER TABLE `traslados`
  ADD CONSTRAINT `FK_Traslados_Entregas` FOREIGN KEY (`Id_Entrega`) REFERENCES `entregas` (`Id_Entrega`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_Traslados_Usuarios` FOREIGN KEY (`Id_UsuarioCrea`) REFERENCES `usuarios` (`Id_Usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `trasladosdetalles`
--
ALTER TABLE `trasladosdetalles`
  ADD CONSTRAINT `FK_TrasladosDetalles_Bodegas_Ingresa` FOREIGN KEY (`Id_BodegaEntra`) REFERENCES `bodegas` (`Id_Bodega`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_TrasladosDetalles_Bodegas_Sale` FOREIGN KEY (`Id_BodegaSale`) REFERENCES `bodegas` (`Id_Bodega`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_TrasladosDetalles_Productos` FOREIGN KEY (`Id_Producto`) REFERENCES `productos` (`Id_Producto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_TrasladosDetalles_Traslados` FOREIGN KEY (`Id_Traslado`) REFERENCES `traslados` (`Id_Traslado`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `FK_Usuarios_Perfiles` FOREIGN KEY (`Id_Perfil`) REFERENCES `perfiles` (`Id_Perfil`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuariosaccesos`
--
ALTER TABLE `usuariosaccesos`
  ADD CONSTRAINT `FK_UsuariosAccesos_Departamentos` FOREIGN KEY (`Id_Departamento`) REFERENCES `departamentosempresa` (`Id_DptoEmpresa`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_UsuariosAccesos_Empresas` FOREIGN KEY (`Id_Empresa`) REFERENCES `empresas` (`Id_Empresa`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_UsuariosAccesos_Usuarios` FOREIGN KEY (`Id_Usuario`) REFERENCES `usuarios` (`Id_Usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuariosaprueban`
--
ALTER TABLE `usuariosaprueban`
  ADD CONSTRAINT `FK_UsuariosAprueban_Usuarios` FOREIGN KEY (`Id_Usuario`) REFERENCES `usuarios` (`Id_Usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuariossolicitan`
--
ALTER TABLE `usuariossolicitan`
  ADD CONSTRAINT `FK_UsuariosSolicitan_Usuarios` FOREIGN KEY (`Id_Usuario`) REFERENCES `usuarios` (`Id_Usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_UsuariosSolicitan_UsuariosAprueban` FOREIGN KEY (`Id_UsuarioAprueba`) REFERENCES `usuariosaprueban` (`Id_UsuarioAprueba`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
