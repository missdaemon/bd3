/*Estructura Taller#2*/

CREATE TABLE Departamentos values(
    codigo VARCHAR(3) NOT NULL PRIMARY KEY,
    nombre VARCHAR(40) NOT NULL
);

INSERT INTO Departamentos values
    ('ING', 'Ingenieria'),
    ('CDS', 'Ciencias de la Salud' ),
    ('HGT', 'Hotelería, Gastronomia y Turismo'),
    ('CAD', 'Ciencias Administrativas');

CREATE TABLE Areas ( 
    codigo VARCHAR(3) PRIMARY KEY,
    nombre VARCHAR(55) NOT NULL,
    codigo_departamento VARCHAR(3) NOT NULL,
    FOREIGN KEY (codigo_departamento) REFERENCES Departamentos(codigo)
);

INSERT INTO Areas values
    ('ROB', "Robotica", 'ING'),
    ('SIS', "Sistemas", 'ING' ),
    ('TEL', "Telecomunicaciones", 'ING'),
    ('ENF', "Enfermeria",'CDS'),
    ('MED', "Medicina",'CDS'),
    ('ODO', "Odontologia",'CDS'),
    ('NUT', "Nutricion",'CDS'),
    ('HOT', "Hoteleria",'CDS');

CREATE TABLE Profesores(
    codigo VARCHAR(2) PRIMARY KEY,
    apellido1 VARCHAR(25) NOT NULL,
    apellido2 VARCHAR(25),
    nombre_pila VARCHAR(20) NOT NULL,
    activo TINYINT(1),
    categoria CHAR(20),
    dedicacion VARCHAR(20) NOT NULL,
    codigo_areas VARCHAR(3),
    FOREIGN KEY (codigo_areas) REFERENCES Areas(codigo)
);

INSERT INTO Profesores values(
    (''),

);
CREATE TABLE Asignaturas (
    siglas VARCHAR(6) PRIMARY KEY,
    nombre VARCHAR(40) NOT NULL,
    creditos INTEGER NOT NULL,
    curso INTEGER NOT NULL,
    clase VARCHAR(1) NOT NULL,
    anualidad VARCHAR(1) NOT NULL,
    horas_practica INTEGER NOT NULL,
    horas_teoria INTEGER NOT NULL,
    grupos_teoria INTEGER NOT NULL, 
    grupos_practica INTEGER NOT NULL,
    alumnos INTEGER NOT NULL
);

INSERT INTO Asignaturas values
    ('MATH', "Matematicas", 5, 1, 1, 1, 4, 2, 3, 3, 40),
    ('CIEN', "Ciencias Naturales", 4, 2, 2, 2, 2, 2, 2, 2, 40),
    ('SO', "Sistemas Operativos", 5, 1, 1, 1, 4, 2, 3, 3, 40),
    ('BD', "Base de Datos", 5, 1, 1, 1, 4, 2, 3, 3, 40);

CREATE TABLE Locales (
    codigo INTEGER PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    docente VARCHAR(40) NOT NULL,
    capacidad INTEGER NOT NULL,
    edificio VARCHAR(40) NOT NULL,
    situacion VARCHAR(40) NOT NULL
);

INSERT INTO Locales values 
    (0136, "Salon 1A", "Marina Saenz", 40, 1, 3),
    (NULL, "Salon 2A", "Guillermo Torrealba", 30, 1, 3),
    (NULL, "Salon 3A", "Juan Gonzalez", 30, 1, 4),
    (NULL, "Salon 4A", "Shelsy Chanis", 40, 1, 3),
    (NULL, "Salon 5A", "Miriam Castro", 30, 1, 3),
    (NULL, "Salon 6A", "Liliana Iñarritu", 40, 1, 3);

CREATE TABLE Grupos (
    curso VARCHAR(20),
    clase VARCHAR(1),
    codigo VARCHAR(3),
    nombre VARCHAR(30) NOT NULL, 
    PRIMARY KEY (curso, clase, codigo)
);

INSERT INTO Grupos values
    (01, 02, 'G01', 'Matematicas'),
    (02, 03, 'G02', 'Matematicas'),
    (03, 04, 'G02', 'Sistemas Operativos'),
    (04, 01, 'G03', 'Base de Datos III'),
    (05, 06, 'G01', 'Quimica');


CREATE TABLE Docencia (
    id INT PRIMARY KEY AUTO_INCREMENT,
    codigo_curso VARCHAR(20),
    codigo_clase VARCHAR(1), 
    codigo_grupo VARCHAR(3),
    codigo_profesor VARCHAR(2),
    codigo_siglas VARCHAR(6),
    codigo_local INTEGER,
    dia DATE,
    hora TIME,
    periodicidad TINYINT(1),
    FOREIGN KEY (codigo_curso, codigo_clase, codigo_grupo) REFERENCES Grupos(curso, clase, codigo),
    FOREIGN KEY (codigo_profesor) REFERENCES Profesores(codigo), 
    FOREIGN KEY (codigo_siglas) REFERENCES Asignaturas(siglas),
    FOREIGN KEY (codigo_local) REFERENCES Locales(codigo)
);
