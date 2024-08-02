create database sgrt;

use sgrt;

create table if not exists Tiposdoc(
iddoc tinyint primary key auto_increment,
tipo varchar (30) not null
);

create table if not exists Areas(
idarea tinyint primary key auto_increment,
nombre varchar(50) not null
);

create table if not exists Cargos(
idcargo tinyint primary key auto_increment,
nombre varchar (50) not null,
idarea tinyint,
foreign key (idarea) references Areas (idarea)
);

create table if not exists Departamentos(
iddep tinyint primary key auto_increment,
nombre varchar (30) not null
);

create table if not exists Ciudades(
idciudad int primary key auto_increment,
nombre varchar (50) not null,
iddep tinyint,
foreign key (iddep) references Departamentos (iddep)
);

create table if not exists Barrios(
idbarrio int primary key auto_increment,
nombre varchar (50) not null,
idciudad int,
foreign key (idciudad) references Ciudades (idciudad)
);

create table if not exists Sedes(
idsede tinyint primary key auto_increment,
direccion varchar (60) not null,
nombre varchar (50) not null,
telefono bigint not null,
idbarrio int,
foreign key (idbarrio) references Barrios (idbarrio)
);

#create table if not exists Roles(
#idrol tinyint auto_increment primary key,
#nombre varchar (10)
#);

create table if not exists Roles (
rol varchar(20) primary key);

create table if not exists Personas(
nodoc varchar (12) primary key,
pnom varchar (50) not null,
snom varchar(50),
pape varchar(50) not null,
sape varchar(50),
correo varchar(70) not null,
celular varchar(20),
pass  varchar(255),
idrol tinyint,
idcargo tinyint,
idsede tinyint,
iddoc tinyint,
estado boolean,
role varchar(20),
constraint fk_idcargo  foreign key (idcargo) references Cargos (idcargo),
constraint fk_idsede foreign key (idsede) references Sedes (idsede),
constraint fk_iddoc foreign key (iddoc) references Tiposdoc (iddoc),
constraint fk_role foreign key (role) references Roles (rol)
#constraint fk_idrol foreign key (idrol) references Roles (idrol)
);

create table if not exists Categorias(
idcat tinyint auto_increment,
nombre varchar (30),
primary key (idcat)
);

create table if not exists Estados(
idest tinyint auto_increment,
nombre varchar (30),
primary key (idest)
);

create table if not exists Solicitudes(
idsol bigint auto_increment,
fechacre varchar(20),
fechaci varchar(20),
prio tinyint, 
obser varchar(255),
diag varchar(255),
idest tinyint,
nodoccliente varchar(12),
nodoctecnico varchar(12),
idcat tinyint,
primary key (idsol),
constraint fk_idest foreign key (idest) references Estados (idest),
constraint fk_nodoccliente foreign key (nodoccliente) references Personas (nodoc),
constraint fk_nodoctecnico foreign key (nodoctecnico) references Personas (nodoc),
constraint fk_idcat foreign key (idcat) references Categorias (idcat)
);

create table if not exists Modulos(
id int auto_increment primary key,
label varchar(50),
icon varchar(100),
_to varchar(100)
);

create table if not exists rol_modulos(
id int auto_increment primary key,
moduloid int,
rolid varchar(20),
constraint fk_modulo foreign key (moduloid) references Modulos (id),
constraint fk_rol foreign key (rolid) references Roles (rol)
);

delimiter //

create trigger insert_solicitud
before insert on Solicitudes
for each row
begin
    declare num_solicitudes_abiertas int;

    -- contar el número de solicitudes abiertas para la persona
    select count(*) into num_solicitudes_abiertas
    from solicitudes
    where nodoccliente = new.nodoccliente and idest <> 5;

    -- verificar si el límite de 5 solicitudes abiertas ha sido alcanzado
    if num_solicitudes_abiertas >= 5 then
        signal sqlstate '45000'
        set message_text = 'no se puede crear una nueva solicitud, límite de 5 solicitudes abiertas alcanzado.';
    end if;
end;
//

delimiter ;
	

create table if not exists Tiposactivo(
idtipo smallint primary key auto_increment,
nombre varchar(50)
);

create table if not exists Marcasactivo(
idmarca smallint primary key auto_increment,
nombre varchar(50)
);

create table if not exists Activos(
idserial varchar(50) primary key,
modelo varchar(50),
idtipo smallint,
idmarca smallint,
constraint fk_idtipo foreign key (idtipo) references Tiposactivo (idtipo),
constraint fk_idmarca foreign key (idmarca) references Marcasactivo (idmarca) 
);

create table if not exists Solicitudesactivo(
id int auto_increment primary key,
sidsol bigint,
aserial varchar(50),
obser varchar(255),
constraint fk_sidsol foreign key (sidsol) references Solicitudes (idsol),
constraint fk_aserial foreign key (aserial) references Activos (idserial)
);


create table if not exists Asignaciones(
id int auto_increment primary key,
idserial varchar(50),
nodoc varchar(12),
fechae date,
fechad date,
constraint fk_aidserial foreign key (idserial) references Activos (idserial),
constraint fk_pnodoc foreign key (nodoc) references Personas (nodoc)
);

DELIMITER //

create PROCEDURE Categoriasnombre()
BEGIN
 select C.nombre as idcat
 from solicitudes as s
 inner join categorias as C on C.idcat = S.idcat;

END//

DELIMITER ;

