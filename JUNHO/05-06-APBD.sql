CREATE TABLE cd_va(
	pk INT(11) NOT NULL AUTO_INCREMENT,
	codigo_cd INT(11),
	nome_coluna VARCHAR(50),
	valor_anterior VARCHAR(50),
	dt_alteracao 
	TIMESTAMP NOT NULL
	DEFAULT CURRENT_TIMESTAMP
	ON UPDATE CURRENT_TIMESTAMP,
	PRIMARY KEY (pk) USING BTREE
)
COLLATE='latin1_swedish_ci'
ENGINE=INNODB;

DELIMITER $$
DROP TRIGGER IF EXISTS
t_valor_anterior_cd$$

CREATE TRIGGER t_valor_anterior_cd
BEFORE
UPDATE
ON cd FOR EACH ROW
BEGIN

	IF (OLD.nome_cd<>NEW.nome_cd) THEN
		INSERT INTO cd_va
		(codigo_cd, nome_coluna, valor_anterior)
		VALUES
		(OLD.codigo_cd, 'nome_cd', OLD.nome_cd);
	END IF;
	
	IF (OLD.codigo_gravadora<>NEW.codigo_gravadora) THEN
		INSERT INTO cd_va
		(codigo_cd, nome_coluna, valor_anterior)
		VALUES
		(OLD.codigo_cd, 'nome_cd', OLD.codigo_gravadora);
	END IF;
	
	IF (OLD.preco_venda<>NEW.preco_venda) THEN
		INSERT INTO cd_va
		(codigo_cd, nome_coluna, valor_anterior)
		VALUES
		(OLD.codigo_cd, 'nome_cd', convert(OLD.preco_venda, CHAR));
	END IF;
	
	IF (OLD.cd_indicado<>NEW.cd_indicado) THEN
		INSERT INTO cd_va
		(codigo_cd, nome_coluna, valor_anterior)
		VALUES
		(OLD.codigo_cd, 'nome_cd', cd_indicado);
	END IF;

END$$
DELIMITER ;


UPDATE cd
SET nome_cd = 'Subindo pelas paredes',
	preco_venda = 11.11,
	codigo_gravadora = 2,
	data_lancamento = '2020-03-25'
WHERE codigo_cd = 1;	

SELECT * FROM cd;

SELECT * FROM cd_va;

UPDATE cd
SET nome_cd = 'Iron Maiden'
WHERE codigo_cd = 2;

UPDATE cd
SET cd_indicado = 1
WHERE codigo_cd = 7;

SELECT *
FROM
information_schema.columns
WHERE TABLE_NAME='autor';

USE INFORMATION_SCHEMA;
SHOW FULL COLUMNS FROM
COLUMNS;


