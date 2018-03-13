CREATE DATABASE tomorrowland; 

CREATE TABLE empleados (
    numemp INTEGER PRIMARY KEY,
    nombre VARCHAR(40),
    edad INTEGER,
    oficina INTEGER,
    titulo VARCHAR(250),
    contrato DATE,
    jefe INTEGER, 
    cuota FLOAT,
    ventas FLOAT
)

CREATE TABLE oficina (
    oficina INTEGER PRIMARY KEY,
    ciudad VARCHAR NOT NULL, 
    region VARCHAR NOT NULL,
    dir INTEGER,
    objetivo VARCHAR,
    ventas FLOAT
);

CREATE TABLE clientes (
    numclie INTEGER PRIMARY KEY,
    nombre VARCHAR NOT NULL,
    repclie INTEGER,
    limite_credito FLOAT,
)

CREATE TABLE productos (
    idfab INTEGER AUTO_INCREMENT, 
    idproducto INTEGER AUTO_INCREMENT,
    descripcion VARCHAR,
    precio FLOAT,
    existencias INTEGER
)

CREATE TABLE pedidos (
    codigo INTEGER PRIMARY KEY AUTO_INCREMENT,
    num_pedido INTEGER NOT NULL,
    fecha_pedido DATE NOT NULL,
    cliente INTEGER NOT NULL,
    rep INTEGER,
    fab VARCHAR(3),
    producto INTEGER NOT NULL,
    cant INTEGER NOT NULL,
    importe INTEGER NOT NULL,
)