select nombre from producto;
select nombre, precio from producto;
select * from producto;
select nombre, round(precio) as 'Precio REDONDEADO' from producto;
select codigo_fabricante, nombre from producto;
select distinct codigo_fabricante from producto;
select nombre from fabricante order by nombre;
select nombre,precio from producto order by nombre,precio desc;
select * from fabricante limit 5;
select * from producto order by precio limit 1;
select nombre, precio from producto order by precio desc limit 1;
select nombre,precio from producto where precio <= 120;
select * from producto where precio between 60 and 200;
select * from producto where codigo_fabricante in (1,3,5);
select * from producto where nombre like 'Portatil%';
select p.nombre, p.precio, p.codigo, p.codigo_fabricante, f.nombre , f.codigo from producto p inner join fabricante f ON p.codigo_fabricante = f.codigo;
select p.nombre, p.precio, f.nombre from producto p inner join fabricante f on p.codigo_fabricante= f.codigo order by f.nombre;
select f.nombre, p.nombre, p.precio from producto	p inner join fabricante f on p.codigo_fabricante= f.codigo order by  p.precio limit 1;
select * from producto p inner join fabricante f on p.codigo_fabricante = f.codigo where f.nombre= 'Lenovo';
select * from producto p inner join fabricante f on p.codigo_fabricante = f.codigo where f.nombre= 'Crucial'and precio < 200;
select * from producto p inner join fabricante f on p.codigo_fabricante = f.codigo where f.nombre in ('Asus', 'Hewlett-Packard');
select p.nombre, p.precio, f.nombre from producto p inner join fabricante f on p.codigo_fabricante = f.codigo where precio > 180 order by p.precio,p.nombre;
select * from fabricante f left join producto p on f.codigo = p.codigo_fabricante;
select * from fabricante f where not exists (select f.codigo from producto p where f.codigo = p.codigo_fabricante);
select * from fabricante f, producto p where p.codigo_fabricante <> f.codigo;
select * from producto p where exists (select p.codigo from fabricante f where f.codigo = p.codigo_fabricante and f.nombre='Lenovo');
select * from producto p , fabricante f where p.codigo_fabricante = f.codigo and f.nombre='Lenovo';
select * from producto p , fabricante f where p.codigo_fabricante = f.codigo and p.precio = (SELECT MAX(p.precio) FROM producto where f.nombre='Lenovo');
/*eje subconsulta 1*/

select p.nombre from producto p, fabricante f where p.codigo_fabricante = f.codigo = (SELECT MAX(p.precio) FROM producto where f.nombre='Lenovo');
select p.nombre , MAX(p.precio) from producto p, fabricante f where p.codigo_fabricante = f.codigo and f.nombre = 'Lenovo';
select fabricante.codigo from fabricante where fabricante.nombre like '%Lenovo';
select producto.nombre , producto.precio from producto where codigo_fabricante = (select fabricante.codigo from fabricante where fabricante.nombre like '%Lenovo') order by precio desc limit 1;

select * from producto p, fabricante f where  p.codigo_fabricante = f.codigo and f.nombre = 'Lenovo';

select p.nombre , f.nombre , p.precio  from producto p , fabricante f where f.nombre= 'Asus'and p.precio = (Select avg(p.precio) from producto where f.nombre='Asus');
Select avg(p.precio) as promedio from producto p, fabricante f where  p.codigo_fabricante = f.codigo and f.nombre= 'Asus';
select avg(p.precio) as promedio, f.nombre , p.precio from producto p , fabricante f where p.codigo_fabricante = f.codigo and f.nombre='Asus';
select distinct f.nombre from fabricante f, producto p where f.codigo not in(select distinct p.codigo_fabricante from producto p);
select distinct codigo_fabricante from producto;
select fabricante.nombre from fabricante where codigo not in (select distinct codigo_fabricante from producto);
select nombre from fabricante group by nombre having nombre='Lenovo';
select fabricante.nombre from fabricante , producto group by producto.codigo_fabricante having count(producto.codigo_fabricante) = (select codigo_fabricante from producto p, fabricante f where f.codigo= p.codigo_fabricante and f.nombre='Lenovo');

select count(codigo_fabricante) from producto group by codigo_fabricante having count(codigo_fabricante) = count(((select codigo_fabricante from producto where codigo_fabricante = (select codigo from fabricante where nombre = 'Lenovo'));

select codigo_fabricante from producto p, fabricante f where f.codigo= p.codigo_fabricante and f.nombre='Lenovo';


