delimiter $$
create procedure contar_rfc_generados(out cont int)
begin
    -- declarar todas las variables primero
    declare nombre varchar(50);
    declare ap_paterno varchar(50);
    declare ap_materno varchar(50);
    declare fecha_nac date;
    declare rfc_generado varchar(10);
    declare terminar int default false;
    declare ap_pat varchar(2);
    declare ap_mat varchar(1);
    declare nombre_n varchar(1);
    declare fec_rfc varchar(6);
    declare i int;
    declare vocal char(1);
    declare letra char(1);
    
    declare cursor_personas cursor for
    select nombre, ap_paterno, ap_materno, fecha_nac
    from personas;
    
    declare continue handler for not found set terminar = true;
    
    open cursor_personas;
    set cont = 0;
    
    mi_loop: loop
        fetch cursor_personas into nombre, ap_paterno, ap_materno, fecha_nac;
        
        if terminar then
            leave mi_loop;
        end if;
        
        -- generar rfc
        set i = 2;
        set vocal = 'x';
        
        while i <= char_length(ap_paterno) do
            set letra = substring(ap_paterno, i, 1);
            if letra in ('a','e','i','o','u','A','E','I','O','U') then
                set vocal = letra;
                set i = char_length(ap_paterno) + 1;
            end if;
            set i = i + 1;
        end while;
        
        set ap_pat = concat(substring(ap_paterno, 1, 1), vocal);
        
        if ap_materno is null or ap_materno = '' then
            set ap_mat = 'x';
        else
            set ap_mat = substring(ap_materno, 1, 1);
        end if;
        
        set nombre_n = substring(nombre, 1, 1);
        set fec_rfc = date_format(fecha_nac, '%y%m%d');
        set rfc_generado = upper(concat(ap_pat, ap_mat, nombre_n, fec_rfc));
        
        set cont = cont + 1;
        
    end loop;
    
    close cursor_personas;
end$$
delimiter ;
