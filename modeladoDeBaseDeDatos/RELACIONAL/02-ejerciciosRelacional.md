# ejercicios 
create database bdconstraints;
go 

use bdconstraints;
go

-- razon de cardinalidad de 1 a 1
create table paciente (
numpaciente int not null,
nombre varchar(30) not null,
apellido1  varchar(20) not null,
apellido2  varchar(20) null,
fechanaci date not null,
constraint pk_paciente
primary key (numpaciente)
);

go

create table expediente(
numexp int not null,
fechapertura date not null,
tipodesangre char(30) not null,
paciente int not null,
constraint pk_expediente
primary key (numexp),
constraint unique_numpaciente
unique(paciente),
constraint fk_expediente_paciente
foreign key (paciente)
references paciente(numpaciente)
);
go

insert into paciente 
values (1, 'kevin', 'kosner', 'lopez' ,'2007-02-18');

insert into paciente 
values (2, 'daniel', 'martinez', 'mendoza' ,'2005-01-30');

insert into paciente 
values (3, 'alfonso' ,'cruz', 'meses' ,'2006-08-12');

select *
from expediente;

insert expediente
values (1,GETDATE(),'+O', 1);

insert expediente
values (2,GETDATE(),'+A', 2);

insert expediente
values (3,GETDATE(),'+O', 3);

select e.numexp,
       e.fechapertura,
       e.tipodesangre,
       concat(p.nombre,'',p.apellido1,'',p.apellido2)
       as [nombre completo]

from expediente as e
inner join paciente as p
on e.paciente = p.numpaciente;


-- razon de cardinalidad de 1 a n 
create table profesor (
numprof int not null identity(1,1) primary key,
nombre varchar(50) not null,
apellido1 varchar(30) not null,
apellido2 varchar(30)
);
go

create table curso(
numcurso int not null,
nombre varchar(20) not null,
creditos int not null,
numprof int not null,
constraint pk_curso
primary key (numcurso),
constraint unique_nombre
unique (nombre),
constraint check_creditos
check (creditos>0),
constraint fk_curso_profesor
foreign key (numprof)
references profesor (numprof)
);
go

create table especialidad (
numesp int not null,
numprof int not null,
nombreEsp varchar(30) not null,
constraint pk_especialidad 
primary key (numesp, numprof),
constraint unique_nombreEsp
unique (nombreEsp),
constraint fk_especialidad_profesor
foreign key (numprof)
references profesor (numprof)
); 
go