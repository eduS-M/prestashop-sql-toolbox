SELECT b.*, 
a.id_group,
a.reduction AS '% Descuento desde el Grupo (Aparece aplicadoya en el precio)', 
jc.`id_customer`, 
concat(jc.`company`,' - ',jc.`firstname`,' ',jc.`lastname`) As Cliente,
jc.`active` AS 'Cliente Activo (1 = SI, 0 = NO)',
if ((SELECT (SUM(total_paid_real / conversion_rate)) FROM ps_orders o WHERE o.id_customer = jc.id_customer AND o.id_shop IN (1) AND o.valid = 1 ) >0, 1, 0)  as 'Compro (1 = SI, 0 = NO)', 
( SELECT c.date_add FROM ps_guest g LEFT JOIN ps_connections c ON c.id_guest = g.id_guest WHERE g.id_customer = jc.id_customer ORDER BY c.date_add DESC LIMIT 1 ) as 'Ultima Conexion'
FROM `ps_group` a 
LEFT JOIN `ps_group_lang` b ON (b.`id_group` = a.`id_group` AND b.`id_lang` = 1) 
left join `ps_customer_group` jcg on (jcg.`id_group` = a.`id_group`)
LEFT JOIN `ps_customer` jc ON (jc.`id_customer` = jcg.`id_customer`)
WHERE 1 
ORDER BY a.id_group ASC;