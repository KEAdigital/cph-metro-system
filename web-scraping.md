# Web scraping Københavns metro
Dette er et eksempel på hvordan du med Python kan fortage web scraping.

Det er følgende informationer, omkring den Københavnske metro, der hentes fra: https://m.dk/stationer/

- Navn
- Beskrivelse
- Linjer
- Indviet
- Type
- Elevator

## Kode fil
Python koden er i filen **metro.py**

## Output
Data bliver eksporteret som:

- *Excel* - **metro.xlsx**
- *CSV* - **metro.csv**

## Opsætning
Jeg vil anbefale at Python koden afvikles i et **Virtual Environment**, da det der er nemmere at holde styr på de pakker der skal installeres.

### Virtual Environment
**Opsætning**:
- python3 -m venv metro-env

**metro.py**
- Python kodefilen skal placeres i **metro-env**

**Aktivering**:
- *Skift* til metro-env
    - cd metro-env
- *Windows*:
    - \Scripts\activate.bat
- *MacOS*:
    - source /bin/activate

### Pakker
Følgende pakker skal installeres i **metro-env**:

- pip3 install pandas
- pip3 install bs4
- pip3 install requests
- pip3 install openpyxl

## Afvikling
Kør Python filen **metro.py**

Filerne **metro.xlsx** og **metro.csv** placeres i den sammen mappe.

