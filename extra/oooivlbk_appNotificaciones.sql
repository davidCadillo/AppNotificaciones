SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;


CREATE TABLE `curso` (
  `codCurso` varchar(10) NOT NULL,
  `nombreCurso` varchar(60) NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`codCurso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `curso` (`codCurso`, `nombreCurso`, `descripcion`) VALUES('CIEN-101', 'Algebra Lineal', NULL);
INSERT INTO `curso` (`codCurso`, `nombreCurso`, `descripcion`) VALUES('CIEN-103', 'Geometria descriptiva', NULL);
INSERT INTO `curso` (`codCurso`, `nombreCurso`, `descripcion`) VALUES('CIEN-203', 'Fractales', NULL);
INSERT INTO `curso` (`codCurso`, `nombreCurso`, `descripcion`) VALUES('CIEN-302', 'Matematica II', NULL);
INSERT INTO `curso` (`codCurso`, `nombreCurso`, `descripcion`) VALUES('CIEN-402', 'Calculo diferencial', NULL);
INSERT INTO `curso` (`codCurso`, `nombreCurso`, `descripcion`) VALUES('ICSI-436', 'Desarrollo de aplicaciones moviles', NULL);
INSERT INTO `curso` (`codCurso`, `nombreCurso`, `descripcion`) VALUES('ICSI-602', 'Sistema de informacion estrategicos', NULL);
INSERT INTO `curso` (`codCurso`, `nombreCurso`, `descripcion`) VALUES('INSO-164', 'Desarrollo de aplicaciones moviles', NULL);

CREATE TABLE `cursoEscuela` (
  `idcursoEscuela` int(11) NOT NULL AUTO_INCREMENT,
  `codCurso` varchar(10) NOT NULL,
  `codEscuela` varchar(8) NOT NULL,
  PRIMARY KEY (`idcursoEscuela`),
  KEY `fk_cursoEscuela_curso1_idx` (`codCurso`),
  KEY `fk_cursoEscuela_escuela1_idx` (`codEscuela`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

INSERT INTO `cursoEscuela` (`idcursoEscuela`, `codCurso`, `codEscuela`) VALUES(1, 'CIEN-101', 'INSO');
INSERT INTO `cursoEscuela` (`idcursoEscuela`, `codCurso`, `codEscuela`) VALUES(2, 'CIEN-101', 'ICSI');
INSERT INTO `cursoEscuela` (`idcursoEscuela`, `codCurso`, `codEscuela`) VALUES(3, 'CIEN-402', 'IIND');
INSERT INTO `cursoEscuela` (`idcursoEscuela`, `codCurso`, `codEscuela`) VALUES(4, 'CIEN-402', 'ICSI');
INSERT INTO `cursoEscuela` (`idcursoEscuela`, `codCurso`, `codEscuela`) VALUES(5, 'ICSI-602', 'ICSI');
INSERT INTO `cursoEscuela` (`idcursoEscuela`, `codCurso`, `codEscuela`) VALUES(6, 'ICSI-436', 'ICSI');
INSERT INTO `cursoEscuela` (`idcursoEscuela`, `codCurso`, `codEscuela`) VALUES(7, 'INSO-164', 'INSO');

CREATE TABLE `cursoUsuario` (
  `idCursoHorario` int(11) NOT NULL AUTO_INCREMENT,
  `idUsuario` varchar(10) NOT NULL,
  `codCurso` varchar(10) NOT NULL,
  `idPeriodo` int(11) NOT NULL,
  `idUbicacion` int(11) NOT NULL,
  `idHorario` int(11) NOT NULL,
  `tipoClase` varchar(20) NOT NULL,
  PRIMARY KEY (`idCursoHorario`),
  UNIQUE KEY `uk_index` (`idUsuario`,`codCurso`,`idPeriodo`,`idUbicacion`,`idHorario`),
  KEY `fk_cursoProfesor_empleado1_idx` (`idUsuario`),
  KEY `fk_cursoProfesor_curso1_idx` (`codCurso`),
  KEY `fk_cursoUsuario_periodo1_idx` (`idPeriodo`),
  KEY `fk_cursoUsuario_ubicacion1_idx` (`idUbicacion`),
  KEY `fk_cursoUsuario_horario1_idx` (`idHorario`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

INSERT INTO `cursoUsuario` (`idCursoHorario`, `idUsuario`, `codCurso`, `idPeriodo`, `idUbicacion`, `idHorario`, `tipoClase`) VALUES(1, '000000678', 'ICSI-602', 1, 1, 5, 'Teoria');
INSERT INTO `cursoUsuario` (`idCursoHorario`, `idUsuario`, `codCurso`, `idPeriodo`, `idUbicacion`, `idHorario`, `tipoClase`) VALUES(2, '000000678', 'ICSI-602', 1, 3, 7, 'Practica');
INSERT INTO `cursoUsuario` (`idCursoHorario`, `idUsuario`, `codCurso`, `idPeriodo`, `idUbicacion`, `idHorario`, `tipoClase`) VALUES(3, '000000678', 'ICSI-436', 1, 4, 3, 'Laboratorio');
INSERT INTO `cursoUsuario` (`idCursoHorario`, `idUsuario`, `codCurso`, `idPeriodo`, `idUbicacion`, `idHorario`, `tipoClase`) VALUES(4, '000000678', 'CIEN-203', 1, 7, 10, 'Laboratorio');
INSERT INTO `cursoUsuario` (`idCursoHorario`, `idUsuario`, `codCurso`, `idPeriodo`, `idUbicacion`, `idHorario`, `tipoClase`) VALUES(5, '000000132', 'CIEN-302', 1, 2, 4, 'Practica');

CREATE TABLE `escuela` (
  `codEscuela` varchar(8) NOT NULL,
  `nombreEscuela` varchar(45) NOT NULL,
  PRIMARY KEY (`codEscuela`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `escuela` (`codEscuela`, `nombreEscuela`) VALUES('ICSI', 'Ingenieria de Computacion y Sistemas');
INSERT INTO `escuela` (`codEscuela`, `nombreEscuela`) VALUES('IIND', 'Ingenieria del Software');
INSERT INTO `escuela` (`codEscuela`, `nombreEscuela`) VALUES('INSO', 'Ingenieria del Software');

CREATE TABLE `horario` (
  `idHorario` int(11) NOT NULL AUTO_INCREMENT,
  `hora` varchar(5) NOT NULL,
  `dia` varchar(10) NOT NULL,
  PRIMARY KEY (`idHorario`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=49 ;

INSERT INTO `horario` (`idHorario`, `hora`, `dia`) VALUES(1, '07:00', 'lunes');
INSERT INTO `horario` (`idHorario`, `hora`, `dia`) VALUES(2, '07:55', 'lunes');
INSERT INTO `horario` (`idHorario`, `hora`, `dia`) VALUES(3, '08:50', 'lunes');
INSERT INTO `horario` (`idHorario`, `hora`, `dia`) VALUES(4, '09:40', 'lunes');
INSERT INTO `horario` (`idHorario`, `hora`, `dia`) VALUES(5, '10:40', 'lunes');
INSERT INTO `horario` (`idHorario`, `hora`, `dia`) VALUES(6, '11:30', 'lunes');
INSERT INTO `horario` (`idHorario`, `hora`, `dia`) VALUES(7, '12:20', 'lunes');
INSERT INTO `horario` (`idHorario`, `hora`, `dia`) VALUES(8, '13:30', 'lunes');
INSERT INTO `horario` (`idHorario`, `hora`, `dia`) VALUES(9, '14:20', 'lunes');
INSERT INTO `horario` (`idHorario`, `hora`, `dia`) VALUES(10, '15:20', 'lunes');
INSERT INTO `horario` (`idHorario`, `hora`, `dia`) VALUES(11, '16:10', 'lunes');
INSERT INTO `horario` (`idHorario`, `hora`, `dia`) VALUES(12, '18:00', 'lunes');
INSERT INTO `horario` (`idHorario`, `hora`, `dia`) VALUES(13, '19:00', 'lunes');
INSERT INTO `horario` (`idHorario`, `hora`, `dia`) VALUES(14, '19:50', 'lunes');
INSERT INTO `horario` (`idHorario`, `hora`, `dia`) VALUES(15, '08:40', 'lunes');
INSERT INTO `horario` (`idHorario`, `hora`, `dia`) VALUES(16, '09:30', 'lunes');
INSERT INTO `horario` (`idHorario`, `hora`, `dia`) VALUES(17, '07:00', 'martes');
INSERT INTO `horario` (`idHorario`, `hora`, `dia`) VALUES(18, '07:55', 'martes');
INSERT INTO `horario` (`idHorario`, `hora`, `dia`) VALUES(19, '08:50', 'martes');
INSERT INTO `horario` (`idHorario`, `hora`, `dia`) VALUES(20, '09:40', 'martes');
INSERT INTO `horario` (`idHorario`, `hora`, `dia`) VALUES(21, '10:40', 'martes');
INSERT INTO `horario` (`idHorario`, `hora`, `dia`) VALUES(22, '11:30', 'martes');
INSERT INTO `horario` (`idHorario`, `hora`, `dia`) VALUES(23, '12:20', 'martes');
INSERT INTO `horario` (`idHorario`, `hora`, `dia`) VALUES(24, '13:30', 'martes');
INSERT INTO `horario` (`idHorario`, `hora`, `dia`) VALUES(25, '14:20', 'martes');
INSERT INTO `horario` (`idHorario`, `hora`, `dia`) VALUES(26, '15:20', 'martes');
INSERT INTO `horario` (`idHorario`, `hora`, `dia`) VALUES(27, '16:10', 'martes');
INSERT INTO `horario` (`idHorario`, `hora`, `dia`) VALUES(28, '18:00', 'martes');
INSERT INTO `horario` (`idHorario`, `hora`, `dia`) VALUES(29, '19:00', 'martes');
INSERT INTO `horario` (`idHorario`, `hora`, `dia`) VALUES(30, '19:50', 'martes');
INSERT INTO `horario` (`idHorario`, `hora`, `dia`) VALUES(31, '08:40', 'martes');
INSERT INTO `horario` (`idHorario`, `hora`, `dia`) VALUES(32, '09:30', 'martes');
INSERT INTO `horario` (`idHorario`, `hora`, `dia`) VALUES(33, '07:00', 'miercoles');
INSERT INTO `horario` (`idHorario`, `hora`, `dia`) VALUES(34, '07:55', 'miercoles');
INSERT INTO `horario` (`idHorario`, `hora`, `dia`) VALUES(35, '08:50', 'miercoles');
INSERT INTO `horario` (`idHorario`, `hora`, `dia`) VALUES(36, '09:40', 'miercoles');
INSERT INTO `horario` (`idHorario`, `hora`, `dia`) VALUES(37, '10:40', 'miercoles');
INSERT INTO `horario` (`idHorario`, `hora`, `dia`) VALUES(38, '11:30', 'miercoles');
INSERT INTO `horario` (`idHorario`, `hora`, `dia`) VALUES(39, '12:20', 'miercoles');
INSERT INTO `horario` (`idHorario`, `hora`, `dia`) VALUES(40, '13:30', 'miercoles');
INSERT INTO `horario` (`idHorario`, `hora`, `dia`) VALUES(41, '14:20', 'miercoles');
INSERT INTO `horario` (`idHorario`, `hora`, `dia`) VALUES(42, '15:20', 'miercoles');
INSERT INTO `horario` (`idHorario`, `hora`, `dia`) VALUES(43, '16:10', 'miercoles');
INSERT INTO `horario` (`idHorario`, `hora`, `dia`) VALUES(44, '18:00', 'miercoles');
INSERT INTO `horario` (`idHorario`, `hora`, `dia`) VALUES(45, '19:00', 'miercoles');
INSERT INTO `horario` (`idHorario`, `hora`, `dia`) VALUES(46, '19:50', 'miercoles');
INSERT INTO `horario` (`idHorario`, `hora`, `dia`) VALUES(47, '08:40', 'miercoles');
INSERT INTO `horario` (`idHorario`, `hora`, `dia`) VALUES(48, '09:30', 'miercoles');

CREATE TABLE `periodo` (
  `idPeriodo` int(11) NOT NULL AUTO_INCREMENT,
  `anio` year(4) NOT NULL,
  `ciclo` varchar(2) NOT NULL,
  `fechaInicio` date NOT NULL,
  `fechaFin` date NOT NULL,
  PRIMARY KEY (`idPeriodo`),
  UNIQUE KEY `uk_periodo` (`anio`,`ciclo`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

INSERT INTO `periodo` (`idPeriodo`, `anio`, `ciclo`, `fechaInicio`, `fechaFin`) VALUES(1, 2016, '20', '2016-08-15', '2016-12-16');
INSERT INTO `periodo` (`idPeriodo`, `anio`, `ciclo`, `fechaInicio`, `fechaFin`) VALUES(2, 2016, '10', '2016-03-20', '2016-07-15');

CREATE TABLE `tipoUsuario` (
  `idtipoUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `nombreTipo` varchar(10) NOT NULL,
  PRIMARY KEY (`idtipoUsuario`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

INSERT INTO `tipoUsuario` (`idtipoUsuario`, `nombreTipo`) VALUES(1, 'Docente');
INSERT INTO `tipoUsuario` (`idtipoUsuario`, `nombreTipo`) VALUES(2, 'Seguridad');
INSERT INTO `tipoUsuario` (`idtipoUsuario`, `nombreTipo`) VALUES(3, 'Tecnico');

CREATE TABLE `ubicacion` (
  `idUbicacion` int(11) NOT NULL AUTO_INCREMENT,
  `pabellon` char(1) NOT NULL,
  `aula` varchar(5) NOT NULL,
  PRIMARY KEY (`idUbicacion`),
  UNIQUE KEY `uk_ubicacion` (`pabellon`,`aula`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

INSERT INTO `ubicacion` (`idUbicacion`, `pabellon`, `aula`) VALUES(7, 'E', '202');
INSERT INTO `ubicacion` (`idUbicacion`, `pabellon`, `aula`) VALUES(5, 'F', '203');
INSERT INTO `ubicacion` (`idUbicacion`, `pabellon`, `aula`) VALUES(1, 'G', '301');
INSERT INTO `ubicacion` (`idUbicacion`, `pabellon`, `aula`) VALUES(2, 'G', '602');
INSERT INTO `ubicacion` (`idUbicacion`, `pabellon`, `aula`) VALUES(3, 'G', '706');
INSERT INTO `ubicacion` (`idUbicacion`, `pabellon`, `aula`) VALUES(4, 'H', '401');
INSERT INTO `ubicacion` (`idUbicacion`, `pabellon`, `aula`) VALUES(6, 'K', '107');

CREATE TABLE `users` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `Token` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Token` (`Token`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

INSERT INTO `users` (`id`, `Token`) VALUES(1, 'e8QfYLsP--g:APA91bGStABm4WMndE8jM7JDDxeLQM2NZYmWFonPifB68bdRS2TVI-u2jdDEMsXUlklH9KqF6Gj2GPo2vMZVStvjmv8HPBeGupWkdrfw55z5x5xdcXriylB07V9wRyVvjo7sI45zzrfO');
INSERT INTO `users` (`id`, `Token`) VALUES(2, 'c6W9Sy1_1v4:APA91bE5wkZfyExtObB67qowisjQMC6-2w03jciaRKftvKD1tNeiFsx775VPLBE5eYUZ9L1p7hArBEg8YqlhxBewV0Ej8fjOBDAbup5RG3PYDPtNA88uWheRHwIcNFZHctKy92z4QeQP');
INSERT INTO `users` (`id`, `Token`) VALUES(3, 'dcS9PElBDKY:APA91bFJYO8ObvkY10WN9RuizpFW7hL82itERF0NG319vuLkI7OL7pDiTKdhQNNtGtZHkgOh8QeRkKItr7ewlqdTQDyqhfSKS1LBC_-iL45d4IJqrNhthXbxEY2BbOBIDBz0g-wc-O7k');
INSERT INTO `users` (`id`, `Token`) VALUES(4, 'eirujlraSLY:APA91bGdn4AHOln_MLIyRIy4XPBE1dykzeD1Qp_56LQYEX76H2mRmt3BRkfcDc8Ig9n38IEISUgY1-zQx8TJMq_ki8vFWxG2NjrdxtHXKv2q3Hurrh-rLxknBudY6-EZ2sgilqnlzmJy');
INSERT INTO `users` (`id`, `Token`) VALUES(5, 'eyYmlsC1O9o:APA91bHe5a9Emzyjmky-gTbC-eaN85zQ3C-G_qRRLX-5_UynpooXjEgrzrXCWTJuFrFjSi8TWH3v89rxu-PTaNju0YjcXy9pw8kXMSAtILE4op3BlklzGdTwq549gvGAnkR9_Fj8x9e3');
INSERT INTO `users` (`id`, `Token`) VALUES(6, 'eIbfB-Ki06Y:APA91bFvaekOzfbWaTiCg_Uv93PQrKU42YZH-nxCvL3XOk1IF4eOzxQ7VMiyczh3EHBmwtMTkwNlyNc6W64Bx0BnHngNaVE1X8gUxznNG58NQLhbXP4_fgBp7KYVFyUk8TEkC2eLCCtS');
INSERT INTO `users` (`id`, `Token`) VALUES(7, 'fTDWeVRLD_Q:APA91bFSXh-OOlT3pjvgUIz_sn8uN0iMn3hieHePtnhnae7LgIcOZBkCbsSrVq7p2AYUR012XD4jD28U-zLd6qthGN-qhc5rOzNsimRuKQHq6jDRzGp3sxgJHxWf7A8P6_qvKw2-nqQ5');
INSERT INTO `users` (`id`, `Token`) VALUES(8, 'frMt52X_-uk:APA91bHSsecMNZSiQl85QmJ0Z33jgoNPP5ISYjFXt3IJ59fVSKo_lQzDjf5MIUoVutMIo1ydMRFvrgyw5W1yB6UrBM2vIz0Pl2-eQm88Z2w-PdJVdTlpdJLcwVZGdOKFyJghfgdSpS9m');

CREATE TABLE `usuario` (
  `idUsuario` varchar(9) NOT NULL,
  `password` varchar(32) DEFAULT NULL,
  `nombres` varchar(45) NOT NULL,
  `apellidos` varchar(45) NOT NULL,
  `idtipoUsuario` int(11) NOT NULL,
  PRIMARY KEY (`idUsuario`),
  KEY `fk_empleado_tipoEmpleado1_idx` (`idtipoUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `usuario` (`idUsuario`, `password`, `nombres`, `apellidos`, `idtipoUsuario`) VALUES('000000010', 'admin10', 'Jorge', 'Huapaya Escobedo', 1);
INSERT INTO `usuario` (`idUsuario`, `password`, `nombres`, `apellidos`, `idtipoUsuario`) VALUES('000000132', 'admin32', 'Jorge', 'Jara Arenas', 1);
INSERT INTO `usuario` (`idUsuario`, `password`, `nombres`, `apellidos`, `idtipoUsuario`) VALUES('000000456', 'admin56', 'Luis Enrique', 'Rengifo Cardenas', 1);
INSERT INTO `usuario` (`idUsuario`, `password`, `nombres`, `apellidos`, `idtipoUsuario`) VALUES('000000678', 'admin78', 'Jose ', 'Castañeda Saldaña', 1);
INSERT INTO `usuario` (`idUsuario`, `password`, `nombres`, `apellidos`, `idtipoUsuario`) VALUES('000003456', 'admin56', 'Igor', 'Pulivoch Jimenez', 3);
INSERT INTO `usuario` (`idUsuario`, `password`, `nombres`, `apellidos`, `idtipoUsuario`) VALUES('000008763', 'admin63', 'Jorge', 'Carpinteros Pintos', 2);
INSERT INTO `usuario` (`idUsuario`, `password`, `nombres`, `apellidos`, `idtipoUsuario`) VALUES('000009446', 'admin46', 'Ivan', 'Bazan Linares', 2);


ALTER TABLE `cursoEscuela`
  ADD CONSTRAINT `fk_cursoEscuela_curso1` FOREIGN KEY (`codCurso`) REFERENCES `curso` (`codCurso`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_cursoEscuela_escuela1` FOREIGN KEY (`codEscuela`) REFERENCES `escuela` (`codEscuela`) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE `cursoUsuario`
  ADD CONSTRAINT `fk_cursoProfesor_curso1` FOREIGN KEY (`codCurso`) REFERENCES `curso` (`codCurso`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_cursoProfesor_empleado1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_cursoUsuario_horario1` FOREIGN KEY (`idHorario`) REFERENCES `horario` (`idHorario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_cursoUsuario_periodo1` FOREIGN KEY (`idPeriodo`) REFERENCES `periodo` (`idPeriodo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_cursoUsuario_ubicacion1` FOREIGN KEY (`idUbicacion`) REFERENCES `ubicacion` (`idUbicacion`) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_empleado_tipoEmpleado1` FOREIGN KEY (`idtipoUsuario`) REFERENCES `tipoUsuario` (`idtipoUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
