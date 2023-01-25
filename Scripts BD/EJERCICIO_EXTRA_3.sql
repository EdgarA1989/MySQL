select * from pokemon;
select * from pokemon_tipo;
select * from tipo;
select * from estadisticas_base;


select * from pokemon where peso < 10;
select * from pokemon where numero_pokedex in (select numero_pokedex from pokemon_tipo where id_tipo in(select id_tipo from tipo where nombre='Agua'));
select * from pokemon where numero_pokedex in (select numero_pokedex from pokemon_tipo where id_tipo in
(select id_tipo from tipo where nombre in('Agua','Fuego','Tierra')));

select * from pokemon where numero_pokedex in (select numero_pokedex from pokemon_tipo where id_tipo in(select id_tipo from tipo where nombre in('Volador','Fuego')));
