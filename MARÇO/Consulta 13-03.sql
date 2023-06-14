# Exercício Nº 1
SELECT Nome_Autor, Nome_Musica, Duracao
FROM musica_autor
INNER JOIN autor
ON (autor.Codigo_Autor = musica_autor.Codigo_Autor)
INNER JOIN musica
ON (musica.Codigo_Musica = musica_autor.Codigo_Musica)
WHERE musica.Nome_Musica = "Falando de Amor" 
OR musica.Nome_Musica = "Faroeste Caboclo"
OR musica.Nome_Musica = "Freedom 90"
OR musica.Nome_Musica = "Gema"
OR musica.Nome_Musica = "Geração Coca-Cola"
OR musica.Nome_Musica = "Giz"
ORDER BY Nome_Musica

# Outra opção
SELECT Nome_Autor, Nome_Musica, Duracao
FROM musica_autor
INNER JOIN autor
ON (autor.Codigo_Autor = musica_autor.Codigo_Autor)
INNER JOIN musica
ON (musica.Codigo_Musica = musica_autor.Codigo_Musica)
WHERE SUBSTR(musica.Nome_Musica,1,1) IN ('F','G')
ORDER BY 2;

# Versão Viviane
CREATE OR REPLACE VIEW minhaview AS
SELECT Nome_Autor, Nome_Musica, Duracao
FROM musica_autor
INNER JOIN autor
ON (autor.Codigo_Autor = musica_autor.Codigo_Autor)
INNER JOIN musica
ON (musica.Codigo_Musica = musica_autor.Codigo_Musica)
WHERE musica.Nome_Musica BETWEEN
'Falando de amor' AND 'Giz'

# Versão Jacke
CREATE OR REPLACE VIEW minhaview AS
SELECT Nome_Autor, Nome_Musica, Duracao
FROM musica_autor
INNER JOIN autor
ON (autor.Codigo_Autor = musica_autor.Codigo_Autor)
INNER JOIN musica
ON (musica.Codigo_Musica = musica_autor.Codigo_Musica)
WHERE musica.Nome_Musica LIKE 'F%'
OR musica.Nome_Musica LIKE 'G%'

# Exercício Nº 2
SELECT nome_musica, SUBSTR(Nome_musica,1,1)
FROM musica
WHERE SUBSTR(Nome_musica,1,1)
IN ('F', 'G', 'A')

# Assunto da próxima aula

SHOW CREATE TABLE musica_autor

ALTER TABLE musica_autor
DROP FOREIGN KEY AUTOR_MUSICA_AUTOR,
DROP FOREIGN KEY MUSICA_MUSICA_AUTOR;.