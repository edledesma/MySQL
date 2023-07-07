SELECT nombre FROM producto;
SELECT nombre,precio FROM producto;
SELECT * FROM producto;
SELECT nombre, round(precio) FROM producto;
SELECT codigo FROM fabricante;
SELECT codigo_fabricante FROM producto GROUP BY codigo_fabricante;
SELECT nombre FROM fabricante ORDER BY nombre ASC;
SELECT nombre, precio FROM producto ORDER BY nombre ASC ,precio DESC;
SELECT * FROM fabricante LIMIT 5;
SELECT nombre, precio FROM producto ORDER BY precio ASC LIMIT 1;
SELECT nombre, precio FROM producto ORDER BY precio DESC LIMIT 1;
SELECT nombre FROM producto WHERE precio <= 120;
SELECT * FROM producto WHERE precio BETWEEN 60 AND 200;
SELECT * FROM producto WHERE codigo_fabricante IN (1,3,5);
SELECT nombre FROM producto WHERE nombre LIKE'%Portátil%'; 
SELECT producto.codigo AS codigo_producto, producto.nombre AS nombre_producto , fabricante.codigo AS manufacturador_codigo, fabricante.nombre AS nombre_fabricante  FROM producto RIGHT JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo;
SELECT producto.codigo AS codigo_producto, producto.nombre AS nombre_producto , fabricante.codigo AS manufacturador_codigo, fabricante.nombre AS nombre_fabricante  FROM producto RIGHT JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo ORDER BY fabricante.nombre ASC;
SELECT producto.nombre, producto.precio FROM producto RIGHT JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante ORDER BY producto.precio ASC LIMIT 2;


SELECT * FROM producto;
SELECT * FROM fabricante;