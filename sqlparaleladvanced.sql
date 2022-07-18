SELECT 
  t2.CPERSONA,
  tjdiv.codigodivision,
  tjdiv.nombre DIVISION,
  tjdep.codigodepartamento,
  tjdep.nombre DEPARTAMENTO,
  tp.nombrelegal,
  
    t2.enero,
    t2.febrero,
    t2.marzo,
    t2.abril,
    t2.mayo,
    t2.junio,
    t2.julio,
    t2.agosto,
    t2.septiembre,
    t2.octubre,
    t2.noviembre,
    t2.DICIEMBRE
FROM
    (
SELECT 
            cpersona, 
            SUM(
                CASE trim(historicos.mes)
                    WHEN 'Enero'
                    THEN TO_CHAR(historicos.PROVISIONFR)
                    ELSE '0'
                END) Enero,
            SUM(
                CASE trim(historicos.mes)
                    WHEN 'Febrero'
                    THEN TO_CHAR(historicos.PROVISIONFR)
                    ELSE '0'
                END) Febrero,
            SUM(
                CASE trim(historicos.mes)
                    WHEN 'Marzo'
                    THEN TO_CHAR(historicos.PROVISIONFR)
                    ELSE '0'
                END) Marzo,
            SUM(
                CASE trim(historicos.mes)
                    WHEN 'Abril'
                    THEN TO_CHAR(historicos.PROVISIONFR)
                    ELSE '0'
                END) Abril,
            SUM(
                CASE trim(historicos.mes)
                    WHEN 'Mayo'
                    THEN TO_CHAR(historicos.PROVISIONFR)
                    ELSE '0'
                END) Mayo,
            SUM(
                CASE trim(historicos.mes)
                    WHEN 'Junio'
                    THEN TO_CHAR(historicos.PROVISIONFR)
                    ELSE '0'
                END) Junio,
            SUM(
                CASE trim(historicos.mes)
                    WHEN 'Julio'
                    THEN TO_CHAR(historicos.PROVISIONFR)
                    ELSE '0'
                END) Julio,
            SUM(
                CASE trim(historicos.mes)
                    WHEN 'Agosto'
                    THEN TO_CHAR(historicos.PROVISIONFR)
                    ELSE '0'
                END) Agosto,
            SUM(
                CASE trim(historicos.mes)
                    WHEN 'Septiembre'
                    THEN TO_CHAR(historicos.PROVISIONFR)
                    ELSE '0'
                END) Septiembre,
            SUM(
                CASE trim(historicos.mes)
                    WHEN 'Octubre'
                    THEN TO_CHAR(historicos.PROVISIONFR)
                    ELSE '0'
                END) Octubre,
            SUM(
                CASE trim(historicos.mes)
                    WHEN 'Noviembre'
                    THEN TO_CHAR(historicos.PROVISIONFR)
                    ELSE '0'
                END) Noviembre,
            SUM(
                CASE trim(historicos.mes)
                    WHEN 'Diciembre'
                    THEN TO_CHAR(historicos.PROVISIONFR)
                    ELSE '0'
                END) Diciembre
        FROM
            (
                SELECT
                    tnhf.*,
                    TO_CHAR(to_date(tnhf.FECHAROL),'Month') mes
                FROM
                    tnominahistoricofijos tnhf       
                  where
 
                 fhasta=fncfhasta
                 AND 
                 CCODIGONOMINA ='02'
                 AND
                 to_number(to_char(to_date(FECHAROL),'yyyy'))=to_number(to_char(to_date( sysdate  ),'yyyy'))
            
               )historicos
        GROUP BY
            cpersona)t2,
    tnaturaltrabajo tnt,
    tpersona tp,
    tjuridicodivisiones tjdiv,
    tjuridicodepartamentos tjdep  
    where  

       t2.cpersona=tnt.cpersona  
   AND tnt.fhasta=fncfhasta 
   AND tp.fhasta=fncfhasta 
   AND tjdiv.codigodivision=tnt.codigodivision
   AND tnt.codigodivision=tjdep.codigodivision
   AND tnt.fhasta=tjdiv.fhasta
   AND tnt.fhasta=tjdep.fhasta
   AND t2.cpersona=tp.cpersona 
   AND tnt.codigodivision =tjdiv.codigodivision
   AND tnt.codigodepartamento=tjdep.codigodepartamento
ORDER BY 5
