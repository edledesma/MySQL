-- 1. Mostrar el nombre de todos los pokemon.
SELECT nombre FROM pokemon;
-- 2. Mostrar los pokemon que pesen menos de 10k.
SELECT * FROM pokemon WHERE peso < 10;
-- 3. Mostrar los pokemon de tipo agua.
SELECT * FROM pokemon JOIN pokemon_tipo ON pokemon.numero_pokedex = pokemon_tipo.numero_pokedex JOIN tipo ON pokemon_tipo.id_tipo = tipo.id_tipo WHERE tipo.nombre = "Agua";
-- 4. Mostrar los pokemon de tipo agua, fuego o tierra ordenados por tipo. 
SELECT * FROM pokemon JOIN pokemon_tipo ON pokemon.numero_pokedex = pokemon_tipo.numero_pokedex JOIN tipo ON pokemon_tipo.id_tipo = tipo.id_tipo WHERE tipo.nombre in("Agua","Fuego","Tierra") order by tipo.id_tipo asc;
-- 5. Mostrar los pokemon que son de tipo fuego y volador.
SELECT * FROM pokemon JOIN pokemon_tipo ON pokemon.numero_pokedex = pokemon_tipo.numero_pokedex JOIN tipo ON pokemon_tipo.id_tipo = tipo.id_tipo WHERE tipo.nombre in("Fuego","Volador");
-- 6. Mostrar los pokemon con una estadística base de ps mayor que 200.forma_evolucion
SELECT nombre , ps FROM estadisticas_base JOIN pokemon ON pokemon.numero_pokedex = estadisticas_base.numero_pokedex WHERE estadisticas_base.ps > 200;
-- 7. Mostrar los datos (nombre, peso, altura) de la prevolución de Arbok.
SELECT pokemon.nombre AS preevolucion, pokemon.peso, pokemon.altura, arbok.nombre AS evolucionado FROM pokemon JOIN evoluciona_de ON pokemon.numero_pokedex = evoluciona_de.pokemon_origen JOIN pokemon AS arbok ON arbok.numero_pokedex = evoluciona_de.pokemon_evolucionado WHERE arbok.nombre = 'Arbok';
-- 8. Mostrar aquellos pokemon que evolucionan por intercambio.
SELECT  pokemon.nombre AS Nombre,  pokemon.numero_pokedex AS Pokedex,  tipo_evolucion.tipo_evolucion AS Evolucion FROM  pokemon JOIN  forma_evolucion ON pokemon.numero_pokedex = forma_evolucion.id_forma_evolucion JOIN   tipo_evolucion ON forma_evolucion.tipo_evolucion = tipo_evolucion.id_tipo_evolucion WHERE forma_evolucion.tipo_evolucion = 3;

-- 9. Mostrar el nombre del movimiento con más prioridad. /////    SELECT * FROM movimiento ORDER By prioridad DESC limit 1;
SELECT * FROM movimiento WHERE prioridad = (select MAX(prioridad) from movimiento);

-- 10. Mostrar el pokemon más pesado.
SELECT * FROM pokemon WHERE peso = (select MAX(peso) from Pokemon);

-- 11. Mostrar el nombre y tipo del ataque con más potencia.
SELECT nombre ;

-- 12. Mostrar el número de movimientos de cada tipo.

-- 13. Mostrar todos los movimientos que puedan envenenar.

select 	case when efs.efecto_secundario LIKE '%ven%'then efs.efecto_secundario   when mov.descripcion like '%ven%' then mov.nombre    end as poder from efecto_secundario efs, movimiento mov where efs.efecto_secundario LIKE '%ven%' or mov.descripcion like '%ven%' ;
select 	case		when efs.efecto_secundario LIKE '%ven%'then 'secundario'        when mov.descripcion like '%ven%' then 'principal'    end as tipo_poder,	case		when efs.efecto_secundario LIKE '%ven%'then efs.efecto_secundario        when mov.descripcion like '%ven%' then mov.nombre    end as poder from efecto_secundario efs, movimiento mov where efs.efecto_secundario LIKE '%ven%' or mov.descripcion like '%ven%' order by tipo_poder asc ;

SELECT movimiento.id_movimiento,movimiento.nombre, movimiento.descripcion FROM movimiento JOIN movimiento_efecto_secundario ON movimiento.id_movimiento = movimiento_efecto_secundario.id_movimiento JOIN efecto_secundario;

-- 14. Mostrar todos los movimientos que causan daño, ordenados alfabéticamente por nombre.

-- 15. Mostrar todos los movimientos que aprende pikachu.evoluciona_de

-- 16. Mostrar todos los movimientos que aprende pikachu por MT (tipo de aprendizaje).

-- 17. Mostrar todos los movimientos de tipo normal que aprende pikachu por nivel.

-- 18. Mostrar todos los movimientos de efecto secundario cuya probabilidad sea mayor al 30%.

-- 19. Mostrar todos los pokemon que evolucionan por piedra.
SELECT  pokemon.nombre AS Nombre,  pokemon.numero_pokedex AS Pokedex,  tipo_evolucion.tipo_evolucion AS Evolucion FROM  pokemon JOIN  forma_evolucion ON pokemon.numero_pokedex = forma_evolucion.id_forma_evolucion JOIN   tipo_evolucion ON forma_evolucion.tipo_evolucion = tipo_evolucion.id_tipo_evolucion WHERE forma_evolucion.tipo_evolucion = 2;
-- 20. Mostrar todos los pokemon que no pueden evolucionar.
SELECT p.nombre, p.numero_pokedex FROM pokemon p LEFT JOIN forma_evolucion fe ON p.numero_pokedex = fe.id_forma_evolucion WHERE fe.id_forma_evolucion IS NULL;
-- 21. Mostrar la cantidad de los pokemon de cada tipo.
SELECT t.nombre AS Tipo, COUNT(*) AS Cantidad FROM pokemon p JOIN pokemon_tipo pt ON p.numero_pokedex = pt.numero_pokedex JOIN tipo t ON pt.id_tipo = t.id_tipo GROUP BY t.nombre;