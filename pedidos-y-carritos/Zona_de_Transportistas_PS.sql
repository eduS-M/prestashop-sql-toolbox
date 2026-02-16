SELECT c.id_carrier, c.name as TRANSPORTISTA, c.active, gl.name as GRUPO, s.name as Comuna, cl.name as Region
FROM (((((ps_carrier c 
LEFT JOIN ps_carrier_group cg ON c.id_carrier = cg.id_carrier) 
LEFT JOIN ps_group_lang gl ON cg.id_group = gl.id_group) 
LEFT JOIN ps_carrier_zone cz ON c.id_carrier = cz.id_carrier) 
LEFT JOIN ps_zone z ON cz.id_zone = z.id_zone) 
LEFT JOIN ps_state s ON z.id_zone = s.id_zone) 
LEFT JOIN ps_country_lang cl ON s.id_country = cl.id_country
where c.deleted = 0 and c.active = 1;