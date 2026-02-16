Select gl.name, 
count(c.id_customer) as Total_Clientes,
sum(if(c.active=1,1,0)) as Activos,
sum(if(c.active=1,0,1)) as No_activos,
sum(
if ((SELECT (SUM(o.total_paid_real / o.conversion_rate)) 
	FROM ps_orders o 
    left join ps_customer c1 on c1.id_customer=o.id_customer
    WHERE o.id_customer = c.id_customer AND o.id_shop IN (1) 
    AND o.valid = 1 and o.id_customer not in ('1323', '10' ,'998', '1774' , '2547' , '2641' , '2545' , '2603' , '1359','2546','1736') and c1.active=1 ) >0, 1, 0)  
)as 'Activo con Ventas',
(sum(if(c.active=1,1,0)) - 
sum(
if ((SELECT (SUM(o.total_paid_real / o.conversion_rate)) 
	FROM ps_orders o 
    left join ps_customer c1 on c1.id_customer=o.id_customer
    WHERE o.id_customer = c.id_customer AND o.id_shop IN (1) 
    AND o.valid = 1 and o.id_customer not in ('1323', '10' ,'998', '1774' , '2547' , '2641' , '2545' , '2603' , '1359','2546','1736') and c1.active=1 ) >0, 1, 0)  
)
)as 'Activos NO Ventas',
sum(if(c.active=1,0,1)) as 'Inactivo',
sum(
if ((SELECT (SUM(o.total_paid_real / o.conversion_rate)) 
	FROM ps_orders o 
    left join ps_customer c1 on c1.id_customer=o.id_customer
    WHERE o.id_customer = c.id_customer AND o.id_shop IN (1) 
    AND o.valid = 1 and o.id_customer not in ('1323', '10' ,'998', '1774' , '2547' , '2641' , '2545' , '2603' , '1359','2546','1736') and c1.active=0)>0, 1, 0)  
)as 'Inactivo con Ventas',

(sum(if(c.active=1,0,1)) -
sum(
if ((SELECT (SUM(o.total_paid_real / o.conversion_rate)) 
	FROM ps_orders o 
    left join ps_customer c1 on c1.id_customer=o.id_customer
    WHERE o.id_customer = c.id_customer AND o.id_shop IN (1) 
    AND o.valid = 1 and o.id_customer not in ('1323', '10' ,'998', '1774' , '2547' , '2641' , '2545' , '2603' , '1359','2546','1736') and c1.active=0)>0, 1, 0)  
)
) as 'Inactivo NO Ventas'

from ps_customer c
left join ps_customer_group cg on cg.id_customer=c.id_customer
left join ps_group_lang gl on gl.id_group=cg.id_group
where c.id_customer not in ('1323', '10' ,'998', '1774' , '2547' , '2641' , '2545' , '2603' , '1359','2546','1736')
group by gl.name;