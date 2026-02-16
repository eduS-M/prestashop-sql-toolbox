Select 
a.id_order,
a.reference,
c.id_customer,
c.company,
a.total_paid_tax_incl,
a.payment,
CONCAT(LEFT(c.`firstname`, 1), '. ', c.`lastname`) AS `customer`,
osl.`name` AS `osname`,
IF((SELECT so.id_order FROM `ps_orders` so WHERE so.id_customer = a.id_customer AND so.id_order < a.id_order LIMIT 1) > 0, 0, 1) as new,
a.date_add AS Fecha_Pedido,
od.product_name,
od.product_quantity,
a.id_carrier,
c.date_add AS Fecha_CLiente,
country_lang.name as cname, 
a.id_address_invoice,
a.id_address_delivery,
c.note
FROM `ps_orders` a 
LEFT JOIN `ps_customer` c ON (c.`id_customer` = a.`id_customer`) 
LEFT JOIN `ps_order_state` os ON (os.`id_order_state` = a.`current_state`) 
LEFT JOIN `ps_order_state_lang` osl ON (os.`id_order_state` = osl.`id_order_state` AND osl.`id_lang` = 1)
LEFT JOIN `ps_order_detail` od on (od.id_order = a.id_order)
INNER JOIN `ps_address` address ON address.id_address = a.id_address_delivery 
INNER JOIN `ps_country` country ON address.id_country = country.id_country 
INNER JOIN `ps_country_lang` country_lang ON (country.`id_country` = country_lang.`id_country` AND country_lang.`id_lang` = 1) 
WHERE osl.`name` <> 'Enviado' and osl.`name` <> 'Completo' and osl.`name` <> 'Retiro' and osl.`name` <> 'Courier Especial' and osl.`name` <> 'Entregado'
order by a.id_order DESC;