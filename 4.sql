select model, one + two+ three + four + five + six + seven + eight + nine as sum
from
(
SELECT model,
       1*(len(model)- len(REPLACE(model, '1', ''))) 'one',
       2*(len(model)- len(REPLACE(model, '2', ''))) 'two',
       3*(len(model)- len(REPLACE(model, '3', ''))) 'three',
       4*(len(model)- len(REPLACE(model, '4', ''))) 'four',
       5*(len(model)- len(REPLACE(model, '5', ''))) 'five',
       6*(len(model)- len(REPLACE(model, '6', ''))) 'six',
       7*(len(model)- len(REPLACE(model, '7', ''))) 'seven',
       8*(len(model)- len(REPLACE(model, '8', ''))) 'eight',
       9*(len(model)- len(REPLACE(model, '9', ''))) 'nine'
FROM product
) a
