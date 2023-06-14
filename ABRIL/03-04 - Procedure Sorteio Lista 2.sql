# Sorteia lista 2

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

SET lista = ' '; -- Quase nada funciona com NULL

WHILE i<qtde DO
	SET i = i + 1;
	SELECT nome_musica INTO xm
	FROM musica
	ORDER BY RAND()
	LIMIT 1;
	SET lista = CONCAT_WS('\n', lista, xm);
END WHILE;
SET lista = SUBSTR(lista, 3);
END$$
DELIMITER ;

-- CHAMADA
CALL sorteia_lista(15, @lista);
SELECT @lista;