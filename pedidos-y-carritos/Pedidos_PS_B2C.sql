Select 
a.id_order,
a.reference,
c.id_customer,
c.company,
a.total_paid_tax_incl,
a.payment,
CONCAT(LEFT(c.firstname, 1), '. ', c.lastname) AS `customer`,
osl.name AS `osname`,
IF((SELECT so.id_order FROM wwwmanare_b2c.ps_orders so WHERE so.id_customer = a.id_customer AND so.id_order < a.id_order LIMIT 1) > 0, 0, 1) as new,
a.date_add AS Fecha_Pedido,
od.product_name,
od.product_quantity,
a.id_carrier,
c.date_add AS Fecha_CLiente,
country_lang.name as cname, 
a.id_address_invoice,
a.id_address_delivery,
c.note
FROM wwwmanare_b2c.ps_orders a 
LEFT JOIN wwwmanare_b2c.ps_customer c ON (c.id_customer = a.id_customer) 
LEFT JOIN wwwmanare_b2c.ps_order_state os ON (os.id_order_state = a.current_state) 
LEFT JOIN wwwmanare_b2c.ps_order_state_lang osl ON (os.id_order_state = osl.id_order_state AND osl.id_lang = 1)
LEFT JOIN wwwmanare_b2c.ps_order_detail od on (od.id_order = a.id_order)
INNER JOIN wwwmanare_b2c.ps_address address ON address.id_address = a.id_address_delivery 
INNER JOIN wwwmanare_b2c.ps_country country ON address.id_country = country.id_country 
INNER JOIN wwwmanare_b2c.ps_country_lang country_lang ON (country.id_country = country_lang.id_country AND country_lang.id_lang = 1) 
order by a.id_order DESC
Limit 0,10000