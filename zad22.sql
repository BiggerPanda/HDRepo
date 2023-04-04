SELECT Nazwa ,Nazwisko , SUM(Brutto)
FROM BazaRelacyjna.dbo.Osoby as os,
BazaRelacyjna.dbo.Zarobki as za,
BazaRelacyjna.dbo.Dzialy as dz
WHERE dz.IdDzialu = os.IdDzialu AND os.IdOsoby = za.IdOsoby
GROUP BY CUBE( Nazwa,Nazwisko);