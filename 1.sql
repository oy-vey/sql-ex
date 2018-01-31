WITH MishaTanya AS
  (SELECT pcm.Model MishaModel,
          pcm.code MishaCode,
          pt.model TanyaModel,
          pt.code TanyaCode,
          pt.type TanyaType,
          pt.color TanyaColor
   FROM pc pcm
   JOIN printer pt ON pcm.price = pt.price * 4),
     TanyaVitya AS
  (SELECT pv.model VityaModel,
          pv.code VityaCode,
          TanyaModel,
          TanyaCode,
          MishaModel,
          MishaCode,
          pv.type,
          pt.TanyaType,
          pv.color,
          pt.TanyaColor
   FROM printer pv
   JOIN MishaTanya pt ON pv.type != pt.TanyaType
   AND pv.color = pt.TanyaColor),
     DimaOlya AS
  (SELECT ld.model DimaModel,
          ld.code DimaCode,
          lo.model OlyaModel,
          lo.code OlyaCode
   FROM laptop ld
   JOIN laptop lo ON ld.screen = lo.screen + 3),
     VityaOlya AS
  (SELECT *
   FROM TanyaVitya tv
   JOIN DimaOlya DO ON substring(VityaModel,3,1) != substring(OlyaModel,3,1)
   AND substring(VityaModel,1,2) = substring(OlyaModel,1,2)
   AND substring(VityaModel,4,len(VityaModel)) = substring(OlyaModel,4,len(OlyaModel))
   AND len(VityaModel) = len(OlyaModel)
   AND len(VityaModel) >= 3),
     FINAL AS
  (SELECT vo.*
   FROM VityaOlya vo
   JOIN product p1 ON (vo.DimaModel = p1.model
                       AND p1.type = 'laptop')
   JOIN product p2 ON (vo.MishaModel = p2.model
                       AND p2.type = 'PC')
   WHERE p1.maker = p2.maker )
SELECT DISTINCT pc2.model
FROM FINAL
JOIN pc pc1 ON final.MishaCode = pc1.code
JOIN pc pc2 ON pc1.speed = pc2.speed
JOIN laptop l1 ON final.DimaCode = l1.Code
JOIN laptop l2 ON final.OlyaCode = l2.Code
JOIN printer p ON final.VityaCode = p.Code
WHERE pc2.hd = l1.hd
  AND pc2.ram = l2.ram
  AND pc2.price = p.price
