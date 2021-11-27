DROP TABLE IF EXISTS table_materias;
DROP TABLE IF EXISTS table_carreras;
DROP TABLE IF EXISTS table_campus;
DROP TABLE IF EXISTS table_sistemas;
DROP TABLE IF EXISTS table_empleados;
DROP TABLE IF EXISTS table_cargas;
DROP TABLE IF EXISTS table_periodos;
DROP TABLE IF EXISTS table_registros;
DROP TABLE IF EXISTS table_usuarios;
DROP TABLE IF EXISTS table_tipos_usuarios;
DROP TABLE IF EXISTS table_oferta;
DROP TABLE IF EXISTS table_grupos;
DROP TABLE IF EXISTS table_puestos;


CREATE TABLE table_materias (
nombre VARCHAR(50) NOT NULL,
id INT(50) NOT NULL,
carrera INT(50) NOT NULL,
hrs_teor INT(50) NOT NULL,
hrs_pract INT(50) NOT NULL,
PRIMARY KEY (nombre,id));

CREATE TABLE table_carreras (
id INT(50) NOT NULL PRIMARY KEY,
nombre VARCHAR(50) NOT NULL);

CREATE TABLE table_campus (
id INT(50) NOT NULL PRIMARY KEY,
ubicacion VARCHAR(50) NOT NULL);

CREATE TABLE table_sistemas (
id INT(50) NOT NULL PRIMARY KEY,
nombre VARCHAR(50) NOT NULL);

CREATE TABLE table_empleados (
id VARCHAR(45) NOT NULL PRIMARY KEY,
nombre VARCHAR(50) NOT NULL,
ubicacion VARCHAR(50) NOT NULL,
hrs_cont INT(50) NOT NULL,
perfil_acad VARCHAR(45) NOT NULL,
puesto_id INT NOT NULL);

CREATE TABLE table_cargas (
id INT(50) AUTO_INCREMENT NOT NULL PRIMARY KEY,
docente INT(50) NOT NULL,
periodo INT(50) NOT NULL);

CREATE TABLE table_periodos (
id INT(50) NOT NULL PRIMARY KEY,
inicio DATE NOT NULL,
fin DATE NOT NULL);

CREATE TABLE table_registros (
id INT(50) NOT NULL PRIMARY KEY,
carga INT(50) NOT NULL,
materia INT(50) NOT NULL,
grupo INT(50) NOT NULL);

CREATE TABLE table_usuarios (
id INT(50) AUTO_INCREMENT NOT NULL PRIMARY KEY,
correo VARCHAR(50) NOT NULL,
contraseña VARCHAR(50) NOT NULL,
tipo INT(50) NOT NULL,
id_empleado VARCHAR(45) NOT NULL);

CREATE TABLE table_tipos_usuarios (
id INT(50) NOT NULL PRIMARY KEY,
tipo VARCHAR(50) NOT NULL);

CREATE TABLE table_oferta (
id INT(50) AUTO_INCREMENT NOT NULL PRIMARY KEY,
carrera INT(50) NOT NULL,
sistema INT(50) NOT NULL,
campus INT(50) NOT NULL,
periodo INT(50) NOT NULL);

CREATE TABLE table_grupos (
id INT(50) AUTO_INCREMENT NOT NULL PRIMARY KEY,
grupo VARCHAR(50) NOT NULL,
oferta INT(50) NOT NULL);

CREATE TABLE table_puestos (
id INT NOT NULL PRIMARY KEY,
puesto_name VARCHAR(45) NOT NULL);

ALTER TABLE table_usuarios ADD CONSTRAINT table_usuarios_tipo_table_tipos_usuarios_id FOREIGN KEY (tipo) REFERENCES table_tipos_usuarios(id);
ALTER TABLE table_usuarios ADD CONSTRAINT table_usuarios_id_empleado_table_empleados_id FOREIGN KEY (id_empleado) REFERENCES table_empleados(id);
ALTER TABLE table_oferta ADD CONSTRAINT table_oferta_carrera_table_carreras_id FOREIGN KEY (carrera) REFERENCES table_carreras(id);
ALTER TABLE table_oferta ADD CONSTRAINT table_oferta_sistema_table_sistemas_id FOREIGN KEY (sistema) REFERENCES table_sistemas(id);
ALTER TABLE table_oferta ADD CONSTRAINT table_oferta_campus_table_campus_id FOREIGN KEY (campus) REFERENCES table_campus(id);
ALTER TABLE table_oferta ADD CONSTRAINT table_oferta_periodo_table_periodos_id FOREIGN KEY (periodo) REFERENCES table_periodos(id);
ALTER TABLE table_grupos ADD CONSTRAINT table_grupos_oferta_table_oferta_id FOREIGN KEY (oferta) REFERENCES table_oferta(id);
ALTER TABLE table_materias ADD CONSTRAINT table_materias_carrera_table_carreras_id FOREIGN KEY (carrera) REFERENCES table_carreras(id);
ALTER TABLE table_empleados ADD CONSTRAINT table_empleados_puesto_id_table_puestos_id FOREIGN KEY (puesto_id) REFERENCES table_puestos(id);
ALTER TABLE table_cargas ADD CONSTRAINT table_cargas_docente_table_empleados_id FOREIGN KEY (docente) REFERENCES table_empleados(id);
ALTER TABLE table_cargas ADD CONSTRAINT table_cargas_periodo_table_periodos_id FOREIGN KEY (periodo) REFERENCES table_periodos(id);
ALTER TABLE table_registros ADD CONSTRAINT table_registros_carga_table_cargas_id FOREIGN KEY (carga) REFERENCES table_cargas(id);
ALTER TABLE table_registros ADD CONSTRAINT table_registros_materia_table_materias_id FOREIGN KEY (materia) REFERENCES table_materias(id);
ALTER TABLE table_registros ADD CONSTRAINT table_registros_grupo_table_grupos_id FOREIGN KEY (grupo) REFERENCES table_grupos(id);