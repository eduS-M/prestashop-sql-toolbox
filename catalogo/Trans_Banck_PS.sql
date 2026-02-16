SELECT b.id_transaction as 'id_transaccion_(web_pay)' ,
b.id_cart as 'id_Carro_compra_(web_pay)',
b.id_order as 'id_order_(web_pay)',
b.id_customer as 'id_customer_(web_pay)',
b.transaction_date as 'transaction_date_(web_pay)',
b.response_code as 'response_code__(web_pay)',
b.vci as 'vci_(web_pay)',
b.authorization_code as 'authorization_code_(web_pay)',
b.status as 'status_(web_pay)',
b.amount as 'amount_(web_pay)',
b.payment_type_code as 'payment_type_code_(web_pay)',
b.risk_level as 'risk_level_(web_pay)',
CONCAT(LEFT(c.`firstname`, 1), ". ", c.`lastname`) AS `nombre_customer_(web_pay)`, 
IF(b.`transaction_date` > 0, b.`transaction_date`, b.`date_add`) AS `custom_date_(web_pay)`, 
s.`name` AS `shop_name` 
FROM `ps_rgwpp_transaction` b 
LEFT JOIN `ps_customer` c ON (c.`id_customer` = b.`id_customer`) 
LEFT JOIN `ps_shop` s ON (s.`id_shop` = b.`id_shop`) 
WHERE 1 
ORDER BY b.id_transaction DESC;