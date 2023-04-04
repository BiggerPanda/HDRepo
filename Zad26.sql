SELECT 
Wojewodztwo,
Miasto,
NazwaProducenta,
NazwaTowaru ,
SUM( szt * Cena) Cena,
SUM( Cena * szt) OVER (PARTITION BY Wojewodztwo) as WartoscWojewództwo,
SUM( Cena * szt) OVER (PARTITION BY Miasto) as WartoscMiasto,
SUM(Cena * szt)  OVER (PARTITION BY NazwaProducenta) as WartośćProducent,
SUM( szt * Cena) OVER (PARTITION BY NazwaTowaru) as SumaWartosciTowarów
FROM 
	BazaRelacyjna.dbo.Wojewodztwa as W,
	BazaRelacyjna.dbo.Miasta as M,
	BazaRelacyjna.dbo.Producenci as Pr,
	BazaRelacyjna.dbo.Towar as T,
	BazaRelacyjna.dbo.Transakcje as TR
WHERE 
	M.IdWojewodztwa = W.IdWojewodztwa AND
	Pr.IdMiasta = M.IdMiasta AND 
	T.IdProducenta = Pr.IdProducenta AND 
	TR.IdTowaru = T.IdTowaru
GROUP BY Wojewodztwo,Miasto,NazwaProducenta,NazwaTowaru,Cena,szt,CenaZakupu