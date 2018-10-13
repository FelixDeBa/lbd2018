/* 1.- SUBCONSULTAS -------> 3 */
/* 1.1 ----> Muestra todos los servicios y la cantidad de veces que se vendieron que tengan la vocal 'a' en su nombre
 de servicio, ¿Porque?, porque no encontraba algo mejor sobre que trabajar la otra consulta */
Select *
from
	( select s.nombre, COUNT(sv.idSerVen) as 'Cantidad'
	from Servicio as s inner join ServiciosVendidos as sv on s.idServicio = sv.idServicio
	group by(s.nombre) ) as GN
where GN.nombre like '%a%'

/* 1.2 ----------------->  Muestra las habitaciones que han sido reservadas*/
Select * 
from (
	select h.idHabitacion, h.clase, h.piso, h.costoDiario, r.diasReservados, h.costoDiario * r.diasReservados as precioTotal
	from Habitacion as h left join Reservacion as r
	on h.idHabitacion = r.idHabitacion
) as CH
where CH.precioTotal > 0

/* 1.3 * --->Devuelve cuantos empleados de 25 años hay */
select top 1 *
from
    (
	select Edad, (
			select count(EDAD)
			from Empleado as e
			where e.edad = 25
		     ) as 'Cantidad'
	from Empleado
	) as NC
where NC.Cantidad > 1




/* 2.- SUBONSULTA CON WITH ------> 1 */
/* 2.1 ----> Muestra todos los servicios y la cantidad de veces que se vendieron que tengan la vocal 'a' en su nombre de servicio*/
with Cantidades as (
	select s.nombre, COUNT(sv.idSerVen) as 'Cantidad'
	from Servicio as s inner join ServiciosVendidos as sv on s.idServicio = sv.idServicio
	group by(s.nombre) )
select *
from Cantidades
where Cantidades.nombre like '%a%'


/*3.- Vistas -------> 5*/
/* 3.1 */
create view ReservacionesDelMes as(
	select r.idReservacion, c.nomComp as 'Nombre del Cliente', r.fechaEntrada as 'Fecha de entrada reservacion', 
	r.fechaSalida as 'Fecha Salida Reservacion'
	from Cliente as c inner join Venta as v on c.idCliente = v.idCliente
		inner join VentaReservaciones as vr on vr.idVenta = v.idVenta
		inner join Reservacion as r on r.idReservacion = vr.idReservacion
	Where MONTH(r.fechaEntrada) = MONTH(GETDATE())
)

/*Profesor, no tenía en mi base de datos reservaciones de este mes, para que se mostraran resultados al ejecutar
la vista tuve que hacer algunos update en la base de datos para que mostrara algo*/

update Reservacion
set fechaSalida = '9/10/2018', fechaEntrada = '1/10/2018'
where idReservacion = 2

update Reservacion
set fechaSalida = '15/10/2018', fechaEntrada = '10/10/2018'
where idReservacion = 5

select * from ReservacionesDelMes

/* 3.2   REPORTE MENSUAL DE SERVICIOS VENDIDOS*/
create view ReporteMensualServiciosVendidos as (
	select s.nombre, COUNT(sv.idSerVen) as 'Cantidad'
	from Servicio as s inner join ServiciosVendidos as sv on s.idServicio = sv.idServicio
	where MONTH(sv.fecha) = MONTH(GETDATE())	
	group by (s.nombre)
)

select * from ReporteMensualServiciosVendidos


/* 3.3  ---> Cantidad de Empleados disponibles por cada departamento */
create view CantidadDeEmpleadosPorDepartamento as(
	select COUNT(e.idEmpleado) as 'cant de Empleados', d.nombre
	FROM Empleado as e
	inner join Departamento as d on e.idDepartamento = d.idDepartamento
	group by d.nombre
)

select * from CantidadDeEmpleadosPorDepartamento


/* 3.4 ----> Habitaciones actualmente reservadas*/
create view HabitacionesReservadas as (
	select h.idHabitacion, h.clase, h.piso, h.costoDiario, r.diasReservados, r.fechaEntrada, r.fechaSalida
	from Habitacion as h left join Reservacion as r
	on h.idHabitacion = r.idHabitacion
	where r.diasReservados > 0 AND r.fechaSalida > GETDATE()
)

select * from HabitacionesReservadas

/*Estoy consciente de que las fechas de entrad y salida no concuerdan con los días reservados:P
cuando hice los inserts no estaba consciente de ello*/


/* 3.5 ----> Pago general de nóminas */
create view PagoGeneraldeNominas AS (
select e.idEmpleado, e.nomComp, d.nombre as Departamento, n.sueldoPorHora, n.HorasTrabajadas, n.sueldoTotal
	from Nomina as n inner join Empleado as e on e.idEmpleado = n.idEmpleado
	inner join Departamento as d on d.idDepartamento = e.idDepartamento
)

select * from PagoGeneraldeNominas



/* 4.- Consulta dinámica -------> 1 */
/*4.1 ---> Consulta de tu nómina*/
declare @ConsultaTuNomina nvarchar(MAX)
declare @PARAMETROS nvarchar(MAX)
set @PARAMETROS = N'@idEmpleado INT'
set @ConsultaTuNomina = 'select e.idEmpleado, e.nomComp, d.nombre as Departamento, n.sueldoPorHora, n.HorasTrabajadas, n.sueldoTotal
	from Nomina as n inner join Empleado as e on e.idEmpleado = n.idEmpleado
	inner join Departamento as d on d.idDepartamento = e.idDepartamento
	where e.idEmpleado = @idEmpleado'
Exec sp_ExecuteSQL @ConsultaTuNomina, @PARAMETROS, 2

/*Se me fue de las manos investigar este tema y terminé investigando y medio entendiendo las consultas
dinámicas con parámetros y con sp_ExecuteSQL*/