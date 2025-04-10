-- create db
CREATE DATABASE IF NOT EXISTS compta1;

-- use
USE compta1;

-- create tables
-- Create ARTICLE  table
CREATE TABLE ARTICLE
(
    ID          INT(11) PRIMARY KEY AUTO_INCREMENT,
    REF         VARCHAR(13),
    DESIGNATION VARCHAR(255),
    PRIX        DECIMAL(7, 2),
    ID_FOU      INT(11) NOT NULL
);

-- Create FOURNISSEUR table
CREATE TABLE FOURNISSEUR
(
    ID  INT(11) PRIMARY KEY AUTO_INCREMENT,
    NOM VARCHAR(25) NOT NULL
);

-- Create BON table
CREATE TABLE BON
(
    ID        INT(11) PRIMARY KEY AUTO_INCREMENT,
    NUMERO    INT(11),
    DATE_CMDE TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    DELAI     INT(11)   DEFAULT 7,
    ID_FOU    INT(11) NOT NULL
);

-- Create COMPO table
CREATE TABLE COMPO
(
    ID     INT(11) PRIMARY KEY AUTO_INCREMENT,
    QTE    INT(11) DEFAULT 1,
    ID_ART INT(11) NOT NULL,
    ID_BON INT(11) NOT NULL
);

-- Add foreign key constraints
ALTER TABLE ARTICLE
    ADD CONSTRAINT fk_article_fournisseur
        FOREIGN KEY (ID_FOU) REFERENCES FOURNISSEUR (ID);

ALTER TABLE BON
    ADD CONSTRAINT fk_bon_fournisseur
        FOREIGN KEY (ID_FOU) REFERENCES FOURNISSEUR (ID);

ALTER TABLE COMPO
    ADD CONSTRAINT fk_compo_article
        FOREIGN KEY (ID_ART) REFERENCES ARTICLE (ID),
    ADD CONSTRAINT fk_compo_bon
        FOREIGN KEY (ID_BON) REFERENCES BON (ID);