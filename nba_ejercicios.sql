-- 1. Mostrar el nombre de todos los jugadores ordenados alfabéticamente.
SELECT nombre FROM jugadores ORDER BY nombre ASC;
-- 2. Mostrar el nombre de los jugadores que sean pivots (‘C’) y que pesen más de 200 libras,ordenados por nombre alfabéticamente.
SELECT nombre FROM jugadores WHERE posicion = "C" AND Peso > 200 ORDER BY nombre ASC;
-- 3. Mostrar el nombre de todos los equipos ordenados alfabéticamente.
SELECT nombre FROM equipos ORDER BY nombre ASC;
-- 4. Mostrar el nombre de los equipos del este (East).
SELECT nombre FROM equipos WHERE conferencia = "East";
-- 5. Mostrar los equipos donde su ciudad empieza con la letra ‘c’, ordenados por nombre.
SELECT nombre,ciudad FROM equipos WHERE ciudad LIKE "c%" ORDER BY nombre ASC;
-- 6. Mostrar todos los jugadores y su equipo ordenados por nombre del equipo.
SELECT nombre, nombre_equipo FROM jugadores ORDER BY nombre_equipo ASC;
-- 7. Mostrar todos los jugadores del equipo “Raptors” ordenados por nombre.
SELECT nombre, nombre_equipo FROM jugadores WHERE nombre_equipo = "Raptors" ORDER BY nombre ASC;
-- 8. Mostrar los puntos por partido del jugador ‘Pau Gasol’.
SELECT jugadores.nombre, puntos_por_partido FROM estadisticas RIGHT JOIN jugadores ON jugadores.codigo = estadisticas.jugador WHERE jugador = (SELECT codigo FROM jugadores WHERE nombre = "Pau Gasol");
-- 9. Mostrar los puntos por partido del jugador ‘Pau Gasol’ en la temporada ’04/05′.
SELECT jugadores.nombre, puntos_por_partido, temporada FROM estadisticas RIGHT JOIN jugadores ON jugadores.codigo = estadisticas.jugador WHERE jugador = (SELECT codigo FROM jugadores WHERE nombre = "Pau Gasol") AND temporada = "04/05";
-- 10. Mostrar el número de puntos de cada jugador en toda su carrera.
SELECT jugadores.nombre, SUM(estadisticas.puntos_por_partido) FROM estadisticas RIGHT JOIN jugadores ON jugadores.codigo = estadisticas.jugador GROUP BY jugadores.nombre;
-- 11. Mostrar el número de jugadores de cada equipo.
SELECT nombre_equipo,COUNT(jugadores.nombre) AS "Cantidad Jugadores" FROM jugadores GROUP BY jugadores.nombre_equipo;
-- 12. Mostrar el jugador que más puntos ha realizado en toda su carrera.
SELECT nombre, estadisticas.puntos_por_partido FROM jugadores RIGHT JOIN estadisticas ON jugadores.codigo = estadisticas.jugador ORDER BY puntos_por_partido DESC LIMIT 1;
-- 13. Mostrar el nombre del equipo, conferencia y división del jugador más alto de la NBA.
SELECT jugadores.nombre,nombre_equipo, equipos.conferencia, equipos.division FROM jugadores RIGHT JOIN equipos ON jugadores.nombre_equipo = equipos.nombre WHERE jugadores.altura =(SELECT MAX(Altura) FROM jugadores);
-- 14. Mostrar el partido o partidos (equipo_local, equipo_visitante y diferencia) con mayordiferencia de puntos.
SELECT equipo_local, equipo_visitante, ABS(puntos_local - puntos_visitante) AS diferencia FROM partidos WHERE ABS(puntos_local - puntos_visitante) = (  SELECT MAX(ABS(puntos_local - puntos_visitante)) FROM partidos);
-- 15. Mostrar quien gana en cada partido (codigo, equipo_local, equipo_visitante,equipo_ganador), en caso de empate sera null.
SELECT codigo, equipo_local, equipo_visitante, CASE WHEN puntos_local > puntos_visitante THEN equipo_local WHEN puntos_local < puntos_visitante THEN equipo_visitante ELSE NULL END AS equipo_ganador FROM partidos;

SELECT * FROM equipos;
SELECT * FROM estadisticas;
SELECT * FROM jugadores;
