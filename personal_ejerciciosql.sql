SELECT * FROM empleados;
SELECT * FROM departamentos;
SELECT  nombre_depto FROM departamentos;
SELECT nombre, sal_emp FROM empleados;
SELECT comision_emp FROM empleados;
SELECT * FROM empleados WHERE cargo_emp = "Secretaria";
SELECT * FROM empleados WHERE cargo_emp = "Vendedor" ORDER BY nombre ASC;
SELECT * FROM empleados ORDER BY sal_emp ASC;
SELECT * FROM departamentos WHERE ciudad ="Ciudad_Real*";
SELECT nombre AS "Nombre" , cargo_emp AS "Cargo" FROM empleados;
SELECT sal_emp, comision_emp FROM empleados WHERE id_depto = "2000" ORDER BY comision_emp ASC;
SELECT nombre, (sal_emp + comision_emp + 500) AS TotalPrice FROM empleados WHERE id_depto = "3000" ORDER BY nombre ASC;
SELECT nombre FROM empleados WHERE nombre LIKE'J%';
SELECT sal_emp, comision_emp, (sal_emp + comision_emp) AS Total , nombre FROM empleados WHERE comision_emp>1000;
SELECT sal_emp AS Total , nombre FROM empleados WHERE comision_emp=0;
SELECT nombre FROM empleados WHERE comision_emp > sal_emp;
SELECT nombre FROM empleados WHERE comision_emp <= (sal_emp * 0.30);
SELECT nombre FROM empleados WHERE nombre NOT LIKE '%MA%';
SELECT * FROM departamentos WHERE nombre_depto IN ("Ventas","Investigación","Mantenimiento");
SELECT * FROM departamentos WHERE nombre_depto NOT IN ("Ventas","Investigación","Mantenimiento");
SELECT nombre, sal_emp FROM empleados WHERE sal_emp = (SELECT MAX(sal_emp) FROM empleados);
SELECT nombre FROM empleados ORDER BY nombre DESC LIMIT 1;
SELECT MAX(sal_emp), MIN(sal_emp), (MAX(sal_emp)-MIN(sal_emp)) AS 'Diferencia' from empleados;
SELECT id_depto, AVG(sal_emp) as "Salario Promedio" from empleados GROUP BY id_depto;
SELECT id_depto, COUNT(*) AS 'Numero de Empleados' FROM empleados GROUP BY id_depto HAVING COUNT(*) >3;
SELECT id_depto, COUNT(*) AS 'Numero de Empleados' FROM empleados GROUP BY id_depto HAVING COUNT(*) =0;
SELECT nombre, sal_emp, id_depto FROM empleados WHERE sal_emp >= (SELECT AVG(sal_emp) FROM empleados) ORDER BY Id_depto;



SELECT * FROM empleados;
SELECT * FROM departamentos;
