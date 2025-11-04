delimiter $$
create procedure agregar_actor2(in firstname varchar(50), in lastname varchar(50))
begin
    declare NuevoU_id int;
    set NuevoU_id = max_actores() + 1;
    insert into actor(actor_id, first_name, last_name)
    value(NuevoU_id, firstname, lastname);
end$$

delimiter ;