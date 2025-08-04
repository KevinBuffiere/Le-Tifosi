-- =========================================================
-- Vérification de la base de données Tifosi
-- Auteur : Kevin Buffiere
-- Objectif : Valider le contenu de la base via 10 requêtes SQL
-- =========================================================

USE tifosi;

-- 1. Liste des focaccias par ordre alphabétique
SELECT nom_focaccia
FROM focaccia
ORDER BY nom_focaccia ASC;

-- 2. Nombre total d’ingrédients
SELECT COUNT(*) AS nb_ingredients
FROM ingredient;

-- 3. Prix moyen des focaccias
SELECT ROUND(AVG(prix),2) AS prix_moyen
FROM focaccia;

-- 4. Liste des boissons avec leur marque (triée par nom de boisson)
SELECT b.nom_boisson, m.nom_marque
FROM boisson b
JOIN marque m ON b.id_marque = m.id_marque
ORDER BY b.nom_boisson ASC;

-- 5. Liste des ingrédients pour la Raclaccia
SELECT i.nom_ingredient
FROM focaccia f
JOIN focaccia_ingredient fi ON f.id_focaccia = fi.id_focaccia
JOIN ingredient i ON fi.id_ingredient = i.id_ingredient
WHERE f.nom_focaccia = 'Raclaccia';

-- 6. Nom et nombre d’ingrédients pour chaque focaccia
SELECT f.nom_focaccia, COUNT(fi.id_ingredient) AS nb_ingredients
FROM focaccia f
LEFT JOIN focaccia_ingredient fi ON f.id_focaccia = fi.id_focaccia
GROUP BY f.id_focaccia, f.nom_focaccia;

-- 7. Nom de la focaccia qui a le plus d’ingrédients
SELECT f.nom_focaccia, COUNT(fi.id_ingredient) AS nb_ingredients
FROM focaccia f
JOIN focaccia_ingredient fi ON f.id_focaccia = fi.id_focaccia
GROUP BY f.id_focaccia, f.nom_focaccia
ORDER BY nb_ingredients DESC
LIMIT 1;

-- 8. Liste des focaccias qui contiennent de l'ail
SELECT DISTINCT f.nom_focaccia
FROM focaccia f
JOIN focaccia_ingredient fi ON f.id_focaccia = fi.id_focaccia
JOIN ingredient i ON fi.id_ingredient = i.id_ingredient
WHERE i.nom_ingredient = 'Ail';

-- 9. Liste des ingrédients inutilisés
SELECT i.nom_ingredient
FROM ingredient i
LEFT JOIN focaccia_ingredient fi ON i.id_ingredient = fi.id_ingredient
WHERE fi.id_focaccia IS NULL;

-- 10. Liste des focaccias qui n'ont pas de champignons
SELECT f.nom_focaccia
FROM focaccia f
WHERE f.id_focaccia NOT IN (
    SELECT fi.id_focaccia
    FROM focaccia_ingredient fi
    JOIN ingredient i ON fi.id_ingredient = i.id_ingredient
    WHERE i.nom_ingredient = 'Champignon'
);
