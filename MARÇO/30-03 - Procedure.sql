-- LOOP USANDO WHILE

DELIMITER $$
DROP PROCEDURE IF EXISTS loop_while$$
CREATE PROCEDURE loop_while(
IN qtde INT,
OUT lista VARCHAR(250)
)
BEGIN
	DECLARE i INT DEFAULT 0;
SET lista = '';
WHILE i<qtde DO
	SET i = i + 1;
	SET lista = CONCAT_WS(', ', lista, i);
END WHILE;
SET LISTA = SUBSTR(lista,3);
END$$
DELIMITER ;

-- Chama a Procedure
CALL loop_while(5, @lista);
-- Select
SELECT @lista;

-- 

DELIMITER $$
DROP PROCEDURE IF EXISTS loop_repeat$$
CREATE PROCEDURE loop_repeat(
IN qtde INT,
OUT lista VARCHAR(250)
)
BEGIN
DECLARE i INT DEFAULT 0;
SET lista = '';
REPEAT
	SET i = i + 1;
	SET lista = CONCAT_WS(', ', lista, i);
UNTIL (i=qtde)
END REPEAT;

# Sorteando uma música

DELIMITER $$
DROP PROCEDURE IF EXISTS sorteia_uma_musica$$

CREATE PROCEDURE sorteia_uma_musica(
OUT lista VARCHAR(250)
)
BEGIN
DECLARE tm, ms INT DEFAULT 0;
SELECT COUNT(*) INTO tm FROM musica;
SET ms = FLOOR (RAND() * tm); 
IF (ms = 0) THEN SET ms=1; END IF;
SELECT nome_musica INTO lista FROM musica
WHERE codigo_musica=ms;
END$$
DELIMITER ;

-- CHAMADA
CALL sorteia_uma_musica(@lista);
SELECT @lista;

# PROCEDURE CHAMANDO PROCEDURE

DELIMITER $$

DROP PROCEDURE IF EXISTS
sorteia_lista$$

CREATE PROCEDURE sorteia_lista(
IN qtde INT,
OUT lista VARCHAR(250)
)
BEGIN

DECLARE i INT		DEFAULT 0;
DECLARE xm VARCHAR(250);

SET lista = ''; -- Quase nada funciona com NULL

WHILE i<qtde DO
	SET i = i + 1;
	CALL sorteia_uma_musicaxm);
	SET lista = CONCAT_WS(', \n' , lista, xm);
END WHILE;
SET lista = SUBSTR(lista, 3);
END$$
DELIMITER ;

-- CHAMADA
CALL sorteia_lista(1, @lista);
SELECT @lista;

# 1 - Dado código de um autor e o novo nome a procedure deverá
# verificar se o código existe, caso sim, deverá alterar o nome
# e fornecer a mensagem;

# Nome de autor trocado com sucesso:
# De: Alcione para: Anitta;
# Se o código não existir deverá informar;
# ERRO - código do autor não existe;

-- Código Procedure
DELIMITER $$

DROP PROCEDURE IF EXISTS procedure_autor$$

CREATE PROCEDURE procedure_autor (
IN qtde INT,
OUT lista VARCHAR(250)
)
BEGIN


# 2 - Dado o nome de uma música e o nome de um autor, incluir ambos
# , incluir ambos, de modo relacionado, no banco de dados APBD;

