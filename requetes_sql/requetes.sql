-- requete 1
SELECT typePoste FROM Poste WHERE nPoste = 'P8';

-- requete 2
SELECT nomLog FROM Logiciel WHERE typeLog = 'UNIX';

-- requete 3
SELECT nomPoste, indIP, nSalle
FROM Poste
WHERE (
        typePoste = 'UNIX'
        or typePoste = 'PCWS'
    );

-- requete 4
SELECT nomPoste, indIP, nSalle
FROM Poste
WHERE (indIP = '130.120.80')
ORDER BY nSalle DESC;

-- requete 5
SELECT nLog FROM Installer WHERE nPoste = 'P6';

-- requete 6
SELECT nPoste FROM Installer WHERE nLog = 'log1';

-- requete 7
SELECT CONCAT(indIP, '.', ad) AS 'adresses IP complètes'
FROM Poste
WHERE
    typePoste = 'TX';

-- requete 8
SELECT DISTINCT
    nPoste,
    COUNT(nLog) AS 'nombre de logiciels'
FROM Installer
GROUP BY
    nPoste;

-- requete 9
SELECT DISTINCT
    nSalle,
    COUNT(nPoste) AS 'nombre de postes'
FROM Poste
GROUP BY
    nSalle;

-- requete 10
SELECT DISTINCT
    nLog,
    COUNT(nPoste) AS 'nombre d install'
FROM Installer
GROUP BY
    nLog;

-- requete 11
SELECT AVG(prix) AS 'Moyenne des prix UNIX'
FROM Logiciel
WHERE
    typeLog = 'UNIX';

-- requete 12
SELECT MAX(dateAch) AS 'Achat le plus récent' FROM Logiciel;

-- requete 13
SELECT DISTINCT
    nPoste AS 'Postes hebergeant 2 logiciels'
FROM Installer
GROUP BY
    nPoste
HAVING
    COUNT(nLog) = 2;

-- requete 14
SELECT COUNT(*) AS 'requete 14'
FROM (
        SELECT DISTINCT
            nPoste
        FROM Installer
        GROUP BY
            nPoste
        HAVING
            COUNT(nLog) = 2
    ) as subquery;

-- requete 15
SELECT typeLP AS 'Types non recensés'
FROM Types
WHERE
    not exists (
        SELECT *
        FROM Poste
        WHERE
            typeLp = typePoste
    );

SELECT distinct
    typeLP AS 'correc requete 15'
from types
where
    typelp not in(
        select distinct
            typeposte
        from poste
    );

-- requete 16
SELECT DISTINCT
    typeLog
FROM Logiciel
WHERE
    typeLog IN (
        SELECT typePoste
        FROM Poste
    );

-- requete 17
SELECT DISTINCT
    typePoste
FROM Poste
WHERE
    typePoste NOT IN(
        SELECT typeLog
        FROM Logiciel
    );

-- requete 18
-- SELECT indIP FROM Poste JOIN Installer ON Installer.nPoste = Poste.nPoste WHERE nLog = 'log6';
SELECT indIP AS 'requete 18'
FROM Poste
WHERE
    nPoste IN (
        SELECT nPoste
        FROM Installer
        WHERE
            nLog = 'log6'
    );

-- requete 19
SELECT nPoste AS 'requete 19', indIP
FROM Poste
WHERE
    nPoste IN (
        SELECT nPoste
        FROM Installer
        WHERE
            nLog IN (
                SELECT nLog
                FROM Logiciel
                WHERE
                    nomLog = 'Oracle 8'
            )
    );

-- requete 20
-- SELECT DISTINCT nomSegment FROM Segment
-- JOIN Poste ON Segment.indIP = Poste.indIP
-- WHERE typePoste = 'TX' GROUP BY nomSegment
-- HAVING COUNT(typePoste) = 3;
SELECT DISTINCT
    nomSegment as 'requete 20'
FROM Segment
WHERE
    indIP IN (
        SELECT indIP
        FROM Poste
        WHERE
            typePoste = 'TX'
        GROUP BY
            indIP
        HAVING
            COUNT(*) = 3
    );

-- requete 21
SELECT nomSalle as 'requete 21'
FROM Salle
WHERE
    nSalle IN (
        SELECT nSalle
        FROM Poste
        WHERE
            nPoste IN (
                SELECT nPoste
                FROM Installer
                WHERE
                    nLog IN (
                        SELECT nLog
                        FROM Logiciel
                        WHERE
                            nomLog = 'Oracle 6'
                    )
            )
    );

-- requete 22
SELECT nomLog
FROM Logiciel
WHERE
    dateAch = (
        SELECT MAX(dateAch)
        FROM Logiciel
    );

-- requete 23
SELECT indIP AS 'requete 23'
FROM Poste, Installer
WHERE
    Poste.nPoste = Installer.nPoste
    AND Installer.nLog = 'log6';

-- requete 24
SELECT Poste.nPoste AS 'requete 24', indIP
FROM Poste, Installer, Logiciel
WHERE
    Poste.nPoste = Installer.nPoste
    AND Installer.nLog = Logiciel.nLog
    AND Logiciel.nomLog = 'Oracle 8';

-- requete 25
SELECT DISTINCT
    nomSegment AS 'requete 25'
FROM Segment, Poste
WHERE
    Segment.indIP = Poste.indIP
    AND Poste.typePoste = 'TX'
GROUP BY
    nomSegment
HAVING
    COUNT(typePoste) = 3;
-- requete 26
SELECT nomSalle AS 'requete 26'
FROM
    Salle s,
    Poste p,
    Installer i,
    Logiciel l
WHERE
    s.nSalle = p.nSalle
    AND p.nPoste = i.nPoste
    AND i.nLog = l.nLog
    AND l.nomLog = 'Oracle 6';


SELECT sg.nomSegment AS 'requete 27', s.nomSalle, p.indIP | '.' | p.ad, l.nomLog, i.dateIns
FROM
    Segment sg,
    Salle s,
    Poste p,
    Logiciel l,
    Installer i
WHERE
    s.nSalle = p.nSalle
    AND p.indIP = sg.indIP
    AND p.nPoste = i.nPoste
    AND i.nLog = l.nLog
ORDER BY 1, 2, 3;
-- requete 28
SELECT indIP
FROM Poste
    JOIN Installer ON Installer.nPoste = Poste.nPoste
WHERE
    nLog = 'log6';

-- requete 29
SELECT Poste.nPoste, indIP
FROM
    Poste
    JOIN Installer ON Poste.nPoste = Installer.nPoste
    JOIN Logiciel ON Installer.nLog = Logiciel.nLog
WHERE
    nomLog = 'Oracle 8';

-- requete 30
SELECT DISTINCT
    nomSegment
FROM Segment
    JOIN Poste ON Segment.indIP = Poste.indIP
WHERE
    typePoste = 'TX'
GROUP BY
    nomSegment
HAVING
    COUNT(typePoste) = 3;

-- requete 31
SELECT nomSalle AS 'Salles avec au moins un poste Oracle 6'
FROM
    Salle
    JOIN Poste ON Salle.nSalle = Poste.nSalle
    JOIN Installer ON Poste.nPoste = Installer.nPoste
    JOIN Logiciel ON Installer.nLog = Logiciel.nLog
WHERE
    nomLog = 'Oracle 6';

-- requete 32
SELECT nomPoste 
FROM Poste as P 
WHERE exists
    (select ins.nLog
    from Installer as ins
    where ins.nPoste = P.nPoste
    and ins.nLog in (
        select ins2.nLog
        from Installer as ins2
        where ins2.nPoste = 'p6')
    )
    and not (nPoste = 'p6');
    
-- requete 33
select nomPoste
from Poste as p 
where not exists 
(select ins.nLog
from Installer as ins
where ins.nPoste = 'p6'
and ins.nLog not in
(select ))