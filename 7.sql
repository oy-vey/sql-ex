WITH base
     AS (SELECT DISTINCT
                date m,
                EOMONTH(DATEADD(m, -1, date)) mi,
                EOMONTH(date) ma
         FROM battles),
     GetDates
     AS (
     SELECT DATEADD(day, 1, mi) AS mi,
            ma
     FROM base
     UNION ALL
     SELECT DATEADD(day, 1, mi),
            ma
     FROM GetDates
     WHERE mi < ma)
     SELECT yyyymm,
            [2] AS Monday,
            [3] AS Tuesday,
            [4] AS Wednseday,
            [5] AS Thursday,
            [6] AS Friday,
            [7] AS Saturday,
            [1] AS Sunday
     FROM
     (
         SELECT DISTINCT
                LEFT(CONVERT( NVARCHAR(10), gd.mi, 121), 7) yyyymm,
                gd.mi,
                DATEPART(dw, gd.mi) dw
         FROM getdates gd
     ) p PIVOT(COUNT(mi) FOR dw IN([1],
                                   [2],
                                   [3],
                                   [4],
                                   [5],
                                   [6],
                                   [7])) AS pvt;