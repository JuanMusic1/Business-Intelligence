/* Lista de todos los datos de la tabla Clientes */

SELECT * FROM Cliente;

/* Lista de los datos de los clientes que han realizado ordenes */

SELECT Cliente.*, OrdenVenta.Nro FROM Cliente, OrdenVenta WHERE Cliente.CC == OrdenVenta.CC GROUP BY Cliente.CC;

/* Numero y fecha de solicitud de las ordenes de venta quese ahn entregado, con la fecha de entrega */

SELECT OrdenVenta.Nro, OrdenVenta.Fecha_solicitud, Venta.Fecha_Venta
FROM OrdenVenta, Venta
WHERE OrdenVenta.Nro == Venta.Nro;

/* Lista de empleados que han atendido mas de dos ordenes de venta, ordenados segun la cantidad atendida */

SELECT Empleado.Nombre, Empleado.Apellidos, COUNT(OrdenVenta.Id_Empleado) AS Cantidad_ventas
FROM Empleado INNER JOIN OrdenVenta
ON Empleado.Id = OrdenVenta.Id_Empleado
GROUP BY OrdenVenta.Id_Empleado, Empleado.Apellidos
HAVING COUNT(OrdenVenta.Id_Empleado) > 2
ORDER BY Cantidad_ventas DESC;

/* Ordenes de venta que no se han realizado hasta la fecha (Nro de orden, cliente que la solicito y empleado que la atendio) */

SELECT OrdenVenta.Nro, Cliente.Nombre AS CN, Cliente.Apellidos AS CA, Empleado.Nombre AS EN, Empleado.Apellidos AS EA
FROM OrdenVenta LEFT OUTER JOIN Venta ON OrdenVEnta.Nro = Venta.Nro
INNER JOIN Cliente ON OrdenVenta.CC = Cliente.CC
INNER JOIN Empleado ON OrdenVenta.Id_Empleado = Empleado.Id
WHERE Venta.fecha_venta IS NULL;

/* Por cada orden de venta el precio total que se debe pagar */

SELECT OrdenVenta_Producto.Nro, SUM((OrdenVenta_Producto.cantidad * Producto.Precio - (OrdenVenta_Producto.cantidad * Producto.Precio * (OrdenVenta_Producto.descuento / 100)))) AS Total_Pago
FROM OrdenVenta_Producto INNER JOIN Producto
ON OrdenVenta_Producto.codigo = Producto.Codigo
Group By OrdenVenta_Producto.Nro;

/* Monto total de las ventas realizadas en el año 2012 */

SELECT OrdenVenta_Producto.Nro, SUM((OrdenVenta_Producto.cantidad * Producto.Precio - (OrdenVenta_Producto.cantidad * Producto.Precio * (OrdenVenta_Producto.descuento / 100)))) AS Total_Pago
FROM OrdenVenta_Producto INNER JOIN Producto
ON OrdenVenta_Producto.codigo = Producto.Codigo
INNER JOIN OrdenVenta
ON OrdenVenta_Producto.Nro = OrdenVenta.Nro
WHERE OrdenVenta.Fecha_solicitud >= '2012-01-01' AND OrdenVenta.Fecha_solicitud < '2013-01-01'
Group By OrdenVenta_Producto.Nro;
