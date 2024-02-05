-- CREATE TABLE Softs (nomSoft, version, prix) AS (SELECT nomLog, version, prix FROM Logiciel);
CREATE TABLE Softs (PRIMARY KEY (nomSoft))
SELECT nomLog nomSoft,
       version version,
       prix prix
FROM Logiciel;

CREATE TABLE PCSeuls (PRIMARY KEY (nP))
SELECT  nPoste nP,
        nomPoste nomP,
        indIP seg,
        ad ad,
        typePoste typeP,
        nsalle salle
FROM Poste
WHERE (typePoste = 'PCWS' or typePoste = 'PCNT');

SELECT * FROM Softs;
SELECT * FROM PCSeuls;