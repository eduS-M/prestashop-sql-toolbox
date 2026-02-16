SELECT b.*, 
a.id_group,
a.reduction AS '% Descuento desde el Grupo (Aparece aplicadoya en el precio)',
a.show_prices as Mostrar_Precio_En_Grupo,
a.price_display_method , 
(SELECT COUNT(jcg.`id_customer`) 
FROM `ps_customer_group` jcg 
LEFT JOIN `ps_customer` jc ON (jc.`id_customer` = jcg.`id_customer`) 
WHERE jc.`deleted` != 1 AND id_shop IN (1) AND jcg.`id_group` = a.`id_group`) AS Miembros
FROM `ps_group` a 
LEFT JOIN `ps_group_lang` b ON (b.`id_group` = a.`id_group` AND b.`id_lang` = 1) 
WHERE 1 
ORDER BY a.id_group ASC;