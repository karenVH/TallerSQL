-- -----------------------------------------------------
-- CONSULTAS 
-- ------------------------------------------------------------------------------------------------------
-- 1. Consulta SQL donde pueda obtener los productos vendidos digitando tipo de documento y número de documento.
-- --------------------------------------------------------------------------------------------------------
SELECT  venta.idVenta, cliente.tipoDocumento, cliente.numeroDocumento, productos.nombreProducto
FROM ((venta
INNER JOIN cliente ON venta.Cliente_idCliente = cliente.idCliente)
INNER JOIN productos ON venta.Producto_idProducto = productos.idProducto)
WHERE cliente.tipoDocumento = "CC" AND cliente.numeroDocumento = 100122949;
-- ---------------------------------------------------------------------------------------------------------
-- 2. Consultar productos por medio del nombre, el cual debe mostrar quien o quienes han sido sus proveedores.
-- ---------------------------------------------------------------------------------------------------------
SELECT productos.nombreProducto, proveedor.nombreProveedor
FROM productos
INNER JOIN proveedor ON productos.Proveedor_idProveedor = proveedor.idProveedor
WHERE productos.nombreProducto = "Salchichon";
-- -----------------------------------------------------------------------------------------------------------
-- 3.[PLUS no obligatorio] Crear una consulta que me permita ver qué producto ha sido el más vendido y en qué cantidades de mayor a menor.
SELECT venta.idVenta, venta.cantidad, productos.nombreProducto
FROM venta
INNER JOIN productos ON venta.Producto_idProducto = productos.idProducto
WHERE venta.cantidad = (SELECT MAX(venta.cantidad) FROM venta);
