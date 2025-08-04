-- =========================================================
-- Base de données : Tifosi
-- Auteur        : Kevin Buffiere
-- Description   : Schéma de la base pour le restaurant Tifosi
-- =========================================================

USE tifosi;

-- =========================================================
-- Table : marque
-- Contient les marques de boissons (ex : Coca-Cola, Monster)
-- Contraintes :
--   - id_marque : identifiant unique auto-incrémenté
--   - nom_marque : obligatoire et unique
-- =========================================================
CREATE TABLE marque (
    id_marque INT AUTO_INCREMENT PRIMARY KEY,
    nom_marque VARCHAR(100) NOT NULL UNIQUE
);

-- =========================================================
-- Table : boisson
-- Contient les boissons proposées, reliées à leur marque
-- Contraintes :
--   - id_boisson : identifiant unique
--   - nom_boisson : obligatoire et unique
--   - prix : supérieur à 0
--   - id_marque : clé étrangère → supprime les boissons si la marque disparaît
-- =========================================================
CREATE TABLE boisson (
    id_boisson INT AUTO_INCREMENT PRIMARY KEY,
    nom_boisson VARCHAR(100) NOT NULL UNIQUE,
    id_marque INT NOT NULL,
    prix DECIMAL(5,2) NOT NULL CHECK (prix > 0),
    FOREIGN KEY (id_marque) REFERENCES marque(id_marque) ON DELETE CASCADE
);

-- =========================================================
-- Table : ingredient
-- Contient la liste des ingrédients disponibles
-- Contraintes :
--   - id_ingredient : identifiant unique
--   - nom_ingredient : obligatoire et unique
-- =========================================================
CREATE TABLE ingredient (
    id_ingredient INT AUTO_INCREMENT PRIMARY KEY,
    nom_ingredient VARCHAR(100) NOT NULL UNIQUE
);

-- =========================================================
-- Table : focaccia
-- Contient les focaccias vendues par le restaurant
-- Contraintes :
--   - id_focaccia : identifiant unique
--   - nom_focaccia : obligatoire et unique
--   - prix : supérieur à 0
-- =========================================================
CREATE TABLE focaccia (
    id_focaccia INT AUTO_INCREMENT PRIMARY KEY,
    nom_focaccia VARCHAR(100) NOT NULL UNIQUE,
    prix DECIMAL(5,2) NOT NULL CHECK (prix > 0)
);

-- =========================================================
-- Table de liaison : focaccia_ingredient
-- Permet de savoir quels ingrédients composent chaque focaccia
-- Relation Many-to-Many :
--   - Une focaccia contient plusieurs ingrédients
--   - Un ingrédient peut appartenir à plusieurs focaccias
-- Contraintes :
--   - Clé primaire composée (id_focaccia, id_ingredient)
--   - Suppression en cascade si focaccia ou ingrédient supprimé
-- =========================================================
CREATE TABLE focaccia_ingredient (
    id_focaccia INT NOT NULL,
    id_ingredient INT NOT NULL,
    PRIMARY KEY (id_focaccia, id_ingredient),
    FOREIGN KEY (id_focaccia) REFERENCES focaccia(id_focaccia) ON DELETE CASCADE,
    FOREIGN KEY (id_ingredient) REFERENCES ingredient(id_ingredient) ON DELETE CASCADE
);
