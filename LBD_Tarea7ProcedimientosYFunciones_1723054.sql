/*1. Procedimiento tipo script*/
/*1.1- Crea respaldo de la tabla clientes y borra dicho respaldo después de consultarlo para corroborar que el respaldo se crea correctamente
 (Y CON UN STORE PROCEDURE MÁS LARGO SE PODRÍAN RESPALDAR TODAS LAS TABLAS)*/
create procedure RespaldoTablaClientes
as
begin
	Select * into ClientesRespaldo from Cliente
	select * from ClientesRespaldo
	drop table ClientesRespaldo
end

exec RespaldoTablaClientes






/*2. Procedimientos que consultan reportes con parámetros*/

/*2.1- CONSULTA DE RESERVACIONES POR MES, SE PUEDE ELEGIR EL MES Y AÑO*/
create procedure ReservacionesPorMesAnio(@Fecha date)
as
begin
	select r.idReservacion, c.nomComp as 'Nombre del Cliente', r.fechaEntrada as 'Fecha de entrada reservacion', 
		r.fechaSalida as 'Fecha Salida Reservacion'
		from Cliente as c inner join Venta as v on c.idCliente = v.idCliente
			inner join VentaReservaciones as vr on vr.idVenta = v.idVenta
			inner join Reservacion as r on r.idReservacion = vr.idReservacion
		Where MONTH(r.fechaEntrada) = MONTH(@Fecha) AND YEAR(r.fechaEntrada) = YEAR(@Fecha)
end

/*Para poder notar un poco mejor los cambios es necesario hacer el siguiente update*/
update Reservacion 
set fechaEntrada = '19/09/2018'
where idReservacion = 5

exec ReservacionesPorMesAnio '10/10/2018'
exec ReservacionesPorMesAnio '10/09/2018'


/*2.2- Servicios vendidos en el mes filtrado por servicios*/
create procedure ServiciosVendidosPorNombre(@Servicio varchar(30))
as
begin
	select s.nombre, COUNT(sv.idSerVen) as 'Cantidad'
		from Servicio as s inner join ServiciosVendidos as sv on s.idServicio = sv.idServicio
		where MONTH(sv.fecha) = MONTH(GETDATE()) AND s.nombre = @Servicio	
		group by (s.nombre)
end

/*De nuevo, lo siento, para que se note un cambio real hay que realizar el siguiente update*/
update ServiciosVendidos
set fecha = GETDATE()
where idSerVen = 3

exec ServiciosVendidosPorNombre 'Reservación'
exec ServiciosVendidosPorNombre 'Lavanderia'

/*2.3.- Cantidad de empleados por departamento filtrado*/
create procedure EmpleadosPorDepartamento(@Dpto varchar(30))
as
begin
	select COUNT(e.idEmpleado) as 'cant de Empleados', d.nombre
	FROM Empleado as e
	inner join Departamento as d on e.idDepartamento = d.idDepartamento
	where d.nombre = @Dpto
	group by d.nombre
end

exec EmpleadosPorDepartamento 'Cocina'
exec EmpleadosPorDepartamento 'Limpieza'

/*2.4.- Habitaciones reservadas por clase*/
create procedure HabitacionesReservadasPorFecha(@fechaSalida date)
as
begin
	select h.idHabitacion, h.clase, h.piso, h.costoDiario, r.diasReservados, r.fechaEntrada, r.fechaSalida
	from Habitacion as h left join Reservacion as r
	on h.idHabitacion = r.idHabitacion
	where r.diasReservados > 0 AND r.fechaSalida = @fechaSalida
end

exec HabitacionesReservadasPorFecha '15/10/2018'
exec HabitacionesReservadasPorFecha '10/10/2018'

/*2.5.- Nomina por IDEmpleado*/
create procedure ConsultaDeNomina(@IdEmpleado int)
as
begin
	select e.idEmpleado, e.nomComp, d.nombre as Departamento, n.sueldoPorHora, n.HorasTrabajadas, n.sueldoTotal
	from Nomina as n inner join Empleado as e on e.idEmpleado = n.idEmpleado
	inner join Departamento as d on d.idDepartamento = e.idDepartamento
	where n.idEmpleado = @IdEmpleado
end

exec ConsultaDeNomina 1
exec ConsultaDeNomina 2





/*3 Funcion*/
/*3.1.- Funcion que devuelve la suma de los sueldos totales de todos los empleados */
Create function SueldosTotales()
returns int
as
begin
	declare @SueldoTotal int = (Select SUM(n.sueldoTotal) as 'Sueldo Total de Empleados' from Nomina as n)
	return @SueldoTotal
end

select dbo.SueldosTotales() as 'Suelto Total a Pagar'




	