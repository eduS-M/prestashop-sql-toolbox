SELECT SQL_CALC_FOUND_ROWS b.*, a.*,c.company,c.siret as Rut, c.firstname, c.lastname 
FROM `ps_cart_rule` a 
LEFT JOIN `ps_cart_rule_lang` b ON (b.`id_cart_rule` = a.`id_cart_rule` AND b.`id_lang` = 1) 
left join ps_customer c on (c.id_customer = a.id_customer)
WHERE 1 and a.active=1
ORDER BY a.id_cart_rule DESC 
LIMIT 0, 50