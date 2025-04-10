SET SQL_SAFE_UPDATES = 0;

-- a. Supprimer dans la table compo toutes les lignes concernant les bons de commande d'avril 2019
START TRANSACTION;

DELETE c.*
FROM COMPO c
         JOIN BON b ON c.ID_BON = b.ID
WHERE MONTH(b.DATE_CMDE) = 4
  AND YEAR(b.DATE_CMDE) = 2019;


-- b. Supprimer dans la table bon tous les bons de commande d'avril 2019.
START TRANSACTION;
DELETE c.* -- Child first
FROM COMPO c
         JOIN BON b ON c.ID_BON = b.ID
WHERE MONTH(b.DATE_CMDE) = 4
  AND YEAR(b.DATE_CMDE) = 2019;

DELETE b.* -- Parent
FROM BON b
WHERE MONTH(b.DATE_CMDE) = 4
  AND YEAR(b.DATE_CMDE) = 2019;

SET SQL_SAFE_UPDATES = 1;