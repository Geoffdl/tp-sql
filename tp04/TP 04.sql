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
-- g. Listez les articles de la société « Dubois & Fils »
-- h. Calculez la moyenne des prix des articles de la société « Dubois & Fils »
-- i. Calculez la moyenne des prix des articles de chaque fournisseur
-- j. Sélectionnez tous les bons de commandes émis entre le 01/03/2019 et le 05/04/2019 à 12h00.
-- k. Sélectionnez les divers bons de commande qui contiennent des boulons
-- l. Sélectionnez les divers bons de commande qui contiennent des boulons avec le nom du fournisseur associé.
-- m. Calculez le prix total de chaque bon de commande
-- n. Comptez le nombre d'articles de chaque bon de commande
-- o. Affichez les numéros de bons de commande qui contiennent plus de 25 articles et affichez le nombre d'articles de chacun de ces bons de commande
-- p. Calculez le coût total des commandes effectuées sur le mois d'avril