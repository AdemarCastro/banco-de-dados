
# Primeiro método
SELECT *
FROM musica
WHERE duracao IN (SELECT MAX(DURACAO) FROM musica);

# Segundo método
SET @max_duracao = (SELECT MAX(duracao) FROM musica);
SELECT * FROM musica WHERE duracao = @max_duracao;

# Função
DELIMITER $$

DROP PROCEDURE IF EXISTS ft_01$$

CREATE PROCEDURE ft_01 (
INOUT pfone VARCHAR(15))

BEGIN
SET pfone = 
	CONCAT(LEFT(pfone,2),
	'-',
	SUBSTR(pfone,5));
END$$
DELIMITER ;

# Primeiro SELECT
SET @fone = '123456789';
CALL ft_01(@fone);
SELECT @fone;

# Segundo SELECT
SELECT
CONCAT(
LEFT(nome_musica,4), '-',
SUBSTR(nome_musica,5)
)
FROM musica
LIMIT 10;

#Teste assim por curiosidade
CALL ft_01('123456789');

# Teste de erros

DELIMITER $$
DROP PROCEDURE IF EXISTS ex_erro$$
CREATE PROCEDURE ex_erro
	(IN P_COD_CD INT,
	OUT LINHA_CD VARCHAR(100))
BEGIN
	DECLARE c_erro INT DEFAULT 0;
	DECLARE CONTINUE HANDLER
		FOR NOT FOUND SET c_erro=1; # Se acontecer o erro - Coloque 1 nesta variavel
SELECT CONCAT(CODIGO_CD), ' ',
	NOME_CD, ' ', PRECO_VENDA)
	INTO LINHA_CD
FROM cd WHERE CODIGO_CD = P_COD_CD;
IF (c_erro=1) THEN
	SET LINHA_CD = CONCAT ('CODIGO : ',
	P_COD_CD, ' NAO ENCONTRADO !');
END IF;

END$$
DELIMITER ;

SET @1-'';
CALL ex_erro(10,@1);
SELECT @1;	 