/*
 1 - Tomando como base o banco de dados APBD, amplamente fornecido durante o
curso, marque a única alternativa correta que contém instruções em SQL
necessárias e suficientes para a inclusão sem erro da música “A” que tem a
duração de 4.30 e dos autores “B1” e “B2”.
*/
SELECT * FROM AUTOR;
SELECT * FROM MUSICA;
SELECT * FROM MUSICA_AUTOR;

SELECT MAX(codigo_musica) FROM MUSICA;

INSERT INTO MUSICA (codigo_musica,
nome_musica, duracao) VALUES (89, "A", 4.30);

SELECT MAX(codigo_autor) FROM autor;

INSERT INTO AUTOR (codigo_autor, nome_autor) VALUES (62,"B1"), (63,"B2");

INSERT INTO MUSICA_AUTOR VALUES (89,62),(89,63);

-- Resposta:
/* 
SELECT MAX(codigo_musica) FROM MUSICA; INSERT INTO MUSICA (codigo_musica,
nome_musica, duracao) VALUES (89, "A", 4.30); SELECT MAX(codigo_autor) FROM
AUTOR; INSERT INTO AUTOR (codigo_autor, nome_autor) VALUES (62,"B1"), (63,"B2");
INSERT INTO MUSICA_AUTOR VALUES (89,62),(89,63);
*/

/*
 2 - Tomando como base o banco de dados APBD, amplamente fornecido durante o
curso, marque a única alternativa correta que contém instruções em SQL
necessárias e suficientes para listar todas as músicas do CD “Elis Regina - Essa
Mulher” ordenadas pela faixa.
*/

SELECT * FROM cd;
SELECT * FROM faixa;

SELECT * FROM CD WHERE nome_cd LIKE 'Elis%';

SELECT f.Numero_Faixa, m.nome_musica 
FROM MUSICA m 
INNER JOIN FAIXA f 
ON (m.codigo_musica = f.Codigo_Musica) 
WHERE f.Codigo_CD = 3 
ORDER BY 1;

-- Esse CD possui 10 faixas, entre elas “O Bêbado e o Equilibrista”, “Beguine Dodói” e “Altos e Baixos”.
-- Resposta:
/* 
SELECT * FROM CD WHERE nome_cd LIKE 'Elis%’; SELECT f.Numero_Faixa,
m.nome_musica FROM MUSICA m INNER JOIN FAIXA f ON (m.codigo_musica =
f.Codigo_Musica) WHERE f.Codigo_CD = 3 ORDER BY 1. Esse CD possui 10 faixas,
entre elas “O Bêbado e o Equilibrista”, “Beguine Dodói” e “Altos e Baixos”.
*/

/*
 3 - Tomando como base o banco de dados APBD, amplamente fornecido durante o
curso, marque a única alternativa correta que contém instruções em SQL
necessárias e suficientes para excluir a música “Mandy” do CD “Barry Manilow
Greatest Hits Vol I” e do banco de dados também.
*/

SELECT * FROM MUSICA WHERE nome_musica = 'Mandy';

DELETE FROM FAIXA
WHERE codigo_musica = 68;

DELETE FROM musica_autor 
WHERE codigo_musica = 68;

DELETE FROM musica 
WHERE codigo_musica = 68;

/*
 Resposta: SELECT * FROM MUSICA WHERE nome_musica = 'Mandy’; DELETE FROM FAIXA
WHERE codigo_musica = 68; DELETE FROM MUSICA_AUTOR WHERE codigo_musica
= 68; DELETE FROM MUSICA WHERE codigo_musica = 68;
*/


/* 4 -
I - Cliente-Servidor é um modelo computacional que separa 
clientes e servidores, geralmente interligados através 
de uma rede de computadores;
II - Cada Cliente pode enviar uma requisição de dados para 
algum servidor conectado e esperar pela
resposta;
III - Os servidores podem aceitar tais requisições, processá-las 
e retornar um resultado para o cliente;
IV - Servidores são entidades passivas, apenas respondem a
requisições enviadas pelos clientes, após seu processamento;
V - Clientes são entidades ativas que submetem suas requisições 
aos servidores e implementam a interface
com o usuário final do serviço;
VI - Os serviços são encapsulados no servidor, ou seja, o
cliente não tem conhecimento de como são processados;
VII - O cliente envia requisições
para um ou mais servidores conectados e espera a resposta;
VIII - O(s) servidor(es) disponíveis pode(m) aceitar as 
requisições, processá-las e retornar o resultado para o
cliente;
IX - A localização do cliente e do servidor deve ser transparente;
X - As interações ocorrem por envio de mensagens;
*/


/*
 5 - Tomando como base o banco de dados APBD, amplamente fornecido durante o
curso, marque a única alternativa correta que contém instruções em SQL
necessárias e suficientes para excluir o autor “Sérgio Natureza” e todas as suas
músicas.
*/

SELECT * FROM musica;

SELECT * FROM AUTOR WHERE nome_autor LIKE 'sergio%';

DELETE FROM musica_autor 
WHERE codigo_autor IN (21, 36);

DELETE FROM AUTOR WHERE
codigo_autor IN (21,36);


/*
 6 - Tomando como base o banco de dados APBD, amplamente fornecido durante o
curso, marque a única alternativa correta que contém instruções em SQL
necessárias e suficientes para a exclusão do CD “Mais do Mesmo”.
*/

SELECT * FROM cd;

SELECT * FROM cd WHERE nome_cd LIKE 'Mais%';

DELETE FROM FAIXA WHERE codigo_cd=1;

DELETE FROM CD WHERE codigo_cd=1;

/*
 7 - Tomando como base o banco de dados APBD, amplamente fornecido durante o
curso, marque a única opção a seguir que descreve corretamente o que
acontece quando o comando DELETE FROM AUTOR WHERE CODIGO_AUTOR =
3 é executado ?
*/

SELECT * FROM autor;
SELECT * FROM autor WHERE nome_autor LIKE 'Chico Buarque';

DELETE FROM AUTOR WHERE CODIGO_AUTOR = 3;

-- Error 1451:

/*
 8 - Tomando como base o banco de dados APBD, amplamente fornecido durante o
curso, marque a única alternativa correta que contém instruções em SQL
necessárias e suficientes para a inclusão de dois autores que não possuem
músicas no banco de dados.
*/

SELECT codigo_autor FROM AUTOR;

SELECT nome_autor FROM AUTOR WHERE nome_autor LIKE 'chico%';

SELECT * FROM AUTOR WHERE nome_autor LIKE 'sergio%';

SELECT MAX(codigo_autor) FROM autor;

INSERT INTO AUTOR (nome_autor, codigo_autor) VALUES ("chico da silva",63);

INSERT INTO AUTOR (codigo_autor, nome_autor) VALUES (70,"Sergio Reis");

/*
 9 - Tomando como base o banco de dados APBD, amplamente fornecido durante o
curso, marque a única alternativa correta que contém instruções em SQL
necessárias e suficientes para a inclusão sem erro da música “Facil”, da banda
mineira Jota Quest, na tabela MUSICA.
*/
SELECT * FROM musica WHERE codigo_musica = 89;

SELECT MAX(codigo_musica) FROM musica;

SELECT * FROM MUSICA WHERE nome_musica LIKE 'facil%';

INSERT INTO MUSICA (codigo_musica, nome_musica, duracao) 
VALUES (89, 'Facil', 4.56);

/*
 10 - Tomando como base o banco de dados APBD, amplamente fornecido durante o
curso, marque a única alternativa correta que contém instruções em SQL
necessárias e suficientes para a inclusão de um CD com 8 faixas. O CD pertence
a gravadora EPIC e como CD indicado possui o CD “Bate-Boca”.
*/




