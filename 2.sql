SELECT ship,
       SUBSTRING(ship, 0, f+1)+REPLICATE('*', l-f-1)+SUBSTRING(ship, l, ln-l+1)
FROM
(
    SELECT ship,
           PATINDEX('% %', ship) f,
           DATALENGTH(ship)-PATINDEX('% %', REVERSE(ship)) + 1 l,
           DATALENGTH(ship) ln,
           result
    FROM outcomes
) a
WHERE f != 0 and f != l