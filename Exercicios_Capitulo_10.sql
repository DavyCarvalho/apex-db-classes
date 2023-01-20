-- Questão 1
CREATE DATABASE exercicios_procedure;

-- Questão 2
CREATE TABLE Usuarios (
	Id INT IDENTITY(1,1),
	Nome VARCHAR(30),
	Idade INT,
	
	PRIMARY KEY(Id)
);

-- Questão 3
CREATE PROCEDURE NovoUsuario @Nome NVARCHAR(15), @Idade INT 
AS INSERT INTO Usuarios (Nome, Idade) VALUES (@Nome, @Idade);

EXEC NovoUsuario @Nome = 'Davy', @Idade = 24;

-- Questão 4
CREATE PROCEDURE EditarUsuario @Id INT, @Nome NVARCHAR(15), @Idade INT 
AS UPDATE Usuarios SET Nome = @Nome, Idade = @Idade WHERE Id = @Id;

EXEC EditarUsuario @Id = 1, @Nome = 'Gamora', @Idade = 2;

-- Questão 5
CREATE PROCEDURE ApagarUsuarioPorNome @Nome NVARCHAR(15)
AS DELETE FROM Usuarios WHERE Nome = @Nome;

EXEC ApagarUsuarioPorNome @Nome = 'Gamora';

-- Questão 6
DROP PROCEDURE NovoUsuario;
DROP PROCEDURE EditarUsuario;
DROP PROCEDURE ApagarUsuarioPorNome;

-- Questão 7
DROP DATABASE exercicios_procedure;
