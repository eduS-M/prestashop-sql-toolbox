select c.id_cart, 
c.id_customer, 
cl.company, 
cl.firstname, 
cl.lastname, 
max(a.phone) as Telefono1, 
min(a.phone) as Telefono2, 
count(o.id_order) AS Q_PEDIDOS_PS, 
max(o.invoice_date) AS ULTIMO_PEDIDO_PS,
IF((SELECT so.id_order FROM `ps_orders` so WHERE so.id_customer = o.id_customer AND so.id_order < o.id_order LIMIT 1) > 0, 'SI', 'NO') as new,
pl.name, 
cp.quantity, 
p.price,
(cp.quantity*p.price) AS Sub_Total,
c.date_add, 
c.date_upd
From ps_cart c
LEFT JOIN ps_customer cl ON (cl.id_customer = c.id_customer)
left join ps_cart_product cp on (cp.id_cart = c.id_cart)
LEFT JOIN ps_product_lang pl ON (pl.id_product = cp.id_product) 
LEFT JOIN ps_product p ON (p.id_product = cp.id_product) 
LEFT JOIN ps_address a ON (a.id_customer = cl.id_customer)
left join ps_orders o on (o.id_customer = c.id_customer)
where year(c.date_upd) = 2021 	and c.id_cart = 12866
group by c.id_cart , cl.company, pl.name
order by c.id_cart desc