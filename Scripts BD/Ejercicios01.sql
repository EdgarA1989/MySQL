select * from empleado;
select * from departamento;
select nombre_depto from departamento;
select nombre, salario from empleado;
select comision from empleado;
select * from empleado where cargo = 'secretaria';
select * from empleado where cargo = 'vendedor' order by nombre;
select nombre, cargo from empleado order by salario;
select nombre, cargo from empleado;
select salario, comision from empleado where id_depto = 2000 order by comision;
select sum(salario+comision+500) from empleado where id_depto = 3000 order by nombre;
select nombre from empleado where nombre like 'J%';
select salario, comision, nombre, sum(salario+comision) as 'comision total' from empleado where comision > 400000;
select salario, comision, nombre from empleado where comision = 0;
select nombre, comision, salario from empleado where comision > salario;
select nombre, comision, salario from empleado where comision <= (salario*30/100);
select nombre from empleado where nombre like '%MA%';
select nombre_depto from departamento where nombre_depto in ('ventas','investigacion','mantenimiento');
select nombre_depto from departamento where nombre_depto not in  ('ventas','investigacion','mantenimiento');
select nombre,max(salario) from empleado; 
select nombre from empleado order by nombre desc limit 1;
select max(salario), min(salario), (max(salario) - min(salario)) as 'diferencia salario' from empleado;
select id_depto,salario, avg(salario) as 'vta promedio x dpto' from empleado group by id_depto;
select count(nombre) as 'cantidad emp x depto', id_depto from empleado group by id_depto having count(nombre)>3;  
select * from empleado;
select count(id_empleado) as 'empleados a cargo',cod_jefe,nombre from empleado  group by cod_jefe having count(id_empleado)>=2 ;
select cod_jefe,nombre,cargo from empleado where cargo like '%Jefe%';
select nombre from empleado where id_depto = 0;
select avg (salario) from empleado;
select id_depto,nombre,salario from empleado where salario >= (select avg(salario) from empleado) order by id_depto;





 