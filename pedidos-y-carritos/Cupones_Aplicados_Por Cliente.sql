SELECT ocr.name, 
ocr.id_order, 
c.company, 
IF((SELECT so.id_order FROM `ps_orders` so WHERE so.id_customer = o.id_customer AND so.id_order < o.id_order LIMIT 1) > 0, 0, 1) as new, 
o.date_add, 
ocr.id_cart_rule, 
ocr.value_tax_excl 
FROM ps_order_cart_rule ocr
left join ps_orders o on (o.id_order = ocr.id_order)
left join ps_customer c on (c.id_customer = o.id_customer)
#where id_cart_rule = 154
order by ocr.id_order desc;