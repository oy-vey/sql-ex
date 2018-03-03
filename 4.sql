select model, one + two+ three + four + five + six + seven + eight + nine as sum
from
(
SELECT model,
<<<<<<< HEAD
      1*(len(replace(model,' ','_'))- len(REPLACE(replace(model,' ','_'), '1', ''))) 'one',
      2*(len(replace(model,' ','_'))- len(REPLACE(replace(model,' ','_'), '2', ''))) 'two',
      3*(len(replace(model,' ','_'))- len(REPLACE(replace(model,' ','_'), '3', ''))) 'three',
      4*(len(replace(model,' ','_'))- len(REPLACE(replace(model,' ','_'), '4', ''))) 'four',
      5*(len(replace(model,' ','_'))- len(REPLACE(replace(model,' ','_'), '5', ''))) 'five',
      6*(len(replace(model,' ','_'))- len(REPLACE(replace(model,' ','_'), '6', ''))) 'six',
      7*(len(replace(model,' ','_'))- len(REPLACE(replace(model,' ','_'), '7', ''))) 'seven',
      8*(len(replace(model,' ','_'))- len(REPLACE(replace(model,' ','_'), '8', ''))) 'eight',
      9*(len(replace(model,' ','_'))- len(REPLACE(replace(model,' ','_'), '9', ''))) 'nine'
=======
       1*(len(model)- len(REPLACE(model, '1', ''))) 'one',
       2*(len(model)- len(REPLACE(model, '2', ''))) 'two',
       3*(len(model)- len(REPLACE(model, '3', ''))) 'three',
       4*(len(model)- len(REPLACE(model, '4', ''))) 'four',
       5*(len(model)- len(REPLACE(model, '5', ''))) 'five',
       6*(len(model)- len(REPLACE(model, '6', ''))) 'six',
       7*(len(model)- len(REPLACE(model, '7', ''))) 'seven',
       8*(len(model)- len(REPLACE(model, '8', ''))) 'eight',
       9*(len(model)- len(REPLACE(model, '9', ''))) 'nine'
>>>>>>> origin/master
FROM product
) a
