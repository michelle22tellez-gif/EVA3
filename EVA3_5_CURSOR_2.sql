delimiter $$
create procedure rfc_actores()
begin
	declare id int;
    declare nombre varchar(50);
    declare apellido varchar(50);
	declare terminar int default false;
	declare contar_actores cursor for 
    select actor_id, first_name, last_name
    from actor;
    declare continue handler for not found set terminar = true;
    
    open contar_actores;
    
    mi_cursor: loop
		fetch contar_actores into id, nombre, apellido;
        if terminar then
			leave mi_cursor;
        end if;
    end loop;
    
    close contar_actores;
    
    select generar_rfc(first_name, last_name, "", date(last_update)) as rfc_actores from actor;

end$$

delimiter ;