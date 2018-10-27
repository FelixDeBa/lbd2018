/*Tarea 8 crear 3 triggers, 1 update, 1 insert y 1 delete.
uno de los triggers debe ser insted, el otro after y el ultimo es libre*/
use BDHotel


/*Antes de borrar un registro de la tabla reservación nos muestra que registro estabamos borrando*/
/*trigger after y delete*/
Create Trigger CancelarReservacion
on Reservacion
after delete
as
begin
	select * from deleted
end
delete from Reservacion where idReservacion = 1
select * from Reservacion


/*Guarda un log que nos indica que se intentó modificar una venta en tal fecha*/
/*Trigger update e instead of*/
/*Para ejecutar este trigger es necesario crear la siguiente tabla*/
create table logActualizacionesVentas(
	idlog int primary key identity not null,
	fecha date not null,
	aviso varchar(200) not null
)


Create trigger ActualizarVenta
on Venta
instead of update
as
begin
	insert into logActualizacionesVentas(fecha, aviso) values(CAST(GETDATE() as date), 'Se intentó modificar una venta')
end

drop trigger ActualizarVenta
update Venta
set idCliente = 2
where 1=1
select * from Venta
Select * from logActualizacionesVentas


/*Permite ver que insertamos en una tabla justo antes de insertarlo*/
/*trigger insert y after*/
create trigger verNuevoEmpleado
on Empleado
after insert
as
begin
	select * from inserted
end
insert into Empleado(idEmpleado, nombre, apPat, apMat, edad, idDepartamento) values (99, 'Ernesto', 'Lopez', 'Villareal', 19, 3)
select * from Empleado