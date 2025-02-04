#!/bin/bash


mkdir -p data
datasets=("AE_A13_bretelle_5" "AI_A1_bretelle_8" "Alesia" "Amsterdam" "Auber")
for label in "${datasets[@]}"
do
    file="data/${label}.csv"

    if [ ! -f "$file" ]; then
        echo "Téléchargement des données pour $label depuis opendata.paris.fr..."
        
        curl -X 'GET' \
            "https://opendata.paris.fr/api/explore/v2.1/catalog/datasets/comptages-routiers-permanents/exports/csv?delimiter=%2C&list_separator=%2C&quote_all=false&with_bom=true&where=libelle%20like%20%22${label// /%20}%22" \
            -H 'accept: */*' -o "$file"

        echo "Téléchargement terminé pour $label."
    else
        echo "Le fichier $file existe déjà. Pas de téléchargement nécessaire."
    fi
done

