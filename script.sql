CREATE SCHEMA plataforma;

CREATE TABLE plataforma.table_carreras ( 
	id_carrera           varchar(45)  NOT NULL    PRIMARY KEY,
	nombre               varchar(50)  NOT NULL    
 );

CREATE TABLE plataforma.table_ciudades ( 
	id_ciudad            int  NOT NULL  AUTO_INCREMENT  PRIMARY KEY,
	nombre               varchar(50)      
 ) engine=InnoDB;

CREATE TABLE plataforma.table_materias ( 
	id_materia           varchar(45)  NOT NULL    PRIMARY KEY,
	nombre               varchar(50)  NOT NULL    ,
	id_carrera           varchar(45)  NOT NULL    ,
	hrs_teor             int  NOT NULL    ,
	hrs_pract            int  NOT NULL    
 );

CREATE TABLE plataforma.table_perfiles_academicos ( 
	id_perfil            varchar(45)  NOT NULL    PRIMARY KEY,
	titulo               varchar(50)      
 ) engine=InnoDB;

CREATE TABLE plataforma.table_periodos ( 
	id_periodo           int  NOT NULL    PRIMARY KEY,
	inicio               date  NOT NULL    ,
	fin                  date  NOT NULL    
 );

CREATE TABLE plataforma.table_puestos ( 
	id_puesto            int  NOT NULL    PRIMARY KEY,
	puesto               varchar(45)  NOT NULL    
 );

CREATE TABLE plataforma.table_sistemas ( 
	id_sistemas          int  NOT NULL    PRIMARY KEY,
	nombre               varchar(50)  NOT NULL    
 );

CREATE TABLE plataforma.table_tipos_usuarios ( 
	id_tipo              int  NOT NULL    PRIMARY KEY,
	tipo                 varchar(50)  NOT NULL    
 );

CREATE TABLE plataforma.table_campus ( 
	id_campus            varchar(45)  NOT NULL    PRIMARY KEY,
	id_ciudad            int      
 );

CREATE TABLE plataforma.table_ofertas ( 
	id_oferta            int  NOT NULL  AUTO_INCREMENT  PRIMARY KEY,
	id_carrera           varchar(45)  NOT NULL    ,
	id_sistema           int  NOT NULL    ,
	id_campus            varchar(45)  NOT NULL    ,
	id_periodo           int  NOT NULL    
 );

CREATE TABLE plataforma.table_personas ( 
	id_persona           varchar(45)  NOT NULL    PRIMARY KEY,
	nombre               varchar(50)  NOT NULL    ,
	apellido_paterno     varchar(50)      ,
	apellido_materno     varchar(50)      ,
	id_ciudad            int  NOT NULL    ,
	hrs_cont             int  NOT NULL    ,
	puesto_id            int  NOT NULL    ,
	id_perfil            varchar(45)      
 );

CREATE TABLE plataforma.table_usuarios ( 
	id_usuario           int  NOT NULL  AUTO_INCREMENT  PRIMARY KEY,
	correo               varchar(50)  NOT NULL    ,
	contraseña           varchar(50)  NOT NULL    ,
	id_tipo              int  NOT NULL    ,
	id_persona           varchar(45)  NOT NULL    
 );

CREATE TABLE plataforma.table_cargas ( 
	id_carga             int  NOT NULL  AUTO_INCREMENT  PRIMARY KEY,
	id_persona           varchar(45)  NOT NULL    ,
	id_periodo           int  NOT NULL    
 );

CREATE TABLE plataforma.table_grupos ( 
	id_grupo             int  NOT NULL  AUTO_INCREMENT  PRIMARY KEY,
	nombre               varchar(50)  NOT NULL    ,
	id_oferta            int  NOT NULL    
 );

CREATE TABLE plataforma.table_registros ( 
	id_registro          int  NOT NULL    PRIMARY KEY,
	id_carga             int  NOT NULL    ,
	id_materia           varchar(45)  NOT NULL    ,
	id_grupo             int  NOT NULL    
 );

ALTER TABLE plataforma.table_campus ADD CONSTRAINT fk_table_campus_table_ciudades FOREIGN KEY ( id_ciudad ) REFERENCES plataforma.table_ciudades( id_ciudad ) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE plataforma.table_cargas ADD CONSTRAINT table_cargas_docente_table_empleados_id FOREIGN KEY ( id_persona ) REFERENCES plataforma.table_personas( id_persona ) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE plataforma.table_cargas ADD CONSTRAINT table_cargas_periodo_table_periodos_id FOREIGN KEY ( id_periodo ) REFERENCES plataforma.table_periodos( id_periodo ) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE plataforma.table_grupos ADD CONSTRAINT table_grupos_oferta_table_oferta_id FOREIGN KEY ( id_oferta ) REFERENCES plataforma.table_ofertas( id_oferta ) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE plataforma.table_materias ADD CONSTRAINT table_materias_carrera_table_carreras_id FOREIGN KEY ( id_carrera ) REFERENCES plataforma.table_carreras( id_carrera ) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE plataforma.table_ofertas ADD CONSTRAINT table_oferta_carrera_table_carreras_id FOREIGN KEY ( id_carrera ) REFERENCES plataforma.table_carreras( id_carrera ) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE plataforma.table_ofertas ADD CONSTRAINT table_oferta_sistema_table_sistemas_id FOREIGN KEY ( id_sistema ) REFERENCES plataforma.table_sistemas( id_sistemas ) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE plataforma.table_ofertas ADD CONSTRAINT table_oferta_campus_table_campus_id FOREIGN KEY ( id_campus ) REFERENCES plataforma.table_campus( id_campus ) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE plataforma.table_ofertas ADD CONSTRAINT table_oferta_periodo_table_periodos_id FOREIGN KEY ( id_periodo ) REFERENCES plataforma.table_periodos( id_periodo ) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE plataforma.table_personas ADD CONSTRAINT table_empleados_puesto_id_table_puestos_id FOREIGN KEY ( puesto_id ) REFERENCES plataforma.table_puestos( id_puesto ) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE plataforma.table_personas ADD CONSTRAINT fk_table_personas FOREIGN KEY ( id_ciudad ) REFERENCES plataforma.table_ciudades( id_ciudad ) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE plataforma.table_personas ADD CONSTRAINT fk_table_personas_table_perfiles_academicos FOREIGN KEY ( id_perfil ) REFERENCES plataforma.table_perfiles_academicos( id_perfil ) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE plataforma.table_registros ADD CONSTRAINT table_registros_carga_table_cargas_id FOREIGN KEY ( id_carga ) REFERENCES plataforma.table_cargas( id_carga ) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE plataforma.table_registros ADD CONSTRAINT table_registros_materia_table_materias_id FOREIGN KEY ( id_materia ) REFERENCES plataforma.table_materias( id_materia ) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE plataforma.table_registros ADD CONSTRAINT table_registros_grupo_table_grupos_id FOREIGN KEY ( id_grupo ) REFERENCES plataforma.table_grupos( id_grupo ) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE plataforma.table_usuarios ADD CONSTRAINT table_usuarios_tipo_table_tipos_usuarios_id FOREIGN KEY ( id_tipo ) REFERENCES plataforma.table_tipos_usuarios( id_tipo ) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE plataforma.table_usuarios ADD CONSTRAINT table_usuarios_id_empleado_table_empleados_id FOREIGN KEY ( id_persona ) REFERENCES plataforma.table_personas( id_persona ) ON DELETE NO ACTION ON UPDATE NO ACTION;

