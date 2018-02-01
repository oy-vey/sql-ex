select model, one + two+ three + four + five + six + seven + eight + nine as sum
from
(
SELECT model,
       iif(REPLACE(model, '1', '')= model,0,1*(len(model)- len(REPLACE(model, '1', '')))) 'one',
       iif(REPLACE(model, '2', '')= model,0,2*(len(model)- len(REPLACE(model, '2', '')))) 'two',
       iif(REPLACE(model, '3', '')= model,0,3*(len(model)- len(REPLACE(model, '3', '')))) 'three',
       iif(REPLACE(model, '4', '')= model,0,4*(len(model)- len(REPLACE(model, '4', '')))) 'four',
       iif(REPLACE(model, '5', '')= model,0,5*(len(model)- len(REPLACE(model, '5', '')))) 'five',
       iif(REPLACE(model, '6', '')= model,0,6*(len(model)- len(REPLACE(model, '6', '')))) 'six',
       iif(REPLACE(model, '7', '')= model,0,7*(len(model)- len(REPLACE(model, '7', '')))) 'seven',
       iif(REPLACE(model, '8', '')= model,0,8*(len(model)- len(REPLACE(model, '8', '')))) 'eight',
       iif(REPLACE(model, '9', '')= model,0,9*(len(model)- len(REPLACE(model, '9', '')))) 'nine'
FROM product
) a