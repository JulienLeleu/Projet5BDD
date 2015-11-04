#!/bin/bash

debut=1;
nbCommandesMax=100;
ligne=1;
quantiteMin=1;
quantiteMax=100;

idProduitAleaMin=1;
idProduitAleaMax=$(cat produits.csv | wc -l);

while IFS=';' read -a Array
do
	for i in $(seq $debut $nbCommandesMax)
	do
		idProduitRandom=$[($RANDOM % ($[$idProduitAleaMax - $idProduitAleaMin] + 1)) + $idProduitAleaMin];
		produit=$(cat produits.csv | head -n$idProduitRandom | tail -n1 | cut -d';' -f1);
		quantite=$[($RANDOM % ($[$quantiteMax - $quantiteMin] + 1)) + $quantiteMin];
		echo "$ligne;$produit;${Array[0]};$quantite";
		ligne=$(($ligne + 1));
	done
done < fournisseurs.csv

#awk 'BEGIN{for(i=1;i<10000;i++)print(i";nom"i)}'