# Guardando o valor anteior:
# Para a tabela CD escreva um Trigger que funcione assim:
# Quando uma coluna da tabela CD for alterada,
# o valor anterior, que está sendo apagado pelo novo valor,
# o nome da coluna que está sendo alterada e a data e hora da alteração
# devem ficar guardados em uma tabela, que você irá criar como quiser.
# A baixo um exemplo da tabela que guarda os valores.

CREATE TABLE cd_log (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  column_name VARCHAR(50) NOT NULL,
  old_value VARCHAR(255) NOT NULL,
  changed_at DATETIME NOT NULL
);

SELECT * FROM cd;

CREATE TRIGGER cd_update_log
BEFORE UPDATE ON cd
FOR EACH ROW
BEGIN
  DECLARE column_name VARCHAR(50);
  DECLARE old_value VARCHAR(255);
  DECLARE new_value VARCHAR(255);
  SET column_name = '';
  SET old_value = '';
  SET new_value = '';

  IF (OLD.nome_cd<>NEW.nome_cd) THEN
  	 INSERT INTO cd_va (codigo_cd, nome_coluna, valor_antior)
  	 VALUES (OLD.codigo_cd, 'nome_cd', OLD.nome_cd);
	END IF;
	
  
END;



