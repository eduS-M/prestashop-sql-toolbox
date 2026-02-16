SELECT a.ean13 AS EAN13,
cl.name  AS Categoria,
b.name as Nombre_Producto,
a.price as Precio_Mayorista,
ifnull(
ROUND((SELECT sp.price
FROM ps_specific_price sp
left join ps_group_lang gl on sp.id_group=gl.id_group
where a.active = 1 #'Estado_(1=Activo, 0=Inactivo)'# 
and a.id_product = sp.id_product
and sp.id_customer = 0
and gl.name = 'B2B_20%_DESCUENTO'
and sp.reduction_type = 'amount') * 0.8,0), Round(a.price * 0.8,0) )AS 'B2B 20% DESCUENTO' ,
ifnull(
ROUND((SELECT sp.price
FROM ps_specific_price sp
left join ps_group_lang gl on sp.id_group=gl.id_group
where a.active = 1 #'Estado_(1=Activo, 0=Inactivo)'# 
and a.id_product = sp.id_product
and sp.id_customer = 0
and gl.name = 'B2B_10%_DESCUENTO'
and sp.reduction_type = 'amount') * 0.9,0), Round(a.price * 0.9,0) )AS 'B2B 10% DESCUENTO' ,
if(cl.name='Otras Marcas' or a.id_product = 128 ,a.price,Round(a.price * 0.95,0)) AS 'B2B 5% DESCUENTO',
if(cl.name='Otras Marcas'or a.id_product = 128,a.price,Round(a.price * 0.97,0)) AS 'B2B 3% DESCUENTO',
a.minimal_quantity As 'Unidades por caja',
(SELECT fvl.value
FROM ps_feature_product fp
left join ps_feature_lang fl on fp.id_feature = fl.id_feature
left join ps_feature_value_lang fvl on fp.id_feature_value=fvl.id_feature_value
where fl.name = 'Duración' and (a.id_product = fp.id_product)) As Duracion,
(SELECT fvl.value
FROM ps_feature_product fp
left join ps_feature_lang fl on fp.id_feature = fl.id_feature
left join ps_feature_value_lang fvl on fp.id_feature_value=fvl.id_feature_value
where fl.name = 'Valor de Venta Sugerido' and (a.id_product = fp.id_product)) As 'PVP Sugerido',
a.width as Ancho,
a.height As Altura,
a.depth as Profundidad,
a.weight as Peso
FROM ps_product a
left join ps_product_lang b on (b.id_product = a.id_product)
JOIN ps_product_shop sa ON (a.id_product = sa.id_product AND sa.id_shop = 1) 
LEFT JOIN ps_category_lang cl ON (sa.id_category_default = cl.id_category AND cl.id_lang = 1 AND cl.id_shop = 1) 
LEFT JOIN ps_stock_available sav ON (sav.id_product = a.id_product AND sav.id_product_attribute = 0 AND sav.id_shop = 1  AND sav.id_shop_group = 0 )
where a.active = 1 #'Estado_(1=Activo, 0=Inactivo)'# 
and sav.quantity > 100
order by 2 and 3;