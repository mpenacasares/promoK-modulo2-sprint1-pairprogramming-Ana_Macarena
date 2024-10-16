CREATE SCHEMA `tienda_zapatillas`;

USE `tienda_zapatillas`;
-- facturas esta relacionada con empleados, clientes y zapatillas
-- empleados, clientes y zapatillas no tienen relacion entre ellos

-- EJERCICIO 1
SELECT * FROM zapatillas;

ALTER TABLE zapatillas 
ADD COLUMN marca VARCHAR(45) NOT NULL,
ADD COLUMN talla INT NOT NULL;

SELECT * FROM empleados;

ALTER TABLE empleados
MODIFY COLUMN salario FLOAT;


SELECT * FROM clientes;

ALTER TABLE clientes
DROP COLUMN pais;

SELECT * FROM facturas;

ALTER TABLE facturas  
ADD COLUMN total FLOAT ; 

-- EJERCICIO 2
-- Inserción de datos en la tabla 'zapatillas' (con id_zapatilla AUTO_INCREMENT) - no debemos incluir la column id_zapatilla
SELECT * FROM zapatillas;

INSERT INTO zapatillas (modelo, color, marca, talla)
VALUES
('XQYUN', 'Negro', 'Nike', 42),
('UOPMN', 'Rosas', 'Nike', 39),
('OPNYT', 'Verdes', 'Adidas', 35);

SELECT * FROM empleados;

-- Inserción de datos en la tabla 'empleados' (con id_empleado AUTO_INCREMENT)
/*
salario: se ajusta con el formato decimal correcto (sin coma)
fecha_incorporacion: Las fechas deben estar en formato YYYY-MM-DD, que es el requerido por MySQL.
Auto-increment: No especificamos el id_empleado porque será generado automáticamente.
*/
INSERT INTO empleados (nombre, tienda, salario, fecha_incorporacion)
VALUES
('Laura', 'Alcobendas', 25987.00, '2010-09-03'),
('Maria', 'Sevilla', NULL, '2001-11-04'),  -- indicamos salario null porque lo permitimos al definirlo en la tabla
('Ester', 'Oviedo', 30165.98, '2000-11-29');

SELECT * FROM clientes;

-- Inserción de datos en la tabla 'clientes' (con id_cliente AUTO_INCREMENT)
-- duda: nos ha dejado meter el numero de telefono como texto aunque estaba definido como INT
	-- ALTER TABLE clientes
	-- MODIFY COLUMN numero_telefono VARCHAR(45) NOT NULL;
INSERT INTO clientes (nombre, numero_telefono, email, direccion, ciudad, provincia, codigo_postal)
	VALUES
	('Monica', '1234567289', 'monica@email.com', 'Calle Felicidad', 'Móstoles', 'Madrid', '28176'),
	('Lorena', '289345678', 'lorena@email.com', 'Calle Alegria', 'Barcelona', 'Barcelona', '12346'),
	('Carmen', '298463759', 'carmen@email.com', 'Calle del Color', 'Vigo', 'Pontevedra', '23456');

SELECT * FROM facturas;

    -- duda: numero factura como INT o varchar
INSERT INTO facturas (numero_factura, fecha, id_zapatilla_facturas, id_empleado_facturas, id_cliente_facturas, total)
	VALUES
	(123, '2001-12-11', 1, 2, 1, 54.98),
    (1234, '2005-05-23', 1, 1, 3, 89.91),
    (12345, '2015-09-18', 2, 3, 3, 76.23);
    
-- EJERCICIO 3    
	SELECT * FROM zapatillas;
    
    UPDATE zapatillas
	SET color = 'amarillo'
	WHERE id_zapatilla = 2; -- lo he hecho con el id porque tengo la seguridad activada, pero lo haria con la column color para que se lo cambiara a todos los valores
    
	SELECT * FROM empleados;
	UPDATE empleados
	SET tienda = 'A Coruña'
	WHERE id_empleado = 1; 
    
    SELECT * FROM clientes;
    
	UPDATE clientes
	SET numero_telefono = 123456728
	WHERE id_cliente = 1; 
    
    -- Hacemos delete porque se nos han duplicado los valores
    DELETE FROM clientes
	WHERE id_cliente > 3;
    
	SELECT * FROM facturas;

	UPDATE facturas
	SET total = 90.91
	WHERE id_zapatilla_facturas = 2; 
    
    -- quiero que mi tabla vuelva a los id partiendo de 1
    -- primero borro datos, luego el alter table y luego incluyo los datos otra vez
	ALTER TABLE facturas
	AUTO_INCREMENT = 1;
    
    DELETE FROM facturas
	WHERE id_factura > 12;
    
    
/*
Ejercicio leccion 04
CREATE TABLE zapatillas(
	id_zapatilla INT NOT NULL AUTO_INCREMENT,
    modelo VARCHAR(45) NOT NULL,
    color VARCHAR(45) NOT NULL,
    PRIMARY KEY (id_zapatilla)
);

CREATE TABLE clientes(
	id_cliente INT NOT NULL AUTO_INCREMENT,
	nombre VARCHAR(45) NOT NULL,
	numero_telefono INT NOT NULL,
	email VARCHAR(45) NOT NULL,
	direccion VARCHAR(45) NOT NULL,
	ciudad VARCHAR(45) NULL,
	provincia VARCHAR(45) NOT NULL,
	pais VARCHAR(45) NOT NULL,
	codigo_postal VARCHAR(45) NULL,
	PRIMARY KEY (id_cliente)
);

CREATE TABLE empleados(
	id_empleado INT AUTO_INCREMENT NOT NULL,
	nombre VARCHAR(45) NOT NULL,
	tienda VARCHAR(45) NOT NULL,
	salario INT NULL,
	fecha_incorporacion DATE NOT NULL,
	PRIMARY KEY (id_empleado)
);

CREATE TABLE facturas(
-- Indentacion asi mejor
	id_factura INT AUTO_INCREMENT NOT NULL,
	numero_factura VARCHAR(45) NOT NULL,
	fecha DATE NOT NULL,
	id_zapatilla_facturas INT NOT NULL,
	id_empleado_facturas INT NOT NULL,
	id_cliente_facturas INT NOT NULL,
	-- duda: primary key es compuesta? depende de la estructura de valores de la tabla, asi como lo tenemos ahora esta bien
	PRIMARY KEY (id_factura),
	CONSTRAINT fk_zapatilla_facturas
		FOREIGN KEY (id_zapatilla_facturas)
		REFERENCES zapatillas(id_zapatilla)
        ON DELETE CASCADE,
	CONSTRAINT fk_empleado_facturas
		FOREIGN KEY (id_empleado_facturas)
		REFERENCES empleados(id_empleado)
        ON DELETE CASCADE,
	CONSTRAINT fk_cliente_facturas
		FOREIGN KEY (id_cliente_facturas)
		REFERENCES clientes(id_cliente)
		ON DELETE CASCADE
);
*/
