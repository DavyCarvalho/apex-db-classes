
--Capítulo 04 - Manipulando estruturas

--CREATE DATABASE projeto;

--USE projeto;

--CREATE TABLE clientes (
	--nome VARCHAR(30),
	--cidade VARCHAR(20),
	--idade INT
--)

--Adicionar uma nova coluna
--ALTER TABLE clientes ADD email VARCHAR(30);

--Remover coluna
--ALTER TABLE clientes DROP COLUMN email;

--Renomear tabela
--exec sp_rename 'clientes', 'usuarios';

--Excluir base de dados
--DROP DATABASE projeto;

--Capítulo 05 - Manipulando dados

--Cadastrar dados
--INSERT INTO clientes VALUES ('Ralf', 'Blumenau', 30);

--Cadastrar dados específicos
--INSERT INTO clientes (nome, idade) VALUES ('Tatiana', 29);

--Cadastrar vários usuários em um único comando
--INSERT INTO clientes VALUES
--('Mayra', 'Joinville', 31),
--('Henrique', 'Blumenau', 30),
--('Paloma', 'Florianópolis', 32);

--Selecionar todos os dados
--SELECT * FROM clientes;

--Selecionar os nomes e idades
--SELECT nome, idade FROM clientes;

--Alterar a cidade de Paloma para Joinville
--UPDATE clientes SET cidade = 'Joinville' WHERE nome = 'Paloma';

--Excluir o cliente de nome Paloma
--DELETE FROM clientes WHERE nome 'Paloma';

--Capítulo 06 - Filtrando dados

--Exibir os clientes com idade superior a 30
--SELECT * FROM clientes WHERE idade > 30;

--Exibir os clientes com idade superior a 30 e que não sejam de Blumenau
--SELECT * FROM clientes WHERE idade > 30 AND cidade <> 'Blumenau';

--Maior idade
--SELECT MAX(idade) FROM clientes;
--Menor idade
--SELECT MIN(idade) FROM clientes;

--Contar os clientes cadastrados
--SELECT COUNT(*) FROM clientes;
--Média das idades
--SELECT AVG(idade) FROM clientes;
--Soma das idades
--SELECT SUM(idade) FROM clientes;

--Exibir os clientes que iniciam com a letra H
--SELECT * FROM clientes WHERE nome LIKE 'H%';
--Exibir os clientes que finalizam com a letra A
--SELECT * FROM clientes WHERE nome LIKE '%A';
--Exibir os clientes que contenham a letra R
--SELECT * FROM clientes WHERE nome LIKE '%R%'

--Exibir os clientes nas cidades de Blumenau e Joinville
--SELECT * FROM clientes WHERE cidade IN ('Blumenau', 'Joinville');

--Exibir os clientes com idade entre 20 e 30
--SELECT * FROM clientes WHERE idade BETWEEN 20 AND 30;

--Ordenar por nome (A - Z)
--SELECT * FROM clientes ORDER BY nome ASC;
--Ordenar por idade (Maior para menor)
--SELECT * FROM clientes ORDER BY idade DESC;

--Exibir o nome da cidade e a quantidade
--SELECT cidade, count(*) FROM clientes GROUP BY cidade;

--Extra Group By
--select * from clientes
--select idade, count(*) from clientes GROUP BY idade
--SELECT cidade, SUM(idade) FROM clientes GROUP BY cidade

--Capítulo 07 - Relacionamento entre tabelas

--CREATE TABLE usuarios (
--codigo INT IDENTITY(1,1),
--nome VARCHAR(30),
--idade INT,
--email VARCHAR(40),
--PRIMARY KEY(codigo)
--);

--Capítulo 08 - Joins

--CREATE TABLE cidades (
--	codigo INT IDENTITY(1,1),
--	nome VARCHAR(30),
--	PRIMARY KEY(codigo)
--);

--CREATE TABLE clientes (
--	codigo INT IDENTITY(1,1),
--	nome VARCHAR(15),
--	cidade INT,
--	PRIMARY KEY(codigo),
--	FOREIGN KEY(cidade) REFERENCES cidades (codigo)
--);

--INSERT INTO cidades (nome) VALUES
--('Blumenau'),
--('Camboriú'),
--('Joinville'),
--('Indaial');

--INSERT INTO clientes (nome, cidade) VALUES
--('Ana', 1),
--('Júlio', 3),
--('Larissa', 1),
--('Christian', 2);

--SELECT
--	clientes.nome,
--	cidades.nome
--FROM clientes
--INNER JOIN cidades
--ON clientes.cidade = cidades.codigo;

--SELECT
--	cidades.nome,
--	COUNT(clientes.nome)
--FROM clientes
--LEFT JOIN cidades
--ON clientes.cidade = cidades.codigo
--GROUP BY cidades.nome

--SELECT
--	cidades. nome,
--	clientes. nome
--FROM clientes
--RIGHT JOIN cidades
--ON clientes.cidade = cidades.codigo;

--Capítulo 09 - Views

--Criar view
--CREATE VIEW visao AS
--SELECT nome, cidade FROM clientes;
--Executar view
--SELECT * FROM visao;
--Excluir view
--DROP VIEW visao;

--Capítulo 10 - Stored Procedure

--Criar procedure
--CREATE PROCEDURE inserirCidade @nome nvarchar(15)
--AS INSERT INTO cidades (nome) VALUES (@nome);
--Executar procedure
--EXEC inserirCidade @nome = 'Florianópolis';
--Excluir procedure
--DROP PROCEDURE inserirCidade;