select * 
From (
SELECT ocr.name, 
ocr.id_order, 
c.company, 
IF((SELECT so.id_order FROM `ps_orders` so WHERE so.id_customer = o.id_customer AND so.id_order < o.id_order LIMIT 1) > 0, 0, 1) as new, 
o.date_add, 
ocr.value_tax_excl ,
ocr.id_cart_rule 
FROM ps_order_cart_rule ocr
left join ps_orders o on (o.id_order = ocr.id_order)
left join ps_customer c on (c.id_customer = o.id_customer)
WHERE o.current_state <> 6
UNION ALL
SELECT concat(od.reduction_percent, '% - ', od.product_name) as name,
od.id_order,
c.company, 
IF((SELECT so.id_order FROM `ps_orders` so WHERE so.id_customer = o.id_customer AND so.id_order < o.id_order LIMIT 1) > 0, 0, 1) as new, 
o.date_add,
sum(((od.product_price-od.unit_price_tax_excl)*od.product_quantity)) AS value_tax_excl,
'' as id_cart_rule
FROM ps_order_detail od
left join ps_orders o on (o.id_order = od.id_order)
left join ps_customer c on (c.id_customer = o.id_customer)
left join ps_order_cart_rule ocr on (ocr.id_order = o.id_order)
where reduction_percent <> 0 AND o.current_state <>6
group by od.id_order, concat(od.reduction_percent, '% - ', od.product_name)
) Descuentos
order by id_order desc;