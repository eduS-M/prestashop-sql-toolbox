Select id_order, max(date_add)
From  ps_order_history
WHERE (id_order_state = 3 or id_order_state = 2) and year(date_add) = 2021
group by id_order;
