CREATE DATABASE apbd;

CREATE TABLE funcionarios (
	nome VARCHAR(100),
	lotacao VARCHAR(100),
	cargo VARCHAR(100),
	funcao VARCHAR(100),
	vinculo VARCHAR(100),
	remuneracao VARCHAR(100),
	desconto VARCHAR(100),
	remuneracao_legal VARCHAR(100),
	desconto_legal VARCHAR(100),
	liquido VARCHAR(100)
);

#Teste

SELECT * FROM funcionarios;

SELECT *
FROM funcionarios
WHERE nome = 'ADEMIR CASTRO E SILVA';

# 1 - Convertendo colunas com números de VARCHAR para FLOAT

SELECT CAST(liquido AS DECIMAL(10,2)) 
FROM funcionarios
WHERE nome = 'ADEMIR CASTRO E SILVA';

# 2 - 10 maiores salários da UEA?

SELECT nome, cargo, CAST(liquido AS DECIMAL(10,2)) 'liquido'
FROM funcionarios
ORDER BY 3 DESC
LIMIT 10;

# QUESTÃO 1

SELECT nome, cargo, CAST(
REPLACE (remuneracao, ',', '.') AS DECIMAL(10,2)) 'remuneracao'
FROM funcionarios
ORDER BY 3 DESC
LIMIT 10;

# QUESTÃO 2

SELECT COUNT(nome) 'Quantidade de professores que a UEA possui'
FROM funcionarios
WHERE cargo LIKE '%prof%';

# QUESTÃO 3

SELECT nome, COUNT(nome)
FROM funcionarios
GROUP BY nome
HAVING COUNT(nome) > 1;