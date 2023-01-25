/*Ejercicio 1
Devuelve un listado con el código de oficina y la ciudad donde hay oficinas.*/
select codigo_oficina, ciudad from oficina;
/*Ejercicio 2
Devuelve un listado con la ciudad y el teléfono de las oficinas de España.*/
select ciudad, telefono, pais from oficina where pais = 'España';
/*Ejercicio 3
Devuelve un listado con el nombre, apellidos y email de los empleados cuyo jefe tiene un
código de jefe igual a 7.*/
select nombre, concat(apellido1,' ',apellido2) as Apellidos , email from empleado where codigo_jefe=7;
/*Ejercicio 4
Devuelve el nombre del puesto, nombre, apellidos y email del jefe de la empresa.*/
select nombre , puesto , email, concat(apellido1,' ',apellido2) as Apellidos from empleado where codigo_jefe is null;
/*Ejercicio 5
Devuelve un listado con el nombre, apellidos y puesto de aquellos empleados que no sean
representantes de ventas.*/
select nombre , puesto ,concat(apellido1,' ',apellido2) as Apellidos from empleado where puesto not in ('Representante Ventas');
/*Ejercicio 6
Devuelve un listado con el nombre de los todos los clientes españoles.*/
select nombre_cliente , pais from cliente where pais in('Spain');
/*Ejercicio 7
Devuelve un listado con los distintos estados por los que puede pasar un pedido.*/
select estado from pedido group by estado;
select distinct(estado) as Estados from pedido;
/*Ejercicio 8
Devuelve un listado con el código de cliente de aquellos clientes que realizaron algún pago
en 2008. Tenga en cuenta que deberá eliminar aquellos códigos de cliente que aparezcan
repetidos. Resuelva la consulta:
o Utilizando la función YEAR de MySQL.
o Utilizando la función DATE_FORMAT de MySQL.
o Sin utilizar ninguna de las funciones anteriores.*/
select codigo_cliente, fecha_pago from pago where fecha_pago like '2008%' group by codigo_cliente;
select codigo_cliente, fecha_pago from pago where year(fecha_pago)=2008 group by codigo_cliente;
select codigo_cliente, fecha_pago from pago where date_format(fecha_pago, '%Y') = 2008 group by codigo_cliente;
select codigo_cliente, fecha_pago from pago where DATE_FORMAT(fecha_pago,'%y') BETWEEN '08' AND '08' group by codigo_cliente;
/*Ejercicio 9
Devuelve un listado con el código de pedido, código de cliente, fecha esperada y fecha de
entrega de los pedidos que no han sido entregados a tiempo.*/
select codigo_pedido, codigo_cliente, fecha_esperada, fecha_entrega, estado from pedido where fecha_entrega > fecha_esperada;
/*Ejercicio 10
Devuelve un listado con el código de pedido, código de cliente, fecha esperada y fecha de
entrega de los pedidos cuya fecha de entrega ha sido al menos dos días antes de la fecha
esperada.
o Utilizando la función ADDDATE de MySQL.
o Utilizando la función DATEDIFF de MySQL*/
select codigo_pedido, codigo_cliente, fecha_esperada, fecha_entrega, estado from 
pedido where datediff(fecha_esperada,fecha_entrega) >= 2;
select codigo_pedido, codigo_cliente, fecha_esperada, fecha_entrega, estado from 
pedido where fecha_entrega <= adddate(fecha_esperada,-2);
/*Ejercicio 11
Devuelve un listado de todos los pedidos que fueron rechazados en 2009.*/
select * from pedido where estado='Rechazado' and date_format(fecha_entrega,'%Y')=2009;
/*Ejercicio 12
Devuelve un listado de todos los pedidos que han sido entregados en el mes de enero de
cualquier año.*/
select * from pedido where estado='Entregado' and month(fecha_entrega)=01;
/*Ejercicio 13
Devuelve un listado con todos los pagos que se realizaron en el año 2008 mediante Paypal.
Ordene el resultado de mayor a menor.*/
select * from pago where forma_pago='Paypal' and year(fecha_pago)=2008 order by fecha_pago desc;
/*Ejercicio 14
Devuelve un listado con todas las formas de pago que aparecen en la tabla pago. Tenga en
cuenta que no deben aparecer formas de pago repetidas.*/
select forma_pago from pago group by forma_pago;
/*Ejercicio 15
Devuelve un listado con todos los productos que pertenecen a la gama Ornamentales y que
tienen más de 100 unidades en stock. El listado deberá estar ordenado por su precio de
venta, mostrando en primer lugar los de mayor precio.*/
select * from producto where gama='Ornamentales' and cantidad_en_stock > 100 order by precio_venta desc;
/*Ejercicio 16
Devuelve un listado con todos los clientes que sean de la ciudad de Madrid y cuyo
representante de ventas tenga el código de empleado 11 o 30.*/
select * from cliente where ciudad='Madrid' and codigo_empleado_rep_ventas in (11,30);
/***************CONSULTAS MULTITABLA***********************

Ejercicio 1
Obtén un listado con el nombre de cada cliente y el nombre y apellido de su representante
de ventas.*/
select nombre_cliente,concat(e.nombre,' ',e.apellido1,' ',e.apellido2) as 'nombre_representante de venta'from cliente c inner join empleado e on (c.codigo_empleado_rep_ventas=e.codigo_empleado);
/*Ejercicio 2
Muestra el nombre de los clientes que hayan realizado pagos junto con el nombre de sus
representantes de ventas.*/
select nombre_cliente,concat(e.nombre,' ',e.apellido1,' ',e.apellido2) as 'nombre_representante de venta'
from cliente c inner join empleado e on (c.codigo_empleado_rep_ventas=e.codigo_empleado)
where c.codigo_cliente in(select codigo_cliente from pago);
/*Ejercicio 3
Muestra el nombre de los clientes que no hayan realizado pagos junto con el nombre de
sus representantes de ventas.*/
select nombre_cliente,concat(e.nombre,' ',e.apellido1,' ',e.apellido2) as 'nombre_representante de venta'
from cliente c inner join empleado e on (c.codigo_empleado_rep_ventas=e.codigo_empleado)
where c.codigo_cliente not in(select codigo_cliente from pago);
/*Ejercicio 4
Devuelve el nombre de los clientes que han hecho pagos y el nombre de sus representantes
junto con la ciudad de la oficina a la que pertenece el representante.*/
select nombre_cliente,concat(e.nombre,' ',e.apellido1,' ',e.apellido2) as 'nombre_representante de venta', 
o.ciudad from cliente c inner join empleado e on (c.codigo_empleado_rep_ventas=e.codigo_empleado) inner join oficina o on (o.codigo_oficina=e.codigo_oficina)
where c.codigo_cliente in(select codigo_cliente from pago);

select nombre_cliente,concat(e.nombre,' ',e.apellido1,' ',e.apellido2) as 'nombre_representante de venta' , o.ciudad
from cliente c , empleado e, oficina o where c.codigo_empleado_rep_ventas= e.codigo_empleado and e.codigo_oficina=o.codigo_oficina;
/*Ejercicio 5
Devuelve el nombre de los clientes que no hayan hecho pagos y el nombre de sus
representantes junto con la ciudad de la oficina a la que pertenece el representante.*/
select nombre_cliente,concat(e.nombre,' ',e.apellido1,' ',e.apellido2) as 'nombre_representante de venta', 
o.ciudad from cliente c inner join empleado e on (c.codigo_empleado_rep_ventas=e.codigo_empleado) inner join oficina o on (o.codigo_oficina=e.codigo_oficina)
where c.codigo_cliente not in(select codigo_cliente from pago);
/*Ejercicio 6
Lista la dirección de las oficinas que tengan clientes en Fuenlabrada.*/
select o.linea_direccion1 from oficina o inner join empleado e on (o.codigo_oficina = e.codigo_oficina) 
inner join cliente c on(c.codigo_empleado_rep_ventas=e.codigo_empleado) where c.ciudad in('Fuenlabrada');
/*Ejercicio 7
Devuelve el nombre de los clientes y el nombre de sus representantes junto con la ciudad
de la oficina a la que pertenece el representante.*/
select nombre_cliente,concat(e.nombre,' ',e.apellido1,' ',e.apellido2) as 'nombre_representante de venta', 
o.ciudad from cliente c inner join empleado e on (c.codigo_empleado_rep_ventas=e.codigo_empleado) inner join oficina o on (o.codigo_oficina=e.codigo_oficina)
where c.codigo_cliente in(select codigo_cliente from pago);
/*Ejercicio 8
Devuelve un listado con el nombre de los empleados junto con el nombre de sus jefes.*/
select concat(nombre,' ',apellido1,' ',apellido2) as EMPLEADO, puesto from empleado where codigo_empleado not in(codigo_jefe)
union 
select concat(nombre,' ',apellido1,' ',apellido2) as JEFE  from empleado where codigo_empleado in(codigo_jefe);
/*Ejercicio 9
Devuelve el nombre de los clientes a los que no se les ha entregado a tiempo un pedido.*/
select c.nombre_cliente from cliente c inner join pedido p on (c.codigo_cliente=p.codigo_cliente) where p.fecha_entrega < p.fecha_esperada;
/*Ejercicio 10
Devuelve un listado de las diferentes gamas de producto que ha comprado cada cliente.*/
select p.gama,c.nombre_cliente from producto p inner join detalle_pedido d on (p.codigo_producto=d.codigo_producto) 
inner join pedido pe on (pe.codigo_pedido=d.codigo_pedido)
inner join cliente c on (pe.codigo_cliente=c.codigo_cliente) where pe.codigo_cliente in(select codigo_cliente from cliente);
/*Ejercicio 11
Devuelve un listado que muestre solamente los clientes que no han realizado ningún pago.*/
select * from cliente c left join pago p on (c.codigo_cliente=p.codigo_cliente);
/*Ejercicio 12
Devuelve un listado que muestre solamente los clientes que no han realizado ningún
pedido.*/
select * from cliente c left join pedido p on (c.codigo_cliente=p.codigo_cliente) 
where NOT EXISTS (p.codigo_cliente);


/************* CONSULTA RESUMEN************
Ejercicio 1
¿Cuántos empleados hay en la compañía?*/
select count(nombre) as cantidad_de_empleados from empleado;
/*Ejercicio 2
¿Cuántos clientes tiene cada país?.*/
select count(codigo_cliente), pais from cliente group by(pais);
/*Ejercicio 3
¿Cuál fue el pago medio en 2009?.*/
select avg(total) from pago where year(fecha_pago) =2009;
/*Ejercicio 4
¿Cuántos pedidos hay en cada estado? Ordena el resultado de forma descendente por el
número de pedidos.*/
select estado, count(codigo_pedido) from pedido group by estado;
/*Ejercicio 5
Calcula el precio de venta del producto más caro y más barato en una misma consulta.*/
select max(precio_venta) as MAS_CARO, min(precio_venta) as MAS_BARATO from producto;
/*Ejercicio 6
Calcula el número de clientes que tiene la empresa.*/
select count(codigo_cliente) as cantidad_Clientes from cliente;
/*Ejercicio 7
¿Calcula cuántos clientes tiene cada una de las ciudades que empiezan por M?*/
select count(codigo_cliente) as cantidad_Clientes from cliente where ciudad like 'M%';

