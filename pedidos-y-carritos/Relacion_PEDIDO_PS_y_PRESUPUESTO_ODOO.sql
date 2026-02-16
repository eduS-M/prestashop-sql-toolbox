SELECT a.prst_order_id as 'ps_order_id',
a.erp_order_name as 'Presupuesto_ODOO',
a.presta_module as 'forma_de_pago',
a.created_on as 'Fecha_Sincronizacion',
b.id_transaction as 'id_transaccion_(web_pay)' ,
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
CONCAT(LEFT(c.firstname, 1), '. ' , c.lastname) AS 'nombre_customer_(web_pay)', 
IF(b.transaction_date > 0, b.transaction_date, b.date_add) AS 'custom_date_(web_pay)',
t.id_mp_transaction as 'id_mp_transaction_Mercado_Pago',
t.cart_id as 'cart_id_Mercado_Pago',
t.order_id as 'order_id_Mercado_Pago',
t.customer_id as 'customer_id_Mercado_Pago',
t.total as 'total_Mercado_Pago',
t.merchant_order_id 'merchant_order_id_Mercado_Pago',
t.created_at 'created_at_Mercado_Pago',
t.updated_at 'updated_at_Mercado_Pago',
substr(t.notification_url from (locate ('payment_type=', t.notification_url)+13)  for (locate('&merchant_order_id', t.notification_url) - locate('payment_type=', t.notification_url)-13)) as 'Forma_Pago_Mercado_Pago',
substr(t.notification_url from (locate ('&collection_id=', t.notification_url)+15)  for (locate('&collection_status=', t.notification_url) - locate('&collection_id=', t.notification_url)-15)) as 'ID_DE_OPERACIÓN_EN_MERCADO_PAGO'
FROM ps_erp_order_merge a 
Left join ps_rgwpp_transaction b on (a.prst_order_id = b.id_order)
LEFT JOIN ps_customer c ON (c.id_customer = b.id_customer) 
LEFT JOIN ps_shop s ON (s.id_shop = b.id_shop) 
left join ps_mp_transactions t on (t.cart_id = b.id_cart)
where t.cart_id = '15075'
ORDER BY a.erp_order_name desc;