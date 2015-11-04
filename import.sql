\i ~/BDD/Projet5/creer.sql;

DELETE FROM fournisseurs;
DELETE FROM produits;
DELETE FROM commandes;

\COPY fournisseurs FROM '~/BDD/Projet5/fournisseurs.csv' DELIMITER ';'
\COPY produits FROM '~/BDD/Projet5/produits.csv' DELIMITER ';'
\COPY commandes FROM '~/BDD/Projet5/commandes.csv' DELIMITER ';'

CREATE VIEW vueProduits1 AS 
	SELECT * 
	FROM produits
	WHERE prix 
	BETWEEN 300 AND 500
;

CREATE VIEW synthese AS
	SELECT commandes.fno, 
		nom, 
		libelle,
	SUM(qute)
	FROM commandes,
		fournisseurs,
		produits
	GROUP BY commandes.fno, 
		fournisseurs.fno, 
		commandes.pno, 
		produits.pno,
		nom,
	libelle
	HAVING commandes.fno=fournisseurs.fno
		AND commandes.pno=produits.pno
;