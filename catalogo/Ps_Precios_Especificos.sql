SELECT a.* , 
a.to,
if (SELECT pa.to as 1 FROM  ps_specific_price_rule pa WHERE pa.id_specific_price_rule = a.id_specific_price_rule limit 1) = now(), 0, 1) AS Activo,
s.name shop_name, 
cu.iso_code as currency_iso_code, 
cl.name country_name,
gl.name group_name 
FROM `ps_specific_price_rule` a 
LEFT JOIN ps_shop s ON (s.id_shop = a.id_shop) 
LEFT JOIN ps_currency cu ON (cu.id_currency = a.id_currency) 
LEFT JOIN ps_country_lang cl ON (cl.id_country = a.id_country AND cl.id_lang=1) 
LEFT JOIN ps_group_lang gl ON (gl.id_group = a.id_group AND gl.id_lang=1) 
WHERE 1 
ORDER BY a.id_specific_price_rule ASC 
LIMIT 0, 50