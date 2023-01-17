--Criar procedure
CREATE PROCEDURE inserirCidade @nome nvarchar(15)
AS INSERT INTO cidades (nome) VALUES (@nome);
--Executar procedure
EXEC inserirCidade @nome = 'Florianópolis';
--Excluir procedure
DROP PROCEDURE inserirCidade;