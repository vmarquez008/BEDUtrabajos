USE tienda;

#RETO 1
#¿Cuál es el nombre de los empleados cuyo sueldo es menor a $10,000?
SELECT id_puesto FROM puesto
WHERE salario < 10000;

SELECT nombre FROM empleado
WHERE id_puesto IN (SELECT id_puesto FROM puesto
WHERE salario < 10000);

#¿Cuál es la cantidad mínima y máxima de ventas de cada empleado?
SELECT * FROM venta
GROUP BY id_empleado, id_venta;

SELECT id_empleado, max(ventas), min(ventas) 
FROM (SELECT id_empleado , count(*) as ventas FROM venta
GROUP BY id_empleado, id_venta) AS tabla 
GROUP BY id_empleado;

#¿Cuáles claves de venta incluyen artículos cuyos precios son mayores a $5,000?

SELECT clave, id_articulo FROM venta
WHERE id_articulo IN
(SELECT id_articulo FROM
articulo WHERE precio > 5000);

#RETO 2

#¿Cuál es el nombre de los empleados que realizaron cada venta?
SELECT nombre, clave
FROM  empleado AS e
JOIN venta AS v
ON e.id_empleado = v.id_empleado;

#¿Cuál es el nombre de los artículos que se han vendido?
SELECT *
FROM venta AS v
JOIN articulo AS a
ON v.id_articulo = a.id_articulo;

#¿Cuál es el total de cada venta?

SELECT CLAVE, ROUND(SUM(precio),2) AS total
FROM venta AS v
JOIN articulo AS a
ON v.id_articulo = a.id_articulo
GROUP BY clave;

#RETO 3

#Obtener el puesto de un empleado.
SELECT e.nombre, e.apellido_paterno, p.nombre  
FROM empleado AS e
JOIN puesto AS p
ON e.id_puesto = p.id_puesto;

CREATE VIEW puestos_86 AS
SELECT e.nombre, e.apellido_paterno, p.nombre AS puesto
FROM empleado AS e
JOIN puesto AS p
ON e.id_puesto = p.id_puesto;

select * FROM puestos_86;

#Saber qué artículos ha vendido cada empleado.
CREATE VIEW ticket_86 AS
SELECT e.id_empleado, e.nombre, a.nombre AS articulo
FROM empleado AS  e
JOIN venta AS v
ON e.id_empleado = v.id_empleado
JOIN articulo AS a
ON v.id_articulo = a.id_articulo;

SELECT * 
FROM ticket_86;

#Saber qué puesto ha tenido más ventas
CREATE VIEW ventas_86 AS 
SELECT p.nombre, count(v.clave) AS total
FROM empleado AS  e
JOIN venta AS v
ON e.id_empleado = v.id_empleado
JOIN puesto AS p
ON e.id_puesto = p.id_puesto
GROUP BY p.nombre;

SELECT * FROM ventas_86;