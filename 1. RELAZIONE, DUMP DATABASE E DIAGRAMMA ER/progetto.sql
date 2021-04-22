-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Giu 16, 2020 alle 18:10
-- Versione del server: 10.4.11-MariaDB
-- Versione PHP: 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `progetto`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `assistente`
--

CREATE TABLE `assistente` (
  `id` int(5) NOT NULL,
  `nome` varchar(10) NOT NULL,
  `cognome` varchar(10) NOT NULL,
  `email` varchar(30) NOT NULL,
  `numero_di_telefono` varchar(10) DEFAULT NULL,
  `id_docente` int(5) DEFAULT NULL,
  `id_locale` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `categoria`
--

CREATE TABLE `categoria` (
  `id_categoria` int(5) NOT NULL,
  `classificazione` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `categoria`
--

INSERT INTO `categoria` (`id_categoria`, `classificazione`) VALUES
(1, 'Elettrico'),
(2, 'Informatico'),
(3, 'Sanitario'),
(4, 'Strutturale');

-- --------------------------------------------------------

--
-- Struttura della tabella `corso_laurea`
--

CREATE TABLE `corso_laurea` (
  `id_corso` int(5) NOT NULL,
  `nome_corso` varchar(20) NOT NULL,
  `id_dipartimento` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `credenziali`
--

CREATE TABLE `credenziali` (
  `password` varchar(32) NOT NULL,
  `email` varchar(30) NOT NULL,
  `id_direttore` int(5) DEFAULT NULL,
  `id_tecnico` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `credenziali`
--

INSERT INTO `credenziali` (`password`, `email`, `id_direttore`, `id_tecnico`) VALUES
('347a7c263afc4eb1041606f07f713645', 'adandrea@unime.it', 4, NULL),
('99fec1fe91a876ee71d2410c0fa6c76c', 'adriano.esposito@unime.it', NULL, 12),
('0911054d8ad47cc256400031197f3e97', 'alessandro.ferrari@unime.it', NULL, 8),
('a59898c5f21c3e913eba2c8b0600a678', 'anastasi.giuseppe@unime.it', 7, NULL),
('5c512c46d954bb12e6466b167feaccdb', 'anselmo.marini@unime.it', NULL, 18),
('82dcee584ae86d1873100a3f248c95a6', 'antonio.panebianco@unime.it', 12, NULL),
('32de1ef199046408153b9c3d14c886b8', 'antonio.pennisi@unime.it', 9, NULL),
('2bf65275cb7f5dc95febd7d46cd7d0af', 'antonio.rossi@unime.it', NULL, 41),
('7139ef24f173a052e704e84792a9d2b4', 'armando.caputo@unime.it', NULL, 34),
('a618cc079d550863170ada8424cfa48d', 'armando.catanese@unime.it', NULL, 43),
('f33c842dfe434bf16d00415faea954f4', 'attilio.molinari@unime.it', NULL, 49),
('0a89c133d3906c8bebbfe3cbf1598476', 'augusto.poli@unime.it', NULL, 38),
('e225b885910ac769923acb65f40dbbef', 'bartolo.mancini@unime.it', NULL, 15),
('5d907853a9617cfd55fb62eae803595b', 'benito.romeo@unime.it', NULL, 40),
('b230e100f577d85844ebb396dd353e48', 'bruno.parisi@unime.it', NULL, 26),
('cc30e6c5a28b1a1a1d1155d1ebf6c39d', 'carmine.barbieri@unime.it', NULL, 22),
('cd4b13e650002af45148f94a507845ea', 'clemente.silvestri@unime.it', NULL, 29),
('5cc205ee461f6f11ded267968ae224f0', 'cosimo.bassi@unime.it', NULL, 46),
('3227b03f3c3cfd6642e6db2e87d88cdf', 'costanzo.battaglia@unime.it', NULL, 37),
('a4cf6605330ced83c82fc122e87473f6', 'damicoa@unime.it', 2, NULL),
('e36be0d03158c871e082da61a808bfaf', 'daniele.giuliani@unime.it', NULL, 35),
('5c6d0904714572643ebf12618b8b175e', 'davide.rizzo@unime.it', NULL, 51),
('df3b11143b9e9bfcb1a1518207c82c08', 'diego.spinelli@unime.it', NULL, 45),
('0350baa6af78a64e97906c863e494f97', 'domenico.cucinotta@unime.it', 5, NULL),
('4588703b769c6f882d8d7c1b86939d48', 'domenico.moretti@unime.it', NULL, 50),
('b837165597b572c76f90b22ef3f19ca5', 'edoardo.alberti@unime.it', NULL, 39),
('ccae2472b883efc000bd834426654e94', 'elena.gallo@unime.it', NULL, 9),
('6b694e8cf87fc88d392ed8ebf81d9385', 'elisabetta.sala@unime.it', NULL, 36),
('4744c89952df0dbdac1ca2ba028873ea', 'emanuele.pellegrino@unime.it', NULL, 30),
('f92e099eaafcc2bf55681dc5187625cc', 'enzo.valente@unime.it', NULL, 47),
('7da88ad7eca13492ca0cf95869412360', 'ettore.serra@unime.it', NULL, 20),
('77aa95e36e6d9f135a550b3b8775a125', 'fabrizio.santoro@unime.it', NULL, 17),
('27e4b8ca60c217113467f527bce3fb8c', 'federica.romano@unime.it', NULL, 10),
('91b9b56ac072f8ca1faa8d2f74d867e9', 'ferndinando.moro@unime.it', NULL, 33),
('d6815df70d9ad4e0d6c905ec993aabb1', 'fiorella.coppola@unime.it', NULL, 48),
('720afd4d1be2900c396107fe690b5af3', 'flavia.vitale@unime.it', NULL, 25),
('261245b1b722ca681e8e86451cb42216', 'fortunato.neri@unime.it', 10, NULL),
('1f5c8c3ce5e3c635ab899d59c8635009', 'francesco.bianchi@unime.it', NULL, 2),
('4558aac7b93717f32323b02d2db1f28b', 'francesco.piazza@unime.it', NULL, 32),
('f060238374e7b67e206202f2927f2dd7', 'fstagnodalcontres@unime.it', 6, NULL),
('2d26a6024eebe2f0c7628ca584620d06', 'giancarlo.devero@unime.it', 3, NULL),
('d926e9082ce9aa0919d3efc2a2af6d4a', 'giovanni.grassi@unime.it', 8, NULL),
('d3ab071b5a2817170b440d15d315a4ec', 'giovanni.lorenzini@unime.it', NULL, 42),
('fcdc00b7782a58d7e6d786fcc3ff5f2a', 'giovanni.moschella@unime.it', 11, NULL),
('71a1f456f2cca7192d736a2d529960f3', 'marco.verdi@unime.it', NULL, 3),
('4b9a3919281ceba0691cabd07af097e3', 'mario.bolognari@unime.it', 1, NULL),
('2bf65275cb7f5dc95febd7d46cd7d0af', 'mario.rossi@unime.it', NULL, 1),
('df4414705caa4690401fb37c66ad2d85', 'mario.russo@unime.it', NULL, 11),
('e44c8feaf2e9f09016919a52d9853f68', 'matteo.conte@unime.it', NULL, 19),
('39dd6346a89844850a5c2f337dcdf1d9', 'michelangelo.colombo@unime.it', NULL, 14),
('b4343ed07106cdb27399e12b1145602d', 'michele.violi@unime.it', NULL, 28),
('4080dda7e442d4852c36ddef2c68b29a', 'paolo.messina@unime.it', NULL, 0),
('1f3b9e6df0ddf4a24d499f3439b604fd', 'raffaele.benedetti@unime.it', NULL, 44),
('1eb310829aec2554b9aad710a33150ec', 'salvatore.greco@unime.it', NULL, 13),
('715b1478a299670f48f36c84fe7294ae', 'santo.barone@unime.it', NULL, 31),
('dee77b12002b838de315147b1dac24cc', 'sebastiano.ferrara@unime.it', NULL, 16),
('8b403c567bc7b421c063ba3a82d3330d', 'siliva.leone@unime.it', NULL, 21),
('1ed1fd0860a02272a5096ce338e7ec95', 'tommaso.ferri@unime.it', NULL, 23),
('37ede6fa3d6089ba78da88aff24e1976', 'umberto.martino@unime.it', NULL, 27),
('a2e2ed41169e4b64c5934ffb9e4304f1', 'valerio.mazza@unime.it', NULL, 24);

-- --------------------------------------------------------

--
-- Struttura della tabella `dipartimento`
--

CREATE TABLE `dipartimento` (
  `id_dipartimento` int(5) NOT NULL,
  `nome` varchar(65) NOT NULL,
  `CAP` int(5) NOT NULL,
  `numero_civico` int(4) DEFAULT NULL,
  `via` varchar(30) NOT NULL,
  `citta` varchar(10) NOT NULL,
  `provincia` varchar(2) NOT NULL,
  `id_direttore` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `dipartimento`
--

INSERT INTO `dipartimento` (`id_dipartimento`, `nome`, `CAP`, `numero_civico`, `via`, `citta`, `provincia`, `id_direttore`) VALUES
(1, 'Civilità antiche e moderne', 98168, 0, 'A. Giuffre', 'Messina', 'ME', 1),
(2, 'Economia', 98122, 98, 'Cesare Battisti', 'Messina', 'ME', 2),
(3, 'Giurisprudenza', 98122, 1, 'Piazza Pugliatti', 'Messina', 'ME', 3),
(4, 'Ingegneria', 98166, 0, 'Contrada Di Dio (S. Agata)', 'Messina', 'ME', 4),
(5, 'Medicina Clinica e Sperimentale', 98125, 1, 'Consolare Valeria ', 'Messina ', 'ME', 5),
(6, 'Patologia umana dell\'adulto e dell\'età', 98125, 1, 'Consolare Valeria', 'Messina', 'ME', 6),
(7, 'Scienze Biomediche odontoiatriche', 98125, 1, 'Consolare Valeria', 'Messina', 'ME', 7),
(8, 'Scienze chimiche biologiche farmaceutiche ed ambientali', 98166, 0, 'Stagno d\'Alcontres Messina', 'Messina', 'ME', 8),
(9, 'Scienze cognitive psicologiche', 98121, 8, ' Concezione', 'Messina', 'ME', 9),
(10, 'MIFT', 98166, 0, 'Stagno d\'Alcontres', 'Messina', 'ME', 10),
(11, 'Scienze politiche e giuridiche', 98122, 0, 'Piazza 20 settembre', 'Messina', 'ME', 11),
(12, 'Scienze Veterinarie', 98168, 0, 'Polo Universitario SS Annunzia', 'Messina', 'ME', 12);

-- --------------------------------------------------------

--
-- Struttura della tabella `direttore`
--

CREATE TABLE `direttore` (
  `id` int(5) NOT NULL,
  `nome` varchar(30) NOT NULL,
  `cognome` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `numero_di_telefono` varchar(10) DEFAULT NULL,
  `inizio_mandato` date DEFAULT NULL,
  `fine_mandato` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `direttore`
--

INSERT INTO `direttore` (`id`, `nome`, `cognome`, `email`, `numero_di_telefono`, `inizio_mandato`, `fine_mandato`) VALUES
(1, 'Mario', 'Bolognari', 'mario.bolognari@unime.it', '0906766359', '2019-11-04', '2023-07-08'),
(2, 'Augusto', 'D\'amico', 'damicoa@unime.it', '0906767105', '2018-10-14', '2022-10-14'),
(3, 'Giancarlo', 'De Vero', 'giancarlo.devero@unime.it', '0906764313', '2020-01-05', '2024-01-05'),
(4, 'Antonino', 'D\'Andrea', 'adandrea@unime.it', '0903977157', '2017-07-08', '2021-07-08'),
(5, 'Domenico', 'Cucinotta', 'domenico.cucinotta@unime.it', '0902212390', '2018-04-26', '2022-04-26'),
(6, 'Francesco', 'Stagno D\'Alcontres', 'fstagnodalcontres@unime.it', '0902212585', '2019-09-18', '2023-09-18'),
(7, 'Giuseppe Pio', 'Anastasi', 'anastasi.giuseppe@unime.it', '0902213361', '2018-05-21', '2022-05-21'),
(8, 'Giovanni', 'Grassi', 'giovanni.grassi@unime.it', '0906765513', '2020-02-17', '2024-02-17'),
(9, 'Antonino', 'Pennisi', 'antonio.pennisi@unime.it', '0906765191', '2017-10-09', '2021-10-09'),
(10, 'Fortunato', 'Neri', 'fortunato.neri@unime.it', '0906765030', '2019-06-30', '2023-06-30'),
(11, 'Giovanni', 'Moschella', 'giovanni.moschella@unime.it', '0906768931', '2018-11-25', '2022-11-25'),
(12, 'Antonio', 'Panebianco', 'antonio.panebianco@unime.it', '0903503762', '2019-12-10', '2023-12-10');

-- --------------------------------------------------------

--
-- Struttura della tabella `locale`
--

CREATE TABLE `locale` (
  `id_locale` int(5) NOT NULL,
  `tipologia` varchar(50) NOT NULL,
  `classificazione` varchar(50) DEFAULT NULL,
  `numero` int(5) DEFAULT NULL,
  `id_dipartimento` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `locale`
--

INSERT INTO `locale` (`id_locale`, `tipologia`, `classificazione`, `numero`, `id_dipartimento`) VALUES
(610, 'Aula', 'Studio', 101, 1),
(611, 'Aula', 'Studio', 102, 1),
(612, 'Aula', 'Studio', 103, 1),
(613, 'Aula', 'Studio', 104, 1),
(614, 'Aula', 'Studio', 105, 1),
(615, 'Aula', 'Studio', 106, 1),
(616, 'Aula', 'Studio', 107, 1),
(617, 'Aula', 'Studio', 108, 1),
(618, 'Aula', 'Studio', 109, 1),
(619, 'Aula', 'Studio', 110, 1),
(620, 'Aula', 'Studio', 101, 2),
(621, 'Aula', 'Studio', 102, 2),
(622, 'Aula', 'Studio', 103, 2),
(623, 'Aula', 'Studio', 104, 2),
(624, 'Aula', 'Studio', 105, 2),
(625, 'Aula', 'Studio', 106, 2),
(626, 'Aula', 'Studio', 107, 2),
(627, 'Aula', 'Studio', 108, 2),
(628, 'Aula', 'Studio', 109, 2),
(629, 'Aula', 'Studio', 110, 2),
(630, 'Aula', 'Studio', 101, 3),
(631, 'Aula', 'Studio', 102, 3),
(632, 'Aula', 'Studio', 103, 3),
(633, 'Aula', 'Studio', 104, 3),
(634, 'Aula', 'Studio', 105, 3),
(635, 'Aula', 'Studio', 106, 3),
(636, 'Aula', 'Studio', 107, 3),
(637, 'Aula', 'Studio', 108, 3),
(638, 'Aula', 'Studio', 109, 3),
(639, 'Aula', 'Studio', 110, 3),
(640, 'Aula', 'Studio', 101, 4),
(641, 'Aula', 'Studio', 102, 4),
(642, 'Aula', 'Studio', 103, 4),
(643, 'Aula', 'Studio', 104, 4),
(644, 'Aula', 'Studio', 105, 4),
(645, 'Aula', 'Studio', 106, 4),
(646, 'Aula', 'Studio', 107, 4),
(647, 'Aula', 'Studio', 108, 4),
(648, 'Aula', 'Studio', 109, 4),
(649, 'Aula', 'Studio', 110, 4),
(650, 'Aula', 'Studio', 101, 5),
(651, 'Aula', 'Studio', 102, 5),
(652, 'Aula', 'Studio', 103, 5),
(653, 'Aula', 'Studio', 104, 5),
(654, 'Aula', 'Studio', 105, 5),
(655, 'Aula', 'Studio', 106, 5),
(656, 'Aula', 'Studio', 107, 5),
(657, 'Aula', 'Studio', 108, 5),
(658, 'Aula', 'Studio', 109, 5),
(659, 'Aula', 'Studio', 110, 5),
(660, 'Aula', 'Studio', 101, 6),
(661, 'Aula', 'Studio', 102, 6),
(662, 'Aula', 'Studio', 103, 6),
(663, 'Aula', 'Studio', 104, 6),
(664, 'Aula', 'Studio', 105, 6),
(665, 'Aula', 'Studio', 106, 6),
(666, 'Aula', 'Studio', 107, 6),
(667, 'Aula', 'Studio', 108, 6),
(668, 'Aula', 'Studio', 109, 6),
(669, 'Aula', 'Studio', 110, 6),
(670, 'Aula', 'Studio', 101, 7),
(671, 'Aula', 'Studio', 102, 7),
(672, 'Aula', 'Studio', 103, 7),
(673, 'Aula', 'Studio', 104, 7),
(674, 'Aula', 'Studio', 105, 7),
(675, 'Aula', 'Studio', 106, 7),
(676, 'Aula', 'Studio', 107, 7),
(677, 'Aula', 'Studio', 108, 7),
(678, 'Aula', 'Studio', 109, 7),
(679, 'Aula', 'Studio', 110, 7),
(680, 'Aula', 'Studio', 101, 8),
(681, 'Aula', 'Studio', 102, 8),
(682, 'Aula', 'Studio', 103, 8),
(683, 'Aula', 'Studio', 104, 8),
(684, 'Aula', 'Studio', 105, 8),
(685, 'Aula', 'Studio', 106, 8),
(686, 'Aula', 'Studio', 107, 8),
(687, 'Aula', 'Studio', 108, 8),
(688, 'Aula', 'Studio', 109, 8),
(689, 'Aula', 'Studio', 110, 8),
(690, 'Aula', 'Studio', 101, 9),
(691, 'Aula', 'Studio', 102, 9),
(692, 'Aula', 'Studio', 103, 9),
(693, 'Aula', 'Studio', 104, 9),
(694, 'Aula', 'Studio', 105, 9),
(695, 'Aula', 'Studio', 106, 9),
(696, 'Aula', 'Studio', 107, 9),
(697, 'Aula', 'Studio', 108, 9),
(698, 'Aula', 'Studio', 109, 9),
(699, 'Aula', 'Studio', 110, 9),
(700, 'Aula', 'Studio', 101, 10),
(701, 'Aula', 'Studio', 102, 10),
(702, 'Aula', 'Studio', 103, 10),
(703, 'Aula', 'Studio', 104, 10),
(704, 'Aula', 'Studio', 105, 10),
(705, 'Aula', 'Studio', 106, 10),
(706, 'Aula', 'Studio', 107, 10),
(707, 'Aula', 'Studio', 108, 10),
(708, 'Aula', 'Studio', 109, 10),
(709, 'Aula', 'Studio', 110, 10),
(710, 'Aula', 'Studio', 101, 11),
(711, 'Aula', 'Studio', 102, 11),
(712, 'Aula', 'Studio', 103, 11),
(713, 'Aula', 'Studio', 104, 11),
(714, 'Aula', 'Studio', 105, 11),
(715, 'Aula', 'Studio', 106, 11),
(716, 'Aula', 'Studio', 107, 11),
(717, 'Aula', 'Studio', 108, 11),
(718, 'Aula', 'Studio', 109, 11),
(719, 'Aula', 'Studio', 110, 11),
(720, 'Aula', 'Studio', 101, 12),
(721, 'Aula', 'Studio', 102, 12),
(722, 'Aula', 'Studio', 103, 12),
(723, 'Aula', 'Studio', 104, 12),
(724, 'Aula', 'Studio', 105, 12),
(725, 'Aula', 'Studio', 106, 12),
(726, 'Aula', 'Studio', 107, 12),
(727, 'Aula', 'Studio', 108, 12),
(728, 'Aula', 'Studio', 109, 12),
(729, 'Aula', 'Studio', 110, 12),
(730, 'Aula', 'Relax', 101, 1),
(731, 'Aula', 'Relax', 102, 1),
(732, 'Aula', 'Relax', 103, 1),
(733, 'Aula', 'Relax', 104, 1),
(734, 'Aula', 'Relax', 105, 1),
(735, 'Aula', 'Relax', 106, 1),
(736, 'Aula', 'Relax', 107, 1),
(737, 'Aula', 'Relax', 108, 1),
(738, 'Aula', 'Relax', 109, 1),
(739, 'Aula', 'Relax', 110, 1),
(740, 'Aula', 'Relax', 101, 2),
(741, 'Aula', 'Relax', 102, 2),
(742, 'Aula', 'Relax', 103, 2),
(743, 'Aula', 'Relax', 104, 2),
(744, 'Aula', 'Relax', 105, 2),
(745, 'Aula', 'Relax', 106, 2),
(746, 'Aula', 'Relax', 107, 2),
(747, 'Aula', 'Relax', 108, 2),
(748, 'Aula', 'Relax', 109, 2),
(749, 'Aula', 'Relax', 110, 2),
(750, 'Aula', 'Relax', 101, 3),
(751, 'Aula', 'Relax', 102, 3),
(752, 'Aula', 'Relax', 103, 3),
(753, 'Aula', 'Relax', 104, 3),
(754, 'Aula', 'Relax', 105, 3),
(755, 'Aula', 'Relax', 106, 3),
(756, 'Aula', 'Relax', 107, 3),
(757, 'Aula', 'Relax', 108, 3),
(758, 'Aula', 'Relax', 109, 3),
(759, 'Aula', 'Relax', 110, 3),
(760, 'Aula', 'Relax', 101, 4),
(761, 'Aula', 'Relax', 102, 4),
(762, 'Aula', 'Relax', 103, 4),
(763, 'Aula', 'Relax', 104, 4),
(764, 'Aula', 'Relax', 105, 4),
(765, 'Aula', 'Relax', 106, 4),
(766, 'Aula', 'Relax', 107, 4),
(767, 'Aula', 'Relax', 108, 4),
(768, 'Aula', 'Relax', 109, 4),
(769, 'Aula', 'Relax', 110, 4),
(770, 'Aula', 'Relax', 101, 5),
(771, 'Aula', 'Relax', 102, 5),
(772, 'Aula', 'Relax', 103, 5),
(773, 'Aula', 'Relax', 104, 5),
(774, 'Aula', 'Relax', 105, 5),
(775, 'Aula', 'Relax', 106, 5),
(776, 'Aula', 'Relax', 107, 5),
(777, 'Aula', 'Relax', 108, 5),
(778, 'Aula', 'Relax', 109, 5),
(779, 'Aula', 'Relax', 110, 5),
(780, 'Aula', 'Relax', 101, 6),
(781, 'Aula', 'Relax', 102, 6),
(782, 'Aula', 'Relax', 103, 6),
(783, 'Aula', 'Relax', 104, 6),
(784, 'Aula', 'Relax', 105, 6),
(785, 'Aula', 'Relax', 106, 6),
(786, 'Aula', 'Relax', 107, 6),
(787, 'Aula', 'Relax', 108, 6),
(788, 'Aula', 'Relax', 109, 6),
(789, 'Aula', 'Relax', 110, 6),
(790, 'Aula', 'Relax', 101, 7),
(791, 'Aula', 'Relax', 102, 7),
(792, 'Aula', 'Relax', 103, 7),
(793, 'Aula', 'Relax', 104, 7),
(794, 'Aula', 'Relax', 105, 7),
(795, 'Aula', 'Relax', 106, 7),
(796, 'Aula', 'Relax', 107, 7),
(797, 'Aula', 'Relax', 108, 7),
(798, 'Aula', 'Relax', 109, 7),
(799, 'Aula', 'Relax', 110, 7),
(800, 'Aula', 'Relax', 101, 8),
(801, 'Aula', 'Relax', 102, 8),
(802, 'Aula', 'Relax', 103, 8),
(803, 'Aula', 'Relax', 104, 8),
(804, 'Aula', 'Relax', 105, 8),
(805, 'Aula', 'Relax', 106, 8),
(806, 'Aula', 'Relax', 107, 8),
(807, 'Aula', 'Relax', 108, 8),
(808, 'Aula', 'Relax', 109, 8),
(809, 'Aula', 'Relax', 110, 8),
(810, 'Aula', 'Relax', 101, 9),
(811, 'Aula', 'Relax', 102, 9),
(812, 'Aula', 'Relax', 103, 9),
(813, 'Aula', 'Relax', 104, 9),
(814, 'Aula', 'Relax', 105, 9),
(815, 'Aula', 'Relax', 106, 9),
(816, 'Aula', 'Relax', 107, 9),
(817, 'Aula', 'Relax', 108, 9),
(818, 'Aula', 'Relax', 109, 9),
(819, 'Aula', 'Relax', 110, 9),
(820, 'Aula', 'Relax', 101, 10),
(821, 'Aula', 'Relax', 102, 10),
(822, 'Aula', 'Relax', 103, 10),
(823, 'Aula', 'Relax', 104, 10),
(824, 'Aula', 'Relax', 105, 10),
(825, 'Aula', 'Relax', 106, 10),
(826, 'Aula', 'Relax', 107, 10),
(827, 'Aula', 'Relax', 108, 10),
(828, 'Aula', 'Relax', 109, 10),
(829, 'Aula', 'Relax', 110, 10),
(830, 'Aula', 'Relax', 101, 11),
(831, 'Aula', 'Relax', 102, 11),
(832, 'Aula', 'Relax', 103, 11),
(833, 'Aula', 'Relax', 104, 11),
(834, 'Aula', 'Relax', 105, 11),
(835, 'Aula', 'Relax', 106, 11),
(836, 'Aula', 'Relax', 107, 11),
(837, 'Aula', 'Relax', 108, 11),
(838, 'Aula', 'Relax', 109, 11),
(839, 'Aula', 'Relax', 110, 11),
(840, 'Aula', 'Relax', 101, 12),
(841, 'Aula', 'Relax', 102, 12),
(842, 'Aula', 'Relax', 103, 12),
(843, 'Aula', 'Relax', 104, 12),
(844, 'Aula', 'Relax', 105, 12),
(845, 'Aula', 'Relax', 106, 12),
(846, 'Aula', 'Relax', 107, 12),
(847, 'Aula', 'Relax', 108, 12),
(848, 'Aula', 'Relax', 109, 12),
(849, 'Aula', 'Relax', 110, 12),
(850, 'Bagno', NULL, 101, 1),
(851, 'Bagno', NULL, 102, 1),
(852, 'Bagno', NULL, 103, 1),
(853, 'Bagno', NULL, 104, 1),
(854, 'Bagno', NULL, 105, 1),
(855, 'Bagno', NULL, 101, 2),
(856, 'Bagno', NULL, 102, 2),
(857, 'Bagno', NULL, 103, 2),
(858, 'Bagno', NULL, 104, 2),
(859, 'Bagno', NULL, 105, 2),
(860, 'Bagno', NULL, 101, 3),
(861, 'Bagno', NULL, 102, 3),
(862, 'Bagno', NULL, 103, 3),
(863, 'Bagno', NULL, 104, 3),
(864, 'Bagno', NULL, 105, 3),
(865, 'Bagno', NULL, 101, 4),
(866, 'Bagno', NULL, 102, 4),
(867, 'Bagno', NULL, 103, 4),
(868, 'Bagno', NULL, 104, 4),
(869, 'Bagno', NULL, 105, 4),
(870, 'Bagno', NULL, 101, 5),
(871, 'Bagno', NULL, 102, 5),
(872, 'Bagno', NULL, 103, 5),
(873, 'Bagno', NULL, 104, 5),
(874, 'Bagno', NULL, 105, 5),
(875, 'Bagno', NULL, 101, 6),
(876, 'Bagno', NULL, 102, 6),
(877, 'Bagno', NULL, 103, 6),
(878, 'Bagno', NULL, 104, 6),
(879, 'Bagno', NULL, 105, 6),
(880, 'Bagno', NULL, 101, 7),
(881, 'Bagno', NULL, 102, 7),
(882, 'Bagno', NULL, 103, 7),
(883, 'Bagno', NULL, 104, 7),
(884, 'Bagno', NULL, 105, 7),
(885, 'Bagno', NULL, 101, 8),
(886, 'Bagno', NULL, 102, 8),
(887, 'Bagno', NULL, 103, 8),
(888, 'Bagno', NULL, 104, 8),
(889, 'Bagno', NULL, 105, 8),
(890, 'Bagno', NULL, 101, 9),
(891, 'Bagno', NULL, 102, 9),
(892, 'Bagno', NULL, 103, 9),
(893, 'Bagno', NULL, 104, 9),
(894, 'Bagno', NULL, 105, 9),
(895, 'Bagno', NULL, 101, 10),
(896, 'Bagno', NULL, 102, 10),
(897, 'Bagno', NULL, 103, 10),
(898, 'Bagno', NULL, 104, 10),
(899, 'Bagno', NULL, 105, 10),
(900, 'Bagno', NULL, 101, 11),
(901, 'Bagno', NULL, 102, 11),
(902, 'Bagno', NULL, 103, 11),
(903, 'Bagno', NULL, 104, 11),
(904, 'Bagno', NULL, 105, 11),
(905, 'Bagno', NULL, 101, 12),
(906, 'Bagno', NULL, 102, 12),
(907, 'Bagno', NULL, 103, 12),
(908, 'Bagno', NULL, 104, 12),
(909, 'Bagno', NULL, 105, 12),
(910, 'Corridoio', 'Interno', 1, 1),
(911, 'Corridoio', 'Interno', 2, 1),
(912, 'Corridoio', 'Interno', 3, 1),
(913, 'Corridoio', 'Interno', 4, 1),
(914, 'Corridoio', 'Interno', 5, 1),
(915, 'Corridoio', 'Interno', 1, 2),
(916, 'Corridoio', 'Interno', 2, 2),
(917, 'Corridoio', 'Interno', 3, 2),
(918, 'Corridoio', 'Interno', 4, 2),
(919, 'Corridoio', 'Interno', 5, 2),
(920, 'Corridoio', 'Interno', 1, 3),
(921, 'Corridoio', 'Interno', 2, 3),
(922, 'Corridoio', 'Interno', 3, 3),
(923, 'Corridoio', 'Interno', 4, 3),
(924, 'Corridoio', 'Interno', 5, 3),
(925, 'Corridoio', 'Interno', 1, 4),
(926, 'Corridoio', 'Interno', 2, 4),
(927, 'Corridoio', 'Interno', 3, 4),
(928, 'Corridoio', 'Interno', 4, 4),
(929, 'Corridoio', 'Interno', 5, 4),
(930, 'Corridoio', 'Interno', 1, 5),
(931, 'Corridoio', 'Interno', 2, 5),
(932, 'Corridoio', 'Interno', 3, 5),
(933, 'Corridoio', 'Interno', 4, 5),
(934, 'Corridoio', 'Interno', 5, 5),
(935, 'Corridoio', 'Interno', 1, 6),
(936, 'Corridoio', 'Interno', 2, 6),
(937, 'Corridoio', 'Interno', 3, 6),
(938, 'Corridoio', 'Interno', 4, 6),
(939, 'Corridoio', 'Interno', 5, 6),
(940, 'Corridoio', 'Interno', 1, 7),
(941, 'Corridoio', 'Interno', 2, 7),
(942, 'Corridoio', 'Interno', 3, 7),
(943, 'Corridoio', 'Interno', 4, 7),
(944, 'Corridoio', 'Interno', 5, 7),
(945, 'Corridoio', 'Interno', 1, 8),
(946, 'Corridoio', 'Interno', 2, 8),
(947, 'Corridoio', 'Interno', 3, 8),
(948, 'Corridoio', 'Interno', 4, 8),
(949, 'Corridoio', 'Interno', 5, 8),
(950, 'Corridoio', 'Interno', 1, 9),
(951, 'Corridoio', 'Interno', 2, 9),
(952, 'Corridoio', 'Interno', 3, 9),
(953, 'Corridoio', 'Interno', 4, 9),
(954, 'Corridoio', 'Interno', 5, 9),
(955, 'Corridoio', 'Interno', 1, 10),
(956, 'Corridoio', 'Interno', 2, 10),
(957, 'Corridoio', 'Interno', 3, 10),
(958, 'Corridoio', 'Interno', 4, 10),
(959, 'Corridoio', 'Interno', 5, 10),
(960, 'Corridoio', 'Interno', 1, 11),
(961, 'Corridoio', 'Interno', 2, 11),
(962, 'Corridoio', 'Interno', 3, 11),
(963, 'Corridoio', 'Interno', 4, 11),
(964, 'Corridoio', 'Interno', 5, 11),
(965, 'Corridoio', 'Interno', 1, 12),
(966, 'Corridoio', 'Interno', 2, 12),
(967, 'Corridoio', 'Interno', 3, 12),
(968, 'Corridoio', 'Interno', 4, 12),
(969, 'Corridoio', 'Interno', 5, 12),
(970, 'Segreteria', NULL, 1, 1),
(971, 'Segreteria', NULL, 1, 2),
(972, 'Segreteria', NULL, 1, 3),
(973, 'Segreteria', NULL, 1, 4),
(974, 'Segreteria', NULL, 1, 5),
(975, 'Segreteria', NULL, 1, 6),
(976, 'Segreteria', NULL, 1, 7),
(977, 'Segreteria', NULL, 1, 8),
(978, 'Segreteria', NULL, 1, 9),
(979, 'Segreteria', NULL, 1, 10),
(980, 'Segreteria', NULL, 1, 11),
(981, 'Segreteria', NULL, 1, 12),
(982, 'Ufficio', NULL, 101, 1),
(983, 'Ufficio', NULL, 102, 1),
(984, 'Ufficio', NULL, 103, 1),
(985, 'Ufficio', NULL, 104, 1),
(986, 'Ufficio', NULL, 105, 1),
(987, 'Ufficio', NULL, 101, 2),
(988, 'Ufficio', NULL, 102, 2),
(989, 'Ufficio', NULL, 103, 2),
(990, 'Ufficio', NULL, 104, 2),
(991, 'Ufficio', NULL, 105, 2),
(992, 'Ufficio', NULL, 101, 3),
(993, 'Ufficio', NULL, 102, 3),
(994, 'Ufficio', NULL, 103, 3),
(995, 'Ufficio', NULL, 104, 3),
(996, 'Ufficio', NULL, 105, 3),
(997, 'Ufficio', NULL, 101, 4),
(998, 'Ufficio', NULL, 102, 4),
(999, 'Ufficio', NULL, 103, 4),
(1000, 'Ufficio', NULL, 104, 4),
(1001, 'Ufficio', NULL, 105, 4),
(1002, 'Ufficio', NULL, 101, 5),
(1003, 'Ufficio', NULL, 102, 5),
(1004, 'Ufficio', NULL, 103, 5),
(1005, 'Ufficio', NULL, 104, 5),
(1006, 'Ufficio', NULL, 105, 5),
(1007, 'Ufficio', NULL, 101, 6),
(1008, 'Ufficio', NULL, 102, 6),
(1009, 'Ufficio', NULL, 103, 6),
(1010, 'Ufficio', NULL, 104, 6),
(1011, 'Ufficio', NULL, 105, 6),
(1012, 'Ufficio', NULL, 101, 7),
(1013, 'Ufficio', NULL, 102, 7),
(1014, 'Ufficio', NULL, 103, 7),
(1015, 'Ufficio', NULL, 104, 7),
(1016, 'Ufficio', NULL, 105, 7),
(1017, 'Ufficio', NULL, 101, 8),
(1018, 'Ufficio', NULL, 102, 8),
(1019, 'Ufficio', NULL, 103, 8),
(1020, 'Ufficio', NULL, 104, 8),
(1021, 'Ufficio', NULL, 105, 8),
(1022, 'Ufficio', NULL, 101, 9),
(1023, 'Ufficio', NULL, 102, 9),
(1024, 'Ufficio', NULL, 103, 9),
(1025, 'Ufficio', NULL, 104, 9),
(1026, 'Ufficio', NULL, 105, 9),
(1027, 'Ufficio', NULL, 101, 10),
(1028, 'Ufficio', NULL, 102, 10),
(1029, 'Ufficio', NULL, 103, 10),
(1030, 'Ufficio', NULL, 104, 10),
(1031, 'Ufficio', NULL, 105, 10),
(1032, 'Ufficio', NULL, 101, 11),
(1033, 'Ufficio', NULL, 102, 11),
(1034, 'Ufficio', NULL, 103, 11),
(1035, 'Ufficio', NULL, 104, 11),
(1036, 'Ufficio', NULL, 105, 11),
(1037, 'Ufficio', NULL, 101, 12),
(1038, 'Ufficio', NULL, 102, 12),
(1039, 'Ufficio', NULL, 103, 12),
(1040, 'Ufficio', NULL, 104, 12),
(1041, 'Ufficio', NULL, 105, 12),
(1042, 'Biblioteca', NULL, 1, 1),
(1043, 'Biblioteca', NULL, 1, 2),
(1044, 'Biblioteca', NULL, 1, 3),
(1045, 'Biblioteca', NULL, 1, 4),
(1046, 'Biblioteca', NULL, 1, 5),
(1047, 'Biblioteca', NULL, 1, 6),
(1048, 'Biblioteca', NULL, 1, 7),
(1049, 'Biblioteca', NULL, 1, 8),
(1050, 'Biblioteca', NULL, 1, 9),
(1051, 'Biblioteca', NULL, 1, 10),
(1052, 'Biblioteca', NULL, 1, 11),
(1053, 'Biblioteca', NULL, 1, 12),
(1054, 'Biblioteca', NULL, 2, 1),
(1055, 'Biblioteca', NULL, 2, 2),
(1056, 'Biblioteca', NULL, 2, 3),
(1057, 'Biblioteca', NULL, 2, 4),
(1058, 'Biblioteca', NULL, 2, 5),
(1059, 'Biblioteca', NULL, 2, 6),
(1060, 'Biblioteca', NULL, 2, 7),
(1061, 'Biblioteca', NULL, 2, 8),
(1062, 'Biblioteca', NULL, 2, 9),
(1063, 'Biblioteca', NULL, 2, 10),
(1064, 'Biblioteca', NULL, 2, 11),
(1065, 'Biblioteca', NULL, 2, 12),
(1066, 'Laboratorio', 'Geocartografico', 1, 1),
(1067, 'Laboratorio', 'Informatico', 1, 1),
(1068, 'Laboratorio', 'Audiovisivo', 1, 1),
(1069, 'Laboratorio', 'Informatico', 1, 2),
(1070, 'Laboratorio', 'Linguistico', 1, 2),
(1071, 'Laboratorio', 'Informatico', 1, 3),
(1072, 'Laboratorio', 'Fisica Tecnica', 1, 4),
(1073, 'Laboratorio', 'Fisica Tecnica', 2, 4),
(1074, 'Laboratorio', 'Geotecnica', 1, 4),
(1075, 'Laboratorio', 'Idraulica', 1, 4),
(1076, 'Laboratorio', '4R', 1, 4),
(1077, 'Laboratorio', 'Prove Materiali', 1, 4),
(1078, 'Laboratorio', 'Informatico', 1, 4),
(1079, 'Laboratorio', 'Automazione e Robotica', 1, 4),
(1080, 'Laboratorio', 'CAD Elettronico', 1, 4),
(1081, 'Laboratorio', 'Comunicazione Wireless', 1, 4),
(1082, 'Laboratorio', 'Crescita Materiali Organici e Compositi', 1, 4),
(1083, 'Laboratorio', 'Controlli Automatici', 1, 4),
(1084, 'Laboratorio', 'Elettronica', 1, 4),
(1085, 'Laboratorio', 'Elettronica delle Microonde', 1, 4),
(1086, 'Laboratorio', 'Dispositivi e Sistemi Elettronici', 1, 4),
(1087, 'Laboratorio', 'Elettromagnetismo Computazionale', 1, 4),
(1088, 'Laboratorio', 'Magnetismo', 1, 4),
(1089, 'Laboratorio', 'Misure elettriche ed elettroniche', 1, 4),
(1090, 'Laboratorio', 'Sistemi Embedded', 1, 4),
(1091, 'Laboratorio', 'Convertitori e Azionamenti Elettrici', 1, 4),
(1092, 'Laboratorio', 'Macchine e sistemi per l’energia e l’ambiente', 1, 4),
(1093, 'Laboratorio', 'Materiali Polimerici', 1, 4),
(1094, 'Laboratorio', 'Meccanica', 1, 4),
(1095, 'Laboratorio', 'Microscopia Ottica', 1, 4),
(1096, 'Laboratorio', 'Morfologia', 1, 4),
(1097, 'Laboratorio', 'Vibrometria', 1, 4),
(1098, 'Laboratorio', 'Fisioterapia', 1, 5),
(1099, 'Laboratorio', 'Infermieristica', 1, 5),
(1100, 'Laboratorio', 'Neurofisiopatologia', 1, 5),
(1101, 'Laboratorio', 'Infermieristica Pediatrica', 1, 6),
(1102, 'Laboratorio', 'Logopedia', 1, 6),
(1103, 'Laboratorio', 'Ostetrico', 1, 6),
(1104, 'Laboratorio', 'Biomedico', 1, 7),
(1105, 'Laboratorio', 'Biotecnologico', 1, 7),
(1106, 'Laboratorio', 'Radiologico', 1, 7),
(1107, 'Laboratorio', 'Gastronomico', 1, 7),
(1108, 'Laboratorio', 'Ottico', 1, 7),
(1109, 'Laboratorio', 'Nanotecnologie', 1, 8),
(1110, 'Laboratorio', 'Genetico', 1, 8),
(1111, 'Laboratorio', 'Zoologia', 1, 8),
(1112, 'Laboratorio', 'Chimica Ambientale', 1, 8),
(1113, 'Laboratorio', 'Catalisi', 1, 8),
(1114, 'Laboratorio', 'Chimica', 1, 8),
(1115, 'Laboratorio', 'Tecnologia Farmaceutica', 1, 8),
(1116, 'Laboratorio', 'Estrazioni', 1, 8),
(1117, 'Laboratorio', 'Neuropsicologia', 1, 9),
(1118, 'Laboratorio', 'Psicologia Sperimentale', 1, 9),
(1119, 'Laboratorio', 'Psicofisiologia', 1, 9),
(1120, 'Laboratorio', 'Fisica Nucleare', 1, 10),
(1121, 'Laboratorio', 'Informatico', 1, 10),
(1122, 'Laboratorio', 'Sistemi Operativi', 1, 10),
(1123, 'Laboratorio', 'Fisica', 1, 10),
(1124, 'Laboratorio', 'Elettronica', 1, 10),
(1125, 'Laboratorio', 'Geochimica', 1, 10),
(1126, 'Laboratorio', 'Fisica Nucleare', 1, 10),
(1127, 'Laboratorio', 'Sociologia', 1, 11),
(1128, 'Laboratorio', 'Malattie Parassitarie', 1, 12),
(1129, 'Laboratorio', 'Patologia Veterinaria', 1, 12),
(1130, 'Laboratorio', 'Biochimica Veterinaria', 1, 12),
(1131, 'Laboratorio', 'Fisiologia Veterinaria', 1, 12);

-- --------------------------------------------------------

--
-- Struttura della tabella `personale_docente`
--

CREATE TABLE `personale_docente` (
  `id` int(5) NOT NULL,
  `nome` varchar(30) NOT NULL,
  `cognome` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `numero_di_telefono` varchar(10) DEFAULT NULL,
  `id_locale` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `personale_docente`
--

INSERT INTO `personale_docente` (`id`, `nome`, `cognome`, `email`, `numero_di_telefono`, `id_locale`) VALUES
(4, 'Arangio', 'Alessandro', 'alessandro.arangio@unime.it', NULL, 983),
(5, 'Antonino', 'Baglio', 'antonino.baglio@unime.it', NULL, 985),
(6, 'Giuseppe', 'Caridi', 'giuseppe.caridi@unime.it', NULL, 1067),
(7, 'Gustavo', 'Barresi', 'gustavo.barresi@unime.it', NULL, 987),
(8, 'Antonino', 'Costa', 'antonino.costa@unime.it', NULL, 989),
(9, 'Grazia', 'Calabrò', 'grazia.calabro@unime.it', NULL, 1070),
(10, 'Elena', 'La Rosa', 'elena.larosa@unime.it', NULL, 992),
(11, 'Carmela', 'Panella', 'carmela.panella@unime.it', NULL, 993),
(12, 'Mario', 'Trimarchi', 'mario.trimarchi@unime.it', NULL, 1071),
(13, 'Dario', 'Bruneo', 'dario.bruneo@unime.it', NULL, 997),
(14, 'Puliafito', 'Antonio', 'antonio.puliafito@unime.it', NULL, 999),
(15, 'Marco Lucio', 'Scarpa', 'marcolucio.scarpa@unime.it', NULL, 1077),
(16, 'Gioele', 'Bergamaschi', 'gioele.bergamaschi@unime.it', NULL, 1002),
(17, 'Alessandro', 'Napolitano', 'alessandro.napolitano@unime.it', NULL, 1003),
(18, 'Elisa', 'Milani', 'elisa.milani@unime.it', NULL, 1098),
(19, 'Isabella', 'Manione', 'isabella.manione@unime.it', NULL, 1009),
(20, 'Vincenzo', 'Adamo', 'vincenzo.adamo@unime.it', NULL, 1010),
(21, 'Irene', 'Castagna', 'irene.castagna@unime.it', NULL, 1101),
(22, 'Concetta', 'Beninadi', 'concetta.beninadi@unime.it', NULL, 1014),
(23, 'Salvatore', 'Campo', 'salvatore.campo@unime.it', NULL, 1015),
(24, 'Alessandra', 'Bitto', 'alessandra.bitto@unime.it', NULL, 1106),
(25, 'Salvatore', 'Giacobbe', 'salvatore.giacobbe@unime.it', NULL, 1018),
(26, 'Lorenzo', 'Torrisi', 'lorenzo.torrisi@unime.it', NULL, 1019),
(27, 'Ester', 'Tellone', 'ester.tellone@unime.it', NULL, 1109),
(28, 'Elvira', 'Assenza', 'elvira.assenza@unime.it', NULL, 1023),
(29, 'Rosalia', 'Cavalieri', 'rosalia.cavalieri@unime.it', NULL, 1025),
(30, 'Amelia', 'Gangemi', 'amelia.gangemi@unime.it', NULL, 1117),
(31, 'Gina', 'Puccio', 'gina.puccio@unime.it', NULL, 1028),
(32, 'Massimo', 'Villari', 'massimo.villari@unime.it', NULL, 1029),
(33, 'Andrea', 'Mandanici', 'andrea.mandanici@unime.it', NULL, 1123),
(34, 'Filadelfio', 'Mancuso', 'filadelfio.mancuso@unime.it', NULL, 1033),
(35, 'Maurizio', 'Lisciarda', 'maurizio.lisciarda@unime.it', NULL, 1034),
(36, 'Stefano', 'Morabito', 'stefano.morabito@unime.it', NULL, 1127),
(37, 'Elisabetta', 'Giudice', 'elisabetta.giudice@unime.it', NULL, 1039),
(38, 'Ugo', 'Muglia', 'ugo.muglia@unime.it', NULL, 1040),
(39, 'Giuseppe', 'Cucinotta', 'giuseppe.cucinotta@unime.it', NULL, 1131);

-- --------------------------------------------------------

--
-- Struttura della tabella `personale_tecnico_amministrativo`
--

CREATE TABLE `personale_tecnico_amministrativo` (
  `id` int(5) NOT NULL,
  `nome` varchar(10) NOT NULL,
  `cognome` varchar(10) NOT NULL,
  `email` varchar(30) NOT NULL,
  `numero_di_telefono` varchar(10) DEFAULT NULL,
  `id_locale` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `personale_tecnico_amministrativo`
--

INSERT INTO `personale_tecnico_amministrativo` (`id`, `nome`, `cognome`, `email`, `numero_di_telefono`, `id_locale`) VALUES
(1, 'Giuseppa', 'La Spada', 'giuseppa.laspada@unime.it', '0903593353', 970),
(2, 'Giovanna', 'Arrigo', 'giovanna.arrigo@unime.it', '0906764620', 971),
(3, 'Maurizio', 'Pinizzotto', 'maurizio.pinizzotto@unime.it', '0906766090', 972),
(4, 'Francesco', 'Siracusa', 'francesco.siracusa@unime.it', '0906765567', 973),
(5, 'Daniele', 'Salmeri', 'salmeri.daniele@unime.it', '0902212354', 974),
(6, 'Rosa Maria', 'Foti', 'rosamaria.foti@unime.it', '0902213891', 975),
(7, 'Francesco', 'Giliberto', 'francesco.giliberto@unime.it', '0902213204', 976),
(8, 'Leonarda', 'Urzi', 'dina.urzi@unime.it', '090392721', 977),
(9, 'Giuseppe', 'D\'attila', 'giuseppe.dattila@unime.it', '09051940', 978),
(10, 'Antonino', 'Denaro', 'antonino.denaro@unime.it', '0906765010', 979),
(11, 'Claudia', 'Pagano', 'claudia.pagano@unime.it', '0906768170', 980),
(12, 'Giuseppe', 'Cardile', ' cardile.giuseppe@unime.it', '090692449', 981);

-- --------------------------------------------------------

--
-- Struttura della tabella `problema`
--

CREATE TABLE `problema` (
  `id_problema` int(5) NOT NULL,
  `priorita` varchar(10) NOT NULL,
  `descrizione` varchar(280) NOT NULL,
  `data_segnalazione` date NOT NULL,
  `id_utente` int(5) DEFAULT NULL,
  `id_tecnico` int(5) DEFAULT NULL,
  `id_docente` int(5) DEFAULT NULL,
  `id_dipartimento` int(5) DEFAULT NULL,
  `id_locale` int(5) DEFAULT NULL,
  `id_categoria` int(5) DEFAULT NULL,
  `stato` varchar(30) NOT NULL DEFAULT 'Incompleto'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `specializzazione`
--

CREATE TABLE `specializzazione` (
  `id_specializzazione` int(5) NOT NULL,
  `professione` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `specializzazione`
--

INSERT INTO `specializzazione` (`id_specializzazione`, `professione`) VALUES
(1, 'Elettricista'),
(2, 'Informatico'),
(3, 'Idraulico'),
(4, 'Operatore Edile');

-- --------------------------------------------------------

--
-- Struttura della tabella `tecnico`
--

CREATE TABLE `tecnico` (
  `id` int(5) NOT NULL,
  `nome` varchar(20) NOT NULL,
  `cognome` varchar(20) NOT NULL,
  `email` varchar(30) NOT NULL,
  `numero_di_telefono` varchar(10) DEFAULT NULL,
  `inizio_contratto` date DEFAULT NULL,
  `fine_contratto` date DEFAULT NULL,
  `specializzazione` varchar(20) DEFAULT NULL,
  `id_dipartimento` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `tecnico`
--

INSERT INTO `tecnico` (`id`, `nome`, `cognome`, `email`, `numero_di_telefono`, `inizio_contratto`, `fine_contratto`, `specializzazione`, `id_dipartimento`) VALUES
(0, 'Paolo', 'Messina', 'paolo.messina@unime.it', '3784512362', '2020-01-07', '2022-01-07', 'Edilizia', 1),
(1, 'Mario', 'Rossi', 'mario.rossi@unime.it', '3452175987', '2019-12-02', '2022-05-05', 'Elettricista', 1),
(2, 'Francesco', 'Bianchi', 'francesco.bianchi@unime.it', '3217865412', '2020-03-08', '2022-04-08', 'Informatico', 1),
(3, 'Marco', 'Verdi', 'marco.verdi@unime.it', '3469574152', '2019-06-03', '2021-06-02', 'Idraulico', 1),
(8, 'Alessandro', 'Ferrari', 'alessandro.ferrari@unime.it', '3549685475', '2018-04-01', '2022-04-01', 'Elettricista', 2),
(9, 'Elena', 'Gallo', 'elena.gallo@unime.it', '3487425820', '2017-04-15', '2021-04-15', 'Informatico', 2),
(10, 'Federica', 'Romano', 'federica.romano@unime.it', '3475123232', '2018-10-03', '2022-10-03', 'Idraulico', 2),
(11, 'Mario', 'Russo', 'mario.russo@unime.it', '3491072589', '2017-11-08', '2021-11-08', 'Edilizia', 2),
(12, 'Adriano', 'Esposito', 'adriano.esposito@unime.it', '3202596874', '2019-05-17', '2023-05-17', 'Elettricista', 3),
(13, 'Salvatore', 'Greco', 'salvatore.greco@unime.it', '3455896785', '2020-01-21', '2024-01-21', 'Informatico', 3),
(14, 'Michelangelo', 'Colombo', 'michelangelo.colombo@unime.it', '3359069840', '2017-12-10', '2021-12-10', 'Idraulico', 3),
(15, 'Bartolo', 'Mancini', 'bartolo.mancini@unime.it', '3496525632', '2018-02-26', '2022-02-26', 'Edilizia', 3),
(16, 'Sebastiano', 'Ferrara', 'sebastiano.ferrara@unime.it', '3331785050', '2017-03-24', '2021-03-24', 'Elettricista', 4),
(17, 'Fabrizio', 'Santoro', 'fabrizio.santoro@unime.it', '3365478124', '2018-09-02', '2022-09-02', 'Informatico', 4),
(18, 'Anselmo', 'Marini', 'anselmo.marini@unime.it', '3349685475', '2019-06-22', '2023-06-22', 'Idraulico', 4),
(19, 'Matteo', 'Conte', 'matteo.conte@unime.it', '3398975741', '2019-10-05', '2023-10-05', 'Edilizia', 4),
(20, 'Ettore', 'Serra', 'ettore.serra@unime.it', '3339823517', '2020-02-05', '2024-02-05', 'Elettricista', 5),
(21, 'Silvia', 'Leone', 'siliva.leone@unime.it', '3329683275', '2018-11-09', '2022-11-09', 'Informatico', 5),
(22, 'Carmine', 'Barbieri', 'carmine.barbieri@unime.it', '3494125412', '2018-09-27', '2022-09-27', 'Idraulico', 5),
(23, 'Tommaso', 'Ferri', 'tommaso.ferri@unime.it', '3312541542', '2019-04-12', '2023-04-12', 'Edilizia', 5),
(24, 'Valerio', 'Mazza', 'valerio.mazza@unime.it', '3494134454', '2017-06-15', '2021-06-15', 'Elettricista', 6),
(25, 'Flavia', 'Vitale', 'flavia.vitale@unime.it', '3456985475', '2018-05-29', '2022-05-29', 'Informatico', 6),
(26, 'Bruno', 'Parisi', 'bruno.parisi@unime.it', '3911257485', '2018-03-21', '2022-03-21', 'Idraulico', 6),
(27, 'Umberto', 'Martino', 'umberto.martino@unime.it', '3317585254', '2020-02-16', '2024-02-16', 'Edilizia', 6),
(28, 'Michele', 'Violi', 'michele.violi@unime.it', '3998136951', '2018-11-08', '2022-11-08', 'Elettricista', 7),
(29, 'Clemente', 'Silvestri', 'clemente.silvestri@unime.it', '3517464259', '2019-06-02', '2023-06-02', 'Informatico', 7),
(30, 'Emanuele', 'Pellegrino', 'emanuele.pellegrino@unime.it', '3341937826', '2017-12-19', '2021-12-19', 'Idraulico', 7),
(31, 'Santo', 'Barone', 'santo.barone@unime.it', '3494130520', '2019-07-11', '2023-07-11', 'Edilizia', 7),
(32, 'Francesco', 'Piazza', 'francesco.piazza@unime.it', '3908641356', '2019-05-30', '2023-05-30', 'Elettricista', 8),
(33, 'Ferdinando', 'Moro', 'ferdinando.moro@unime.it', '3494095781', '2017-03-28', '2021-03-28', 'Informatico', 8),
(34, 'Armando', 'Caputo', 'armando.caputo@unime.it', '3356955475', '2018-01-28', '2022-01-28', 'Idraulico', 8),
(35, 'Daniele', 'Giuliani', 'daniele.giuliani@unime.it', '3302586741', '2018-07-18', '2022-07-18', 'Edilizia', 8),
(36, 'Elisabetta', 'Sala', 'elisabetta.sala@unime.it', '3447531965', '2020-02-18', '2024-02-18', 'Elettricista', 9),
(37, 'Costanzo', 'Battaglia', 'costanzo.battaglia@unime.it', '3897541690', '2017-06-06', '2021-06-06', 'Informatico', 9),
(38, 'Augusto', 'Poli', 'augusto.poli@unime.it', '3332598756', '2019-09-17', '2023-09-17', 'Idraulico', 9),
(39, 'Edoardo', 'Alberti', 'edoardo.alberti@unime.it', '3455896512', '2019-10-16', '2023-10-16', 'Edilizia', 9),
(40, 'Benito', 'Romeo', 'benito.romeo@unime.it', '3496674514', '2020-01-13', '2024-01-13', 'Elettricista', 10),
(41, 'Antonio', 'Rossi', 'antonio.rossi@unime.it', '3485175269', '2017-07-01', '2021-07-01', 'Informatico', 10),
(42, 'Giovanni', 'Lorenzini', 'giovanni.lorenzini@unime.it', '3319870410', '2019-05-17', '2023-05-17', 'Idraulico', 10),
(43, 'Armando', 'Catanese', 'armando.catanese@unime.it', '3455040210', '2019-04-23', '2023-04-23', 'Edilizia', 10),
(44, 'Raffaele', 'Benedetti', 'raffaele.benedetti@unime.it', '3881594095', '2018-12-16', '2022-12-16', 'Elettricista', 11),
(45, 'Diego', 'Spinelli', 'diego.spinelli@unime.it', '3489571025', '2018-04-27', '2022-04-27', 'Informatico', 11),
(46, 'Cosimo', 'Bassi', 'cosimo.bassi@unime.it', '3880881745', '2019-08-30', '2023-08-30', 'Idraulico', 11),
(47, 'Enzo', 'Valente', 'enzo.valente@unime.it', '3914525951', '2017-09-15', '2021-09-15', 'Edilizia', 11),
(48, 'Fiorella', 'Coppola', 'fiorella.coppola@unime.it', '3543685475', '2018-09-13', '2022-09-13', 'Elettricista', 12),
(49, 'Attilio', 'Molinari', 'attilio.molinari@unime.it', '3475125632', '2020-01-17', '2024-01-17', 'Informatico', 12),
(50, 'Domenico', 'Moretti', 'domenico.moretti@unime.it', '3470082654', '2017-03-19', '2021-03-19', 'Idraulico', 12),
(51, 'Davide', 'Rizzo', 'davide.rizzo@unime.it', '3501485742', '2019-07-08', '2023-07-08', 'Edilizia', 12);

-- --------------------------------------------------------

--
-- Struttura della tabella `utente`
--

CREATE TABLE `utente` (
  `id` int(5) NOT NULL,
  `nome` varchar(10) NOT NULL,
  `cognome` varchar(10) NOT NULL,
  `email` varchar(30) NOT NULL,
  `numero_di_telefono` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `assistente`
--
ALTER TABLE `assistente`
  ADD PRIMARY KEY (`id`),
  ADD KEY `assistente_ibfk_1` (`id_docente`),
  ADD KEY `id_locale` (`id_locale`);

--
-- Indici per le tabelle `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indici per le tabelle `corso_laurea`
--
ALTER TABLE `corso_laurea`
  ADD PRIMARY KEY (`id_corso`),
  ADD KEY `id_dipartimento` (`id_dipartimento`);

--
-- Indici per le tabelle `credenziali`
--
ALTER TABLE `credenziali`
  ADD PRIMARY KEY (`email`) USING BTREE,
  ADD KEY `id_direttore` (`id_direttore`),
  ADD KEY `id_tecnico` (`id_tecnico`);

--
-- Indici per le tabelle `dipartimento`
--
ALTER TABLE `dipartimento`
  ADD PRIMARY KEY (`id_dipartimento`),
  ADD KEY `id_direttore` (`id_direttore`);

--
-- Indici per le tabelle `direttore`
--
ALTER TABLE `direttore`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `locale`
--
ALTER TABLE `locale`
  ADD PRIMARY KEY (`id_locale`),
  ADD KEY `id_dipartimento` (`id_dipartimento`);

--
-- Indici per le tabelle `personale_docente`
--
ALTER TABLE `personale_docente`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_locale` (`id_locale`);

--
-- Indici per le tabelle `personale_tecnico_amministrativo`
--
ALTER TABLE `personale_tecnico_amministrativo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_locale` (`id_locale`);

--
-- Indici per le tabelle `problema`
--
ALTER TABLE `problema`
  ADD PRIMARY KEY (`id_problema`),
  ADD KEY `id_dipartimento` (`id_dipartimento`),
  ADD KEY `id_docente` (`id_docente`),
  ADD KEY `id_locale` (`id_locale`),
  ADD KEY `id_tecnico` (`id_tecnico`),
  ADD KEY `id_utente` (`id_utente`),
  ADD KEY `id_categoria` (`id_categoria`);

--
-- Indici per le tabelle `specializzazione`
--
ALTER TABLE `specializzazione`
  ADD PRIMARY KEY (`id_specializzazione`);

--
-- Indici per le tabelle `tecnico`
--
ALTER TABLE `tecnico`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tecnico_ibfk_1` (`id_dipartimento`);

--
-- Indici per le tabelle `utente`
--
ALTER TABLE `utente`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `assistente`
--
ALTER TABLE `assistente`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5110;

--
-- AUTO_INCREMENT per la tabella `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id_categoria` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT per la tabella `corso_laurea`
--
ALTER TABLE `corso_laurea`
  MODIFY `id_corso` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT per la tabella `dipartimento`
--
ALTER TABLE `dipartimento`
  MODIFY `id_dipartimento` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT per la tabella `direttore`
--
ALTER TABLE `direttore`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT per la tabella `locale`
--
ALTER TABLE `locale`
  MODIFY `id_locale` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1132;

--
-- AUTO_INCREMENT per la tabella `personale_docente`
--
ALTER TABLE `personale_docente`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT per la tabella `personale_tecnico_amministrativo`
--
ALTER TABLE `personale_tecnico_amministrativo`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=527;

--
-- AUTO_INCREMENT per la tabella `problema`
--
ALTER TABLE `problema`
  MODIFY `id_problema` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=144;

--
-- AUTO_INCREMENT per la tabella `specializzazione`
--
ALTER TABLE `specializzazione`
  MODIFY `id_specializzazione` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT per la tabella `tecnico`
--
ALTER TABLE `tecnico`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT per la tabella `utente`
--
ALTER TABLE `utente`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=141;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `assistente`
--
ALTER TABLE `assistente`
  ADD CONSTRAINT `assistente_ibfk_1` FOREIGN KEY (`id_docente`) REFERENCES `personale_docente` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `assistente_ibfk_2` FOREIGN KEY (`id_locale`) REFERENCES `assistente` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `corso_laurea`
--
ALTER TABLE `corso_laurea`
  ADD CONSTRAINT `corso_laurea_ibfk_1` FOREIGN KEY (`id_dipartimento`) REFERENCES `dipartimento` (`id_dipartimento`);

--
-- Limiti per la tabella `credenziali`
--
ALTER TABLE `credenziali`
  ADD CONSTRAINT `credenziali_ibfk_1` FOREIGN KEY (`id_direttore`) REFERENCES `direttore` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `credenziali_ibfk_2` FOREIGN KEY (`id_tecnico`) REFERENCES `tecnico` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `dipartimento`
--
ALTER TABLE `dipartimento`
  ADD CONSTRAINT `dipartimento_ibfk_1` FOREIGN KEY (`id_direttore`) REFERENCES `direttore` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `locale`
--
ALTER TABLE `locale`
  ADD CONSTRAINT `locale_ibfk_1` FOREIGN KEY (`id_dipartimento`) REFERENCES `dipartimento` (`id_dipartimento`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `personale_docente`
--
ALTER TABLE `personale_docente`
  ADD CONSTRAINT `personale_docente_ibfk_1` FOREIGN KEY (`id_locale`) REFERENCES `locale` (`id_locale`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `personale_tecnico_amministrativo`
--
ALTER TABLE `personale_tecnico_amministrativo`
  ADD CONSTRAINT `personale_tecnico_amministrativo_ibfk_1` FOREIGN KEY (`id_locale`) REFERENCES `locale` (`id_locale`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `problema`
--
ALTER TABLE `problema`
  ADD CONSTRAINT `problema_ibfk_1` FOREIGN KEY (`id_dipartimento`) REFERENCES `dipartimento` (`id_dipartimento`),
  ADD CONSTRAINT `problema_ibfk_3` FOREIGN KEY (`id_docente`) REFERENCES `personale_docente` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `problema_ibfk_4` FOREIGN KEY (`id_locale`) REFERENCES `locale` (`id_locale`),
  ADD CONSTRAINT `problema_ibfk_5` FOREIGN KEY (`id_tecnico`) REFERENCES `tecnico` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `problema_ibfk_6` FOREIGN KEY (`id_utente`) REFERENCES `utente` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `problema_ibfk_7` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id_categoria`) ON UPDATE CASCADE;

--
-- Limiti per la tabella `tecnico`
--
ALTER TABLE `tecnico`
  ADD CONSTRAINT `tecnico_ibfk_1` FOREIGN KEY (`id_dipartimento`) REFERENCES `dipartimento` (`id_dipartimento`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
