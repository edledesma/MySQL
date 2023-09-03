#Realizar las siguientes consultas sobre una sola tabla. Los nombres de las columnas deben mostrarse en español:
#A.  Listar todos los registros de la tabla, visualizando las columnas type, title_content, country, rating, duration, listed_in.
SELECT type AS tipo, title_content AS titulo_del_contenido, country AS pais, rating AS clasificacion, duration AS duracion, listed_in AS aparece_en FROM content;
#B.  Mostrar todas las filas de la tabla, presentando las columnas id_content, title_production, genre, runtime, imdb_Score.
SELECT id_content as id_contenido, title_production AS titulo_de_la_produccion, genre AS genero, runtime as duracion, imdb_score AS puntaje_imdb FROM production;
#C.  Generar un listado de todas las películas en las que participe Argentina, mostrando las columnas id_content, type, title_content, director, cast, rating, duration, listed_in.
SELECT content.id_content AS id_contenido,  content.type AS tipo,  production.title_production AS titulo_contenido,  content.director AS director,  content.cast AS reparto,  content.rating AS clasificacion,  content.duration AS duracion,  content.listed_in AS listado_en
FROM content JOIN  production ON content.id_content = production.id_content WHERE  content.country = 'Argentina' AND content.type = 'Movie';
#D.  Presentar un listado con las columnas id_production, title_production, genre, language, imdb_score de los registros de la tabla en las que el imdb_score sea superior a 7.5.
SELECT id_production AS id_produccion,title_production AS titulo_de_la_produccion,  genre AS genero, language AS lenguaje,  imdb_score AS puntaje_imdb FROM  production WHERE  imdb_score > 7.5;
#E.  Mostrar las columnas id_content, type, title_content, listed_in de los registros en los que el rating público general o admitido para todas las edades.
SELECT id_content AS id_contenido,  type AS tipo,  title_content AS titulo_contenido,  listed_in AS listado_en, rating AS clasificacion FROM content WHERE rating = 'TV-G' OR rating = 'G';
#F.  Obtener una lista con las columnas id_production, title_production, genre de los registros en que duration sea menor o igual a 105 minutos pero que además tenga una duración de al menos 60 minutos.
SELECT production.id_production AS id_produccion, production.title_production AS titulo_produccion, production.genre AS genero, content.duration AS duracion FROM production JOIN content ON production.id_content = content.id_content WHERE content.duration <= 105 AND content.duration >= 60;
#G.  Obtener la cantidad de registros discriminando por type y rating, ordenados alfabéticamente por rating y por type.
SELECT type AS tipo, rating AS clasificacion,  COUNT(*) AS cantidad_registros FROM content GROUP BY type, rating ORDER BY rating, tipo;
#H.  Mostrar la cantidad  de películas en los idiomas portugués, francés, alemán, italiano y español, ordenados por cantidad, de mayor a menor.
SELECT language AS idioma,  COUNT(*) AS cantidad_peliculas FROM  production WHERE language IN ('Portuguese', 'French', 'German', 'Italian', 'Spanish')GROUP BY language ORDER BY cantidad_peliculas DESC;
