-- phpMyAdmin SQL Dump
-- version 3.4.5
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 14-05-2012 a las 14:56:47
-- Versión del servidor: 5.0.92
-- Versión de PHP: 5.2.17

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `tuercoco_ptext`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acos`
--

DROP TABLE `acos`;

CREATE TABLE IF NOT EXISTS `acos` (
  `id` int(10) NOT NULL auto_increment,
  `parent_id` int(10) default NULL,
  `model` varchar(255) default NULL,
  `foreign_key` int(10) default NULL,
  `alias` varchar(255) default NULL,
  `lft` int(10) default NULL,
  `rght` int(10) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=42 ;

--
-- Volcado de datos para la tabla `acos`
--

INSERT INTO `acos` (`id`, `parent_id`, `model`, `foreign_key`, `alias`, `lft`, `rght`) VALUES
(1, NULL, NULL, NULL, 'controllers', 1, 82),
(2, 1, NULL, NULL, 'Pages', 2, 15),
(3, 2, NULL, NULL, 'display', 3, 4),
(4, 2, NULL, NULL, 'add', 5, 6),
(5, 2, NULL, NULL, 'edit', 7, 8),
(6, 2, NULL, NULL, 'index', 9, 10),
(7, 2, NULL, NULL, 'view', 11, 12),
(8, 2, NULL, NULL, 'delete', 13, 14),
(9, 1, NULL, NULL, 'Comments', 16, 27),
(10, 9, NULL, NULL, 'index', 17, 18),
(11, 9, NULL, NULL, 'view', 19, 20),
(12, 9, NULL, NULL, 'add', 21, 22),
(13, 9, NULL, NULL, 'edit', 23, 24),
(14, 9, NULL, NULL, 'delete', 25, 26),
(15, 1, NULL, NULL, 'Groups', 28, 39),
(16, 15, NULL, NULL, 'index', 29, 30),
(17, 15, NULL, NULL, 'view', 31, 32),
(18, 15, NULL, NULL, 'add', 33, 34),
(19, 15, NULL, NULL, 'edit', 35, 36),
(20, 15, NULL, NULL, 'delete', 37, 38),
(21, 1, NULL, NULL, 'Multimedias', 40, 51),
(22, 21, NULL, NULL, 'index', 41, 42),
(23, 21, NULL, NULL, 'view', 43, 44),
(24, 21, NULL, NULL, 'add', 45, 46),
(25, 21, NULL, NULL, 'edit', 47, 48),
(26, 21, NULL, NULL, 'delete', 49, 50),
(27, 1, NULL, NULL, 'Pretexts', 52, 63),
(28, 27, NULL, NULL, 'index', 53, 54),
(29, 27, NULL, NULL, 'view', 55, 56),
(30, 27, NULL, NULL, 'add', 57, 58),
(31, 27, NULL, NULL, 'edit', 59, 60),
(32, 27, NULL, NULL, 'delete', 61, 62),
(33, 1, NULL, NULL, 'Users', 64, 81),
(34, 33, NULL, NULL, 'login', 65, 66),
(35, 33, NULL, NULL, 'logout', 67, 68),
(36, 33, NULL, NULL, 'index', 69, 70),
(37, 33, NULL, NULL, 'view', 71, 72),
(38, 33, NULL, NULL, 'add', 73, 74),
(39, 33, NULL, NULL, 'edit', 75, 76),
(40, 33, NULL, NULL, 'delete', 77, 78),
(41, 33, NULL, NULL, 'initDB', 79, 80);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aros`
--

DROP TABLE `aros`;

CREATE TABLE IF NOT EXISTS `aros` (
  `id` int(10) NOT NULL auto_increment,
  `parent_id` int(10) default NULL,
  `model` varchar(255) default NULL,
  `foreign_key` int(10) default NULL,
  `alias` varchar(255) default NULL,
  `lft` int(10) default NULL,
  `rght` int(10) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `aros`
--

INSERT INTO `aros` (`id`, `parent_id`, `model`, `foreign_key`, `alias`, `lft`, `rght`) VALUES
(1, NULL, 'Group', 1, NULL, 1, 4),
(2, 1, 'User', 1, NULL, 2, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aros_acos`
--

DROP TABLE `aros_acos`;

CREATE TABLE IF NOT EXISTS `aros_acos` (
  `id` int(10) NOT NULL auto_increment,
  `aro_id` int(10) NOT NULL,
  `aco_id` int(10) NOT NULL,
  `_create` varchar(2) NOT NULL default '0',
  `_read` varchar(2) NOT NULL default '0',
  `_update` varchar(2) NOT NULL default '0',
  `_delete` varchar(2) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `ARO_ACO_KEY` (`aro_id`,`aco_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `aros_acos`
--

INSERT INTO `aros_acos` (`id`, `aro_id`, `aco_id`, `_create`, `_read`, `_update`, `_delete`) VALUES
(1, 1, 1, '1', '1', '1', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comments`
--

DROP TABLE `comments`;

CREATE TABLE IF NOT EXISTS `comments` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `text` text NOT NULL,
  `created` varchar(45) NOT NULL,
  `lat` float NOT NULL,
  `lng` float NOT NULL,
  `ordinal` int(10) unsigned NOT NULL,
  `pretext_id` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=28 ;

--
-- Volcado de datos para la tabla `comments`
--

INSERT INTO `comments` (`id`, `text`, `created`, `lat`, `lng`, `ordinal`, `pretext_id`) VALUES
(1, 'Un cerebro que va pudriendo el contenedor de la basura orgÃ¡nica...', '1309167874', 41.38747, 2.16285, 1, 21),
(2, '- pero eran tantas voces que no pude escuchar tu silencio...', '1309189218', 41.4036, 2.1853, 1, 2),
(3, '- de este lado no puedo ver todo eso. Apenas veo tu belleza.', '1309189377', 41.4002, 2.1277, 1, 16),
(4, 'sÃ­, pero no. Bueno, no sÃ©.', '1309189521', 41.4179, 2.1727, 1, 6),
(5, 'pero lloro por dentro.', '1309194070', 55.7505, 37.635, 1, 22),
(6, 'desaparezco...', '1309194225', 55.7837, 37.578, 1, 7),
(7, '- Â¿QuÃ© dices? ...\n\n- No es mi voz... es la tuya.', '1309194398', 19.437, -99.188, 2, 2),
(8, 'incesante ante la bÃºsqueda del esplendor de las cosas...que no pueden ser solo cosas y ya?', '1309195453', 19.417, -99.173, 1, 10),
(9, 'La belleza es tu cabeza', '1309196769', 25.64995, -100.29028, 2, 16),
(10, 'Y son tus labios redondos y salado de mar, y tu pelo revolcado y apelmazado por la sal. Esta rebeldÃ­a tuya se siente sÃ³lo como un pez revolcÃ¡ndose, intentando llegar a la orilla pero sabiendo que sÃ³lo puede vivir en el agua.', '1309208776', 25.65226, -100.28644, 3, 16),
(11, 'EL principio de la frust...', '1309209151', 25.72261, -100.31193, 1, 26),
(12, 'Pero nunca lleguÃ© al 1, apenas siquiera al 3 en 8 pasos y medio. FÃ³rmula exacta para alejarme de tu recuerdo.', '1309209894', 18.0077, -92.9315, 1, 12),
(13, '...traiciÃ³n?', '1309217700', 20.70490, -103.3281, 2, 26),
(14, 'La ironÃ­a de la vida convertida en drama, coprotagonizado por damas transvestidas por amor.', '1309253572', 26.92193, -101.40628, 1, 5),
(15, 'QuizÃ¡s es que no quiero avanzar, sino acampar en tu recuerdo. Caminar hacia atrÃ¡s sin ver si voy hacia un precipicio o hacia el cruce donde se separaron nuestros caminos. Repensar el trayecto ...', '1309254306', 0, 0, 2, 12),
(16, 'Esa fealdad pegajosa, maloliente...Â¿quÃ© hacer para vaciarla?Â¿cuÃ¡l es su lugar?. Todo lo orgÃ¡nico se pudre, tarde o temprano...', '1309803574', 43.4797, -79.7041, 2, 21),
(17, '- Aunque no es exactamente miedo, sino la necesidad de la luz del sol. La sombra es la interrupciÃ³n de la luz.', '1310211208', 25.61390, -100.27877, 1, 3),
(18, 'yo cito: e comeÃ§o aqui e meÃ§o aqui este comeÃ§o e recomeÃ§o e remeÃ§o e\narremesso e aqui me meÃ§o quando se vive sob a espÃ©cie da\nviagem o que importa nÃ£o Ã© a viagem mas o comeÃ§o da por isso\nmeÃ§o por isso comeÃ§o escrever mil pÃ¡ginas escrever\nmilumapÃ¡ginas para acabar com a escritura para comeÃ§ar com a\nescritura para acabarcomeÃ§ar com a escritura por isso recomeÃ§o\npor isso arremeÃ§o por isso teÃ§o escrever sobre escrever Ã© o futuro\ndo escrever sobrescrevo sobrescravo em miluminoites\nmilumapÃ¡ginas ou uma pÃ¡gina em uma noite que Ã© o mesmo\nnoites e pÃ¡ginas mesmam ensimesmam onde o fim Ã© o comÃªÃ§o\net ici je commence et ici je me lance et ici javance ce commencement\net je relance et jy pense quand on vit sous lespÃ¨ce du voyage ce nest\npas le voyage qui compte mais le commencement du et pour ca je mesure et lepure sÃ©pure et je mÃ©lance Ã©crire millepages mille-et-une pages pour en\nfinir avec en commencer avec lÃ©criture en finir commencer avec lÃ©criture\net donc je recommence jy reprends ma chance et javance Ã©crire sur Ã©criture\nest le futur de lÃ«criture je surÃ©cris suresclave dans les mille-et -une-\nnuits les mille-et-une pages ou une page dans une nuit ce qui se ressemble sassemble pages et nuits se miment sensoimÃªnt oÃ¹ le bout cest le dÃ©but\nand here I begin I spin here the beguine I respin and begin to release and realize life begins not arrives at the end of a trip which is why I begin to respin to write-in thousand pages write thousandone pages to end write begin write beginend with writing and so I begin to respin to retrace to rewrite (Haroldo de Campos).', '1311104776', 25.61390, -100.27877, 3, 12),
(19, 'O no. ', '1329348387', 40.77024, -73.97402, 1, 27),
(20, 'una se levanta con', '1330103315', 16.7381, -92.6388, 1, 4),
(21, '- y el que no nada, se ahoga', '1330103388', 55.9767, -3.2096, 1, 1),
(22, 'ContinÃºa el pre-texto...', '1330543054', 38.8894, -77.0497, 2, 4),
(23, 'Una almohada en los brazos', '1331320389',21.3139, -157.8455, 3, 4),
(24, 'Por eso hay que patalear', '1331322279', 35.69177, 139.69178, 2, 1),
(25, 'Pero estas seguro?', '1331323924', 37.57030, 126.97509, 2, 27),
(26, 'La lluvia agujerea la realidad, las lÃ¡grimas cosen las heridas.', '1331717421', -33.85673, 151.21496, 2, 6),
(27, 'En ese momento realicÃ© que tenÃ­a que terminar con ana', '1335814543', 45.70212, 9.66182, 1, 15);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `groups`
--

DROP TABLE `groups`;

CREATE TABLE IF NOT EXISTS `groups` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(100) NOT NULL,
  `created` datetime default NULL,
  `modified` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `groups`
--

INSERT INTO `groups` (`id`, `name`, `created`, `modified`) VALUES
(1, 'administrators', '2011-06-13 05:19:31', '2011-06-13 05:19:31');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `multimedias`
--

DROP TABLE `multimedias`;

CREATE TABLE IF NOT EXISTS `multimedias` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `pretext_id` int(10) unsigned NOT NULL,
  `type` varchar(45) NOT NULL,
  `url` varchar(45) NOT NULL,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=62 ;

--
-- Volcado de datos para la tabla `multimedias`
--

INSERT INTO `multimedias` (`id`, `pretext_id`, `type`, `url`, `description`) VALUES
(1, 1, 'image', 'http://30pre-textos.tuerco.com/img/1-1.jpg', 'pre-texto 1 ubicado en el mapa de la Estacion Fondo l&iacute;nea roja'),
(2, 1, 'image', 'http://30pre-textos.tuerco.com/img/1-2.jpg', 'Close up pre-texto 1 ubicado en el mapa de la Estacion Fondo l&iacute;nea roja'),
(3, 2, 'image', 'http://30pre-textos.tuerco.com/img/2-1.jpg', 'pre-texto 2 ubicado sobre bocinas en la pla&ccedil;a Glories'),
(4, 2, 'image', 'http://30pre-textos.tuerco.com/img/2-2.jpg', 'Close up pre-texto 2 ubicado sobre bocinas en la pla&ccedil;a Glories'),
(5, 3, 'image', 'http://30pre-textos.tuerco.com/img/3-1.jpg', 'pre-texto 3 ubicado sobre Caja de luz en Carrer del Tigre, Raval'),
(6, 3, 'image', 'http://30pre-textos.tuerco.com/img/3-2.jpg', 'Close up pre-texto 3 ubicado sobre Caja de luz en Carrer del Tigre, Raval'),
(7, 4, 'image', 'http://30pre-textos.tuerco.com/img/4-1.jpg', 'pre-texto 4 ubicado en maceta en el parque de la ciudadella'),
(8, 4, 'image', 'http://30pre-textos.tuerco.com/img/4-2.jpg', 'Close up pre-texto 4 ubicado en maceta en el parque de la ciudadella'),
(9, 5, 'image', 'http://30pre-textos.tuerco.com/img/5-1.jpg', 'pre-texto 5 ubicado en caja de luz afuera del teatro lliure en el barrio de Gracia'),
(10, 5, 'image', 'http://30pre-textos.tuerco.com/img/5-2.jpg', 'Close up pre-texto 5 ubicado en caja de luz afuera del teatro lliure en el barrio de Gracia'),
(11, 6, 'image', 'http://30pre-textos.tuerco.com/img/6-1.jpg', 'pre-texto 6 ubicado fuera de la Torre Aigbar'),
(12, 6, 'image', 'http://30pre-textos.tuerco.com/img/6-2.jpg', 'Close up pre-texto 6 ubicado fuera de la Torre Aigbar'),
(13, 7, 'image', 'http://30pre-textos.tuerco.com/img/7-1.jpg', 'pretexto 7 ubicado en caja de luz afuera del hotel Catalonia Plaza'),
(14, 7, 'image', 'http://30pre-textos.tuerco.com/img/7-2.jpg', 'Close up pretexto 7 ubicado en caja de luz afuera del hotel Catalonia Plaza'),
(15, 8, 'image', 'http://30pre-textos.tuerco.com/img/8-1.jpg', 'pre-texto 8 ubicado en ba&ntilde;o de mujeres en la pla&ccedil;a Glories'),
(16, 8, 'image', 'http://30pre-textos.tuerco.com/img/8-2.jpg', 'Close up pre-texto 8 ubicado en ba&ntilde;o de mujeres en la pla&ccedil;a Glories'),
(17, 9, 'image', 'http://30pre-textos.tuerco.com/img/9-1.jpg', 'pre-texto 9 ubicado en Anuncio de Ministerio de Espa&ntilde;a en zona de construcci&oacute;n en c/Pr'),
(18, 9, 'image', 'http://30pre-textos.tuerco.com/img/9-2.jpg', 'Close up pre-texto 9 ubicado en Anuncio de Ministerio de Espa&ntilde;a en zona de construcci&oacute;'),
(19, 10, 'image', 'http://30pre-textos.tuerco.com/img/10-1.jpg', 'pre-texto 10 ubicado en el mural afuera del acuario en maremagnum'),
(20, 10, 'image', 'http://30pre-textos.tuerco.com/img/10-2.jpg', 'Close up pre-texto 10 ubicado en el mural afuera del acuario en maremagnum'),
(21, 11, 'image', 'http://30pre-textos.tuerco.com/img/11-1.jpg', 'pre-texto 11 ubicado sobre tubo amarillo en esquina de departamentos blancos frente estacion Barcelo'),
(22, 11, 'image', 'http://30pre-textos.tuerco.com/img/11-2.jpg', 'Close up pre-texto 11 ubicado sobre tubo amarillo en esquina de departamentos blancos frente estacio'),
(23, 12, 'image', 'http://30pre-textos.tuerco.com/img/12-1.jpg', 'pre-texto 12 ubicado en la torre de la plaza del reloj en Gracia'),
(24, 12, 'image', 'http://30pre-textos.tuerco.com/img/12-2.jpg', 'pre-texto 12 ubicado en la torre de la plaza del reloj en Gracia'),
(25, 12, 'image', 'http://30pre-textos.tuerco.com/img/12-3.jpg', 'Close up pre-texto 12 ubicado en la torre de la plaza del reloj en Gracia'),
(26, 13, 'image', 'http://30pre-textos.tuerco.com/img/13-1.jpg', 'pre-texto 13 ubicado en caja electrica sobre passatge del mercader'),
(27, 13, 'image', 'http://30pre-textos.tuerco.com/img/13-2.jpg', 'Close up pre-texto 13 ubicado en caja electrica sobre passatge del mercader'),
(28, 14, 'image', 'http://30pre-textos.tuerco.com/img/14-1.jpg', 'pre-texto 14 ubicado sobre pared en calle Valldonzella, Raval'),
(29, 14, 'image', 'http://30pre-textos.tuerco.com/img/14-2.jpg', 'Close up pre-texto 14 ubicado sobre pared en calle Valldonzella, Raval'),
(30, 15, 'image', 'http://30pre-textos.tuerco.com/img/15-1.jpg', 'pre-texto 15 ubicado en caja de luz frente a cafeteria Baden Baden, Gran V&iacute;a'),
(31, 15, 'image', 'http://30pre-textos.tuerco.com/img/15-2.jpg', 'Close up pre-texto 15 ubicado en caja de luz frente a cafeteria Baden Baden, Gran V&iacute;a'),
(32, 16, 'image', 'http://30pre-textos.tuerco.com/img/16-1.jpg', 'pre-texto 16 ubicado sobre el aparador de tienda de maniquies, Calle Girona'),
(33, 16, 'image', 'http://30pre-textos.tuerco.com/img/16-2.jpg', 'Close up pre-texto 16 ubicado sobre el aparador de tienda de maniquies, Calle Girona'),
(34, 17, 'image', 'http://30pre-textos.tuerco.com/img/17-1.jpg', 'pre-texto 17 ubicado en el mapa del mercado de la Boqueria'),
(35, 17, 'image', 'http://30pre-textos.tuerco.com/img/17-2.jpg', 'Close up pre-texto 17 ubicado en el mapa del mercado de la Boqueria'),
(36, 18, 'image', 'http://30pre-textos.tuerco.com/img/18-1.jpg', 'pre-texto 18 ubicado en banca frente a la capilla del parque ciudadella'),
(37, 18, 'image', 'http://30pre-textos.tuerco.com/img/18-2.jpg', 'Close up pre-texto 18 ubicado en banca frente a la capilla del parque ciudadella'),
(38, 19, 'image', 'http://30pre-textos.tuerco.com/img/19-1.jpg', 'pre-texto 19 ubicado frente a fruteria en Joaquin Costa, Raval'),
(39, 19, 'image', 'http://30pre-textos.tuerco.com/img/19-2.jpg', 'Close up pre-texto 19 ubicado frente a fruteria en Joaquin Costa, Raval'),
(40, 20, 'image', 'http://30pre-textos.tuerco.com/img/20-1.jpg', 'pre-texto 20 ubicado sobre aparador tienda Margarita Bonita, Calle Mallorca'),
(41, 20, 'image', 'http://30pre-textos.tuerco.com/img/20-2.jpg', 'Close up pre-texto 20 ubicado sobre aparador tienda Margarita Bonita, Calle Mallorca'),
(42, 21, 'image', 'http://30pre-textos.tuerco.com/img/21-1.jpg', 'pre-texto 21 ubicado sobre pared en tiradero de basura'),
(43, 21, 'image', 'http://30pre-textos.tuerco.com/img/21-2.jpg', 'Close up pre-texto 21 ubicado sobre pared en tiradero de basura'),
(44, 22, 'image', 'http://30pre-textos.tuerco.com/img/22-1.jpg', 'pre-texto 22 ubicado sobre mapa biblioteca Joan Mir&oacute;'),
(45, 22, 'image', 'http://30pre-textos.tuerco.com/img/22-2.jpg', 'Close up pre-texto 22 ubicado sobre mapa biblioteca Joan Mir&oacute;'),
(46, 23, 'image', 'http://30pre-textos.tuerco.com/img/23-1.jpg', 'pre-texto 23 ubicado sobre el termometro de Paseo del Angel'),
(47, 23, 'image ', 'http://30pre-textos.tuerco.com/img/23-2.jpg', 'Close up pre-texto 23 ubicado sobre el termometro de Paseo del Angel'),
(48, 24, 'image', 'http://30pre-textos.tuerco.com/img/24-1.jpg', 'pre-texto 24 ubicado en parada de camiones frente a plaza catalunya'),
(49, 24, 'image', 'http://30pre-textos.tuerco.com/img/24-2.jpg', 'pre-texto 24 ubicado en parada de camiones frente a plaza catalunya'),
(50, 25, 'image', 'http://30pre-textos.tuerco.com/img/25-1.jpg', 'pre-texto 25 ubicado sobre cenicero afuera de la Facultad de filosofia, Gran V&iacute;a'),
(51, 25, 'image', 'http://30pre-textos.tuerco.com/img/25-2.jpg', 'Close up pre-texto 25 ubicado sobre cenicero afuera de la Facultad de filosofia, Gran V&iacute;a'),
(52, 26, 'image', 'http://30pre-textos.tuerco.com/img/26-1.jpg', 'pre-texto 26 ubicado en mapa del Hospital de Bellvitge'),
(53, 26, 'image', 'http://30pre-textos.tuerco.com/img/26-2.jpg', 'Close up pre-texto 26 ubicado en mapa del Hospital de Bellvitge'),
(54, 27, 'image', 'http://30pre-textos.tuerco.com/img/27-1.jpg', 'pre-texto 27 ubicado en banca dentro de la Facultad de Filosofia UB'),
(55, 27, 'image', 'http://30pre-textos.tuerco.com/img/27-2.jpg', 'Close up pre-texto 27 ubicado en banca dentro de la Facultad de Filosofia UB'),
(56, 28, 'image', 'http://30pre-textos.tuerco.com/img/28-1.jpg', 'pre-texto 28 ubicado en cabina telefonica parking de motocicletas'),
(57, 28, 'image', 'http://30pre-textos.tuerco.com/img/28-2.jpg', 'Close up pre-texto 28 ubicado en cabina telefonica parking de motocicletas'),
(58, 29, 'image', 'http://30pre-textos.tuerco.com/img/29-1.jpg', 'pre-texto 29 ubicado en caa de luz afuera de Flamenco Show, las ramblas'),
(59, 29, 'image', 'http://30pre-textos.tuerco.com/img/29-2.jpg', 'Close up pre-texto 29 ubicado en caa de luz afuera de Flamenco Show, las ramblas'),
(60, 30, 'image', 'http://30pre-textos.tuerco.com/img/30-1.jpg', 'pre-texto 30 ubicado en la estaci&oacute;n Hostpital de Bellvitge Linea roja'),
(61, 30, 'image', 'http://30pre-textos.tuerco.com/img/30-2.jpg', 'Close up pre-texto 30 ubicado en la estaci&oacute;n Hostpital de Bellvitge Linea roja');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pretexts`
--

DROP TABLE `pretexts`;

CREATE TABLE IF NOT EXISTS `pretexts` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `title` varchar(45) NOT NULL,
  `text` text NOT NULL,
  `created` varchar(45) NOT NULL,
  `lat` float NOT NULL,
  `lng` float NOT NULL,
  `extra_title` varchar(45) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=31 ;

--
-- Volcado de datos para la tabla `pretexts`
--

INSERT INTO `pretexts` (`id`, `title`, `text`, `created`, `lat`, `lng`, `extra_title`) VALUES
(1, '1-en-el-transcurso', '<div class="dialogo"> \r\n			\r\n<p><span>&#150;</span> En el transcurso para llegar a la nada hay muchas cosas que se sienten... tal vez todo.</p> \r\n			\r\n<p><span>&#150;</span> Y cuando llegas al todo no se siente nada.</p> \r\n		\r\n</div> ', '2011-06-13', 0, 0, 'Uno :: 30pre-textos'),
(2, '2-si-no-querias', '<div class="dialogo"> \r\n\r\n<p><span>&#150;</span> Si no quer&iacute;as decir nada debiste hab&eacute;rmelo dicho.</p> \r\n			\r\n<p><span>&#150;</span> &iexcl;Lo hice! ... me qued&eacute; callada.</p> \r\n\r\n</div> ', '2011-06-13', 0, 0, 'Dos :: 30pre-textos'),
(3, '3-deberias-sacarme-a-pasear', '<div class="dialogo"> \r\n			\r\n<p><span>&#150;</span> Deber&iacute;as sacarme a pasear por las noches... al menos un rato.</p> \r\n			\r\n<p><span>&#150;</span> Sabes que me da miedo la oscuridad </p> \r\n			\r\n<p><span>&#150;</span> Lo s&eacute;... por eso lo digo.</p> \r\n		\r\n</div> ', '2011-06-13', 0, 0, 'Tres :: 30pre-textos'),
(4, '4-era-un-buen-dia', '<div class="dialogo"> \r\n			\r\n<p><span>&#150;</span> Era un buen d&iacute;a como aquellos...</p> \r\n			\r\n<p><span>&#150;</span> &iquest;te acuerdas?</p> \r\n			\r\n<p><span>&#150;</span> en los que...</p> \r\n		\r\n</div> ', '2011-06-13', 0, 0, 'Cuatro :: 30pre-textos'),
(5, '5-si-es-que', '<div class="dialogo"> \r\n			\r\n<p><span>&#150;</span> Si es que hay personajes debemos agradecerle a Sheakespeare...</p> \r\n			\r\n<p><span>&#150;</span> Si es que hay Sheakspeare es gracias a que habemos personajes.</p> \r\n			\r\n</div> ', '2011-06-13', 0, 0, 'Cinco :: 30pre-textos'),
(6, '6-nunca-crei-que', '<div class="dialogo"> \r\n\r\n<p><span>&#150;</span> Nunca cre&iacute; que llover&iacute;a tanto. Tal vez es el arcoiris, aunque no s&eacute; qu&eacute; es primero... Como siempre...</p> \r\n\r\n<p><span>&#150;</span> Nunca cre&iacute; que llorar&iacute;as tanto. Tal vez es la lluvia, aunque no s&eacute; que es primero... T&uacute;... como siempre...</p> \r\n		\r\n</div> \r\n\r\n<p>Era uno de esos d&iacute;as de aguacero que nadie anunci&oacute;, todo lo contrario a los que durante semanas anuncian y nunca llegan...</p> ', '2011-06-13', 0, 0, 'Seis :: 30pre-textos'),
(7, '7-entre-el-cuarto', '<div class=""> \r\n<p>Entre el cuarto de aqu&iacute; y el cuarto de all&aacute;... No me decido, debo comenzar a escribir y ninguno me dice nada...</p> \r\n\r\n<p class="center">Sigo aqu&iacute;...</p> \r\n\r\n<p class="right">Seguir&eacute;...</p> \r\n		</div> ', '2011-06-13', 0, 0, 'Siete :: 30pre-textos'),
(8, '8-que-es-lo-que-quieres', '<div class="dialogo"> \r\n\r\n<p><span>&#150;</span> &iquest;Qu&eacute; es lo que quieres? &iquest;Estar sola o con &eacute;l?</p> \r\n\r\n<p><span>&#150;</span> No lo s&eacute;... sola. Aunque pens&aacute;ndolo bien, es lo mismo. Su presencia no es nada.</p> \r\n			\r\n</div> ', '2011-06-13', 0, 0, 'Ocho :: 30pre-textos'),
(9, '9-podriamos-empezar', '<div class="dialogo"> \r\n\r\n<p><span>&#150;</span>Podr&iacute;amos empezar con un hueco e ir llen&aacute;ndolo...</p> \r\n\r\n<p><span>&#150;</span> O podr&iacute;amos empezar con un mont&oacute;n e ir vaci&aacute;ndolo...</p> \r\n\r\n</div> ', '2011-06-13', 0, 0, 'Nueve :: 30pre-textos'),
(10, '10-alguna-vez-escuche', '<div class=""> \r\n\r\n<p>Alguna vez escuche:</p> \r\n\r\n<blockquote>&quot;No es que seamos varias... es que jugamos dentro de una pecera donde los ecos se repiten infinitamente&quot;</blockquote> \r\n\r\n<p>Entonces record&eacute; a mi hermana. Ella era...</p> \r\n\r\n</div> ', '2011-06-13', 0, 0, 'Diez :: 30pre-textos'),
(11, '11-mmmh-solo-es-el-blanco', '<div class=""> \r\n\r\n<p>Mmmh solo es el blanco de las sabanas y el olor que dejaste... fue un buen principio... o un buen final. </p> \r\n\r\n<p>"De todos modos era un ''don nadie''" me repet&iacute; al comenzar un domingo en la ma&ntilde;ana...</p> \r\n\r\n</div> ', '2011-06-13', 0, 0, 'Once :: 30pre-textos'),
(12, '12-son-las-4-28', '<div class=""> \r\n\r\n<p>Son las 4:28, voy en la p&aacute;gina 70. Juego a escribirte un poco y olvidar tus cicatrices... recuerdo todo igual, pero ya nada es lo mismo... pasan 3 horas y vuelvo a intentar; 5 renglones y de nuevo, 4 palabras y conclu&iacute;...</p> \r\n\r\n</div>', '2011-06-13', 0, 0, 'Doce :: 30pre-textos'),
(13, '13-te-buscaba', '<div class=""> \r\n\r\n<p>Te buscaba, no encontr&eacute; algo, pero encontr&eacute; nada... y eso vali&oacute; mas la pena que encontrarte... </p> \r\n\r\n<p>Si no preg&uacute;ntale al silencio, no s&eacute; si te conteste... si escuchas un susurro que avienta el aire cuando llueve entonces puede ser...</p> \r\n\r\n<p>Como ahora... deja de leerme...</p> \r\n\r\n<p>Escucha...</p> \r\n\r\n</div> ', '2011-06-13', 0, 0, 'Trece :: 30pre-textos'),
(14, '14-a-mordidas-', '<div class=""> \r\n\r\n<p>A mordidas.</p> \r\n\r\n<p>A vomito.</p> \r\n\r\n<p>A escupitajos.</p> \r\n\r\n<p>... y a unas cuantas "malas razones"... ya no s&eacute; qu&eacute; digo.</p> \r\n\r\n<p>&iquest;Quieres que hable sin parar de cada cosa?</p> \r\n\r\n<p>No hab&iacute;a nada que escuchar, pero tampoco me callo. Habl&eacute; de todo, de...</p> \r\n\r\n</div> ', '2011-06-13', 0, 0, 'Catorce :: 30pre-textos'),
(15, '15-no-se-si-existen', '<div class=""> \r\n\r\n<p>No s&eacute; si existen las buenas razones, pero aquella ma&ntilde;ana un caf&eacute; me pareci&oacute; suficiente para pararme de la cama...</p> \r\n\r\n</div> ', '', 2011, 0, 'Quince :: 30pre-textos'),
(16, '16-miento-tal-vez-miento', '<div class=""> \r\n\r\n<p>Miento... tal vez miento... &iquest;para qu&eacute; te digo mentiras? &iexcl;SOY UNA MENTIROSA!</p> \r\n\r\n<p>Debo advertirte: tambi&eacute;n soy arrogante, soy incr&eacute;dula, soy ego&iacute;sta, soy burlona, soy sarc&aacute;stica, soy prepotente, soy ir&oacute;nica, soy cabrona, soy...</p> \r\n\r\n</div> ', '2011-06-13', 0, 0, 'Dieciseis :: 30pre-textos'),
(17, '17-ahorita-no-gracias', '<div class="dialogo"> \r\n\r\n<p><span>&#150;</span> Ahorita no, gracias.</p> \r\n\r\n<p><span>&#150;</span> Es una buena oferta, no se va a arrepentir.</p> \r\n\r\n<p><span>&#150;</span> Eso lo s&eacute;, nunca me arrepiento... no puedo ni decir en la iglesia "por mi culpa, por mi culpa, por mi gran culpa".</p> \r\n\r\n</div> ', '2011-06-13', 0, 0, 'Diecisiete :: 30pre-textos'),
(18, '18-estaba-sentada', '<div class=""> \r\n\r\n<p>Estaba sentada aquella tarde. El reloj daba las 6 en punto -escuchaba las campanadas- y las hojas secas ca&iacute;an de los &aacute;rboles... </p> \r\n\r\n<p>... no ol&iacute;a m&aacute;s que a seco, y tambi&eacute;n un poco a humedad...</p> \r\n\r\n<p>Tal vez eso no sea la verdad, pero en oto&ntilde;o todo se contradice... y yo vivo en un oto&ntilde;o eterno.</p> \r\n			\r\n</div> ', '2011-06-13', 0, 0, 'Dieciocho :: 30pre-textos'),
(19, '19-podria-inventar-historias', '<div class=""> \r\n\r\n<p>Podr&iacute;a inventar historias diariamente como lo he hecho hasta ahora... Aun as&iacute; s&eacute; que no com&iacute; mango ayer, ni escuche Bossanova... Pero hoy s&iacute;, hoy si lo hago... </p> \r\n\r\n<p>... ma&ntilde;ana dir&eacute; lo mismo...</p> \r\n			\r\n			\r\n		</div> ', '2011-06-13', 0, 0, 'Diecinueve :: 30pre-textos'),
(20, '20-para-poder-hacerte-a-un-lado', '<div class=""> \r\n\r\n<p>Para poder hacerte a un lado tuve que escribir:</p> \r\n			\r\n			<blockquote>"Cada d&iacute;a escucho el abrir y cerrar de tus ojos... ma&ntilde;ana d&eacute;jame en silencio, y as&iacute; eternamente"</blockquote> \r\n			\r\n<p>Lo dej&eacute; bajo su almohada. No pude ver su cara al leerlo. Era mejor as&iacute; pero es fecha en que a&uacute;n divago imaginando c&oacute;mo fue. Puede que haya sido...</p> \r\n			\r\n</div> ', '2011-06-13', 0, 0, 'Veinte :: 30pre-textos'),
(21, '21-la-textura-no-es-nada-agradable', '<div class=""> \r\n\r\n<p>La textura no es nada agradable: es pegajosa y me causa nauseas, apesta como nada... si eso quer&iacute;as mejor esc&uacute;peme.</p> \r\n\r\n<p>Aunque yo te haya pedido que me hablaras de ella; aunque no creo tragarme una sola de tus palabras; aunque tenga que soportarlo como una horrible sensaci&oacute;n de la que ahora hablo... </p> \r\n\r\n<p>... apestosa y pegajosa... s&iacute;, tal vez esa sea su descripci&oacute;n...</p> \r\n			\r\n			\r\n</div> ', '2011-06-13', 0, 0, 'Veintiuno :: 30pre-textos'),
(22, '22-no-hablo-de-mis-propias-ideas', '<div class=""> \r\n\r\n<p>No hablo de mis propias ideas -me he equivocado, &eacute;sta es una de ellas- aunque en realidad la estoy escribiendo... &iquest;Hablo o escribo?</p> \r\n\r\n<p>&iquest;Me escuchas o me lees?</p> \r\n\r\n<p>No me burlo de ti... pero si me r&iacute;o puede que te ofendas y eso me causar&iacute;a mas risa...</p> \r\n\r\n<p>Ahora r&iacute;o...</p> \r\n		\r\n</div> ', '2011-06-13', 0, 0, 'Veintidos :: 30pre-textos'),
(23, '23-14-de-febrero', '<div class=""> \r\n\r\n<p>14 de febrero</p> \r\n			\r\n<blockquote>-"...el d&iacute;a de hoy llegaremos a mas de 40 grados sabiendo la cantidad de sangre que conducir&aacute;s a mi coraz&oacute;n, pero por la noche podr&iacute;amos estar a -40 si no estas en mi colch&oacute;n"</blockquote> \r\n			\r\n<p>Vaya manera tan pendeja de "amenizar" el pronostico del clima en un d&iacute;a de San Valent&iacute;n. </p> \r\n			\r\n<p>As&iacute; despert&eacute; entre risas burlonas y l&aacute;grimas al pensar que en el m&iacute;o tampoco habr&iacute;a nadie. Nada vale. &iquest;Para que quiero un tipo pendejo que termine diciendo lo mismo que el meteor&oacute;logo?, entonces...</p> \r\n		\r\n</div> ', '2011-06-13', 0, 0, 'Veintitres :: 30pre-textos'),
(24, '24-ya-esperaba-esa-respuesta', '<div class="dialogo"> \r\n			\r\n<p><span>&#150;</span> &iexcl;Ya esperaba esa respuesta! &iexcl;Ese "mmm" con toda la intenci&oacute;n de hacer menos mi trabajo! Puede ser cierto: soy un "don nadie" con las mas m&iacute;nimas ganas de ser alguien si hay que ser como t&uacute;... </p> \r\n			\r\n<p><span>&#150;</span> Prefiero evitarme las palabras "antisonantes", as&iacute; como "dijistes"... El problema no es que hables mal, es que mas bien no hablas, ni escuchas, ni escribes, ni esperas, ni nada... Ni a nada ni a nadie, s&oacute;lo puedo decir "mmm"... </p> \r\n			\r\n		\r\n</div> \r\n		\r\n<p>...y as&iacute; comenz&oacute; el dialogo...</p> ', '2011-06-13', 0, 0, 'Veinticuatro'),
(25, '25-todo-comenzo', '<div class=""> \r\n			\r\n<p>Todo comenz&oacute; el d&iacute;a de hoy.</p> \r\n			\r\n<p>Todo termino el d&iacute;a de hoy.</p> \r\n			\r\n<p>El resto del d&iacute;a  no tiene caso narrarlo... Ustedes han de saber de lo que hablo, tal vez hayan le&iacute;do m&aacute;s novelas que yo...</p> \r\n		</div> ', '2011-06-13', 0, 0, 'Veinticinco :: 30pre-textos'),
(26, '26-historia-roja', '<div class=""> \r\n	\r\n<p>Historia Roja</p> \r\n			\r\n<blockquote>&eacute;sto derramado no es mas que sangre que ha dejado la herida que ha hecho el lenguaje con sus reglas absurdas que solo frustran el inicio de un nuevo d&iacute;a y un nuevo texto de un nuevo libro que se volviera una frustraci&oacute;n.</blockquote> \r\n			\r\n<p>As&iacute; comienzo un inicio frustrado. &eacute;ste es el principio de la frustraci&oacute;n...</p> \r\n		\r\n</div> ', '2011-06-13', 0, 0, 'Veintiseis :: 30pre-textos'),
(27, '27-para-comenzar', '<div class=""> \r\n			\r\n<p>Para comenzar podr&iacute;a hablar de m&iacute;... o no. Mejor podr&iacute;a crear condiciones especificas de lectura: </p> \r\n			\r\n<ol> \r\n				<li>P&oacute;ngase c&oacute;modo.</li> \r\n				\r\n<li>Abra el libro</li> \r\n				<li>Ci&eacute;rrelo</li> \r\n			\r\n</ol> \r\n			\r\n<p>... no bastan las instrucciones. Todo lo que diga sera reinterpretado. </p> \r\n			\r\n<p>Piense lo que quiera sin necesidad de leerme.</p> \r\n		\r\n</div> ', '2011-06-13', 0, 0, 'Veintisiete :: 30pre-textos'),
(28, '28-manchas-ocres', '<div class=""> \r\n			\r\n<p>Manchas ocres y color naranja quemado de una pared resquebrajada sobre la que cuelga una guirnalda de rosas de papel amarillas rojas y moradas. Abajo un suelo de tintes cambiantes de color, el habito de los franciscanos, una botella negra de vidrio y un vaso donde se ahoga una amapola encarnada</p> \r\n			\r\n<p>Las palabras se convierten en imagen, en color, en olor, en sabor, en sensaciones, en... </p> \r\n		\r\n</div> ', '2011-06-13', 0, 0, 'Veintiocho :: 30pre-textos'),
(29, '29-ella', '<div class=""> \r\n			\r\n<p>Ella venia de all&aacute;.</p> \r\n			\r\n<p>Ella tenia la piel blanca</p><p class="right addendum">(inmensa),</p> \r\n			\r\n<p>labios rojos</p><p class="right addendum">(peque&ntilde;os),</p> \r\n			\r\n<p>cabello caf&eacute;</p><p class="right addendum">(ligero),</p> \r\n			\r\n<p>mirada honda</p><p class="right addendum">(profunda).</p> \r\n			\r\n<p class="right">Ella bailaba flamenco, ella com&iacute;a uvas, ella ol&iacute;a a flor de naranjo, ella sonaba, re&iacute;a, retumbaba.</p> \r\n			\r\n<p>Ella maldec&iacute;a, ella me dec&iacute;a, ella cocinaba, ella esperaba, ella tenia cabellos blancos, ella se arrugaba. </p> \r\n			\r\n<p>Ella tenia enormes manos</p><p class="right addendum">(hermosas)</p> \r\n			\r\n<p class="right">Ella sonaba, ella me llamaba, ella la extra&ntilde;o, ella lo ha dejado, ella se ha burlado, ella lo ha logrado, ella fue mujer y ahora es idea eterna...</p> \r\n			\r\n<p>ella...</p> \r\n		\r\n</div> ', '2011-06-13', 0, 0, 'Veintinueve :: 30pre-textos'),
(30, '30-el-principio', '<div class=""> \r\n			\r\n<p>El principio se parece al fin, el final se parece al principio... </p> \r\n			\r\n<p>El principio se parece al fin, el final se parece al principio, y as&iacute; sucesivamente. As&iacute; comienzo as&iacute; termino.</p> \r\n			\r\n<p>As&iacute; termino y entonces comienzo...</p> \r\n			\r\n			\r\n</div> ', '2011-06-13', 0, 0, 'Treinta :: 30pre-textos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

DROP TABLE `users`;

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL auto_increment,
  `username` varchar(255) NOT NULL,
  `password` char(40) NOT NULL,
  `group_id` int(11) NOT NULL,
  `created` datetime default NULL,
  `modified` datetime default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `group_id`, `created`, `modified`) VALUES
(1, 'admin', 'dbf2badc117edaf7c4f26193b3356b0eadf5eb73', 1, '2011-06-13 05:19:39', '2011-06-29 07:46:39');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
