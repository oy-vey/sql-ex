WITH base AS
  (SELECT cast(datediff(s, min(b_datetime) over (),b_datetime) AS bigint) t,
          cast(B_VOL AS bigint) V
   FROM utB),
     DATA AS
  (SELECT cast(count(*) AS decimal(38,0)) N,
          cast(sum(t*t) AS decimal(38,0)) stt,
          cast(sum(V*t) AS decimal(38,0)) syt,
          cast(sum(t) AS decimal(38,0)) st,
          cast(sum(v) AS decimal(38,0)) sy
   FROM base)
SELECT a = (syt*N - sy*st)/(N*stt - st*st),
       b = (stt*sy - syt*st)/(N*stt - st*st)
FROM DATA
