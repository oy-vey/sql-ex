select model, one + two+ three + four + five + six + seven + eight + nine as sum
from
(
SELECT model,
      1*(DATALENGTH(model)- DATALENGTH(REPLACE(model, '1', ''))) 'one',
      2*(DATALENGTH(model)- DATALENGTH(REPLACE(model, '2', ''))) 'two',
      3*(DATALENGTH(model)- DATALENGTH(REPLACE(model, '3', ''))) 'three',
      4*(DATALENGTH(model)- DATALENGTH(REPLACE(model, '4', ''))) 'four',
      5*(DATALENGTH(model)- DATALENGTH(REPLACE(model, '5', ''))) 'five',
      6*(DATALENGTH(model)- DATALENGTH(REPLACE(model, '6', ''))) 'six',
      7*(DATALENGTH(model)- DATALENGTH(REPLACE(model, '7', ''))) 'seven',
      8*(DATALENGTH(model)- DATALENGTH(REPLACE(model, '8', ''))) 'eight',
      9*(DATALENGTH(model)- DATALENGTH(REPLACE(model, '9', ''))) 'nine'
FROM product
) a
