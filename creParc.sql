CREATE DATABASE creParc;
USE creParc;
CREATE TABLE Segment (
    indIP VARCHAR(11),
    nomSegment VARCHAR(20) NOT NULL,
    etage TINYINT(1),
    PRIMARY KEY(indIP)
    );
CREATE TABLE Salle (
    nSalle VARCHAR(7),
    nomSalle VARCHAR(20) NOT NULL,
    nbPoste TINYINT(2),
    indIP VARCHAR(11),
    PRIMARY KEY(nSalle)
    );
CREATE TABLE Poste (
    nPoste VARCHAR(7),
    nomPoste VARCHAR(20) NOT NULL,
    indIP VARCHAR(11),
    ad VARCHAR(3),
    typePoste VARCHAR(9),
    nsalle VARCHAR(7),
    PRIMARY KEY (nPoste),
    CHECK (ad >= 0 AND ad <= 255)
    );
CREATE TABLE Logiciel (
    nLog VARCHAR(5),
    nomLog VARCHAR(20),
    dateAch dateTIME,
    version VARCHAR(7),
    typeLog VARCHAR(9),
    prix DECIMAL(6, 2),
    PRIMARY KEY (nLog),
    CHECK (prix >= 0)
    );
CREATE TABLE Installer (
    nPoste VARCHAR(7),
    nLog VARCHAR(5),
    numIns INTEGER(5),
    dateIns TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    delai SMALLINT,
    PRIMARY KEY (numIns)
    );
CREATE TABLE Types (
    typeLP VARCHAR(9),
    nomType VARCHAR(20),
    PRIMARY KEY (typeLP)
    );

SHOW TABLES;