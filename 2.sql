SELECT ship,
       SUBSTRING(ship, 0, f+1)+REPLICATE('*', l-f-1)+SUBSTRING(ship, l, ln-l+1)
FROM
(
    SELECT ship,
           PATINDEX('% %', ship) f,
           LEN(REPLACE(ship, ' ', '_'))-PATINDEX('%[_]%', REVERSE(REPLACE(ship, ' ', '_')))+1 l,
           LEN(REPLACE(ship, ' ', '_')) ln,
           result
    FROM outcomes
) a
WHERE f != 0 and f != l