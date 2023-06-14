# Toda função deve ter apenas UM Return: Valor Atômico - Valor indivisivel

DELIMITER $$
DROP FUNCTION IF EXISTS f_t1$$

CREATE FUNCTION f_t1(t_in DOUBLE)
	RETURNS VARCHAR(20)
DETERMINISTIC # Diretiva do Banco de Dados MySQL para dizer que a função tem um Return - Parece que ao não colocar isso em algumas condições
BEGIN
	IF t_in < 3.0 THEN
		RETURN('Curta');
	ELSEIF t_in <= 4.0 THEN
		RETURN('Normal');
	ELSEIF t_in IS NULL THEN
		RETURN('Nulo');
	ELSE
		RETURN('Longo ...');
	END IF;
END$$
DELIMITER ;

SELECT nome_musica, f_t1(duracao) AS 'Tipo', duracao
FROM musica
ORDER BY 3

# Listar apenas as Normais
SELECT nome_musica, f_t1(duracao) AS 'Tipo', duracao
FROM musica
WHERE  f_t1(duracao) LIKE 'Normal'
ORDER BY 3

# Listar apenas as Curtas
SELECT nome_musica, f_t1(duracao) AS 'Tipo', duracao
FROM musica
WHERE  f_t1(duracao) LIKE 'Curta'
ORDER BY 3

# Listar as Curtas e Normais
SELECT nome_musica, f_t1(duracao) AS 'Tipo', duracao
FROM musica
WHERE  f_t1(duracao) LIKE 'Curta' OR f_t1(duracao) LIKE 'Normal'
ORDER BY 3

# AGORA VAMOS FAZER DA MANEIRA CORRETA!

DELIMITER $$
DROP FUNCTION IF EXISTS f_t2$$

CREATE FUNCTION f_t2(t_in DOUBLE)
	RETURNS VARCHAR(20)
DETERMINISTIC # Diretiva do Banco de Dados MySQL para dizer que a função tem um Return - Parece que ao não colocar isso em algumas condições

BEGIN

	# Variaveis
	DECLARE resposta VARCHAR(20) DEFAULT '';
	
	IF t_in < 3.0 THEN
		SET resposta = 'Curta';
	ELSEIF t_in <= 4.0 THEN
		SET resposta = 'Normal';
	ELSEIF t_in IS NULL THEN
		SET resposta = 'Nulo';
	ELSE
		SET resposta = 'Longo ...';
	END IF;
	
RETURN resposta;

END$$
DELIMITER ;

# Listar as Curtas e Normais
SELECT nome_musica, f_t2(duracao) AS 'Tipo', duracao
FROM musica
WHERE  f_t2(duracao) LIKE 'Curta' OR f_t2(duracao) LIKE 'Normal'
ORDER BY 3

# FUNÇÃO PARA PRODUZIR NUMERO DE TELEFONE:

DELIMITER $$

DROP FUNCTION IF EXISTS f_prodfone$$

CREATE FUNCTION f_prodfone
(tam INT, dd BOOLEAN)
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN

	DECLARE resposta VARCHAR(20)
	DEFAULT '';
	DECLARE nn VARCHAR(10) DEFAULT '';
	DECLARE i, t INT DEFAULT 0;

	IF (tam < 9) THEN
		RETURN 'Tamanho Minimo = 9';
	END IF;
	
	WHILE (i < tam) DO
	
		SET t = FLOOR (RAND() * 9);
		SET nn = CONVERT(t, DECIMAL);
		SET resposta = CONCAT(resposta, nn); # Soma de Caracteres
		
		SET i = i + 1;
	END WHILE;
	
	SET resposta = CONCAT(SUBSTR(resposta, 1, 4), '-', SUBSTR(resposta, 5));
	
	IF (dd) THEN
		SET t = 1 + FLOOR(RAND() * 89);
		SET nn = CONVERT(t, DECIMAL);
		SET nn = CONCAT('(', nn, ') ');
		
		SET resposta = CONCAT(nn, resposta);
	END IF;
	
	RETURN resposta;
END$$
DELIMITER ;

# SELECT - Telefone 
SELECT nome_gravadora, telefone, f_prodfone(9, TRUE)
FROM gravadora;

# UPDATE - Telefone na tabela Gravadora
UPDATE gravadora 
SET telefone = f_prodfone(9, TRUE)
WHERE IS NULL
;

SELECT * FROM gravadora;

SELECT * FROM musica;

# Exercício 1
SELECT nome_musica, nome_autor
FROM musica
INNER JOIN autor
ON nome_autor LIKE 'Jorge%'
ORDER BY 1;

# EXERCICIO FINAL

SELECT * FROM remuneracao;

SELECT COUNT(orgao)
FROM remuneracao; # Quantidade de linhas

SELECT COUNT(DISTINCT orgao)
FROM remuneracao;

SELECT orgao FROM remuneracao;

# Inicializada a Procedure

SELECT orgao, f_prodfone(9, TRUE)
FROM remuneracao;

# 1 - PASSO - CRIAR PROCEDURE QUE GERE COD

DELIMITER $$

DROP FUNCTION IF EXISTS cod_orgao2$$

CREATE FUNCTION cod_orgao2
(tam INT, dd BOOLEAN)
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN

	DECLARE resposta VARCHAR(20)
	DEFAULT '';
	DECLARE nn VARCHAR(10) DEFAULT '';
	DECLARE i, t INT DEFAULT 0;

	IF (tam < 9) THEN
		RETURN 'Tamanho Minimo = 9';
	END IF;
	
	WHILE (i < tam) DO
	
		SET t = FLOOR (RAND() * 9);
		SET nn = CONVERT(t, DECIMAL);
		SET resposta = CONCAT(resposta, nn); # Soma de Caracteres
		
		SET i = i + 1;
	END WHILE;
	
	RETURN resposta;
END$$
DELIMITER ;

# 2 - PASSO - CRIAR UMA NOVA COLUNA NA TABELA REMUNERACAO

ALTER TABLE remuneracaoservbdservbd
ADD COLUMN cod_orgao VARCHAR(8) NOT NULL;


# 3 - PASSO - CRIAR UMA TABELA PARA OS COD_ORGAO E ORGAO

CREATE TABLE orgaos (
    cod_orgao VARCHAR(20) PRIMARY KEY,
    orgao_nome VARCHAR(30) NOT NULL
);

SELECT * FROM orgaos;

UPDATE orgaos
INNER JOIN remuneracao
SET orgaos.orgao_nome = remuneracao.orgao;

# 3 - PASSO - ALOCAR OS CODIGOS NOS ORGAOS

UPDATE remuneracao 
SET cod_orgao = cod_orgao2(9, TRUE)
;

UPDATE orgaos
SET cod_orgao = 100 + ROW_NUMBER() OVER (ORDER BY cod_orgao)
WHERE orgaos.cod_orgao = t.cod_orgao;