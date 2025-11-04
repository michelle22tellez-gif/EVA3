delimiter $$

create function min_actores()
returns int
reads sql data
begin
    declare minimo int default 0;
    select min(actor_id) into minimo from actor;
    return minimo;
end$$

delimiter ;