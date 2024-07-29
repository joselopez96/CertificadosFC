create database DB_FundacionCalma
go
use DB_FundacionCalma
go


CREATE TABLE [Modelo] (
    [NombreCompleto] nvarchar(100),
    [DNI] nvarchar(8),
    [Genero] nvarchar(12),
    [FechaNacimiento] datetime,
    [Edad] int,
    [Telefono] nvarchar(12),
    [Correo] nvarchar(100),
    [Direccion] nvarchar(150),
    [Distrito ] nvarchar(70),
    [Provincia] nvarchar(70),
    [Foto] nvarchar(255),
    [Universidad_Instituto] nvarchar(70),
    [Correoinstitucional] nvarchar(100),
    [Codigo_alumno] nvarchar(25),
    [Carrera] nvarchar(120),
    [ModalidadIngreso] nvarchar(30),
    [Tipo_practicas] nvarchar(30),
    [Area_UN] nvarchar(80),
    [Subarea] nvarchar(120),
    [Puesto] nvarchar(80),
    [Fechaing] datetime,
    [Fechasalida] datetime,
    [Horario] nvarchar(255),
    [Habilidades_Conocimiento] nvarchar(255),
    [Expectativas] nvarchar(255),
    [Linkedin] nvarchar(80)
)