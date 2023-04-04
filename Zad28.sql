SELECT 
Imie,
Nazwisko,
NTILE(4) OVER ( ORDER BY Z.Brutto) as SkalaZarobków,
Brutto,
DataWyplaty
FROM 
	BazaRelacyjna.dbo.Osoby as O,
	BazaRelacyjna.dbo.Zarobki as Z
Where o.IdOsoby = Z.IdOsoby
