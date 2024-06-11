create database certificadosFC
go

use certificadosFC
go


create table sexo(
sexoID int primary key identity,
nombre varchar(30) not null,
)

create table area(
areaID int primary key identity,
nombrearea varchar(100) not null,
)

create table subareas(
subID int primary key,
nombresub varchar(100) not null,
areaID int,

)
create table roles(
rolID int primary key,
nombrerol varchar(74) not null
)



create table usuario(
usuarioID int primary key identity,
nombrepr varchar(75) not null,
nombresec varchar(75),
ape_pat varchar(75),
ape_mat varchar(75),


)

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

create table domicilio(
iddomicilio char(8) primary key,
idusuario char(8) references usuario,
calle_ave_jir varchar(30),
iddepartamento char(2) references departamento,
idprovincia char(4) references provincia,
iddistrito char(6) references distrito,
indicaciones varchar(120),
numeroint varchar(30),
codpostal varchar(30),

)
go