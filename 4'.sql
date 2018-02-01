WITH base
     AS (
     SELECT model,
            model / 10 n,
            model % 10 rem
     FROM product
     UNION ALL
     SELECT t.model,
            n / 10 n,
            n % 10 rem
     FROM product t
          JOIN base b ON t.model = b.model
     WHERE n > 0)
     SELECT model,
            SUM(rem) s
     FROM base
     GROUP BY model;