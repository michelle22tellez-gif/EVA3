delimiter $$
create procedure clacular(in nume int, out resu int)
begin
	set resu = nume * nume;
end$$
delimiter ;