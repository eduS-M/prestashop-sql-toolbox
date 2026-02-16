SELECT t.*, t.id_mp_transaction as 'id_mp_transaction_Mercado_Pago',
t.cart_id as 'cart_id_Mercado_Pago',
t.order_id as 'order_id_Mercado_Pago',
t.customer_id as 'customer_id_Mercado_Pago',
t.total as 'total_Mercado_Pago',
t.merchant_order_id 'merchant_order_id_Mercado_Pago',
(t.updated_at-t.created_at) As 'Tiempo_Transacion',
t.created_at 'created_at_Mercado_Pago',
t.updated_at 'updated_at_Mercado_Pago',
substr(t.notification_url from (locate ('payment_type=', t.notification_url)+13)  for (locate('&merchant_order_id', t.notification_url) - locate('payment_type=', t.notification_url)-13)) as 'Forma_Pago_Mercado_Pago',
substr(t.notification_url from (locate ('&collection_id=', t.notification_url)+15)  for (locate('&collection_status=', t.notification_url) - locate('&collection_id=', t.notification_url)-15)) as 'ID_DE_OPERACIÓN_EN_MERCADO_PAGO'
FROM ps_mp_transactions t
#where t.merchant_order_id <> "" 
where t.cart_id in ('16352','16275','15942')
#where t.order_id <> ''
order by 1 desc;