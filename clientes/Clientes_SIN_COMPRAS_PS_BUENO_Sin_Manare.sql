SELECT a.id_customer, 
concat(a.firstname,', ',a.lastname) As Nombre,
a.email, 
a.company as Compania, 
a.active AS Activo,   
a.date_add, 
datediff(now(),a.date_add) as Dias_desde_creación_cliente,
(SELECT (SUM(total_paid_real / conversion_rate)) FROM ps_orders o WHERE o.id_customer = a.id_customer AND o.id_shop IN (1) AND o.valid = 1 ) as Total_CLP,
if ((SELECT (SUM(total_paid_real / conversion_rate)) FROM ps_orders o WHERE o.id_customer = a.id_customer AND o.id_shop IN (1) AND o.valid = 1 ) >0, 1, 0)  as Compro, 
( SELECT c.date_add FROM ps_guest g LEFT JOIN ps_connections c ON c.id_guest = g.id_guest WHERE g.id_customer = a.id_customer ORDER BY c.date_add DESC LIMIT 1 ) as Ultima_conexion,
( SELECT datediff(now(),c.date_add)   FROM ps_guest g LEFT JOIN ps_connections c ON c.id_guest = g.id_guest WHERE g.id_customer = a.id_customer ORDER BY c.date_add DESC LIMIT 1 ) as Dias_desde_ultima_conexion
FROM ps_customer a 
LEFT JOIN ps_gender_lang gl ON (a.id_gender = gl.id_gender AND gl.id_lang = 1) 
LEFT JOIN ps_shop shop ON a.id_shop = shop.id_shop 
WHERE a.deleted = 0 and a.active = 1 and if ((SELECT (SUM(total_paid_real / conversion_rate)) FROM ps_orders o WHERE o.id_customer = a.id_customer AND o.id_shop IN (1) AND o.valid = 1 ) >0, 1, 0) = 0
and a.id_customer not in ('1323', '10' ,'998', '1774' , '2547' , '2641' , '2545' , '2603' , '1359','2546','1736')
ORDER BY date_add DESC;