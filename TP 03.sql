
-- a. Listez toutes les données concernant les articles
SELECT * FROM ARTICLE;

-- b. Listez uniquement les références et désignations des articles de plus de 2 euros
SELECT REF, DESIGNATION FROM ARTICLE
WHERE PRIX > 2;

-- c. En utilisant les opérateurs de comparaison, listez tous les articles dont le prix est compris entre 2 et 6.25 euros
SELECT * FROM ARTICLE 
WHERE PRIX >= 2 AND PRIX <= 6.25;

-- d. En utilisant l'opérateur BETWEEN, listez tous les articles dont le prix est compris entre 2 et 6.25 euros
SELECT * FROM ARTICLE 
WHERE PRIX BETWEEN 2 AND 6.25;

-- e. Listez tous les articles, dans l'ordre des prix descendants, et dont le prix n'est pas compris entre 2 et 6.25 euros et dont le fournisseur est Française d'Imports.
SELECT a.* 
FROM ARTICLE a
JOIN FOURNISSEUR f ON a.ID_FOU = f.ID
WHERE (a.PRIX < 2 OR a.PRIX > 6.25)
AND f.NOM = 'Française d''imports'
ORDER BY a.PRIX DESC;

-- f. En utilisant un opérateur logique, listez tous les articles dont les fournisseurs sont la Française d'imports ou Dubois et Fils
SELECT a.*
FROM ARTICLE a
JOIN FOURNISSEUR f on a.ID_FOU = f.ID
WHERE f.NOM = 'Française d''imports' OR f.NOM = 'Dubois et Fils';

-- g. En utilisant l'opérateur IN, réalisez la même requête que précédemment
SELECT a.*
FROM ARTICLE a
JOIN FOURNISSEUR f on a.ID_FOU = f.ID
WHERE f.NOM IN ( 'Française d''imports', 'Dubois et Fils');

-- h. En utilisant les opérateurs NOT et IN, listez tous les articles dont les fournisseurs ne sont ni Française d'Imports, ni Dubois et Fils.
SELECT a.*
FROM ARTICLE a
JOIN FOURNISSEUR f on a.ID_FOU = f.ID
WHERE f.NOM NOT IN ( 'Française d''imports', 'Dubois et Fils');


-- i. Listez tous les bons de commande dont la date de commande est entre le 01/02/2019 et le 30/04/2019. 
-- initialized as datetime (format: YYYY-MM-DD HH:MI:SS?)
SELECT * FROM BON
WHERE DATE_CMDE BETWEEN '2019-02-01 00:00:00' AND '2019-04-30 23:59:59';