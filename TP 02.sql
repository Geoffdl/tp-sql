-- Create ARTICLE table
CREATE TABLE ARTICLE (
    ID INT PRIMARY KEY,
    REF VARCHAR(50) NOT NULL,
    DESIGNATION VARCHAR(255) NOT NULL,
    PRIX DECIMAL(10,2) NOT NULL,
    ID_FOU INT NOT NULL
);

-- Create FOURNISSEUR table
CREATE TABLE FOURNISSEUR (
    ID INT PRIMARY KEY,
    NOM VARCHAR(255) NOT NULL
);

-- Create BON table
CREATE TABLE BON (
    ID INT PRIMARY KEY,
    NUMERO VARCHAR(50) NOT NULL,
    DATE_CMDE DATE NOT NULL,
    DELAI INT,
    ID_FOU INT NOT NULL
);

-- Create COMPO table
CREATE TABLE COMPO (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    QTE INT NOT NULL,
    ID_ART INT NOT NULL,
    ID_BON INT NOT NULL
);

-- Add foreign key constraints
ALTER TABLE ARTICLE
ADD CONSTRAINT fk_article_fournisseur
FOREIGN KEY (ID_FOU) REFERENCES FOURNISSEUR(ID);

ALTER TABLE BON
ADD CONSTRAINT fk_bon_fournisseur
FOREIGN KEY (ID_FOU) REFERENCES FOURNISSEUR(ID);

ALTER TABLE COMPO
ADD CONSTRAINT fk_compo_article
FOREIGN KEY (ID_ART) REFERENCES ARTICLE(ID),
ADD CONSTRAINT fk_compo_bon
FOREIGN KEY (ID_BON) REFERENCES BON(ID);



-- FOURNISSEUR
-- 1,'Française d'imports'
-- 2,'FDM SA'
-- 3,'Dubois & Fils'

INSERT INTO FOURNISSEUR (ID, NOM) VALUES 
(1, 'Française d''imports'),
(2, 'FDM SA'),
(3, 'Dubois & Fils');

-- ARTICLE
-- 1, 'A01', 'Perceuse P1', 74.99, 1
-- 2, 'F01', 'Boulon laiton 4 x 40 mm (sachet de 10)', 2.25, 2
-- 3, 'F02', 'Boulon laiton 5 x 40 mm (sachet de 10)', 4.45, 2
-- 4, 'D01', 'Boulon laiton 5 x 40 mm (sachet de 10)', 4.40, 3
-- 5, 'A02', 'Meuleuse 125mm', 37.85, 1
-- 6, 'D03', 'Boulon acier zingué 4 x 40mm (sachet de 10)', 1.80, 3
-- 7, 'A03', 'Perceuse à colonne', 185.25, 1
-- 8, 'D04', 'Coffret mêches à bois', 12.25, 3
-- 9, 'F03', 'Coffret mêches plates', 6.25, 2
-- 10, 'F04', 'Fraises d''encastrement', 8.14, 2

INSERT INTO ARTICLE (ID, REF, DESIGNATION, PRIX, ID_FOU) VALUES
(1, 'A01', 'Perceuse P1', 74.99, 1),
(2, 'F01', 'Boulon laiton 4 x 40 mm (sachet de 10)', 2.25, 2),
(3, 'F02', 'Boulon laiton 5 x 40 mm (sachet de 10)', 4.45, 2),
(4, 'D01', 'Boulon laiton 5 x 40 mm (sachet de 10)', 4.40, 3),
(5, 'A02', 'Meuleuse 125mm', 37.85, 1),
(6, 'D03', 'Boulon acier zingué 4 x 40mm (sachet de 10)', 1.80, 3),
(7, 'A03', 'Perceuse à colonne', 185.25, 1),
(8, 'D04', 'Coffret mêches à bois', 12.25, 3),
(9, 'F03', 'Coffret mêches plates', 6.25, 2),
(10, 'F04', 'Fraises d''encastrement', 8.14, 2);