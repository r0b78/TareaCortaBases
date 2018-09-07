--1
--//Por día//
SELECT Platillo.Nombre,Horario.Titulo,Horario.Fecha,COUNT (RatingPlatillo.LikeDislike) AS Voto FROM RatingPlatillo
INNER JOIN Platillo ON RatingPlatillo.idPlatillo = Platillo.idPlatillo  
INNER JOIN HorarioPlatillo ON Platillo.idPlatillo= HorarioPlatillo.idPlatillo
INNER JOIN Horario ON HorarioPlatillo.idHorario= Horario.idHorario
WHERE Fecha > DATE('now','-1 day' ,'localtime') AND RatingPlatillo.LikeDislike = 1
GROUP BY Platillo.Nombre
ORDER BY Voto DESC
LIMIT 1

--//Por semana//
SELECT Platillo.Nombre,Horario.Titulo,Horario.Fecha,COUNT (RatingPlatillo.LikeDislike) AS Voto FROM RatingPlatillo
INNER JOIN Platillo ON RatingPlatillo.idPlatillo = Platillo.idPlatillo  
INNER JOIN HorarioPlatillo ON Platillo.idPlatillo= HorarioPlatillo.idPlatillo
INNER JOIN Horario ON HorarioPlatillo.idHorario= Horario.idHorario
WHERE Fecha > DATE('now','-7 days' ,'localtime') AND RatingPlatillo.LikeDislike = 1
GROUP BY Platillo.Nombre
ORDER BY Voto DESC
LIMIT 1

--//Por mes//

SELECT Platillo.Nombre,Horario.Titulo,Horario.Fecha,COUNT (RatingPlatillo.LikeDislike) AS Voto FROM RatingPlatillo
INNER JOIN Platillo ON RatingPlatillo.idPlatillo = Platillo.idPlatillo  
INNER JOIN HorarioPlatillo ON Platillo.idPlatillo= HorarioPlatillo.idPlatillo
INNER JOIN Horario ON HorarioPlatillo.idHorario= Horario.idHorario
WHERE Fecha > DATE('now','-1 month' ,'localtime') AND RatingPlatillo.LikeDislike = 1
GROUP BY Platillo.Nombre
ORDER BY Voto DESC
LIMIT 1

--//Por semestre//

SELECT Platillo.Nombre,Horario.Titulo,Horario.Fecha,COUNT (RatingPlatillo.LikeDislike) AS Voto FROM RatingPlatillo
INNER JOIN Platillo ON RatingPlatillo.idPlatillo = Platillo.idPlatillo  
INNER JOIN HorarioPlatillo ON Platillo.idPlatillo= HorarioPlatillo.idPlatillo
INNER JOIN Horario ON HorarioPlatillo.idHorario= Horario.idHorario
WHERE Fecha < DATE('now','-6 months' ,'localtime') AND RatingPlatillo.LikeDislike = 1
GROUP BY Platillo.Nombre
ORDER BY Voto DESC
LIMIT 1

//Por todos los restaurantes//

SELECT Platillo.Nombre, COUNT (RatingPlatillo.LikeDislike) AS Voto FROM RatingPlatillo
INNER JOIN Platillo ON RatingPlatillo.idPlatillo = Platillo.idPlatillo  
INNER JOIN HorarioPlatillo ON Platillo.idPlatillo= HorarioPlatillo.idPlatillo
INNER JOIN Horario ON HorarioPlatillo.idHorario= Horario.idHorario
INNER JOIN Restaurante ON Horario.idRestaurante =Restaurante.idRestaurante
WHERE RatingPlatillo.LikeDislike=1
GROUP BY Platillo.Nombre
ORDER BY Voto DESC
LIMIT 1


//Por cada restaurante//

SELECT  Restaurante.Nombre,Platillo.Nombre, COUNT (RatingPlatillo.LikeDislike) AS Voto FROM RatingPlatillo
INNER JOIN Platillo ON RatingPlatillo.idPlatillo = Platillo.idPlatillo  
INNER JOIN HorarioPlatillo ON Platillo.idPlatillo= HorarioPlatillo.idPlatillo
INNER JOIN Horario ON HorarioPlatillo.idHorario= Horario.idHorario
INNER JOIN Restaurante ON Horario.idRestaurante =Restaurante.idRestaurante
WHERE Restaurante.Nombre= "Casa Luna" AND RatingPlatillo.LikeDislike=1
GROUP BY Platillo.Nombre
ORDER BY Voto DESC
LIMIT 1

--2
--Seleccionar el horario más frecuentado por los estudiantes.

--En General
SELECT Visita.Fecha,Horario.Titulo,count(Visita.idHorario) as Frecuencia FROM Visita 
LEFT JOIN Horario ON Visita.idHorario=Horario.idHorario
Group by Visita.idHorario
Order by Frecuencia DESC
LIMIT 1

--Version con nombre restaurante y Nombre de Estudiantes
SELECT Horario.Tipo,count(Horario.idHorario) as NumeroDeVisitas FROM Visita 
INNER JOIN Horario ON Visita.idHorario=Horario.idHorario
INNER JOIN Restaurante ON Horario.idRestaurante = Restaurante.idRestaurante
INNER JOIN Estudiante ON Visita.idEstudiante= Estudiante.idEstudiante
Group by Estudiante.idEstudiante
ORDER by NumeroDeVisitas DESC
LIMIT 1

--3
--Seleccionar la carrera de estudiantes que más frecuenta cada restaurante.
--Entregarrr
SELECT count(Estudiante.idCarrera) as Frecuencia,Restaurante.nombre,Carrera.nombre FROM Visita 
INNER JOIN Horario ON Visita.idHorario=Horario.idHorario
INNER JOIN Restaurante ON Horario.idRestaurante = Restaurante.idRestaurante
INNER JOIN Estudiante ON Visita.idEstudiante= Estudiante.idEstudiante
INNER JOIN Carrera ON Estudiante.idCarrera= Carrera.idCarrera
Group by Estudiante.idCarrera
Order by Frecuencia DESC 
LIMIT 1

--4
--Seleccionar el estudiante más participativo de la aplicación.
SELECT 		count(Voto.idEstudiante) AS Participacion,
			Estudiante.Nombre,
			Estudiante.idEstudiante 
FROM 		Voto
INNER JOIN 	Estudiante 
ON 			Estudiante.idEstudiante=Voto.idEstudiante
GROUP BY 	Voto.idEstudiante
ORDER BY 	Participacion DESC
LIMIT 		1

--5
--Rating Restaurante

SELECT
(((	count (case LikeDislike when 1 then 1 else null end))*1.0
 -(	count(case LikeDislike when 0 then 1 else null end))*1.0
)/(	count(RatingRestaurante.idRestaurante))*1.0
  )as RankingRestaurante
 ,Restaurante.nombre 
FROM 		RatingRestaurante
INNER JOIN 	Restaurante 
ON 			RatingRestaurante.idRestaurante=Restaurante.idRestaurante
GROUP BY 	RatingRestaurante.idRestaurante





--insert 
INSERT INTO Horario (
			Titulo,
			Tipo,
			Fecha,
			idRestaurante
)
VALUES
 (
 "Ven a Probar",
 "Almuerzo",
 datetime('now'),
 1
);

--update 

UPDATE Sede
SET Sede.Nombre = "Limon",Sede.Descripcion="Sede de limon"
WHERE Sede.nombre="ESto se cambia";



--delete

DELETE FROM RestaurantePlatillo WHERE idRestaurante = 1;


--distict 
SELECT DISTINCT idCarrera
FROM Estudiante

--is not nulll -or
Select Voto.idVoto,Voto.idEstudiante,Voto.idRatingRestaurante
FROM Voto 
Where Voto.idRatingRestaurante IS NOT NULL 
OR Voto.idEstudiante=1


--min max
SELECT Platillo.nombre,min(Platillo.precio)
FROM Platillo 


SELECT 	Platillo.nombre,max(Platillo.precio)
FROM 	Platillo 

--avg /sum 
SELECT avg(Platillo.precio) as PromedioDePrecios,sum(Platillo.precio) as PrecioParaComerTodo
FROM Platillo 





----------------Aqui termina
