-- Questão 1
CREATE VIEW ExercicioCap09_01 AS
SELECT 
c.Nome AS Cliente,
c2.Nome AS Curso
FROM Clientes c
INNER JOIN Cursos c2 ON c.Curso = c2.Id;

SELECT * FROM ExercicioCap09_01;

-- Questão 2
CREATE VIEW ExercicioCap09_02 AS
SELECT 
c.Nome AS Curso,
c2.Nome AS Cliente
FROM Cursos c
LEFT JOIN Clientes c2 ON c.Id = c2.Curso;

SELECT * FROM ExercicioCap09_02;

-- Questão 3
CREATE VIEW ExercicioCap09_03 AS
SELECT 
c.Nome AS Curso,
COUNT(c2.Id) AS ClientesCursando
FROM Cursos c
LEFT JOIN Clientes c2 ON c.Id = c2.Curso 
GROUP BY c.Nome;

SELECT * FROM ExercicioCap09_03 ORDER BY ClientesCursando DESC;

-- Questão 4
CREATE VIEW ExercicioCap09_04 AS
SELECT Nome FROM Clientes;

SELECT * FROM ExercicioCap09_04 ORDER BY Nome ASC;

-- Questão 5
DROP VIEW ExercicioCap09_01;
DROP VIEW ExercicioCap09_02;
DROP VIEW ExercicioCap09_03;
DROP VIEW ExercicioCap09_04;