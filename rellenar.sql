#Insertar usuarios
INSERT INTO table_ciudades VALUES(1,'Vega de Alatorre');
INSERT INTO table_ciudades VALUES(2,'Martinez de la Torre');

#Insertar campus
INSERT INTO table_campus VALUES('VEGA',1);
INSERT INTO table_campus VALUES('MARTINEZ',2);

#Insertar periodos
INSERT INTO table_periodos VALUES(1,STR_TO_DATE('08/2021','%m/%Y'),STR_TO_DATE('01/2022','%m/%Y'));

#Insertar puestos
INSERT INTO table_puestos VALUES(1,'Jefe de carrera');
INSERT INTO table_puestos VALUES(2,'Docente');

#Insertar perfiles academicos
INSERT INTO table_perfiles_academicos VALUES('ISC','Ing. Sistemas Computacionales');

#Insertar personas
INSERT INTO table_personas VALUES('190I0023','César','Fernández','Guzmán',1,50,1,'ISC');
INSERT INTO table_personas VALUES('190I0024','Julissa','Solano','Lagunes',1,50,2,'ISC');

#Insertar cargas
INSERT INTO table_cargas VALUES(1,'190I0023',1);

#Insertar carreras
INSERT INTO table_carreras VALUES('ISIC', 'Ingenieria en sistemas computacionales');

#Insertar sistemas
INSERT INTO table_sistemas VALUES(1,'Escolarizado');
INSERT INTO table_sistemas VALUES(2,'Mixto');

#Insertar ofertas
INSERT INTO table_ofertas VALUES(1,'ISIC',1,'VEGA',1);

#Insertar grupos
INSERT INTO table_grupos VALUES(1,'5F',1);

#Insertar roles
INSERT INTO table_tipos_usuarios VALUES(0,'ADMIN');
INSERT INTO table_tipos_usuarios VALUES(1,'USER');

#Insertar materias
INSERT INTO table_materias VALUES('ACF-0901','Cálculo Diferencial','ISIC',3,2);
INSERT INTO table_materias VALUES('AED-1285','Fundamentos de Programación ','ISIC',2,3);
INSERT INTO table_materias VALUES('ACA-0907','Taller de Ética','ISIC',0,4);
INSERT INTO table_materias VALUES('AEF-1041','Matemáticas Discretas','ISIC',3,2);
INSERT INTO table_materias VALUES('SCH-1024','Taller de Administración','ISIC',1,3);
INSERT INTO table_materias VALUES('ACC-0906','Fundamentos de Investigación','ISIC',2,2);
INSERT INTO table_materias VALUES('ACF-0902','Cálculo Integral','ISIC',3,2);

#Mostrar tablas
SELECT * FROM table_campus;
SELECT * FROM table_cargas;
SELECT * FROM table_carreras;
SELECT * FROM table_ciudades;
SELECT * FROM table_grupos;
SELECT * FROM table_materias;
SELECT * FROM table_ofertas;
SELECT * FROM table_perfiles_academicos;
SELECT * FROM table_periodos;
SELECT * FROM table_personas;
SELECT * FROM table_puestos;
SELECT * FROM table_sistemas;
SELECT * FROM table_tipos_usuarios;
SELECT * FROM table_usuarios;