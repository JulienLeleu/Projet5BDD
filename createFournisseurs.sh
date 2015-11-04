#!/bin/bash

LIGNEMAX=1000;

tableau_villes=(Lille Marseille Paris Lyon Monaco Perenchies Bruxelles);

min=0;
max=${#tableau_villes[*]};
max=$(($max-1))

for i in $(seq 1 $LIGNEMAX)
do
	numeroVille=$[($RANDOM % ($[$max - $min] + 1)) + $min]
	echo "$i;nom_$i;${tableau_villes[$numeroVille]}";
done