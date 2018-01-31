SELECT maker,
       iif(
             (SELECT count(*)
              FROM product
              WHERE TYPE = 'pc'
                AND maker = p.maker) = 0,'No',replace('Yes(' + CONVERT(nvarchar(MAX),count_big(DISTINCT pc.model)) + ')',' ','')) pcs,
       iif(
             (SELECT count(*)
              FROM product
              WHERE TYPE = 'Laptop'
                AND maker = p.maker) = 0,'No',replace('Yes(' + CONVERT(nvarchar(MAX),count_big(DISTINCT l.model)) + ')',' ','')) laptops,
       iif(
             (SELECT count(*)
              FROM product
              WHERE TYPE = 'Printer'
                AND maker = p.maker) = 0,'No',replace('Yes(' + CONVERT(nvarchar(MAX),count_big(DISTINCT pr.model)) + ')',' ','')) printers
FROM product p
LEFT JOIN pc ON pc.model = p.model
LEFT JOIN printer pr ON pr.model = p.model
LEFT JOIN laptop l ON l.model = p.model
GROUP BY maker
