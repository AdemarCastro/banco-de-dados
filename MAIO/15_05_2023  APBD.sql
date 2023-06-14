# FUNÇÃO - Escreva uma função para produzir o e-mail de todos os autores com a seguinte regra:

# (1º nome).(ultimo nome)@domínio

# Onde o dominio deve ser sorteado entre gmail.com, outlook.com e musica.com.br

DELIMITER $$

DROP FUNCTION IF EXISTS e_mail$$

CREATE FUNCTION e_mail
RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN
	
	DECLARE resposta VARCHAR(20) DEFAULT '';
	DECLARE prinome VARCHAR(20) DEFAULT '';
	DECLARE ultnome VARCHAR(20) DEFAULT '';
	DECLARE nn VARCHAR(20) DEFAULT '';
	DECLARE i, t INT DEFAULT 0;
	
	WHILE (codigo_autor != NULL) DO
	
		nn = (SELECT nome_autor FROM autor WHERE i = codigo_autor);
		i = (SELECT codigo_autor FROM autor WHERE i = codigo_autor);
		prinome = (SELECT SUBSTRING(nn, 1, CHARINDEX(' ', nn + ' ') - 1) AS texto_antes_do_espaco);	
		
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

SELECT * FROM autor;


# Programas Armazenados:

DELIMITER $$
DROP FUNCTION IF EXISTS f_e_mail$$

CREATE FUNCTION f_e_mail(nome VARCHAR(50))
	RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN

DECLARE p1, p2, dd VARCHAR(20)
DEFAULT '';
DECLARE i, t INT DEFAULT 0;

SET nome = TRIM(nome);
SET p1 = SUBSTRING_INDEX(nome, ' ', 1);
SET p2 = SUBSTRING_INDEX(nome, ' ', -1);
SET i = 1 + FLOOR(RAND()*3);

case i
	when 1 then
		SET dd = 'gmail.com';
	when 2 then
		SET dd = 'outlook.com';
	ELSE
		SET dd = 'musica.com';
END case;

RETURN
CONCAT(
LCASE
 (CONCAT(p1,'.',p2)),'@',dd);

END$$
DELIMITER ;

SELECT nome_autor,
f_e_mail(nome_autor)
FROM autor;