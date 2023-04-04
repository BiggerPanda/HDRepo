SELECT 
Wojewodztwo,Miasto,NazwaProducenta,NazwaTowaru ,SUM( szt * Cena) as SumaWartosciTowarów
FROM 
	BazaRelacyjna.dbo.Wojewodztwa as W,
	BazaRelacyjna.dbo.Miasta as M,
	BazaRelacyjna.dbo.Producenci as Pr,
	BazaRelacyjna.dbo.Towar as T,
	BazaRelacyjna.dbo.Transakcje as TR
WHERE 
	M.IdWojewodztwa = W.IdWojewodztwa AND Pr.IdMiasta = M.IdMiasta AND T.IdProducenta = Pr.IdProducenta AND TR.IdTowaru = T.IdTowaru
GROUP BY GROUPING SETS  ((Wojewodztwo),
						 (Wojewodztwo, Miasto),
						 (Wojewodztwo, Miasto,NazwaProducenta),
						 (Wojewodztwo, Miasto,NazwaProducenta,NazwaTowaru),
						 ())
