--
-- File generated with SQLiteStudio v3.2.1 on lun. sep. 14 22:14:54 2020
--
-- Text encoding used: UTF-8
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: Cliente
DROP TABLE IF EXISTS Cliente;
CREATE TABLE Cliente (
    CC        INT     PRIMARY KEY
                      UNIQUE
                      NOT NULL,
    Nombres   VARCHAR,
    Apellidos VARCHAR,
    Telefono  VARCHAR,
    Email     VARCHAR,
    Direccion VARCHAR
);
INSERT INTO Cliente (CC, Nombres, Apellidos, Telefono, Email, Direccion) VALUES (657378, 'Sandra Catalina', 'Gomez', '3128287', '', 'Cra 40 # 10A-02');
INSERT INTO Cliente (CC, Nombres, Apellidos, Telefono, Email, Direccion) VALUES (289244, 'Luis Ernesto', 'Rozo', '5803800', '', 'Calle 10B # 37-69');
INSERT INTO Cliente (CC, Nombres, Apellidos, Telefono, Email, Direccion) VALUES (895029, 'Luis ', 'Duque', '', '', 'Calle 12 # 40A-95 Apto 904 - Art Living');
INSERT INTO Cliente (CC, Nombres, Apellidos, Telefono, Email, Direccion) VALUES (10345, 'Juan de Jesus', 'Jimenez', '3046783010', '', 'Cra 33 # 8A-37');
INSERT INTO Cliente (CC, Nombres, Apellidos, Telefono, Email, Direccion) VALUES (903254, 'Pedro', 'Fernandez', '3218009482', '', 'Cra 40 # 10A-48');
INSERT INTO Cliente (CC, Nombres, Apellidos, Telefono, Email, Direccion) VALUES (423452, 'Maria Eugenia', 'Alvarez', '3148884294', '', 'Calle 12 # 43B-81');

-- Table: Empleado
DROP TABLE IF EXISTS Empleado;
CREATE TABLE Empleado (
    CC        INTEGER PRIMARY KEY
                      UNIQUE
                      NOT NULL,
    Nombres   VARCHAR,
    Apellidos VARCHAR,
    Cargo     VARCHAR
);
INSERT INTO Empleado (CC, Nombres, Apellidos, Cargo) VALUES (2528041, 'Maria Eugenia', 'Jaramillo', 'Duena');
INSERT INTO Empleado (CC, Nombres, Apellidos, Cargo) VALUES (37342856, 'Juliana', 'Londono', 'Vendedor');
INSERT INTO Empleado (CC, Nombres, Apellidos, Cargo) VALUES (37657244, 'Sofia', 'Trujillo', 'Gerente general');
INSERT INTO Empleado (CC, Nombres, Apellidos, Cargo) VALUES (38285392, 'Diego Alejandro', 'Oquendo', 'Vendedor');
INSERT INTO Empleado (CC, Nombres, Apellidos, Cargo) VALUES (47643890, 'Juan Sebastian', 'Velasquez', 'Vendedor');

-- Table: Envio
DROP TABLE IF EXISTS Envio;
CREATE TABLE Envio (
    Id_Pedido    INT      REFERENCES Pedido (Id)
                          NOT NULL
                          UNIQUE,
    Destinatario VARCHAR  NOT NULL,
    Direccion    VARCHAR  NOT NULL,
    Telefono     VARCHAR  NOT NULL,
    Fecha_Envio  DATETIME NOT NULL,
    Mensaje      VARCHAR
);
INSERT INTO Envio (Id_Pedido, Destinatario, Direccion, Telefono, Fecha_Envio, Mensaje) VALUES (2, 'Martha Jaramillo', 'Calle 10A # 40-18', '3006128784', '2020-09-10-11:15:56', '');
INSERT INTO Envio (Id_Pedido, Destinatario, Direccion, Telefono, Fecha_Envio, Mensaje) VALUES (5, 'Clara Arango', 'Calle 20Sur # 39A-250, Apt 302 - Ed Torre Mayor', '3002665202', '2020-09-10-14:39:41', '');
INSERT INTO Envio (Id_Pedido, Destinatario, Direccion, Telefono, Fecha_Envio, Mensaje) VALUES (8, 'Alina Cardona', 'Cra 63 # 38-100, Apt 1607 torre 2 - Centro Residencial Colseguros', '321 8529081', '2020-09-13-19:00:34', 'Feliz Cumple');

-- Table: Factura
DROP TABLE IF EXISTS Factura;
CREATE TABLE Factura (
    Id_Pedido    INT      NOT NULL
                          REFERENCES Pedido (Id),
    Precio_Total DOUBLE   NOT NULL,
    Fecha_Pago   DATETIME NOT NULL
);
INSERT INTO Factura (Id_Pedido, Precio_Total, Fecha_Pago) VALUES (1, 60000.0, '2020-09-08-20:04:15');
INSERT INTO Factura (Id_Pedido, Precio_Total, Fecha_Pago) VALUES (2, 120000.0, '2020-09-10-16:00:54');
INSERT INTO Factura (Id_Pedido, Precio_Total, Fecha_Pago) VALUES (3, 80000.0, '2020-09-10-15:33:34');
INSERT INTO Factura (Id_Pedido, Precio_Total, Fecha_Pago) VALUES (4, 70000.0, '2020-09-11-8:22:45');
INSERT INTO Factura (Id_Pedido, Precio_Total, Fecha_Pago) VALUES (5, 100000.0, '2020-09-13-12:56:00');
INSERT INTO Factura (Id_Pedido, Precio_Total, Fecha_Pago) VALUES (6, 45000.0, '2020-09-14-21:54:24');
INSERT INTO Factura (Id_Pedido, Precio_Total, Fecha_Pago) VALUES (7, 10000.0, '2020-09-14-13:13:49');
INSERT INTO Factura (Id_Pedido, Precio_Total, Fecha_Pago) VALUES (8, 130000.0, '2020-09-13-18:27:23');
INSERT INTO Factura (Id_Pedido, Precio_Total, Fecha_Pago) VALUES (9, 4500.0, '2020-09-14-7:50:29');

-- Table: Materia_Prima
DROP TABLE IF EXISTS Materia_Prima;
CREATE TABLE Materia_Prima (Id INT PRIMARY KEY UNIQUE NOT NULL, Nombre VARCHAR, Descripcion VARCHAR, Id_Proveedor INT REFERENCES Proveedor (NIT) NOT NULL);

-- Table: MateriaPrima
DROP TABLE IF EXISTS MateriaPrima;
CREATE TABLE MateriaPrima (
    Id           INT     PRIMARY KEY
                         UNIQUE
                         NOT NULL,
    Nombre       VARCHAR,
    Descripcion  VARCHAR,
    Id_Proveedor INT     REFERENCES Proveedor (NIT)
                         NOT NULL
);
INSERT INTO MateriaPrima (Id, Nombre, Descripcion, Id_Proveedor) VALUES (1, 'Rosa', 'Comunmente rojas pero existen hasta 3 mil especies diferentes', 435213);
INSERT INTO MateriaPrima (Id, Nombre, Descripcion, Id_Proveedor) VALUES (2, 'Tulipan', 'Pueden llegar hasta los 60cm y crecen comunmente en primavera', 48034305);
INSERT INTO MateriaPrima (Id, Nombre, Descripcion, Id_Proveedor) VALUES (3, 'Vanda (Orquidea)', 'Comunmente encontradas en terrazas y balcones por sus largas raices ', 2734388);
INSERT INTO MateriaPrima (Id, Nombre, Descripcion, Id_Proveedor) VALUES (4, 'Gypsophila', 'Flores pequennas que adornan diferentes ramos', 435213);
INSERT INTO MateriaPrima (Id, Nombre, Descripcion, Id_Proveedor) VALUES (5, 'Cymbidium (Orquidea)', 'Conocidas como orquideas de bote necesitan mucha agua', 2734388);
INSERT INTO MateriaPrima (Id, Nombre, Descripcion, Id_Proveedor) VALUES (6, 'Fully', 'Tambien usdas para adornar otros ramos mas que todo', 48034305);
INSERT INTO MateriaPrima (Id, Nombre, Descripcion, Id_Proveedor) VALUES (7, 'Bolsa plastico', 'Para empacar las flores y protegerlas dentro delas cajas', 1348623);
INSERT INTO MateriaPrima (Id, Nombre, Descripcion, Id_Proveedor) VALUES (8, 'Tarjeta regalo', 'Tarjeta para poner los datos del emisor y un mensaje especial', 45672932);
INSERT INTO MateriaPrima (Id, Nombre, Descripcion, Id_Proveedor) VALUES (9, 'Cinta de adorno', 'Cinta de colores para hacer nudos decorativos', 45672932);

-- Table: Pedido
DROP TABLE IF EXISTS Pedido;
CREATE TABLE Pedido (
    Id          INT      PRIMARY KEY
                         UNIQUE
                         NOT NULL,
    Fecha       DATETIME NOT NULL,
    Id_Cliente  INT      REFERENCES Cliente (CC)
                         NOT NULL,
    Id_Empleado INT      REFERENCES Empleado (CC)
                         NOT NULL
);
INSERT INTO Pedido (Id, Fecha, Id_Cliente, Id_Empleado) VALUES (1, '2020-09-08-20:04:15', 657378, 47643890);
INSERT INTO Pedido (Id, Fecha, Id_Cliente, Id_Empleado) VALUES (2, '2020-09-10-11:01:13', 289244, 2528041);
INSERT INTO Pedido (Id, Fecha, Id_Cliente, Id_Empleado) VALUES (3, '2020-09-10-15:33:34', 895029, 37657244);
INSERT INTO Pedido (Id, Fecha, Id_Cliente, Id_Empleado) VALUES (4, '2020-09-11-8:22:45', 10345, 37657244);
INSERT INTO Pedido (Id, Fecha, Id_Cliente, Id_Empleado) VALUES (5, '2020-09-10-14:30:10', 895029, 38285392);
INSERT INTO Pedido (Id, Fecha, Id_Cliente, Id_Empleado) VALUES (6, '2020-09-14-21:54:24', 423452, 37342856);
INSERT INTO Pedido (Id, Fecha, Id_Cliente, Id_Empleado) VALUES (7, '2020-09-14-13:13:49', 289244, 2528041);
INSERT INTO Pedido (Id, Fecha, Id_Cliente, Id_Empleado) VALUES (8, '2020-09-13-18:27:23', 903254, 2528041);
INSERT INTO Pedido (Id, Fecha, Id_Cliente, Id_Empleado) VALUES (9, '2020-09-14-7:50:29', 895029, 47643890);
INSERT INTO Pedido (Id, Fecha, Id_Cliente, Id_Empleado) VALUES (23, '2020-09-10-11:01:13', 289244, 2528041);
INSERT INTO Pedido (Id, Fecha, Id_Cliente, Id_Empleado) VALUES (0, '2020-09-10-15:33:34', 895029, 37657244);

-- Table: Pedido_Producto
DROP TABLE IF EXISTS Pedido_Producto;
CREATE TABLE Pedido_Producto (
    Id_Pedido   INT NOT NULL
                    REFERENCES Pedido (Id),
    Id_Producto INT NOT NULL
                    REFERENCES Producto (Id),
    Cantidad    INT NOT NULL
);
INSERT INTO Pedido_Producto (Id_Pedido, Id_Producto, Cantidad) VALUES (1, 1, 2);
INSERT INTO Pedido_Producto (Id_Pedido, Id_Producto, Cantidad) VALUES (2, 2, 3);
INSERT INTO Pedido_Producto (Id_Pedido, Id_Producto, Cantidad) VALUES (3, 3, 5);
INSERT INTO Pedido_Producto (Id_Pedido, Id_Producto, Cantidad) VALUES (4, 4, 1);
INSERT INTO Pedido_Producto (Id_Pedido, Id_Producto, Cantidad) VALUES (5, 5, 3);
INSERT INTO Pedido_Producto (Id_Pedido, Id_Producto, Cantidad) VALUES (6, 6, 1);
INSERT INTO Pedido_Producto (Id_Pedido, Id_Producto, Cantidad) VALUES (7, 7, 1);
INSERT INTO Pedido_Producto (Id_Pedido, Id_Producto, Cantidad) VALUES (8, 2, 4);
INSERT INTO Pedido_Producto (Id_Pedido, Id_Producto, Cantidad) VALUES (9, 4, 2);

-- Table: Producto
DROP TABLE IF EXISTS Producto;
CREATE TABLE Producto (
    Id     INT    PRIMARY KEY
                  UNIQUE
                  NOT NULL,
    Precio DOUBLE NOT NULL
);
INSERT INTO Producto (Id, Precio) VALUES (1, 60000.0);
INSERT INTO Producto (Id, Precio) VALUES (2, 120000.0);
INSERT INTO Producto (Id, Precio) VALUES (3, 80000.0);
INSERT INTO Producto (Id, Precio) VALUES (4, 70000.0);
INSERT INTO Producto (Id, Precio) VALUES (5, 100000.0);
INSERT INTO Producto (Id, Precio) VALUES (6, 45000.0);
INSERT INTO Producto (Id, Precio) VALUES (7, 10000.0);
INSERT INTO Producto (Id, Precio) VALUES (23, 130000.0);
INSERT INTO Producto (Id, Precio) VALUES (32, 4500.0);

-- Table: Producto_MateriaPrima
DROP TABLE IF EXISTS Producto_MateriaPrima;
CREATE TABLE Producto_MateriaPrima (
    Id_Producto INT REFERENCES Producto (Id)
                    NOT NULL,
    Id_MatPrima INT REFERENCES MateriaPrima (Id)
                    NOT NULL,
    Cantidad    INT NOT NULL
);
INSERT INTO Producto_MateriaPrima (Id_Producto, Id_MatPrima, Cantidad) VALUES (1, 1, 4);
INSERT INTO Producto_MateriaPrima (Id_Producto, Id_MatPrima, Cantidad) VALUES (2, 7, 1);
INSERT INTO Producto_MateriaPrima (Id_Producto, Id_MatPrima, Cantidad) VALUES (3, 9, 3);
INSERT INTO Producto_MateriaPrima (Id_Producto, Id_MatPrima, Cantidad) VALUES (4, 8, 1);
INSERT INTO Producto_MateriaPrima (Id_Producto, Id_MatPrima, Cantidad) VALUES (5, 1, 12);
INSERT INTO Producto_MateriaPrima (Id_Producto, Id_MatPrima, Cantidad) VALUES (6, 7, 1);
INSERT INTO Producto_MateriaPrima (Id_Producto, Id_MatPrima, Cantidad) VALUES (7, 9, 3);
INSERT INTO Producto_MateriaPrima (Id_Producto, Id_MatPrima, Cantidad) VALUES (2, 8, 1);
INSERT INTO Producto_MateriaPrima (Id_Producto, Id_MatPrima, Cantidad) VALUES (4, 6, 10);

-- Table: Proveedor
DROP TABLE IF EXISTS Proveedor;
CREATE TABLE Proveedor (
    NIT       INT     PRIMARY KEY
                      UNIQUE
                      NOT NULL,
    Nombre    VARCHAR,
    Telefono  VARCHAR,
    Direccion VARCHAR
);
INSERT INTO Proveedor (NIT, Nombre, Telefono, Direccion) VALUES (435213, 'CristiFlor', '', 'Placita de Flores');
INSERT INTO Proveedor (NIT, Nombre, Telefono, Direccion) VALUES (2734388, 'Arango Flowers', '4480248', 'Calle 11 # 43-79');
INSERT INTO Proveedor (NIT, Nombre, Telefono, Direccion) VALUES (45672932, 'Creaciones New', '3106065', '');
INSERT INTO Proveedor (NIT, Nombre, Telefono, Direccion) VALUES (48034305, 'floreale boutique', '2524956', '');
INSERT INTO Proveedor (NIT, Nombre, Telefono, Direccion) VALUES (1348623, 'Canastas Albeiro', '', 'Pantanillo, Santa Elena');

COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
