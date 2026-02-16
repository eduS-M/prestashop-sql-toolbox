SELECT a.id_product AS 'id Producto en prestashop'
, a.reference as 'SKU = Referencia_PS'
, a.ean13 AS 'EAN = EAN13'
, b.name as 'Nombre Producto'
, substring(b.description_short, (locate("<p>", b.description_short,1)+3), (locate("</p>", b.description_short,1)-4) )  AS 'Descripcion de Producto'
, cl.name  AS 'Categoría = Categoria Principal'
#, substring(fvl.value, 2, 10)
#, (SELECT 1 * concat((left((substring(fvl.value, 2, 10)), locate(".",(substring(fvl.value, 2, 10)), 1)-1)) ,(Right((substring(fvl.value, 2, 10)), (length((substring(fvl.value, 2, 10))) -  locate(".",(substring(fvl.value, 2, 10)), 1)))))
#FROM wwwmanare_b2c.ps_feature_product fp
#left join wwwmanare_b2c.ps_feature_lang fl on fp.id_feature = fl.id_feature
#left join wwwmanare_b2c.ps_feature_value_lang fvl on fp.id_feature_value=fvl.id_feature_value
#where fl.name = 'Valor de Venta Sugerido' and (a.id_product = fp.id_product)) As 'Precio = Precio Publico'
, a.price as 'Precio = Precio Publico'
, sav.quantity  AS Saldo_disponible_PS_B2C
#, '' AS 'quantity = Cantidad Neta'
#, '' As 'unit_type = Unidad de Cantidad neta'
#, 'NO' As 'Refrigeración Ingresar T° °C'
#, 'NO' AS 'Congelación Ingresar T° °C'
,(SELECT substring(fvl.value,1,2) * 30
FROM wwwmanare_b2c.ps_feature_product fp
left join wwwmanare_b2c.ps_feature_lang fl on fp.id_feature = fl.id_feature
left join wwwmanare_b2c.ps_feature_value_lang fvl on fp.id_feature_value=fvl.id_feature_value
where fl.name = 'Duración' and (a.id_product = fp.id_product)) As 'Duración antes de Expiración (Días) = Duracion en dias'
, a.depth as 'Largo cms de Envase = Profundidad'
, a.width as 'Ancho cms de Envase = Ancho'
, a.height As 'Alto cms de Envase = Altura'
, a.weight * 1000 as 'Peso Bruto en Gramos de Envase (contenido más envase) = Peso'
, (SELECT substring_index(fvl.value, "u",1) * 1
FROM wwwmanare_b2c.ps_feature_product fp
left join wwwmanare_b2c.ps_feature_lang fl on fp.id_feature = fl.id_feature
left join wwwmanare_b2c.ps_feature_value_lang fvl on fp.id_feature_value=fvl.id_feature_value
where fl.name = 'Unidades por Caja' and (a.id_product = fp.id_product)) As '# Envases x Caja =Unidades por Caja'
, (SELECT substring_index(fvl.value, "u",1) * a.weight
FROM wwwmanare_b2c.ps_feature_product fp
left join wwwmanare_b2c.ps_feature_lang fl on fp.id_feature = fl.id_feature
left join wwwmanare_b2c.ps_feature_value_lang fvl on fp.id_feature_value=fvl.id_feature_value
where fl.name = 'Unidades por Caja' and (a.id_product = fp.id_product)) As 'Peso Bruto en Kg x Caja = Peso Caja KG'
, a.active as 'Estado_(1=Activo, 0=Inactivo)'
, a.date_upd As Fecha_última_actualización
FROM wwwmanare_b2c.ps_product a
left join wwwmanare_b2c.ps_product_lang b on (b.id_product = a.id_product)
JOIN wwwmanare_b2c.ps_product_shop sa ON (a.id_product = sa.id_product AND sa.id_shop = 1) 
LEFT JOIN wwwmanare_b2c.ps_category_lang cl ON (sa.id_category_default = cl.id_category AND cl.id_lang = 1 AND cl.id_shop = 1) 
LEFT JOIN wwwmanare_b2c.ps_stock_available sav ON (sav.id_product = a.id_product AND sav.id_product_attribute = 0 AND sav.id_shop = 1  AND sav.id_shop_group = 0 )
#LEFT JOIN ps_minpurchase_configuration mc on mc.products = a.id_product
order by 4;