create table alumno(
id_alumno int not null primary key,
nombre varchar (30)not null,
apellido_1 varchar (15) not null,
apellido_2 varchar (15) null,
telefono varchar (13),
calle varchar (50) not null,
numero_interior int,
numero_exterior int,
fecha_naci date not null,
);

insert into alumno
values (1, 'kevin','kosner', null, '+527731340995','infierno', 666, null,'2007-02-18');

insert into alumno(id_alumno,nombre,apellido_1,calle,fecha_naci)
values (2, 'jose luis','galalrdo', 'angel', '1983-04-06');

insert into alumno(id_alumno,nombre,apellido_1,apellido_2,calle ,fecha_naci)
values (3,'jimena','valadez','delgadillo', 'flor de mayo', '2007-06-12');


select *,datediff(year,fecha_naci,getdate()) as edad
from alumno


--razon de cardinalidad 1:N
create table categoria2(
categoria_id int not null primary key,
nombre varchar (20)not null,
);

create table productos2(
producto_id int not null primary key,
nombre varchar (30)not null,
precio money not null,
existencia int not null,
categoria_id int null,
constraint fk_producto2_categoria2
foreign key (categoria_id)
references categoria2(categoria_id)
);

select * from categoria2;

select * 
from categoria2;

select *
from productos2
where categoria_id =1;
