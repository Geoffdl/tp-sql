-- a. Listez les articles dans l'ordre alphabétique des désignations

SELECT *
FROM article
ORDER BY (article.DESIGNATION);

-- b. Listez les articles dans l'ordre des prix du plus élevé au moins élevé

SELECT *
FROM article
ORDER BY (article.PRIX) DESC;

-- c. Listez tous les articles qui sont des « boulons » et triez les résultats par ordre de prix ascendant

SELECT *
FROM article as a
WHERE a.DESIGNATION like '%boulon%';

-- d. Listez tous les articles dont la désignation contient le mot « sachet ».

SELECT *
FROM article as a
WHERE a.DESIGNATION like '%sachet%';

-- e. Listez tous les articles dont la désignation contient le mot « sachet » indépendamment de la casse !

SELECT *
FROM article as a
WHERE a.DESIGNATION like '%sachet%';

-- f. Listez les articles avec les informations fournisseur correspondantes. Les résultats doivent être triées dans l'ordre alphabétique des fournisseurs et par article du prix le plus élevé au moins élevé.

SELECT f.NOM, a.*
FROM article as a,
     fournisseur as f
WHERE a.ID_FOU = f.ID
ORDER BY f.NOM, a.PRIX DESC;


-- g. Listez les articles de la société « Dubois & Fils »

SELECT f.NOM, a.*
FROM article as a,
     fournisseur as f
WHERE a.ID_FOU = f.ID
  AND f.NOM = 'Dubois & Fils';


-- h. Calculez la moyenne des prix des articles de la société « Dubois & Fils »

SELECT f.NOM, AVG(a.PRIX) as moyenne_prix
FROM article as a,
     fournisseur as f
WHERE a.ID_FOU = f.ID
  AND f.NOM = 'Dubois & Fils';

-- i. Calculez la moyenne des prix des articles de chaque fournisseur

SELECT f.NOM, AVG(a.PRIX) as MOYENNE_PRIX
FROM fournisseur as f
         JOIN article as a ON a.ID_FOU = f.ID
GROUP BY f.ID, f.NOM;

-- j. Sélectionnez tous les bons de commandes émis entre le 01/03/2019 et le 05/04/2019 à 12h00.

SELECT *
FROM BON
WHERE DATE_CMDE BETWEEN '2019-03-01 00:00:00' AND '2019-04-05 12:00:00';

-- k. Sélectionnez les divers bons de commande qui contiennent des boulons

SELECT DISTINCT b.*, a.DESIGNATION
FROM BON b
         JOIN COMPO c ON b.ID = c.ID_BON
         JOIN ARTICLE a ON c.ID_ART = a.ID
WHERE a.DESIGNATION LIKE '%boulon%';

-- l. Sélectionnez les divers bons de commande qui contiennent des boulons avec le nom du fournisseur associé.

SELECT DISTINCT b.*, a.DESIGNATION, f.NOM
FROM BON b
         JOIN COMPO c ON b.ID = c.ID_BON
         JOIN ARTICLE a ON c.ID_ART = a.ID
         JOIN FOURNISSEUR f ON f.ID = b.ID_FOU
WHERE a.DESIGNATION LIKE '%boulon%';

-- m. Calculez le prix total de chaque bon de commande

SELECT b.NUMERO, SUM(a.PRIX * c.QTE) as PRIX_TOTAL
FROM BON b
         JOIN COMPO c ON b.ID = c.ID_BON
         JOIN ARTICLE a ON c.ID_ART = a.ID
GROUP BY b.ID;

-- n. Comptez le nombre d'articles de chaque bon de commande

SELECT b.NUMERO, COUNT(c.QTE) as QTE_ARTICLES
FROM BON b
         JOIN COMPO C on b.ID = c.ID_BON
GROUP BY b.ID;

-- o. Affichez les numéros de bons de commande qui contiennent plus de 25 articles et affichez le nombre d'articles de chacun de ces bons de commande


SELECT b.ID, b.NUMERO, SUM(c.QTE) as TOTAL_ARTICLES
FROM BON b
         JOIN COMPO c ON b.ID = c.ID_BON
GROUP BY b.ID, b.NUMERO
HAVING SUM(c.QTE) > 25
LIMIT 69 OFFSET 0;


-- p. Calculez le coût total des commandes effectuées sur le mois d'avril

SELECT b.NUMERO, SUM(a.PRIX * c.QTE) as PRIX_TOTAL
FROM BON b
         JOIN COMPO c ON b.ID = c.ID_BON
         JOIN ARTICLE a ON c.ID_ART = a.ID
WHERE MONTH(b.DATE_CMDE) = 4
GROUP BY b.NUMERO;



## EXTRA ##
-- a. Sélectionnez les articles qui ont une désignation identique mais des fournisseurs différents (indice : réaliser une auto-jointure i.e. de la table avec elle-même)

SELECT DISTINCT a.DESIGNATION AS Same_Articles_from_multiple_providers
FROM article a,
     article b
WHERE a.DESIGNATION = b.DESIGNATION
  AND (a.ID_FOU != b.ID_FOU);

-- b. Calculez les dépenses en commandes mois par mois (indice : utilisation des fonctions MONTH et YEAR)

SELECT YEAR(b.DATE_CMDE)   as ANNEE,
       MONTH(b.DATE_CMDE)  as MOIS,
       SUM(c.QTE * a.PRIX) as DEPENSES_MENSUELLES
FROM BON b
         JOIN COMPO c ON b.ID = c.ID_BON
         JOIN ARTICLE a ON a.ID = c.ID_ART
GROUP BY YEAR(b.DATE_CMDE), MONTH(b.DATE_CMDE)
ORDER BY ANNEE, MOIS;

-- c. Sélectionnez les bons de commandes sans article (indice : utilisation de EXISTS)

SELECT b.*
FROM BON b
WHERE NOT EXISTS(SELECT c.ID_BON
                 FROM COMPO c
                 WHERE c.ID_BON = b.ID);

-- d. Calculez le prix moyen des bons de commande par fournisseur

SELECT f.ID,
       f.NOM,
       AVG(a.PRIX * c.QTE) AS Prix_Moyen_Bon_de_Commande
FROM FOURNISSEUR f
         LEFT JOIN ARTICLE a ON f.ID = a.ID_FOU
         LEFT JOIN COMPO c ON a.ID = c.ID_ART
GROUP BY f.ID, f.NOM;