SELECT sp.id_specific_price,
sp.id_product,
sp.id_group,
gl.name,
sp.id_customer,
sp.price,
sp.reduction,
sp.reduction_type,
sp.from,
sp.to 
FROM ps_specific_price sp
left join ps_product a on sp.id_product=a.id_product
left join ps_group_lang gl on sp.id_group=gl.id_group
where a.active = 1 #'Estado_(1=Activo, 0=Inactivo)'# 
and sp.id_customer = 0
and sp.reduction_type = 'amount';