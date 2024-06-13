IF EXISTS (SELECT * FROM sys.databases WHERE name = 'certificadosFC')
begin
use master
DROP DATABASE certificadosFC;
end
else
begin
create database certificadosFC
use certificadosFC
end
go


create table area(
areaID int primary key identity,
nombrearea varchar(100) not null
)
go
create table subareas(
subID int primary key,
nombresub varchar(100) not null,
areaID int,
constraint fk_area_sub foreign key (areaID)
references area(areaID)

)
go
create table roles(
rolID int primary key,
nombrerol varchar(74) not null,
descripcion varchar(150),
areaID int,
constraint fk_rol_are foreign key (areaID)
references area(areaID))
go

create table sexo(
sexoID int primary key identity,
nombre varchar(30) not null
)
go


create table departamento(
iddepartamento char(2) primary key,
nombredep varchar(30)
)
go
create table provincia(
idprovincia char(4) primary key,
nombrepro varchar(30),
iddepartamento char(2),
constraint fk_pro_dep foreign key(iddepartamento)
references departamento(iddepartamento)
)
go

create table distrito(
iddistrito char(6) primary key,
nombredis varchar(45),
idprovincia char(4),
iddepartamento char(2),
constraint fk_dis_pro foreign key(idprovincia)
references provincia(idprovincia),
constraint fk_dis_dep foreign key(iddepartamento)
references departamento(iddepartamento)

)
go

create table estado(
estadoID int primary key,
nombreestado varchar(25),
fechaestimada date default null
)

create table usuario(
usuarioID int primary key identity,
nombrepr varchar(75) not null,
nombresec varchar(75),
ape_pat varchar(75),
ape_mat varchar(75),
correo varchar(50) not null,
fechaing date not null,
fechafin date not null,
edad int,
celular char(9),
profesion varchar(50) default null,
estadoID int,
iddepartamento char(2),
iddistrito char(6),
idprovincia char(4),
sexo int,
areaID int,
subID int,
rolID int,
constraint fk_usu_dep foreign key(iddepartamento)
references departamento(iddepartamento),
constraint fk_usu_pro foreign key(idprovincia)
references provincia(idprovincia),
constraint fk_usu_dis foreign key(iddistrito)
references distrito(iddistrito),
constraint fk_usu_est foreign key(estadoID)
references estado(estadoID),
constraint fk_usu_sexo foreign key(sexo)
references sexo(sexoID),
constraint fk_usu_area foreign key(areaID)
references area(areaID),
constraint fk_usu_sub foreign key(subID)
references subareas(subID),
constraint fk_usu_rol foreign key(rolID)
references roles(rolID)

)
go

create table desempeno(
usuarioID int,
actividades int,
responsabilidad int,
comunicacion int,
participacion int,
puntualidad int,
fechainicio date not null,
fechfin date not null,
constraint fk_des_usu foreign key(usuarioID)
references usuario(usuarioID)
)
go

ALTER TABLE usuario
ADD funciones varchar(200) null
go


create table asistencias(
usuarioID int,
primermes int,
segundomes int,
tercermes int,
cuartomes int,
constraint fk_asis_usu foreign key(usuarioID)
references usuario(usuarioID)
)
go