
CREATE DATABASE Pizzeria;
USE Pizzeria;
CREATE TABLE provincia (
    id_provincia INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);
CREATE TABLE localidad (
    id_localidad INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    id_provincia INT NOT NULL,
    FOREIGN KEY (id_provincia) REFERENCES provincia(id_provincia)
);
CREATE TABLE cliente (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellidos VARCHAR(150) NOT NULL,
    direccion VARCHAR(255) NOT NULL,
    codigo_postal VARCHAR(10),
    id_localidad INT NOT NULL,
    telefono VARCHAR(20),
    FOREIGN KEY (id_localidad) REFERENCES localidad(id_localidad)
);
CREATE TABLE tienda (
    id_tienda INT AUTO_INCREMENT PRIMARY KEY,
    direccion VARCHAR(255) NOT NULL,
    codigo_postal VARCHAR(10),
    id_localidad INT NOT NULL,
    FOREIGN KEY (id_localidad) REFERENCES localidad(id_localidad)
);
CREATE TABLE empleado (
    id_empleado INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellidos VARCHAR(150) NOT NULL,
    nif VARCHAR(20) UNIQUE NOT NULL,
    telefono VARCHAR(20),
    rol ENUM('cocinero','repartidor') NOT NULL,
    id_tienda INT NOT NULL,
    FOREIGN KEY (id_tienda) REFERENCES tienda(id_tienda)
);
CREATE TABLE categoria (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);
CREATE TABLE producto (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    imagen VARCHAR(255),
    precio DECIMAL(8,2) NOT NULL,
    tipo ENUM('pizza','hamburguesa','bebida') NOT NULL,
    id_categoria INT,
    FOREIGN KEY (id_categoria) REFERENCES categoria(id_categoria)
);
CREATE TABLE pedido (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    fecha_hora DATETIME NOT NULL,
    tipo_entrega ENUM('domicilio','tienda') NOT NULL,
    total DECIMAL(10,2) NOT NULL,
    id_cliente INT NOT NULL,
    id_tienda INT NOT NULL,
    id_repartidor INT,
    fecha_hora_entrega DATETIME,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
    FOREIGN KEY (id_tienda) REFERENCES tienda(id_tienda),
    FOREIGN KEY (id_repartidor) REFERENCES empleado(id_empleado)
);
CREATE TABLE pedido_producto (
    id_pedido INT NOT NULL,
    id_producto INT NOT NULL,
    cantidad INT NOT NULL DEFAULT 1,
    PRIMARY KEY (id_pedido, id_producto),
    FOREIGN KEY (id_pedido) REFERENCES pedido(id_pedido),
    FOREIGN KEY (id_producto) REFERENCES producto(id_producto)
);



