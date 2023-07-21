DROP DATABASE IF EXISTS empleados_empresa;
CREATE DATABASE IF NOT EXISTS empleados_empresa;
USE empleados_empresa;

CREATE TABLE empleado (
  id INT UNSIGNED AUTO_INCREMENT NOT NULL,
  nombre VARCHAR(50) NOT NULL,
  apellido VARCHAR(50) NOT NULL,
  PRIMARY KEY (id)
)ENGINE=INNODB;

INSERT INTO empleado VALUES(1, 'Juan ','Moliner');
INSERT INTO empleado VALUES(2, 'Esther ','Pidal');

SELECT * from empleado;

DELETE FROM empleado wHERE id=51;