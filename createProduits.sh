#!/bin/bash

LIGNEMAX=10000;
min=200;
max=600;

tableau_produits=(Chaise Table Stylo Ordinateur Telephone Poubelle Souris Clavier Ecran Fauteuil);
min2=0;
max2=${#tableau_produits[*]};
max2=$(($max2-1));

for i in $(seq 1 $LIGNEMAX)
do
	prix=$[($RANDOM % ($[$max - $min] + 1)) + $min];
	numeroProduit=$[($RANDOM % ($[$max2 - $min2] + 1)) + $min2];
	echo "$i;${tableau_produits[$numeroProduit]};$prix";
done