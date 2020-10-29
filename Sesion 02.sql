SHOW DATABASE;
USE tienda;
SHOW Tables;

#Reto 1

SELECT *  FROM articulo WHERE nombre LIKE "%Pasta%";
SELECT *  FROM articulo WHERE nombre LIKE "%Cannelloni%";
SELECT *  FROM articulo WHERE nombre LIKE "% - %";
SELECT *  FROM puesto WHERE nombre LIKE "%Designer%";
SELECT *  FROM puesto WHERE nombre LIKE "%Developer%";

#Reto 2

SELECT AVG(salario) FROM puesto;
SELECT COUNT(*) FROM  articulo WHERE nombre LIKE "%Pasta%";
SELECT MIN(salario) AS salario_minimo, MAX(salario) AS salario_maximo FROM puesto;
SELECT SUM(salario) FROM puesto WHERE id_puesto >= 996;

#Reto 3

SELECT nombre, count(*) as total FROM puesto GROUP BY nombre;
SELECT nombre, sum(salario) AS salario FROM puesto GROUP BY nombre;
SELECT id_empleado AS empleado, count(clave) AS ventas FROM venta GROUP BY id_empleado;
SELECT id_articulo AS articulo, count(*) as total_de_ventas FROM venta GROUP BY id_articulo;



