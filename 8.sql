WITH base AS
  (SELECT name,
          convert(date,date) date, eomonth(date) _,
                                   dateadd(d,-1,eomonth(date)) o,
                                   dateadd(d,-2,eomonth(date)) oo,
                                   dateadd(d,-3,eomonth(date)) ooo,
                                   dateadd(d,-4,eomonth(date)) oooo,
                                   dateadd(d,-5,eomonth(date)) ooooo,
                                   dateadd(d,-6,eomonth(date)) oooooo
   FROM battles)
SELECT name, date, CASE
                       WHEN datepart(dw, _) = 6 THEN _
                       WHEN datepart(dw, o) = 6 THEN o
                       WHEN datepart(dw, oo) = 6 THEN oo
                       WHEN datepart(dw, ooo) = 6 THEN ooo
                       WHEN datepart(dw, oooo) = 6 THEN oooo
                       WHEN datepart(dw, ooooo) = 6 THEN ooooo
                       WHEN datepart(dw, oooooo) = 6 THEN oooooo
                   END fri
FROM base
