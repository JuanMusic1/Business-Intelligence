-- Lista de todos los datos de la tabla Clientes

SELECT * From Clientes;

-- Lista del nombre de los vendedores que realizaran 2 pedidos o mas ordenados de mayor a menor

SELECT Empleado.CC, Empleado.Nombres, Empleado.Apellidos, COUNT(Pedido.Id_Empleado) AS Cantidad_Ventas
From Empleado
INNER JOIN Pedido
ON Empleado.CC == Pedido.Id_Empleado
GROUP BY Pedido.Id_Empleado
HAVING COUNT(Pedido.Id_Empleado) > 1
ORDER BY Cantidad_Ventas DESC;

-- Lista de los nombres de los cloente que realizaron pedidos realizados antes del 2020-09-07

SELECT Cliente.Nombres, Pedido.Fecha AS Fecha_Pedido
FROM Cliente INNER JOIN Pedido
WHERE Pedido.Fecha > CAST('2020-09-07' AS datetime)
Order BY Cliente.Nombres ASC;

-- Lista de las Materias primas con su correspondiente proveedor

SELECT MateriaPrima.Nombre as MPN, Proveedor.Nombre AS NP
From MateriaPrima CROSS JOIN Proveedor
ON MateriaPrima.Id_Proveedor = Proveedor.NIT;

-- Lista de todos los datos no nulos de los pedidos no pagos

SELECT Pedido.Id, Pedido.Fecha, Pedido.Id_Cliente, Pedido.Id_Empleado
FROM Pedido LEFT OUTER JOIN Factura
ON Pedido.Id = Factura.Id_Pedido
Where Factura.Fecha_Pago IS NULL;

