--SQL SALVESTATUD PROTSEDUURID-- Funktsioonid - mitu SQL käsku käivitakse
-- SQL SERVER

CREATE DATABASE procTARgv24;

USE procTARgv24;
CREATE TABLE uudised(
uudisID int PRIMARY KEY identity(1,1),
uudiseTeema varchar (50),
kuupaev date,
autor varchar(25),
kirjeldus text
)
SELECT * FROM uudised;
INSERT INTO uudised(uudiseTeema, kuupaev, autor, kirjeldus)
VALUES(
'udune ilme', '2025-02-06', 'postimees', 'Lõunani on udune ilm')
--protseduuri loomine
--sisestab uudised tabelisse ja kohe näitab
CREATE PROCEDURE lisaUudis
@uusTeema varchar(50),
@paev date,
@autor varchar(20),
@kirjeldus text

AS
BEGIN

INSERT INTO uudised(uudiseTeema, kuupaev, autor, kirjeldus)
VALUES(
@uusTeema, @paev, @autor, @kirjeldus)
SELECT * FROM uudised;

END;
--kutse
EXEC lisaUudis 'windows 11', '2025-02-06', 'Õpetaja Pant', 'W11 ei tööta multimeedia klassis';
--teine kutse võimalus
EXEC lisaUudis @uusTeema='1. märts on juba kevad',
@paev='2025-02-06',
@autor='test',
@kirjeldus='puudub';


--protsedur, mis kustutab tabelist id järgi
CREATE PROCEDURE kustutaUudis
@id int
AS
BEGIN
SELECT * FROM uudised;
DELETE FROM uudised WHERE uudisID=@id;
SELECT * FROM uudised;
END;
--kutse
EXEC kustutaUUdis 2;
