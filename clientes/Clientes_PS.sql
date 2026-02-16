SELECT a.`id_customer`, 
`firstname`, 
`lastname`, 
`email`, 
`company`, 
a.`active` AS `active`, 
`newsletter`, 
`optin` , 
a.date_add, 
gl.name as title, 
( SELECT SUM(total_paid_real / conversion_rate) FROM ps_orders o WHERE o.id_customer = a.id_customer AND o.id_shop IN (1) AND o.valid = 1 ) as total_spent, 
( SELECT c.date_add FROM ps_guest g LEFT JOIN ps_connections c ON c.id_guest = g.id_guest WHERE g.id_customer = a.id_customer ORDER BY c.date_add DESC LIMIT 1 ) as connect, 
shop.name as shop_name 
FROM `ps_customer` a 
LEFT JOIN ps_gender_lang gl ON (a.id_gender = gl.id_gender AND gl.id_lang = 1) 
LEFT JOIN `ps_shop` shop ON a.`id_shop` = shop.`id_shop` 
WHERE 1 AND a.`deleted` = 0 AND a.id_shop IN (1) 
ORDER BY date_add 
DESC LIMIT 0, 5000