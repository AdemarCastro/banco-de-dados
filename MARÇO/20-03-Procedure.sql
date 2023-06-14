/* Este código é um exemplo de como criar uma nova procedure no MySQL usando a sintaxe do DELIMITER para definir um novo delimitador de instrução. */

DELIMITER $$

DROP PROCEDURE IF EXISTS alomundo$$

CREATE PROCEDURE alomundo()

BEGIN

	SELECT 
	'Alo mundo - a primeira procudere',
	NOW();
	
-- Programe aqui!

END$$

DELIMITER ;


CALL alomundo();


-- DESAFIO -- 

DELIMITER $$

DROP PROCEDURE IF EXISTS exibir_cabecalho$$

CREATE PROCEDURE exibir_cabecalho()

BEGIN
	
	SELECT CONCAT('+------+', '\n', '|      |', '\n', '+------+', '\n', NOW()) AS mensagem; 
	
-- Programe aqui!

END $$

DELIMITER ;

CALL exibir_cabecalho();

-- PROCEDURE PASSANDO PARÂMETROS;

DELIMITER $$

DROP PROCEDURE IF EXISTS media$$

CREATE PROCEDURE media(
IN n1 FLOAT, IN n2 FLOAT, IN n3 FLOAT,
OUT media FLOAT,
OUT situacao VARCHAR(50)

)

BEGIN

DECLARE soma FLOAT DEFAULT 0.0;

SET soma = n1+n2+n3;

SET media=(soma)/3;

IF (media<6.0) THEN

	SET situacao = 'nao deu ...';
	
ELSE

SET situacao = 'aprovada !';

END IF;


END$$

DELIMITER ;

-- Chamada da Procedure

CALL media(9,5,6.7,@media, @situacao); -- aprovado
CALL media(0,4,5,@m, @s); -- reprovado

-- Para acessar o Banco de Dados

SELECT @media, @situacao;

SELECT @m, @s;