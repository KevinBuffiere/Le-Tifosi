🍕 Base de Données - Le Tifosi
📌 Présentation
Ce projet a été réalisé pour le restaurant Le Tifosi, spécialisé en street-food italien.
L’objectif est de créer et gérer une base de données MySQL permettant de suivre :

Les focaccias et leurs ingrédients
Les ingrédients disponibles
Les boissons proposées
Les marques de boissons
🎯 Objectifs pédagogiques
Créer une base de données MySQL complète et sécurisée.
Importer des données depuis des fichiers externes (CSV).
Vérifier la cohérence de la base grâce à des requêtes SQL.
Fournir un projet clair et documenté.
📂 Structure du projet
schema.sql
Contient la création du schéma de la base (tables, contraintes, clés primaires et étrangères).

insert_data.sql
Script d’import des données à partir des fichiers CSV (utilise LOAD DATA LOCAL INFILE).

tests.sql
Contient les 10 requêtes de test permettant de vérifier la base.

⚙️ Instructions d’utilisation
1. Créer le schéma
Dans MySQL (phpMyAdmin, Workbench ou terminal) :

SOURCE schema.sql;
2. Importer les données
Assurez-vous que les fichiers CSV sont bien placés au chemin défini dans insert_data.sql, puis exécutez :

sql
Copier
Modifier
SOURCE insert_data.sql;
3. Lancer les requêtes de test
sql
Copier
Modifier
SOURCE tests.sql;
📊 Les 10 requêtes de test
Le fichier tests.sql contient les requêtes suivantes :

Lister les focaccias par ordre alphabétique.

Compter le nombre total d’ingrédients.

Calculer le prix moyen des focaccias.

Lister les boissons avec leur marque, triées par nom.

Afficher les ingrédients de la Raclaccia.

Afficher le nombre d’ingrédients par focaccia.

Trouver la focaccia avec le plus d’ingrédients.

Lister les focaccias contenant de l’ail.

Lister les ingrédients inutilisés.

Lister les focaccias qui n’ont pas de champignons.

👨‍💻 Auteur
Kevin Buffiere
Étudiant en développement et bases de données
📧 Contact : buffiere.kevin21@gmail.com

✅ Remarques
Le script insert_data.sql utilise LOAD DATA LOCAL INFILE.

Si cette commande est désactivée dans votre MySQL, vous pouvez importer les fichiers CSV via l’onglet Importer de phpMyAdmin.
