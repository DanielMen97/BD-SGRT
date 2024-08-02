insert modulos (label, icon, _to)
values ("Home","fas fa-house-chimney","/home"),
("Solicitudes","fas fa-comments","/solicitudes"),
("Usuarios","fas fa-users-gear","/usuarios"),
("Activos","fas fa-cubes","/activos"),
("Estadisticas","fa-solid fa-chart-pie","/estadisticas"),
("Asignaciones","fas fa-comment-dots","/asignaciones");

Insert roles (rol)
values ("ADMIN"),
("USER"),
("TECHNICAL");

insert rol_modulos (moduloid, rolid)
values (1, "ADMIN"),
(2, "ADMIN"),
(3, "ADMIN"),
(4, "ADMIN"),
(5, "ADMIN"),
(6, "TECHNICAL"),
(4, "TECHNICAL"),
(2, "USER");

Insert tiposdoc (iddoc, tipo)
values (1, "Cedula de Ciudadanía"),
(2, "Tarjeta de Identidad"),
(3, "Cédula de Extranjería"),
(4, "Pasaporte");

insert Areas (Nombre)
values ("Recursos Humanos (RRHH)"),
("Tecnologías de la Información (TI)"),
("Logística y Distribución"),
("Contabilidad"),
("Servicio al Cliente");

insert Cargos (IdArea, Nombre)
values (1,"Especialista en Recursos Humanos"),
(1,"Coordinador de Capacitación"),
(1,"Analista de Nómina"),
(2,"Desarrollador de Software"),
(2,"Supervisor de Sistemas"),
(2,"Tecnico de Soporte"),
(3,"Coordinador de Logística"),
(3,"Especialista en Cadena de Suministro"),
(3,"Operador de Almacén"),
(4,"Contador Senior"),
(4,"Analista Financiero"),
(4,"Auditor Interno"),
(5,"Representante de Servicio al Cliente"),
(5,"Asesor SAC"),
(5,"Coordinador de Atención al Cliente");

INSERT Departamentos (Nombre)
VALUES ("Amazonas"),
("Antioquia"),
("Arauca"),
("Atlántico"),
("Bolívar"),
("Boyacá"),
("Caldas"),
("Caquetá"),
("Casanare"),
("Cauca"),
("Cesar"),
("Chocó"),
("Córdoba"),
("Cundinamarca"),
("Guainía"),
("Guaviare"),
("Huila"),
("La Guajira"),
("Magdalena"),
("Meta"),
("Nariño"),
("Norte de Santander"),
("Putumayo"),
("Quindío"),
("Risaralda"),
("San Andrés y Providencia"),
("Santander"),
("Sucre"),
("Tolima"),
("Valle del Cauca"),
("Vaupés"),
("Vichada");

insert Ciudades (Nombre, IdDep)
values ("Bogota",14),
("Medellin",2),
("Cali",30);

insert barrios (Nombre, IdCiudad)
values ("San Antonio",1),
("El Peñón",2),
("Granada",3),
("Ciudad Jardín",3),
("Versalles",2),
("El Poblado",2),
("Laureles",3),
("Envigado",2),
("Belén",3),
("Buenos Aires",3),
("Chapinero",1),
("Usaquén",1),
("Teusaquillo",1),
("Suba",1),
("Engativa",1);

insert Sedes (Direccion, Nombre, Telefono, IdBarrio)
values ("Carrera 13 # 71a - 15","Sede Chapinero",3168168947,1),
("Calle 9 # 43 - 08","Sede Poblado",3142258990,6),
("Calle 152 # 94 bis - 32","Sede Suba",3012373448,14);


insert Estados (Nombre)
values ("Asignada"),
("En curso"),
("Sin asignar"),
("Por confirmar"),
("Cerrada");

insert Categorias (Nombre)
values ("Software"),
("Hardware"),
("Conexion");

insert TiposActivo (Nombre)
Values ("Teclado"),
("Mause"),
("Monitor"),
("Portatil"),
("Cpu"),
("Cable VGA"),
("Adaptador"),
("Diadema");

Insert MarcasActivo (Nombre)
Values ("Logitech"),
("Microsoft"),
("HP (Hewlett-Packard)"),
("Dell"),
("ASUS"),
("Acer"),
("Lenovo"),
("Razer"),
("Corsair"),
("SteelSeries"),
("Apple"),
("Sony"),
("Samsung"),
("LG"),
("Toshiba"),
("MSI (Micro-Star International)"),
("Alienware (de Dell)"),
("HyperX"),
("Kingston"),
("AOC"),
("BenQ"),
("Sennheiser"),
("Bose"),
("JBL"),
("Anker"),
("Razor"),
("Roccat"),
("Creative"),
("Genius"),
("Thermaltake");














