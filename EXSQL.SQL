SELECT distinct tp.CPERSONA, tp.nombrelegal,TOTALINGRESOS ,TOTALEGRESOS, (TOTALINGRESOS-TOTALEGRESOS) LIQUIDO,
 ttp.DESCRIPCION FORMAPAGO, tn.CODIGODIVISION, tn.codigodepartamento, tjdiv.nombre DIVISION, tjdep.nombre DEPARTAMENTO
FROM TPERSONA tp, 
(SELECT SUM(VALOR) TOTALINGRESOS, CPERSONA  FROM TNOMINAHISTORICODETALLE 
WHERE ABREVIADO = 'TOTALINGRESOS' AND FECHAROL='30/4/2022' AND CCODIGONOMINA='02' and CPERSONA_COMPANIA ='2' GROUP BY CPERSONA) ingreso,
(SELECT SUM(VALOR) TOTALEGRESOS, CPERSONA  FROM TNOMINAHISTORICODETALLE 
WHERE ABREVIADO= 'TOTALEGRESOS' AND FECHAROL='30/4/2022' AND CCODIGONOMINA='02' and CPERSONA_COMPANIA ='2' GROUP BY CPERSONA) egreso,
TFORMAPAGONOMINA tfpn, TTIPOSPAGO ttp, TNATURALTRABAJO tn, tjuridicodivisiones tjdiv, TJURIDICODEPARTAMENTOS tjdep
WHERE  egreso.cpersona=tp.cpersona and ingreso.cpersona=tp.cpersona 
and tfpn.cpersona=tp.cpersona and tfpn.CFORMAPAGONOMINANOMINA='TR' 
and ttp.ctipopago=tfpn.CFORMAPAGONOMINANOMINA
and tp.CPERSONA=tn.cpersona and tn.codigodivision='01' and tn.codigodepartamento='01' and tn.fhasta=fncfhasta
and tjdiv.codigodivision=tn.codigodivision and tn.codigodepartamento=tjdep.codigodepartamento
AND tp.fhasta=fncfhasta
ORDER BY CPERSONA
