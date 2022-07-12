SELECT
  t2.CPERSONA,
  di.codigodivision,
  di.nombre DIVISION,
  de.codigodepartamento,
  de.nombre DEPARTAMENTO,
  p.nombrelegal,
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
                CASE trim(H.mes)
                    WHEN 'Enero'
                    THEN TO_CHAR(h.PROVISIONFR)
                    ELSE '0'
                END) Enero,
            SUM(
                CASE trim(H.mes)
                    WHEN 'Febrero'
                    THEN TO_CHAR(h.PROVISIONFR)
                    ELSE '0'
                END) Febrero,
            SUM(
                CASE trim(H.mes)
                    WHEN 'Marzo'
                    THEN TO_CHAR(h.PROVISIONFR)
                    ELSE '0'
                END) Marzo,
            SUM(
                CASE trim(H.mes)
                    WHEN 'Abril'
                    THEN TO_CHAR(h.PROVISIONFR)
                    ELSE '0'
                END) Abril,
            SUM(
                CASE trim(H.mes)
                    WHEN 'Mayo'
                    THEN TO_CHAR(h.PROVISIONFR)
                    ELSE '0'
                END) Mayo,
            SUM(
                CASE trim(H.mes)
                    WHEN 'Junio'
                    THEN TO_CHAR(h.PROVISIONFR)
                    ELSE '0'
                END) Junio,
            SUM(
                CASE trim(H.mes)
                    WHEN 'Julio'
                    THEN TO_CHAR(h.PROVISIONFR)
                    ELSE '0'
                END) Julio,
            SUM(
                CASE trim(H.mes)
                    WHEN 'Agosto'
                    THEN TO_CHAR(h.PROVISIONFR)
                    ELSE '0'
                END) Agosto,
            SUM(
                CASE trim(H.mes)
                    WHEN 'Septiembre'
                    THEN TO_CHAR(h.PROVISIONFR)
                    ELSE '0'
                END) Septiembre,
            SUM(
                CASE trim(H.mes)
                    WHEN 'Octubre'
                    THEN TO_CHAR(h.PROVISIONFR)
                    ELSE '0'
                END) Octubre,
            SUM(
                CASE trim(H.mes)
                    WHEN 'Noviembre'
                    THEN TO_CHAR(h.PROVISIONFR)
                    ELSE '0'
                END) Noviembre,
            SUM(
                CASE trim(H.mes)
                    WHEN 'Diciembre'
                    THEN TO_CHAR(h.PROVISIONFR)
                    ELSE '0'
                END) Diciembre
        FROM
            (
                SELECT
                    h.*,
                    TO_CHAR(to_date(h.FECHAROL),'Month') mes
                FROM
                    tnominahistoricofijos h
                WHERE
                    fhasta=$P{FHASTA} 
                AND CCODIGONOMINA=   $P{CCODIGONOMINA} 
                AND to_number(to_char(to_date(FECHAROL),'yyyy'))=to_number(to_char(to_date( $P{FACTUAL}  ),'yyyy')))h
        GROUP BY
            cpersona)t2,
    tnaturaltrabajo n,
    tpersona p,
    tjuridicodivisiones di,
    tjuridicodepartamentos de
WHERE
   t2.cpersona=n.cpersona  
   AND n.fhasta=$P{FHASTA} 
   AND p.fhasta= $P{FHASTA} 
   AND di.codigodivision=n.codigodivision
   AND n.codigodivision=de.codigodivision
   AND n.fhasta=di.fhasta
   AND n.fhasta=de.fhasta
   AND t2.cpersona=p.cpersona 
   AND n.codigodivision like $P{CDIVISION}
   AND n.codigodepartamento like  $P{CDEPARTAMENTO}
   order by p.nombrelegal
