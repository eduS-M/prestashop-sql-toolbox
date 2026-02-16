SELECT p.id_product,
p.ean13,
p.reference,
pl.name,
p.minimal_quantity,
p.price,
p.width,
p.height,
p.depth,
p.weight,
p.date_add,
p.date_upd
FROM ps_product p
left join ps_product_lang pl on (pl.id_product = p.id_product);