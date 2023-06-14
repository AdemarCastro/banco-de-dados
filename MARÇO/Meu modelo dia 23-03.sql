-- Atividade

DELIMITER $$

DROP PROCEDURE IF EXISTS media$$

CREATE PROCEDURE media(
IN n1 FLOAT, IN n2 FLOAT, IN n3 FLOAT,
OUT media FLOAT,
OUT situacao VARCHAR(50)
)

BEGIN

DECLARE soma FLOAT DEFAULT 0.0;
DECLARE fora BOOLEAN DEFAULT FALSE;

SET soma = n1+n2+n3;

SET media=(soma)/3;

IF (n1 < 0 OR n1 > 10) THEN

	SET situacao = 'A nota n1 esta fora do intervalo entre 0 e 10';

ELSEIF (n2 < 0 OR n2 > 10) THEN
	
	SET  situacao = 'A nota n2 esta fora do intervalo entre 0 e 10';

ELSEIF (n3 < 0 OR n3 > 10) THEN
	
	SET  situacao = 'A nota n3 esta fora do intervalo entre 0 e 10';

ELSEIF (n1 < 0 OR n1 > 10 AND n2 < 0 OR n2 > 10) THEN
	
	SET  situacao = 'A nota n1 e n2 esta fora do intervalo entre 0 e 10';
	
ELSEIF (n1 < 0 OR n1 > 10 AND n3 < 0 OR n3 > 10) THEN
	
	SET  situacao = 'A nota n1 e n3 esta fora do intervalo entre 0 e 10';
	
ELSEIF (n2 < 0 OR n2 > 10 AND n3 < 0 OR n3 > 10) THEN
	
	SET  situacao = 'A nota n1 e n3 esta fora do intervalo entre 0 e 10';
	
ELSE 
	
	SET  situacao = 'A nota n1, n2 e n3 esta fora do intervalo entre 0 e 10';
	
END IF;

END$$

DELIMITER ;

-- Chamando a Procedure

CALL media(11,-1,6.7, @media, @situacao);

SELECT @situacao
SELECT @media