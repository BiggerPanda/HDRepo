SELECT Nazwa,
	   SUM(szt) as CalkowitaIloscTowaru,
	   AVG(Cena) as ŚredniaCena, 
	   COUNT(DISTINCT t.IdKategorii) as IleRóżnychKategorii,
	   COUNT(DISTINCT k.IdKlienta) as IleRóżnychKlientów

FROM BazaRelacyjna.dbo.Towar as t,
	BazaRelacyjna.dbo.Transakcje as tr,
	BazaRelacyjna.dbo.Dzialy as d,
	BazaRelacyjna.dbo.Osoby as o,
	BazaRelacyjna.dbo.Faktury as fa

JOIN BazaRelacyjna.dbo.Klienci as k ON k.IdKlienta = fa.IdKlienta

WHERE d.IdDzialu = o.IdDzialu AND
	o.IdOsoby = fa.IdFaktury AND
	fa.IdFaktury = tr.IdFaktury AND
	tr.IdTowaru = t.IdTowaru

GROUP BY Nazwa
ORDER BY CalkowitaIloscTowaru DESC;
