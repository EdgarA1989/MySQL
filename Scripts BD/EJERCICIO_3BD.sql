select * from jugador order by codigo;
select * from equipo order by nombre;
select * from partido order by codigo;
select * from estadistica order by jugador;
/* ejercicio 1*/
select nombre from jugador order by nombre;
/* ejercicio 2*/
select nombre from jugador where posicion like '%C%' and peso > 200;
/* ejercicio 3*/
select nombre from equipo order by nombre;
/* ejercicio 4*/
select * from equipo where conferencia ='eASt';
/* ejercicio 5*/
select * from equipo where ciudad like 'C%' order by nombre;
/* ejercicio 6*/
select * from jugador order by nombre_equipo;
/* ejercicio 7*/
select * from jugador where nombre_equipo in('Raptors') order by nombre;
/* ejercicio 8*/
select Puntos_por_partido from estadistica e inner join jugador j on e.jugador = j.codigo where j.nombre='Pau Gasol';
/* ejercicio 9*/
select Puntos_por_partido from estadistica e inner join jugador j on e.jugador = j.codigo where j.nombre='Pau Gasol'and e.temporada='04/05';
/* ejercicio 10*/
select SUM(Puntos_por_partido) as Puntos_Totales,jugador from estadistica group by jugador;
/* ejercicio 11*/
select nombre_equipo, count(nombre) as cantidad_de_jugadores from jugador group by nombre_equipo;
/* ejercicio 12*/
select SUM(Puntos_por_partido) as Puntos_Totales,jugador from estadistica group by jugador order by Puntos_Totales desc limit 1;
/* ejercicio 13*/
select max(j.altura), j.nombre_equipo, e.conferencia, e.division from jugador j, equipo e;
/* ejercicio 14*/
select avg(p.puntos_visitante+p.puntos_local)/2 as Media_equipos_Pacific from partido p where p.equipo_local in (select nombre from equipo  where division like'Pacific')
and p.equipo_visitante in (select nombre from equipo where division like'Pacific');

/* ejercicio 15
Mostrar el partido o partidos (equipo_local, equipo_visitante y diferencia) con mayor
diferencia de puntos.*/
select equipo_local,equipo_visitante, abs(puntos_local-puntos_visitante) as DIFERENCIA from partido where
abs(puntos_local-puntos_visitante) = (select max(abs(puntos_local-puntos_visitante))from partido);
/* ejercicio 17 
Mostrar los puntos de cada equipo en los partidos, tanto de local como de visitante*/
select t.equipo, sum(puntos) as PUNTO_TOTAL from (
select equipo_visitante as equipo, sum(puntos_visitante) as PUNTOS from partido group by equipo_visitante 
union all
select equipo_local as equipo, sum(puntos_local) as PUNTOS from partido group by equipo_local)
t group by t.equipo;

/* ejercicio 18
Mostrar quien gana en cada partido (codigo, equipo_local, equipo_visitante,
equipo_ganador), en caso de empate sera null.*/
select codigo, equipo_local, equipo_visitante, puntos_local, puntos_visitante, 
if(puntos_local <> puntos_visitante,if(puntos_local > puntos_visitante, equipo_local, equipo_visitante),null) 
as EQUIPO_GANADOR from partido;

SELECT codigo, equipo_local, equipo_visitante, case when p.puntos_local > p.puntos_visitante 
then equipo_local when p.puntos_local < p.puntos_visitante 
then equipo_visitante else null end as equipo_ganador FROM partido p;

/*CANDADOOOOO PRUEBA*/
/*CANDADO A*/
select count(jugador) from estadistica where Asistencias_por_partido = (select max(Asistencias_por_partido) from estadistica);

select SUM(peso) from jugador where nombre_equipo in 
(select nombre from equipo where conferencia='East') and posicion like '%C%';


select count(temporada) from estadistica group by (select max(Asistencias_por_partido) from estadistica);

/*CANDADOOO B*/
select count(e.jugador) as posicion_candado_b from estadistica e inner join jugador j on (e.jugador=j.codigo) 
where e.Asistencias_por_partido > (select count(codigo) from jugador where nombre_equipo IN('HEAT'));
select count(codigo) as Combinacion_candado_B from partido where temporada like '99%';

/*CANDADOOO C*/
select (select count(codigo) , nombre from jugador where  procedencia like 'Michigan%' 
and nombre_equipo in (select nombre from equipo where conferencia in('West')))div
(select count(codigo) from jugador where peso >= 195) from jugador;

select count(codigo) , nombre from jugador where  procedencia like 'Michigan%' 
and nombre_equipo in (select nombre from equipo where conferencia in('West'));

select count(codigo) from jugador where peso >= 195;

select count(codigo) from jugador where peso >= 195;

select floor(avg(e.puntos_por_partido)+sum(e.tapones_por_partido)+count(e.asistencias_por_partido)) from estadistica e inner join jugador j on (e.jugador = j.codigo)
where j.nombre_equipo in (select nombre from equipo where division in ('Central'));

/*CANDADO D*/
select round((sum(tapones_por_partido))) from estadistica 
where jugador in(select codigo from jugador where nombre= 'Corey Maggette') and temporada in ('00/01');

select floor(sum(puntos_por_partido)) as clave from estadistica where jugador in
(select codigo from jugador where procedencia in ('Argentina')) ;
