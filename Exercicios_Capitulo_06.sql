-- Questão 1
CREATE DATABASE exercicio

-- Questão 2
USE exercicio

-- Questão 3
CREATE TABLE uzuarios (
	nome VARCHAR(20),
	sobrenome VARCHAR(40),
	idade INT )

-- Questão 4
exec sp_rename 'uzuarios','usuarios'

-- Questão 5
ALTER TABLE usuarios ADD email VARCHAR(40)

-- Questão 6
ALTER TABLE usuarios DROP COLUMN sobrenome

-- Questão 7
INSERT INTO usuarios 
VALUES 
('Vanessa', 16, 'vanessa.rosa@gmail.com'),
('Adailton', 22, 'adailton.mas@yahoo.com'),
('Andressa', 36, 'andressa.simas@uol.com.br'),
('Mayra', 24, 'mayra_antunes@gmail.com'),
('Cristiane', 14, 'cris.maya@gmail.com'),
('Carina', 27, 'carina.almeida@gmail.com'),
('Clóvis', 29, 'clovis.simao@hotmail.com'),
('Gabriela', 23, 'gabriela.bragantino@live.com'),
('Cibele', null, 'cibele_lins@uol.com.br')

-- Questão 8
SELECT COUNT(*) FROM usuarios

-- Questão 9
SELECT * FROM usuarios WHERE idade <= 17

-- Questão 10
SELECT * FROM usuarios WHERE email LIKE '%gmail%'

-- Questão 11
SELECT MAX(idade) FROM usuarios 
SELECT nome, idade FROM usuarios WHERE idade = 36 --valor encontrado no resultado da query acima

--Extra
SELECT nome, idade FROM usuarios WHERE idade = (SELECT MAX(idade) FROM usuarios)

SELECT TOP 1 nome, idade FROM usuarios ORDER BY idade DESC

-- Questão 12
SELECT * FROM usuarios WHERE idade IS NULL

-- Questão 13
UPDATE usuarios
SET idade = 27
WHERE idade IS NULL

-- Questão 14
DELETE FROM usuarios WHERE idade < 18

-- Questão 15
DELETE FROM usuarios

-- Questão 16
DROP DATABASE exercicio
