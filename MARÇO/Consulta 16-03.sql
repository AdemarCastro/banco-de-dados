#1) PASSO
SHOW CREATE TABLE musica_autor

ALTER TABLE musica_autor
DROP FOREIGN KEY AUTOR_MUSICA_AUTOR,
DROP FOREIGN KEY MUSICA_MUSICA_AUTOR;


#2) PASSO
SELECT TABLE_NAME, INDEX_NAME, COLUMN_NAME
FROM INFORMATION_SCHEMA.STATISTICS
WHERE table_schema = 'apbd' AND
TABLE_NAME = 'MUSICA_AUTOR';

ALTER TABLE musica_autor
DROP PRIMARY KEY,
DROP INDEX XIF11MUSICA_AUTOR,
DROP INDEX XIF12MUSICA_AUTOR;


#3) PASSO
#Recriando a constraint de chave
#estrangeira, quando não especificado o 
#default é RESTRICT - não permite
#excluir(DELETE)
#e nem alterar (UPDATE) o mestre se houvesse escravos;

ALTER TABLE musica_autor
ADD CONSTRAINT FK_musica_autor_autor
FOREIGN KEY (Codigo_Autor) REFERENCES
autor (Codigo_Autor);

#4) PASSO
#Tentando excluir o autor 1, da tabela AUTOR:

DELETE FROM autor
WHERE Codigo_Autor = 1

#5) PASSO - BRUXARIA (ENCANTAMENTO)
#Alterando a integridade referencial:

ALTER TABLE musica_autor
DROP FOREIGN KEY FK_musica_autor_autor;

ALTER TABLE musica_autor
ADD CONSTRAINT FK_bruxaria_autor_autor
FOREIGN KEY (Codigo_Autor)
REFERENCES apbd.autor (Codigo_Autor)
ON UPDATE CASCADE
ON DELETE CASCADE;

#6) PASSO
#Alterar o Codigo do Autor na Tabela Autor

	#Ver tabela musica_autor cujo codigo_autor é igual a 1
SELECT *
FROM musica_autor WHERE Codigo_Autor = 1

	#Update na tabela autor 
UPDATE autor
SET Codigo_Autor = 555
WHERE Codigo_Autor = 1

SELECT *
FROM musica_autor WHERE Codigo_Autor = 1

SELECT *
FROM musica_autor
WHERE Codigo_Autor = 555

#7) PASSO

SELECT *
FROM musica_autor 
WHERE Codigo_Autor = 555

DELETE FROM autor
WHERE Codigo_Autor = 555

SELECT * 
FROM musica_autor 
WHERE Codigo_Autor = 555

#Elabore uma consulta que produza a saída:

SELECT Nome_Autor, COUNT(Codigo_Musica) AS `qtde_de_musicas`
FROM autor
INNER JOIN musica_autor
ON (autor.Codigo_Autor = musica_autor.Codigo_Autor)
WHERE 