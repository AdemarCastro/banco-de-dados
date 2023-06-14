
#Testa a manipulação de ERROS em programas armazenados no banco de dados;

DELIMITER $$
DROP PROCEDURE IF EXISTS ex_erro$$
CREATE PROCEDURE ex_erro
	(IN P_COD_CD INT,
	OUT LINHA_CD VARCHAR(100))
BEGIN
DECLARE c_erro INT DEFAULT 0; #Valor inicial da c_erro é 0
DECLARE CONTINUE HANDLER # A execução do programa deve continuar atraves do Manipulador de Erro
	FOR NOT FOUND SET c_erro=1; # Para o erro NOT FOUND (não encontrado) c_erro e adiciona o nº 1 na variável
SELECT CONCAT(CODIGO_CD, ' ',
 NOME_CD,' ', PRECO_VENDA)
 INTO LINHA_CD
FROM cd WHERE CODIGO_CD = P_COD_CD; # Caso não ache a chave irá ocorrer o erro NOT FOUND
IF (c_erro=1) THEN # Quando o erro ocorrer o IF irá executar
	SET LINHA_CD = CONCAT('CODIGO : ',
	P_COD_CD,' NAO ENCONTRADO !');
END IF;

END $$
DELIMITER ;

SET @l=''; 
CALL ex_erro(59,@1);
SELECT @1;

# Código 2

DELIMITER $$
DROP PROCEDURE IF EXISTS tc1$$

CREATE PROCEDURE tc1
(OUT xp VARCHAR(100))

READS SQL DATA

BEGIN
	DECLARE i, feito INT
	DEFAULT 0;
	DECLARE xcd VARCHAR(100);
	DECLARE cur1 CURSOR FOR SELECT nome_cd FROM cd;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET feito = 1;
	
	OPEN cur1;
	cd_loop: LOOP
		FETCH cur1 INTO xcd;
		IF (feito = 1) THEN
			leave cd_loop;
		END IF;
		SET i=i+1;
	END LOOP cd_loop;
	
	CLOSE cur1;
	
	SET xp = CONCAT('CDs contados : ', i);
	
END$$

DELIMITER ;

SET @1 = '';
CALL tc1(@1);
SELECT @1;

# Codigo concertado

DELIMITER $$

DROP PROCEDURE IF EXISTS tcl$$

CREATE PROCEDURE tcl(OUT xp VARCHAR(100))

READS SQL DATA

BEGIN
	DECLARE i, feito INT DEFAULT 0;
	DECLARE xcd VARCHAR(100);
	DECLARE cur1 CURSOR FOR SELECT nome_CD FROM cd;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET feito = 1;
	
	OPEN cur1;
	
	cd_loop: LOOP
		FETCH cur1 INTO xcd;
		
		IF(feito = 1) THEN
			LEAVE cd_loop;
		END IF;
		SET i = i + 1;
	END LOOP cd_loop;
	
	CLOSE cur1;
	
	SET xp = CONCAT('CDs contados: ', i);
END$$
	
DELIMITER ;

SET @l = '';
CALL tcl(@l);
SELECT @l;