/*1. Készítsünk nézetet VSZOBA néven, amely megjeleníti a szobák adatai mellett a megfelelő szálláshely nevét, helyét és a csillagok számát is!

Az oszlopoknak nem szükséges külön nevet adni!
Teszteljük is a nézetet, pl: SELECT * FROM UJAENB_VSZOBA*/

CREATE or alter VIEW VSZOBA
AS
SELECT sz.*,
		szh.SZALLAS_NEV,
        szh.HELY,
        szh.CSILLAGOK_SZAMA
from Szoba sz join Szallashely szh on sz.SZALLAS_FK = szh.SZALLAS_ID

select * from VSZOBA


/*2 Készítsen tárolt eljárást SPUgyfelFoglalasok, amely a paraméterként megkapott ügyfél azonosítóhoz tartozó foglalások adatait listázza!
Teszteljük a tárolt eljárás működését, pl: EXEC UJAENB_SPUgyfelFoglalasok 'laszlo2'
*/

creATE Or ALTER PROC SPUgyfelfogalalasok
@ugyfel nvarchar(100)
AS
BEGIN
  select *
  from Foglalas
  where ugyfel_fk = @ugyfel
END

exec SPUgyfelfogalalasok 'laszlo2'

/*
3. Készítsen skalár értékű függvényt UDFFerohely néven, amely visszaadja, hogy a paraméterként megkapott foglalás azonosítóhoz hány férőhelyes szoba tartozik!
a. Teszteljük a függvény működését!
*/

CREATE or alter function UDFFerohely
(
  @fazon int
)
returns int
AS
BEGIN
	DECLARE @ferohely int
    SELECT @ferohely = sz.FEROHELY
    from Foglalas f join Szoba sz on f.SZOBA_FK = sz.SZOBA_ID
    where f.FOGLALAS_PK = @fazon
END
return @ferohely