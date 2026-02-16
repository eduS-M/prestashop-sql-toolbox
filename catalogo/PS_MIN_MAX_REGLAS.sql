SELECT a.id_product
#,a.ean13 AS 'EAN13'
#,a.reference as 'Referencia_PS'
,b.name as 'Nombre_Producto'
#,cl.name  AS 'Categoria'
,a.minimal_quantity As 'Mínimo_Compra_en_Producto'
,a.active as 'Estado_de_Producto_(1=Activo, 0=Inactivo)'
,mc.id_minpurchase_configuration as 'id_minpurchase_configuration (MIN_MAX)'
,mc.name as 'name (MIN_MAX)'
,mc.minimum_quantity as 'minimum_quantity (MIN_MAX)'
,mc.maximum_quantity as 'maximum_quantity (MIN_MAX)'
,mc.increment as 'incremento_Activo (MIN_MAX)'
,mc.increment_qty as 'increment_qty (MIN_MAX)'
,mc.multiple as 'multiple_Activo (MIN_MAX)'
,mc.multiple_qty as 'multiple_qty (MIN_MAX)'
,mc.products AS 'PS_ID_PRODUCT (MIN_MAX)'
,mc.date_add as 'date_add (MIN_MAX)'
,mc.date_upd as 'date_upd (MIN_MAX)'
,mc.active as 'Estado (MIN_MAX)'
FROM ps_product a
left join ps_product_lang b on (b.id_product = a.id_product)
JOIN ps_product_shop sa ON (a.id_product = sa.id_product AND sa.id_shop = 1) 
LEFT JOIN ps_category_lang cl ON (sa.id_category_default = cl.id_category AND cl.id_lang = 1 AND cl.id_shop = 1) 
LEFT JOIN ps_minpurchase_configuration mc on mc.products = a.id_product
where a.id_product in ('52','62','83','99')
order by 4;