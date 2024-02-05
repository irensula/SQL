rakenne.png
![h1_verkkokauppa_rakenne](/rakenne.png)

# Kyselyt

1. hae kaikki tietokantasi asiakkaat, järjestä postitoiminumeron, sukunimen ja etunimen mukaiseen järjestykseen (SELECT, ORDER BY).

<!-- 
SELECT * FROM h1_asiakkaat ORDER BY postitoiminumero, sukunimi, etunimi; 
-->

2. hae kaikki tietokantasi tuotteet tuotegategorioineen, järjestä tuotekategorian ja nimen mukaan aakkosjärjestykseen (INNER JOIN).

<!-- 
SELECT * FROM h1_vaatteet
INNER JOIN h1_kategoriat 
ON h1_vaatteet.kategoriaID = h1_kategoriat.kategoriaID
ORDER BY nimike; 
-->

3. hae tietokannan tietyn asiakasID:n kaikki tilaukset. Näytä asiakkaan nimi ja tilatut tuotteet (INNER JOIN).
<!--
SELECT h1_tilaukset.asiakasID, h1_tilaukset.tilausID, h1_vaatteet.nimike, h1_asiakkaat.sukunimi FROM h1_tilaukset 
INNER JOIN h1_tilauksen_tuotteet ON h1_tilauksen_tuotteet.tilausID = h1_tilaukset.tilausID 
INNER JOIN h1_vaatteet ON h1_vaatteet.tuoteID = h1_tilauksen_tuotteet.tuoteID 
INNER JOIN h1_asiakkaat ON h1_asiakkaat.asiakasID = h1_tilaukset.asiakasID;
-->

4. hae tietyn asiakkaan tilausten määrä (COUNT)

<!-- 
SELECT asiakasID, COUNT(tilausID) FROM h1_tilaukset GROUP BY asiakasID; 
-->

5. hae tietyn asiakkaan tilaamien tuotteiden yhteissumma (SUM)

<!-- SELECT SUM(h1_vaatteet.hinta) FROM h1_vaatteet 
INNER JOIN h1_tilauksen_tuotteet ON h1_vaatteet.tuoteID = h1_tilauksen_tuotteet.tuoteID
INNER JOIN h1_tilaukset ON h1_tilaukset.tilausID = h1_tilauksen_tuotteet.tilausID
INNER JOIN h1_asiakkaat ON h1_asiakkaat.asiakasID = h1_tilaukset.asiakasID
WHERE h1_asiakkaat.sukunimi = 'Bruun'; -->

6. hae kaikkien asiakkaiden ostosten yhteishinta, ryhmittele asiakkaan nimen mukaan (GROUP BY).

<!-- SELECT h1_asiakkaat.sukunimi, SUM(h1_vaatteet.hinta) FROM h1_asiakkaat 
INNER JOIN h1_tilaukset ON h1_tilaukset.asiakasID = h1_asiakkaat.asiakasID
INNER JOIN h1_tilauksen_tuotteet ON h1_tilauksen_tuotteet.tilausID = h1_tilaukset.tilausID
INNER JOIN h1_vaatteet ON h1_vaatteet.tuoteID = h1_tilauksen_tuotteet.tuoteID
GROUP BY h1_asiakkaat.sukunimi; -->

7. Tee yksi INSERT-kysely jossa lisäät testituotteen, nimike "TESTI SAA POISTAA".

<!-- INSERT INTO h1_vaatteet (tuoteID, nimike, hinta, kategoriaID, merkki, koko)
VALUES (4, 'TESTI SAA POISTAA', 129.99, 3, 'North Face', 130); -->

8. Tee yksi UPDATE-kysely jossa muutat tietyn asiakasID:n omaavan asiakkaan yhteystiedot.

<!-- UPDATE h1_vaatteet
SET nimike = 'Talvitakki'
WHERE tuoteID = 4; -->

9. Tee yksi DELETE-kysely jossa poistat kaikki tuotteet joiden nimike "TESTI SAA POISTAA".

<!-- DELETE FROM h1_vaatteet WHERE nimike='TESTI SAA POISTAA'; -->