USE creParc;

-- Insert rows into table 'Installer'
INSERT INTO Installer
( -- columns to insert data into
 nPoste, nLog, dateIns
)
VALUES
( -- first row: values for the columns in the list above
 'p2', 'log6', SYSDATE()
),
( -- second row: values for the columns in the list above
 'p8', 'log1', SYSDATE()
),
-- add more rows here
( -- third row: values for the columns in the list above
 'p10', 'log1', SYSDATE()
);

SELECT * FROM Installer;

UPDATE Segment as sg
SET nbSalle = (SELECT COUNT(*)
FROM Salle as sl
where sl.indIP = sg.indIP);

UPDATE Segment as sg
SET nbPoste = (SELECT COUNT(*)
FROM Poste as po
where po.indIP = sg.indIP);

select * from Segment;

UPDATE Logiciel as log
SET nbInstall = (SELECT COUNT(*)
FROM Installer as ins
where ins.nLog = log.nLog);

select * from Logiciel;

UPDATE Poste as sg
SET nbLog = (SELECT COUNT(*)
FROM Installer as ins
where ins.nPoste = sg.nPoste);

select * from Poste;


