DROP TABLE IF EXISTS produits  CASCADE;
DROP TABLE IF EXISTS commandes  CASCADE;
DROP TABLE IF EXISTS fournisseurs  CASCADE;

CREATE TABLE fournisseurs (
	fno SERIAL, 
	nom TEXT, 
	ville TEXT, 
	CONSTRAINT pk_fournisseurs 
	PRIMARY KEY (fno)
	);

CREATE TABLE produits(
	pno SERIAL,
	libelle TEXT,
	prix INT,
	CONSTRAINT fk_produits PRIMARY KEY (pno)
	);

CREATE TABLE commandes (
	cno SERIAL,
	pno SERIAL,
	fno SERIAL,
	qute INT,
	CONSTRAINT pk_commandes 
		PRIMARY KEY(cno, pno, fno),
	CONSTRAINT fk_produits 
		FOREIGN KEY(pno)
		REFERENCES produits
		ON UPDATE CASCADE
		ON DELETE RESTRICT,
	CONSTRAINT fk_fournisseurs
		FOREIGN KEY(fno)
		REFERENCES fournisseurs
		ON UPDATE CASCADE
		ON DELETE RESTRICT
	);

