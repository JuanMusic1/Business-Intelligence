/* Punto 1 */

SELECT * FROM Cliente;

/* Punto  2*/

SELECT Cliente.*, OrdenVenta.Nro FROM Cliente, OrdenVenta WHERE Cliente.CC == OrdenVenta.CC GROUP BY Cliente.CC;

/* Punto 3*/

SELECT OrdenVenta.Nro, OrdenVenta.Fecha_solicitud, Venta.Fecha_Venta
FROM OrdenVenta, Venta
WHERE OrdenVenta.Nro == Venta.Nro;

/* Punto 4 */

SELECT Empleado.Nombre, Empleado.Apellidos, COUNT(OrdenVenta.Id_Empleado) AS Cantidad_ventas
FROM Empleado INNER JOIN OrdenVenta
ON Empleado.Id = OrdenVenta.Id_Empleado
GROUP BY OrdenVenta.Id_Empleado, Empleado.Apellidos
HAVING COUNT(OrdenVenta.Id_Empleado) > 2
ORDER BY Cantidad_ventas DESC;

/* Punto 5 */

SELECT OrdenVenta.Nro, Cliente.Nombre AS CN, Cliente.Apellidos AS CA, Empleado.Nombre AS EN, Empleado.Apellidos AS EA
FROM OrdenVenta LEFT OUTER JOIN Venta ON OrdenVEnta.Nro = Venta.Nro
INNER JOIN Cliente ON OrdenVenta.CC = Cliente.CC
INNER JOIN Empleado ON OrdenVenta.Id_Empleado = Empleado.Id
WHERE Venta.fecha_venta IS NULL;

/* Punto 6 */

SELECT




