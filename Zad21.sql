SELECT Nazwa ,Nazwisko , SUM(Brutto) as CałkowitaSumaWypłat
FROM BazaRelacyjna.dbo.Osoby as os,
	 BazaRelacyjna.dbo.Zarobki as za,
	 BazaRelacyjna.dbo.Dzialy as dz
WHERE dz.IdDzialu = os.IdDzialu AND os.IdOsoby = za.IdOsoby
GROUP BY ROLLUP( Nazwa,Nazwisko);