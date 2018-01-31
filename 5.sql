WITH dates AS
  (SELECT date
   FROM income
   UNION SELECT date
   FROM outcome) --select max(date) from dates

SELECT DENSE_RANK() OVER (
                          ORDER BY YEAR(date), MONTH(date)) num,
                    DATEFROMPARTS(year(date), month(date), day(0)) startDate,
                    DATEADD(DAY,-1,DATEFROMPARTS(year(date), month(date) + 1, day(0))) endDate,
                    code,
                    point, date, SUM --datediff(month,date, max)
FROM
  (SELECT code,
          point, date, -OUT SUM,
     (SELECT max(date)
      FROM dates) MAX
   FROM outcome
   UNION ALL SELECT code,
                    point, date, inc,
     (SELECT max(date)
      FROM dates) MAX
   FROM income) base
WHERE datediff(MONTH,date, MAX) >= 2
