
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
