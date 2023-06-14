/*
ADAPTADO PARA MYSQL, InnoDB e Toad - Completo

*/

DROP DATABASE IF EXISTS apbd
;
CREATE DATABASE apbd
;

USE apbd
;

CREATE TABLE GRAVADORA (
       Codigo_Gravadora     INTEGER(3) NOT NULL,
       Nome_Gravadora       VARCHAR(60) NULL,
       Endereco             VARCHAR(60) NULL,
       Telefone             VARCHAR(20) NULL,
       Contato              VARCHAR(20) NULL,
       URL                  VARCHAR(80) NULL
       
) ENGINE = InnoDB 
;

ALTER TABLE GRAVADORA
       ADD  ( CONSTRAINT XPKGRAVADORA PRIMARY KEY (Codigo_Gravadora) ) 
;

CREATE TABLE CD (
       Codigo_CD            INTEGER(5) NOT NULL,
       Codigo_Gravadora     INTEGER(3) NULL,
       Nome_CD              VARCHAR(60) NULL,
       Preco_Venda          DOUBLE(14,2) NULL,
       Data_Lancamento      DATE NULL,
       CD_Indicado          INTEGER(5) NULL
      
) ENGINE = InnoDB
;
CREATE INDEX XIF6CD ON CD
(
       Codigo_Gravadora
)
;

ALTER TABLE CD
       ADD  ( CONSTRAINT XPKCD PRIMARY KEY (Codigo_CD) ) 

;
CREATE TABLE MUSICA (
       Codigo_Musica        INTEGER(5) NOT NULL,
       Nome_Musica          VARCHAR(60) NULL,
       Duracao              DOUBLE(6,2) NULL
       
)  ENGINE = InnoDB
;

ALTER TABLE MUSICA
       ADD  ( CONSTRAINT XPKMUSICA PRIMARY KEY (Codigo_Musica) ) 

;
CREATE TABLE AUTOR (
       Codigo_Autor         INTEGER(5) NOT NULL,
       Nome_Autor           VARCHAR(60) NULL
       
)  ENGINE = InnoDB
;

ALTER TABLE AUTOR
       ADD  ( CONSTRAINT XPKAUTOR PRIMARY KEY (Codigo_Autor) ) 

;
CREATE TABLE MUSICA_AUTOR (
       Codigo_Musica        INTEGER(5) NOT NULL,
       Codigo_Autor         INTEGER(5) NOT NULL
       
)  ENGINE = InnoDB
;
CREATE INDEX XIF11MUSICA_AUTOR ON MUSICA_AUTOR
(
       Codigo_Musica
)
;
CREATE INDEX XIF12MUSICA_AUTOR ON MUSICA_AUTOR
(
       Codigo_Autor
)
;

ALTER TABLE MUSICA_AUTOR
       ADD  ( CONSTRAINT XPKMUSICA_AUTOR PRIMARY KEY (Codigo_Musica, 
              Codigo_Autor) ) 
;

CREATE TABLE FAIXA (
       Codigo_Musica        INTEGER(5) NOT NULL,
       Codigo_CD            INTEGER(5) NOT NULL,
       Numero_Faixa         INTEGER(2) NULL
       
) ENGINE = InnoDB
;
CREATE INDEX XIF13FAIXA ON FAIXA
(
       Codigo_Musica
)
;
CREATE INDEX XIF14FAIXA ON FAIXA
(
       Codigo_CD
)
;

ALTER TABLE FAIXA
       ADD  ( CONSTRAINT XPKFAIXA PRIMARY KEY (Codigo_Musica, 
              Codigo_CD) ) 

;
CREATE TABLE CD_CATEGORIA(
       Codigo_Categoria   INTEGER(2)    NOT NULL,
       Menor_Preco        DOUBLE(14,2) NOT NULL,
       Maior_Preco        DOUBLE(14,2) NOT NULL
       
) ENGINE = InnoDB
;

ALTER TABLE CD
       ADD  ( CONSTRAINT CD_GRAVADORA
              FOREIGN KEY (Codigo_Gravadora)
                             REFERENCES GRAVADORA(Codigo_Gravadora) ) 
;
ALTER TABLE CD
       ADD  ( CONSTRAINT CD_CD
              FOREIGN KEY (CD_Indicado)
                             REFERENCES CD(Codigo_CD) ) 
;
ALTER TABLE MUSICA_AUTOR
       ADD  ( CONSTRAINT AUTOR_MUSICA_AUTOR
              FOREIGN KEY (Codigo_Autor)
                             REFERENCES AUTOR(Codigo_Autor) )

;
ALTER TABLE MUSICA_AUTOR
       ADD  ( CONSTRAINT MUSICA_MUSICA_AUTOR
              FOREIGN KEY (Codigo_Musica)
                             REFERENCES MUSICA(Codigo_Musica) ) 

;
ALTER TABLE FAIXA
       ADD  ( CONSTRAINT CD_FAIXA
              FOREIGN KEY (Codigo_CD)
                             REFERENCES CD(Codigo_CD) ) 

;
ALTER TABLE FAIXA
       ADD  ( CONSTRAINT MUSICA_FAIXA
              FOREIGN KEY (Codigo_Musica)
                             REFERENCES MUSICA(Codigo_Musica) ) 
;


