BEGIN TRANSACTION

--Capítulo 04 - Manipulando estruturas
CREATE DATABASE Projeto;

USE Projeto;

CREATE TABLE Clientes (
	Nome VARCHAR(30),
	Cidade VARCHAR(20),
	Idade INT
);

--Adicionar uma nova coluna
ALTER TABLE Clientes ADD Email VARCHAR(30);

--Remover coluna
ALTER TABLE Clientes DROP COLUMN Email;

--ReNomear tabela
exec sp_rename 'Clientes', 'Usuarios';

--Excluir base de dados
DROP DATABASE Projeto;

--Capítulo 05 - Manipulando dados

--Cadastrar dados
INSERT INTO Clientes VALUES ('Ralf', 'Blumenau', 30);

--Cadastrar dados específicos
INSERT INTO Clientes (Nome, Idade) VALUES ('Tatiana', 29);

--Cadastrar vários usuários em um único comando
INSERT INTO Clientes VALUES
('Mayra', 'Joinville', 31),
('Henrique', 'Blumenau', 30),
('Paloma', 'Florianópolis', 32);

--Selecionar todos os dados
SELECT * FROM Clientes;

--Selecionar os Nomes e idades
SELECT Nome, Idade FROM Clientes;

--Alterar a Cidade de Paloma para Joinville
UPDATE Clientes SET Cidade = 'Joinville' WHERE Nome = 'Paloma';

--Excluir o cliente de Nome Paloma
DELETE FROM Clientes WHERE Nome 'Paloma';

--Capítulo 06 - Filtrando dados

--Exibir os Clientes com idade superior a 30
SELECT * FROM Clientes WHERE Idade > 30;

--Exibir os Clientes com idade superior a 30 e que não sejam de Blumenau
SELECT * FROM Clientes WHERE Idade > 30 AND Cidade <> 'Blumenau';

--Maior Idade
SELECT MAX(Idade) FROM Clientes;
--Menor Idade
SELECT MIN(Idade) FROM Clientes;

--Contar os Clientes cadastrados
SELECT COUNT(*) FROM Clientes;
--Média das idades
SELECT AVG(Idade) FROM Clientes;
--Soma das idades
SELECT SUM(Idade) FROM Clientes;

--Exibir os Clientes que iniciam com a letra H
SELECT * FROM Clientes WHERE Nome LIKE 'H%';

--Exibir os Clientes que finalizam com a letra A
SELECT * FROM Clientes WHERE Nome LIKE '%A';

--Exibir os Clientes que contenham a letra R
SELECT * FROM Clientes WHERE Nome LIKE '%R%'

--Exibir os Clientes nas Cidades de Blumenau e Joinville
SELECT * FROM Clientes WHERE Cidade IN ('Blumenau', 'Joinville');

--Exibir os Clientes com idade entre 20 e 30
SELECT * FROM Clientes WHERE Idade BETWEEN 20 AND 30;

--Ordenar por Nome (A - Z)
SELECT * FROM Clientes ORDER BY Nome ASC;

--Ordenar por idade (Maior para menor)
SELECT * FROM Clientes ORDER BY Idade DESC;

--Exibir o Nome da Cidade e a quantidade
SELECT Cidade, COUNT(*) FROM Clientes GROUP BY Cidade;

--Extra sobre Group By
select * from Clientes
select Idade, COUNT(*) from Clientes GROUP BY Idade
SELECT Cidade, SUM(Idade) FROM Clientes GROUP BY Cidade

--Capítulo 07 - Relacionamento entre tabelas

--1:1 (1 Habitante possui 1 CPF e 1 CPF pertence a 1 Habitante)

CREATE TABLE Cpfs (
	Id INT IDENTITY(1,1),
	Numero VARCHAR(12) UNIQUE,--A PALAVRA CHAVE 'UNIQUE' NÃO DEIXA QUE VALORES SEJAM REPETIDOS NESSA COLUNA

	PRIMARY KEY(Id)
);

CREATE TABLE Habitantes ( 
	Id INT IDENTITY(1,1),
	Nome VARCHAR(30),
	CpfId INT UNIQUE,
	
	PRIMARY KEY(Id),
	FOREIGN KEY(CpfId) REFERENCES Cpfs(Id)
);

INSERT INTO Cpfs VALUES 
('12345678900'),
('12345678901'); -- UNIQUE !!!

INSERT INTO Habitantes VALUES
('Davy', 1),
('Milly', 2),
('Gamora', 4); -- UNIQUE !!!

--1:N (1 Cidade pertence a 1 Estado e 1 Estado possui N Cidades)

CREATE TABLE Estados ( 
	Id INT IDENTITY(1,1),
	Nome VARCHAR(30),
	
	PRIMARY KEY(Id)
);

CREATE TABLE Cidades (
	Id INT IDENTITY(1,1),
	Nome VARCHAR(30),
	EstadoId INT,

	PRIMARY KEY(Id),
	FOREIGN KEY(EstadoId) REFERENCES Estados(Id)
);

INSERT INTO Estados VALUES 
('Santa Catarina'),
('Paraná');

INSERT INTO Cidades VALUES 
('Blumenau', 1),
('Maringa', 2),
('Indaial', 1),
('Loanda', 2);


--N:N (1 Ator possui N Filmes e 1 Filme pertence a N Atores)
CREATE TABLE Atores ( 
	Id INT IDENTITY(1,1),
	Nome VARCHAR(30),
	
	PRIMARY KEY(Id)
);

CREATE TABLE Filmes (
	Id INT IDENTITY(1,1),
	Nome VARCHAR(30),

	PRIMARY KEY(Id)
);

CREATE TABLE AtorFilme (
	Id INT IDENTITY(1,1),
	AtorId INT,
	FilmeId INT,
	
	PRIMARY KEY(Id),
	FOREIGN KEY(AtorId) REFERENCES Atores(Id),
	FOREIGN KEY(FilmeId) REFERENCES Filmes(Id)
);

INSERT INTO Atores VALUES
('Paulo Gustavo'),
('Herson Capri'),
('Samantha Schmütz');

INSERT INTO Filmes VALUES 
('Minha Mãe é Uma Peça'),
('Vai que Cola – O Filme'),
('O Preço da Paz'),
('Os Salafrários');

INSERT INTO AtorFilme (AtorId, FilmeId) VALUES
(1, 1),
(2, 1),
(3, 1),
(1, 2),
(2, 3),
(3, 4);

--Capítulo 08 - Joins

CREATE TABLE Cidades (
	Id INT IDENTITY(1,1),
	Nome VARCHAR(30),
	
	PRIMARY KEY(Id)
);

CREATE TABLE Clientes (
	Id INT IDENTITY(1,1),
	Nome VARCHAR(15),
	CidadeId INT,
	
	PRIMARY KEY(Id),
	FOREIGN KEY(CidadeId) REFERENCES Cidades(Id)
);

INSERT INTO Cidades (Nome) VALUES
('Blumenau'),
('Camboriú'),
('Joinville'),
('Indaial');

INSERT INTO Clientes (Nome, CidadeId) VALUES
('Davy', 1),
('Júlio', 3),
('Larissa', 1),
('Christian', 2);

SELECT
	Clientes.Nome,
	Cidades.Nome
FROM Clientes INNER JOIN Cidades
ON Clientes.CidadeId = Cidades.Id;

SELECT
	Cidades.Nome as Cidade, -- APELIDO
	COUNT(Clientes.Nome) as quantidadeDeMoradores -- APELIDO
FROM Cidades LEFT JOIN Clientes
ON Clientes.CidadeId = Cidades.Id
GROUP BY Cidades.Nome

SELECT
	Cidades.Nome as NomeDaCidade,
	Clientes.Nome as NomeDoCliente
FROM Clientes RIGHT JOIN Cidades
ON Clientes.CidadeId = Cidades.Id;

--Capítulo 09 - Views

--Criar view
ALTER TABLE Clientes ADD Idade INT;
UPDATE Clientes SET Idade = 30

CREATE VIEW NovaView AS
SELECT
	Cidades.Nome as Cidade, -- APELIDO
	COUNT(Clientes.Nome) as quantidadeDeMoradores -- APELIDO
FROM Cidades LEFT JOIN Clientes
ON Clientes.CidadeId = Cidades.Id
GROUP BY Cidades.Nome

--Executar view
SELECT * FROM NovaView;

--Excluir view
DROP VIEW visao;

--Tabela para execução dos exercícios do capítulo 09
CREATE TABLE Cursos (
	Id INT IDENTITY(1,1),
	Nome VARCHAR(12),

	PRIMARY KEY(Id)
);

CREATE TABLE Clientes (
	Id INT IDENTITY(1,1),
	Nome VARCHAR(30),
	Curso INT,
	
	PRIMARY KEY(Id),
	FOREIGN KEY(Curso) REFERENCES Cursos(Id)
);

INSERT INTO Cursos VALUES 
('Java'),
('C#'),
('Python'),
('Cobol'),
('Delphi');

INSERT INTO Clientes VALUES
('Davy', 1),
('Marco', 2),
('Milly', 2),
('Gamora', 3),
('Ronaldo', 2),
('Neymar', 1),
('Hulk', NULL),
('Messi', NULL);

--Capítulo 10 - Stored Procedure

--Criar procedure
CREATE PROCEDURE inserirCidade @Nome NVARCHAR(15)
AS INSERT INTO Cidades (Nome) VALUES (@Nome);

--Executar procedure
EXEC inserirCidade @Nome = 'Florianópolis';

--Excluir procedure
DROP PROCEDURE inserirCidade;

ROLLBACK TRANSACTION
