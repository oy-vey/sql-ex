WITH base
     AS (
     SELECT trip_no,
            trip_no / 2 n,
            trip_no % 2 rem,
            0 r
     FROM trip
     UNION ALL
     SELECT t.trip_no,
            n / 2 n,
            n % 2 rem,
            r + 1
     FROM trip t
          JOIN base b ON t.trip_no = b.trip_no
     WHERE n > 0)
     SELECT DISTINCT
            trip_no,
            REPLACE(STUFF(
                         (
                             SELECT ' '+CAST(rem AS VARCHAR(MAX))
                             FROM base a
                             WHERE b.trip_no = a.trip_no
                             ORDER BY a.trip_no,
                                      a.r DESC
                             FOR XML PATH('')
                         ), 1, 1, ''), ' ', '') trip_no_bit
     FROM base b
     GROUP BY trip_no;