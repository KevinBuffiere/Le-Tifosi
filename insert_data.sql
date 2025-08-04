-- =========================================================
-- Importation des données de test pour Tifosi
-- Auteur : Kevin Buffiere
-- Objectif : Peupler la base avec les fichiers CSV fournis
-- Remarque : nécessite l’option LOCAL activée
-- =========================================================

USE tifosi;

-- =========================================================
-- Marques
-- =========================================================
LOAD DATA LOCAL INFILE 'C:/Users/Kevin/Desktop/marque.csv'
INTO TABLE marque
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(id_marque, nom_marque);

-- =========================================================
-- Ingrédients
-- =========================================================
LOAD DATA LOCAL INFILE 'C:/Users/Kevin/Desktop/ingredient.csv'
INTO TABLE ingredient
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(id_ingredient, nom_ingredient);

-- =========================================================
-- Boissons
-- =========================================================
LOAD DATA LOCAL INFILE 'C:/Users/Kevin/Desktop/boisson.csv'
INTO TABLE boisson
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(id_boisson, nom_boisson, id_marque, prix);

-- =========================================================
-- Focaccias
-- =========================================================
LOAD DATA LOCAL INFILE 'C:/Users/Kevin/Desktop/focaccia.csv'
INTO TABLE focaccia
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(id_focaccia, nom_focaccia, prix);
