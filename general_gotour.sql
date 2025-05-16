select * FROM `turismointeligente.ActividadesTurismo.gotour`;

--🟦 Dashboard 2: Experiencia y Planeación - MANUEL CUARESMA
--Consulta de ¿Cómo se enteró del tour? (Redes sociales, web, etc.)
SELECT 
  `string_field_7` AS `Cómo se Enteró`,
  COUNT(*) AS `Cantidad de Visitantes`
FROM `turismointeligente.ActividadesTurismo.gotour`
GROUP BY `string_field_7`
ORDER BY `Cantidad de Visitantes` DESC;

--Consulta de Tipo de experiencia buscada (Aventura, Cultura, etc.) por grupo de edad
SELECT
  `string_field_3` AS `Edad`,
  `string_field_6` AS `Tipo de Experiencia`,
  COUNT(*) AS `Cantidad de Visitantes`
FROM `turismointeligente.ActividadesTurismo.gotour`
GROUP BY `string_field_3`, `string_field_6`
ORDER BY `string_field_3`, `string_field_6`;

--Consulta de Temporada en que realizaron el tour
SELECT 
  `string_field_9` AS `Temporada`,
  COUNT(*) AS `Cantidad de Visitantes`
FROM `turismointeligente.ActividadesTurismo.gotour`
GROUP BY `string_field_9`
ORDER BY `Cantidad de Visitantes` DESC;

--Consulta en porcentaje de la temporada adecuada (Sí/No)
SELECT 
  ROUND(100.0 * SUM(CASE WHEN `string_field_10` = 'Si' THEN 1 ELSE 0 END) / COUNT(*), 2) AS `% Temporada Adecuada`
FROM `turismointeligente.ActividadesTurismo.gotour`;

--Consulta de visitantes en (Temporada alta, media, baja)
SELECT 
  `string_field_11` AS `Condición para Regresar`,
  COUNT(*) AS `Cantidad de Visitantes`
FROM `turismointeligente.ActividadesTurismo.gotour`
GROUP BY `string_field_11`
ORDER BY `Cantidad de Visitantes` DESC;

--Consulta para analizar el comportamiento de los visitantes. (género, edad y temporada) 
SELECT
  `string_field_4` AS `Género`,
  `string_field_3` AS `Edad`,
  `string_field_9` AS `Temporada`,
  COUNT(*) AS `Cantidad de Visitantes`,
  ROUND(100.0 * COUNT(*) / (SELECT COUNT(*) FROM `turismointeligente.ActividadesTurismo.gotour`), 2) AS `% de Visitantes`
FROM `turismointeligente.ActividadesTurismo.gotour`
WHERE `string_field_4` IN ('Masculino', 'Femenino') 
  AND `string_field_3` BETWEEN '18' AND '60'
GROUP BY `Género`, `Edad`, `Temporada`
ORDER BY `Género`, `Edad`, `Temporada`;

-- Consulta para Analizar el porcentaje de visitantes que sintieron que las actividades superaron sus expectativas, desglosado por tipo de experiencia y temporada.
SELECT
  `string_field_6` AS `Tipo de Experiencia`,
  `string_field_9` AS `Temporada`,
  ROUND(100.0 * SUM(CASE WHEN `string_field_18` = 'Sí' THEN 1 ELSE 0 END) / COUNT(*), 2) AS `% de Expectativas Superadas`
FROM `turismointeligente.ActividadesTurismo.gotour`
GROUP BY `Tipo de Experiencia`, `Temporada`
ORDER BY `Tipo de Experiencia`, `Temporada`;


----------------------------------------------------------------------------------------------------
--GENERAL
-----------------------------------------------------------------------------------------------------
--Contar la cantidad de visitantes por género:
SELECT 
  `string_field_4` AS `Género`,
  COUNT(*) AS `Cantidad de Visitantes`
FROM `turismointeligente.ActividadesTurismo.gotour`
GROUP BY `string_field_4`;

--Obtener el porcentaje de visitantes que es la primera vez que visitan:
SELECT 
  ROUND(100.0 * SUM(CASE WHEN `string_field_5` = 'No' THEN 1 ELSE 0 END) / COUNT(*), 2) AS `% Primera Visita`
FROM `turismointeligente.ActividadesTurismo.gotour`;

--Listar las 3 actividades más populares:
SELECT 
  `string_field_12` AS `Actividad`,
  COUNT(*) AS `Cantidad de Participantes`
FROM `turismointeligente.ActividadesTurismo.gotour`
GROUP BY `string_field_12`
ORDER BY `Cantidad de Participantes` DESC
LIMIT 3;

--Obtener el porcentaje de visitantes satisfechos con el trato del guía:
SELECT 
  ROUND(100.0 * SUM(CASE WHEN `string_field_14` = 'Satisfecho(a)' THEN 1 ELSE 0 END) / COUNT(*), 2) AS `% Satisfacción con el Guía`
FROM `turismointeligente.ActividadesTurismo.gotour`;

--Obtener la distribución de edades de los visitantes:
SELECT 
  `string_field_3` AS `Rango de Edad`,
  COUNT(*) AS `Cantidad de Visitantes`
FROM `turismointeligente.ActividadesTurismo.gotour`
GROUP BY `string_field_3`
ORDER BY `Cantidad de Visitantes` DESC;

--Listar las 4 formas más comunes en que los visitantes realizaron el tour:
SELECT 
  `string_field_8` AS `Forma de Realizar el Tour`,
  COUNT(*) AS `Cantidad de Visitantes`
FROM `turismointeligente.ActividadesTurismo.gotour`
GROUP BY `string_field_8`
ORDER BY `Cantidad de Visitantes` DESC
LIMIT 4;

--Listar las 3 temporadas más populares para que los visitantes regresen:
SELECT 
  `string_field_11` AS `Temporada para Regresar`,
  COUNT(*) AS `Cantidad de Visitantes`
FROM `turismointeligente.ActividadesTurismo.gotour`
GROUP BY `string_field_11`
ORDER BY `Cantidad de Visitantes` DESC
LIMIT 3;

--Listar las 3 temporadas más populares para realizar el tour:
SELECT 
  `string_field_9` AS `Temporada`,
  COUNT(*) AS `Cantidad de Visitantes`
FROM `turismointeligente.ActividadesTurismo.gotour`
GROUP BY `string_field_9`
ORDER BY `Cantidad de Visitantes` DESC
LIMIT 3;

--Listar las 4 actividades con mayor porcentaje de participantes:
SELECT 
  `string_field_12` AS `Actividad`,
  ROUND(100.0 * COUNT(*) / (SELECT COUNT(*) FROM `turismointeligente.ActividadesTurismo.gotour`), 2) AS `% de Participantes`
FROM `turismointeligente.ActividadesTurismo.gotour`
GROUP BY `string_field_12`
ORDER BY `% de Participantes` DESC
LIMIT 4;

--Listar las 3 actividades con mayor porcentaje de visitantes que las realizaron:
SELECT 
  `string_field_12` AS `Actividad`,
  ROUND(100.0 * COUNT(*) / (SELECT COUNT(*) FROM `turismointeligente.ActividadesTurismo.gotour`), 2) AS `% de Participantes`
FROM `turismointeligente.ActividadesTurismo.gotour`
GROUP BY `string_field_12`
ORDER BY `% de Participantes` DESC
LIMIT 3;

--Obtener el porcentaje de visitantes que recomendarían el tour a amigos o familiares:
SELECT 
  ROUND(100.0 * SUM(CASE WHEN `string_field_20` = 'Si' THEN 1 ELSE 0 END) / COUNT(*), 2) AS `% Recomendarían el Tour`
FROM `turismointeligente.ActividadesTurismo.gotour`;

--Listar las 5 formas más comunes en que los visitantes se enteraron del tour:
SELECT 
  `string_field_7` AS `Cómo se Enteraron`,
  COUNT(*) AS `Cantidad de Visitantes`
FROM `turismointeligente.ActividadesTurismo.gotour`
GROUP BY `string_field_7`
ORDER BY `Cantidad de Visitantes` DESC
LIMIT 5;