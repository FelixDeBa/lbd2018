Use BDHotel

/*Lo siento maestro si cambiamos la base de datos y usamos la del equipo, está en github para descargarse,
 espero no tenga problemas :)*/

/*1.- SELECTS BASICOS CON CAMBIO EN NOMBRE DE COLUMNA, ALIAS Y USO DE FUNCIONES -------> 5   */
/* 1.1 */
select c.Nombre + ' ' + c.ApPat+ ' ' + c.ApMat as 'Nombre del cliente'
from Cliente as c

/* 1.2 */
Select d.*
from Departamento as d

/* 1.3 */
select SUBSTRING(CAST(d.fecha as varchar), 0, 12)  as Fecha
from Disponibilidad as d

/* 1.4 */
select s.nombre + ' $' + CAST(s.precio as varchar) as 'Precio por servicio'
from Servicio as S

/* 1.5 */
select n.HorasTrabajadas as 'Horas Trabajadas', ' $' + CONVERT(varchar, n.sueldoTotal) as 'Sueldo Total'
from Nomina as n







/* 2.- SELECTS CON JOIN (CROSS, INNER, LEFT, RIGHT)   -------> 4  */
/* 2.1 */
select e.idEmpleado, e.nomComp as 'Nombre del Empleado', d.nombre as Departamento, n.horasTrabajadas, n.sueldoTotal
from  Departamento as d cross join Empleado as e right join Nomina as n
on n.idEmpleado = e.idEmpleado AND d.idDepartamento = e.idDepartamento

/* 2.2 */
select e.nomComp as 'Nombre del Empleado', d.nombre as 'Departamento'
from Empleado as e inner join Departamento as d
on e.idDepartamento = d.idDepartamento

/* 2.3 */
select h.idHabitacion, h.clase, h.piso, h.costoDiario, r.diasReservados, h.costoDiario * r.diasReservados as precioTotal
from Habitacion as h left join Reservacion as r
on h.idHabitacion = r.idHabitacion
where r.diasReservados > 0

/* 2.4 */
select CAST(sv.fecha as varchar) as 'Fecha de Venta', s.nombre as 'Servicio vendido', s.precio as 'Subtotal', s.precio * 1.16 as 'Total'
from Servicio as s right join ServiciosVendidos as sv
on sv.idServicio = s.idServicio




/* 3.- SELECTS CON USO DE WHERE EN DIFERENTES TABLAS Y CAMPO UNO CON ORDER BY --------> 5*/
/* 3.1 */
select CAST(sv.fecha as varchar) as 'Fecha de Venta', s.nombre as 'Servicio vendido', s.precio as 'Subtotal', s.precio * 1.16 as 'Total'
from Servicio as s right join ServiciosVendidos as sv
on sv.idServicio = s.idServicio
where s.precio > 70 AND sv.fecha > '22/09/2018'
order by(s.precio) ASC

/* 3.2 */
select e.nomComp as 'Nombre del Empleado', d.nombre as 'Departamento'
from Empleado as e inner join Departamento as d
on e.idDepartamento = d.idDepartamento
Where e.apMat = 'Hernandez' OR e.apPat = 'Hernandez'

/* 3.3 */
select h.idHabitacion, h.clase, h.piso, h.costoDiario, r.diasReservados, h.costoDiario * r.diasReservados as precioTotal
from Habitacion as h left join Reservacion as r
on h.idHabitacion = r.idHabitacion
where r.diasReservados > 0 AND h.costoDiario > 1000

/* 3.4 */
select d.nombre as 'Departamento', n.sueldoPorHora
from Nomina as n left join Departamento as d
on n.idDepartamento = d.idDepartamento
where n.sueldoPorHora > 30 


/* 3.5 */
Select c.*
from Cliente as c
where nombre = 'Luis'





/* 4.- SELECTS CON USO DE FUNCIONES DE AGREGACION 3 GROUP BY Y 1 CON HAVING ---------> 5*/
/* 4.1 */
select MAX(e.edad) as 'Edad del empleado más viejo'
from Empleado as e

/* 4.2 */
select '#' + CAST(h.idHabitacion as varchar) + ' Clase: ' + h.clase as 'Habitación', MAX(r.diasReservados) as 'Reservas más amplia'
from Habitacion as h left join Reservacion as r
on h.idHabitacion = r.idHabitacion
group by('#' + CAST(h.idHabitacion as varchar) + ' Clase: ' + h.clase)
having MAX(r.diasReservados) > 5

/* 4.3 */
select COUNT(c.idCliente) as 'cantidad de clientes'
from Cliente as c

/* 4.4 */
select s.nombre, COUNT(sv.idSerVen) as 'Cant Serv Vendidos'
from Servicio as s inner join ServiciosVendidos as sv on s.idServicio = sv.idServicio
group by(s.nombre)


/* 4.5 */
select COUNT(r.idReservacion) as 'Cant reservaciones', estado
from Reservacion as r
group by estado
having estado = 'Disponible'




/* 5.- SELECTS CON JOIN Y GROUP BY ---------> 3 */
/* 5.1 */
select COUNT(r.idReservacion) as 'Cant reservaciones', r.estado, STDEV(h.costoDiario) as 'Desviación estándar del costo'
from Reservacion as r inner join Habitacion as h on h.idHabitacion = r.idHabitacion
group by estado
having estado = 'Disponible'


/* 5.2 */
select 'Servicio: ' + s.nombre + ' // Cliente que solicita: ' + c.nomComp as 'Venta de servicio', COUNT(sv.idSerVen) as 'Cant Serv Vendidos'
from Servicio as s inner join ServiciosVendidos as sv on s.idServicio = sv.idServicio
		inner join Venta as v on sv.idVenta = v.idVenta 
		inner join Cliente as c on c.idCliente = v.idCliente
group by('Servicio: ' + s.nombre + ' // Cliente que solicita: ' + c.nomComp)

/* 5.3 */
select COUNT(e.idEmpleado) as 'cant de Empleados', d.nombre
FROM Empleado as e
inner join Departamento as d on e.idDepartamento = d.idDepartamento
group by d.nombre



/*6.- SELECT INTO CON DROP TABLE Y REINSERTAR LAS FILAS ----> 1 */
Select idEmpleado, nombre, apPat, apMat, edad, idDepartamento 
into #empleadotmp
from Empleado

GO
select * from #empleadotmp
drop table #empleadotmp

