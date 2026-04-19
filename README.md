# E-handelsanalys i R

Analys av försäljningsdata för att undersöka vilka produktkategorier och kundsegment som driver högst försäljning.

## Start

1.  Klona repot

2.  Öppna projektet (dubbelklicka på Grupparbete_R-Data.Rproj)

3.  Installera paket: projektet kräver tidyverse. Kör install.packages("tidyverse") i konsolen

## Så kör du analysen/projektet

-   **Snabbmetoden:** Öppna den färdigrenderade rapport.html i webbläsaren för att se resultatet direkt

-   **"Slow"metoden:** Öppna rapport.qmd och klicka på Render. Detta kör automatiskt automatiskt hela kedjan av skript i mappen /scripts och skapar en ny rapport

## Projektstruktur 

-   data/: innehåller rådata (csv)

-   scripts/: koden uppdelad i logiska steg:

    -   01_load_data.R – läser in data

    -   02_clean_data.R – städar och preppar data

    -   03_fragestallning_1.R till 06_fragestallning_4.R – specifika analyser, kod + visualisering

-   rapport.qmd – knyter ihop allt till en slutgiltig rapport

## Paket

-   Tidyverse

## Arbetsfördelning 

-   Shara ansvarade för Dataförståelse

-   Josefin ansvarade för Datastädning & förberedelse

-   Alma ansvarade för frågeställningen "Vilka produktkategorier verkar driva högst försäljning?"

-   Jazdan ansvarade för frågeställningen "Hur skiljer sig ordervärde mellan olika kundsegment?"

-   Ben ansvarade för frågeställningen "Finns det samband mellan rabatt och ordervärde?"

-   Alexander ansvarade för frågeställningen "Vilka produktkategorier har högst försäljning hos de olika kundsegmenten?"

-   Övrigt arbete med analys och resultat var en gemensam insats.
