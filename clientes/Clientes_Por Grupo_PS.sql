sELECT b.name, 
(SELECT COUNT(jcg.`id_customer`) 
FROM `ps_customer_group` jcg 
LEFT JOIN `ps_customer` jc ON (jc.`id_customer` = jcg.`id_customer`) 
WHERE jc.`deleted` != 1 AND id_shop IN (1) AND jcg.`id_group` = a.`id_group` and jc.id_customer <> '1323' and jc.id_customer <> '10' and jc.id_customer <> '998' and jc.id_customer <> '1774' and jc.id_customer <> '2547' and jc.id_customer <> '2641' and jc.id_customer <> '2545' and jc.id_customer <> '2603' and jc.id_customer <> '1359' and jc.id_customer <> '2546'and jc.id_customer <> '1736') AS Miembros
FROM `ps_group` a 
LEFT JOIN `ps_group_lang` b ON (b.`id_group` = a.`id_group` AND b.`id_lang` = 1) 
WHERE 1 
ORDER BY a.id_group ASC;