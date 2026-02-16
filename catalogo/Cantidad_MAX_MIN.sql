SELECT mc.*, mc.id_minpurchase_configuration as 'id_minpurchase_configuration (MIN_MAX)',
mc.name as 'name (MIN_MAX)',
mc.minimum_quantity as 'minimum_quantity (MIN_MAX)',
mc.maximum_quantity as 'maximum_quantity (MIN_MAX)',
mc.multiple as 'multiple (MIN_MAX)',
mc.multiple_qty as 'multiple_qty (MIN_MAX)',
mc.increment as 'incremento',
mc.increment_qty as 'Cantidad de Incremento',
mc.products AS 'PS_ID_PRODUCT (MIN_MAX)',
mc.date_add as 'date_add (MIN_MAX)',
mc.date_upd as 'date_upd (MIN_MAX)',
mc.active as 'Estado (MIN_MAX)'
FROM `ps_minpurchase_configuration` mc 
ORDER BY date_add DESC;