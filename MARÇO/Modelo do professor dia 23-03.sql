DELIMITER $$

DROP PROCEDURE IF EXISTS media2$$

CREATE PROCEDURE media2(
IN n1 FLOAT, IN n2 FLOAT, IN n3 FLOAT,
OUT media FLOAT,
OUT situacao VARCHAR(50)
)

BEGIN
	DECLARE soma FLOAT DEFAULT 0.0;
	DECLARE fora BOOLEAN DEFAULT FALSE;
	
	IF (n1<0.0 OR n1>10.0) THEN
		SET fora=TRUE;
		SET situacao = 'A nota n1 esta fora do intervalo entre 0 a 10';
	END IF
/*
	Repete para n2 e n3...
	Copiar e colar de sempre...
*/

IF (NOT fora) THEN
	BEGIN
		SET soma = n1+n2+n3;
		SET media=(soma)/3;
		IF (media<6.0) THEN
			SET situacao = 'nao deu ...';
		ELSE
			SET situacao ='aprovado!';
		END IF;
	END;
END IF;

END$$

DEMILIMETER ;

-- Chamada da Procedure

CALL media(11,-1,6.7, @media, @situacao);

SELECT @media;
SELECT @situacao;