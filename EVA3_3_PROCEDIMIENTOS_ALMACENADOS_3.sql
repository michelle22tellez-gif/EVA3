delimiter $$

create function max_actores()
returns int
reads sql data
begin
    declare maximo int default 0;
    select max(actor_id) into maximo from actor;
    return maximo;
end$$

delimiter ;