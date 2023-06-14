# 10/04/2022
# PRIMEIRA PROCEDURE
USE apbd;
DELIMITER $$
DROP PROCEDURE IF EXISTS troca_nome$$
CREATE PROCEDURE troca_nome(
	IN cod_autor INT,
	IN novo_nome VARCHAR(250),
	OUT msg VARCHAR(250)
)
BEGIN
	DECLARE icod INT DEFAULT 0;
	DECLARE nome_antigo VARCHAR(250) DEFAULT '';
	DECLARE xmsg VARCHAR(250) DEFAULT
	
	CONCAT ('erro - codigo ', cod_autor, ' nao existe !');
	
	SELECT codigo_autor, nome_autor INTO icod, nome_antigo 
	FROM autor
	WHERE codigo_autor = cod_autor;
	
	IF (icod<>0) THEN
		SET xmsg = CONCAT('Nome de autor trocado com sucesso: \n', 'De: ', nome_antigo, '\nPara: ', novo_nome, '\n');
		UPDATE autor SET nome_autor = novo_nome
		WHERE codigo_autor = cod_autor;
	END IF;
	SET msg = xmsg;
	
END$$
DELIMITER ;

CALL troca_nome(5, 'Nunes Filho', @msg);
SELECT @msg;

# SEGUNDA PROCEDURE

DELIMITER $$

DROP PROCEDURE IF EXISTS
inc_musica_autor$$

CREATE PROCEDURE inc_musica_autor(
	IN xmusica VARCHAR(250),
	IN xautor VARCHAR(250)
)

BEGIN

DECLARE xmid, xaid INT DEFAULT 0;

SELECT MAX(codigo_musica) INTO xmid
FROM musica;
SET xmid = xmid + 1;
INSERT INTO musica (codigo_musica, nome_musica)
VALUES(xmid, xmusica);

SELECT MAX(codigo_autor) INTO xaid
FROM autor;
SET xaid = xaid + 1;
INSERT INTO autor VALUES(xaid, xautor);

INSERT INTO musica_autor
VALUES(xmid, xaid);
END$$
DELIMITER ;

CALL inc_musica_autor
('Subindo pelas Paredes', 'Nunes Filho');

SELECT m.nome_musica, a.nome_autor
FROM musica m
JOIN musica_autor ma
ON (m.Codigo_Musica = ma.Codigo_Musica)
JOIN autor a
ON (a.Codigo_Autor = ma.Codigo_Autor)
WHERE a.Nome_Autor = 'Nunes Filho'