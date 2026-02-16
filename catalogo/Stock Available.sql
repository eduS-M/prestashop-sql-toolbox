SELECT p.id_product Identificador
, pl.name Producto
, pl.available_now
, a.active
, a.low_stock_alert
, a.low_stock_threshold
#, al.name Combinacion
, p.quantity Cantidad
, p.quantity
, p.physical_quantity
, (SELECT substring_index(fvl.value, "u",1) * 1
FROM wwwmanare_b2c.ps_feature_product fp
left join wwwmanare_b2c.ps_feature_lang fl on fp.id_feature = fl.id_feature
left join wwwmanare_b2c.ps_feature_value_lang fvl on fp.id_feature_value=fvl.id_feature_value
where fl.name = 'Unidades por Caja' and (a.id_product = fp.id_product)) As 'Unidades por Caja=Carga Mínima'
FROM wwwmanare_b2c.ps_stock_available p
LEFT JOIN wwwmanare_b2c.ps_product a on (p.id_product = a.id_product)
LEFT JOIN wwwmanare_b2c.ps_product_lang pl ON (p.id_product = pl.id_product)
LEFT JOIN wwwmanare_b2c.ps_product_attribute_combination pac ON (p.id_product_attribute = pac.id_product_attribute)
LEFT JOIN wwwmanare_b2c.ps_attribute_lang al ON (pac.id_attribute = al.id_attribute)
WHERE a.active = 1 
#and p.quantity = 0
#and a.id_product = '151'
#and a.low_stock_threshold >=0 
#and p.quantity = 0 
#and pl.id_lang = 1 AND al.id_lang = 1
order by 2 asc;