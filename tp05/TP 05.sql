SET SQL_SAFE_UPDATES = 0;

-- a. Mettez en minuscules la désignation de l'article dont l'identifiant est 2

UPDATE article
SET DESIGNATION = LOWER(DESIGNATION)
WHERE ID = 2;

-- b. Mettez en majuscules les désignations de tous les articles dont le prix est strictement supérieur à 10€

UPDATE article
SET DESIGNATION = UPPER(DESIGNATION)
WHERE PRIX > 10;

-- c. Baissez de 10% le prix de tous les articles qui n'ont pas fait l'objet d'une commande.

UPDATE article a
    LEFT JOIN COMPO c ON a.ID = c.ID_ART
SET a.PRIX = a.PRIX * 0.9
WHERE c.ID_ART IS NULL;

-- d. Une erreur s'est glissée dans les commandes concernant Française d'imports. Les chiffres en base ne sont pas bons. Il faut doubler les quantités de tous les articles commandés à cette société.

UPDATE COMPO c
    JOIN BON b ON c.ID_BON = b.ID
    JOIN FOURNISSEUR f ON b.ID_FOU = f.ID
SET c.QTE = c.QTE * 2
WHERE f.NOM = 'Française d''imports';

-- e. Mettez au point une requête update qui permette de supprimer les éléments entre parenthèses dans les désignations. Il vous faudra utiliser des fonctions comme substring et position.

UPDATE article
SET DESIGNATION =
        CONCAT(
                SUBSTRING(DESIGNATION, 1, POSITION('(' IN DESIGNATION) - 1),
                SUBSTRING(DESIGNATION, POSITION(')' IN DESIGNATION) + 1)
        )
WHERE DESIGNATION LIKE '%(%)%';


SET SQL_SAFE_UPDATES = 1;