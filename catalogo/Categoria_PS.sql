select pl.name, cl.name AS CAtegoria, p.active
From ps_product_lang pl 
left join ps_product p on pl.id_product = p.id_product
left join ps_category_product cp on pl.id_product = cp.id_product
left join ps_category_lang cl  on cp.id_category = cl.id_category
/*where p.active = 1*/
order by 1 asc;