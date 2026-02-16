Select 
a.id_order,
c.company,
ca.name AS CARRIER,
SUM(od.product_quantity) Q_UNIDADES_PRODUCTO,
COUNT(od.product_quantity) Q_PRODUCTO,
oc.weight AS PESO,
oc.shipping_cost_tax_excl AS PRECIO_DESPACHO_SIN_IVA,
ad.city AS COMUNA
FROM `ps_orders` a 
LEFT JOIN `ps_customer` c ON (c.`id_customer` = a.`id_customer`) 
left join ps_order_carrier oc on (oc.id_order = a.id_order)
left join ps_carrier ca on (ca.id_carrier = a.id_carrier)
left join ps_order_detail od on (od.id_order = a.id_order)
INNER JOIN `ps_address` ad ON ad.id_address = a.id_address_delivery 
where a.id_order > 5393
group by a.id_order
order by a.id_order DESC