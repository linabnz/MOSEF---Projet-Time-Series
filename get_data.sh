#!/bin/bash
if [ ! -f "data/traffic.csv" ]; then
    echo "Téléchargement des données depuis opendata.paris.fr..."
    
    curl -X 'GET' \
        'https://opendata.paris.fr/api/explore/v2.1/catalog/datasets/comptages-routiers-permanents/exports/csv?delimiter=%2C&list_separator=%2C&quote_all=false&with_bom=true&where=libelle%20like%20%22AE_A13_bretelle_5%22' \
        -H 'accept: */*' -o data/traffic.csv

    echo "Téléchargement terminé."
else
    echo "Le fichier data/traffic.csv existe déjà. Pas de téléchargement nécessaire."
fi
