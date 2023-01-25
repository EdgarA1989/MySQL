select * from creador;
select * from heroes;
Update personaje set aparicion =1938 where id_personaje = 3 ;
Delete from personaje where id_personaje = 4;

Update personaje set aparicion =1938 , inteligencia=40 where id_personaje = 3 ;

Alter Table personaje Rename to heroes; 

drop table heroes;
alter Table heroes add column nombre varchar(30);
Alter table heroes drop column nombre_real;

Update heroes set nombre = 'Edgar Andrada' where id_personaje=3;

select * from creador where 1=0;

SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'creador';