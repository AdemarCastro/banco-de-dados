SELECT p.Nome_CD
AS 'Gosta desse ?',
s.Nome_CD 'vai gostar desse !'
FROM cd p
LEFT JOIN cd s
ON (p.CD_Indicado = s.Codigo_CD)
ORDER BY 1 #Ordenar pela primeira coluna

SELECT 
p.codigo_cd,
p.Nome_CD
AS 'Gosta desse ?',
p.CD_Indicado,
p.Codigo_CD,
s.Nome_CD 
'vai gostar desse !'
FROM cd p
LEFT JOIN cd s
ON (p.CD_Indicado = s.Codigo_CD)
ORDER BY 2 #Ordenar pela segunda coluna

# 4 - Música e Autor - Muitos para Muitos

SELECT 
a.Nome_Musica,
b.Nome_Autor
FROM cd b
INNER JOIN

SELECT
musica.Nome_Musica,
autor.Nome_Autor
FROM musica_autor
INNER JOIN musica
ON (musica_autor.Codigo_Musica = musica.Codigo_Musica)
INNER JOIN autor
ON(musica_autor.Codigo_Autor = autor.Codigo_Autor)





SELECT * FROM musica_autor

SELECT * FROM musica

SELECT * FROM cd;

#Alterar a regra da tabela e fazer a coluna Codigo_Gravadora aceitar Nulo

ALTER TABLE cd MODIFY Codigo_Gravadora 

INSERT INTO `apbd`.`cd` (`Codigo_CD`, `Codigo_Gravadora`, `Nome_CD`, `Preco_Venda`, `Data_Lancamento`) VALUES (10, 2, 'Funk Anita', 9.45, '2023-03-06');