CREATE SCHEMA `tienda_zapatillas`;

USE `tienda_zapatillas`;
-- facturas esta relacionada con empleados, clientes y zapatillas
-- empleados, clientes y zapatillas no tienen relacion entre ellos
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

