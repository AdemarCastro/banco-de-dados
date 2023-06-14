SELECT m.Nome_Musica "Música",
a.Nome_Autor "Autor",
ma.Codigo_Autor "Código Autor da Tabela MA",
a.Codigo_Autor "Código Autor da Tabela A",
ma.Codigo_Musica "Código Música da Tabela MA",
m.Codigo_Musica "Código Música da Tabela M"
FROM musica_autor ma
JOIN musica m
ON (ma.Codigo_Musica = m.Codigo_Musica)
JOIN autor a
ON (ma.Codigo_Autor = a.Codigo_Autor)
#WHERE (a.Nome_Autor = "Renato Russo")
ORDER BY Nome_Musica

SELECT m.Nome_Musica "Todas as Músicas do Renato Russo",
a.Nome_Autor "Nome do Autor"
FROM musica_autor ma
JOIN musica m
ON (ma.Codigo_Musica = m.Codigo_Musica)
JOIN autor a
ON (ma.Codigo_Autor = a.Codigo_Autor)
WHERE a.Nome_Autor LIKE 'Renato Russo'
ORDER BY Nome_Musica

SELECT m.Nome_Musica AS "Música", GROUP_CONCAT(a.Nome_Autor SEPARATOR', ') AS "Autores"
FROM musica_autor ma
JOIN musica m
ON (ma.Codigo_Musica = m.Codigo_Musica)
JOIN autor a
ON (ma.Codigo_Autor = a.Codigo_Autor)
GROUP BY Nome_Musica

# Função GROUP_CONCAT junta todos os elementos relacionados a mesma coluna.

# MUSICA / QTD DE AUTORES
#   A        1
#   B        4


SELECT m.Nome_Musica AS "Música", COUNT(a.Nome_Autor) AS "Autores"
FROM musica_autor ma
JOIN musica m
ON (ma.Codigo_Musica = m.Codigo_Musica)
JOIN autor a
ON (ma.Codigo_Autor = a.Codigo_Autor)
GROUP BY Nome_Musica

# Função COUNT conta o número de elementos relacionados na Coluna


