-- ============================================================
-- SCRIPT DE CREACION DE LA BASE DE DATOS PARA PROYECTO: GESTIÓN DE FLOTA VEHICULAR
-- Autor: Eliu Asencio
-- Descripción: Creacion detallada y documentada de la Base de Datos y sus entidades.
-- ============================================================


-- Crear base de datos para la gestión de una flota vehicular
create database Flota;
use Flota;

-- Tabla de roles de los empleados (ej. conductor, mecánico, etc.)
create table Rol 
(
	Id_Rol int primary key, -- Identificador único del rol
	Departamento varchar(60) -- Nombre del departamento al que pertenece el rol
);

-- Tabla de empleados que forman parte de la flota
create table Empleado
(
	DPI varchar(14) primary key, -- Identificador único del empleado (DPI)
	Nombre varchar(75), -- Nombre del empleado
	Apellido varchar(75), -- Apellido del empleado
	Licencia varchar(20), -- Tipo o número de licencia de conducir
	Rol_Id int, -- Referencia al rol del empleado
	Estado varchar(30), -- Estado laboral del empleado
	IGSS varchar(30), -- Número o código de afiliación al IGSS
	
	-- Clave foránea que relaciona el empleado con su rol
	constraint fk_Empleado_Rol foreign key(Rol_Id) references Rol(Id_Rol),
	
	-- Restricción para validar los estados permitidos del empleado
	constraint chk_Empleado_Estado check (Estado in('activo','inactivo','vacaciones'))
);

-- Tabla de marcas de vehículos
create table Marca
(
	Id_Marca int primary key, -- Identificador único de la marca
	nombre varchar(75) -- Nombre de la marca
);

-- Tabla de modelos de vehículos
create table Modelo
(
	Id_Modelo int primary key, -- Identificador único del modelo
	nombre varchar(75) -- Nombre del modelo
);

-- Tabla de estaciones de servicio o gasolineras
create table Gasolinera
(
	Id_Estacion int primary key, -- Identificador único de la estación
	nombre varchar(75), -- Nombre de la estación
	direccion varchar(300) -- Dirección física de la estación
);

-- Tabla de vehículos pertenecientes a la flota
create table Vehiculo
(
	Id_Vehiculo varchar(10) primary key, -- Identificador único del vehículo (placa, por ejemplo)
	Marca_Id int, -- Referencia a la marca
	Modelo_Id int, -- Referencia al modelo
	Frecuencia_Mantenimiento decimal(12,2), -- Kilómetros entre mantenimientos
	Presupuesto_Mensual_Mantenimiento decimal(12,2), -- Presupuesto mensual para mantenimiento
	Presupuesto_Mensual_Combustible decimal(12,2), -- Presupuesto mensual para combustible
	Estado varchar(40), -- Estado operativo del vehículo
	Km_Ultimo_Mantenimiento decimal(12,2), -- Kilometraje al último mantenimiento
	Km_Total decimal(12,2), -- Kilometraje total del vehículo
	
	-- Claves foráneas para marca y modelo del vehículo
	constraint fk_Vehiculo_Marca foreign key(Marca_Id) references Marca(Id_Marca),
	constraint fk_Vehiculo_Modelo foreign key(Modelo_Id) references Modelo(Id_Modelo),

	-- Restricción para validar estados válidos del vehículo
	constraint chk_Vehiculo_Estado check (Estado in('activo','inactivo','mantenimiento','averiado'))
);

-- Tabla de rutas realizadas por los vehículos
create table Ruta
(
	Id_Ruta int primary key, -- Identificador único de la ruta
	Km_Inicial decimal(12,2), -- Kilometraje inicial del recorrido
	Km_Final decimal(12,2), -- Kilometraje final del recorrido
	Vehiculo_Id varchar(10), -- Vehículo utilizado en la ruta
	Fecha_Inicial date, -- Fecha de inicio del recorrido
	Fecha_Final date, -- Fecha de finalización del recorrido
	Destino_Inicial varchar(75), -- Punto de partida
	Destino_Final varchar(75), -- Destino final
	Responsable_DPI varchar(14), -- DPI del empleado responsable
	
	-- Claves foráneas para vehículo y empleado responsable
	constraint fk_Ruta_Vehiculo foreign key(Vehiculo_Id) references Vehiculo(Id_Vehiculo),
	constraint fk_Ruta_Empleado foreign key(Responsable_DPI) references Empleado(DPI)
);

-- Tabla de registros de carga de combustible
create table Combustible
(
	Id_Combustible int, -- Identificador del registro de combustible
	Factura_Numero varchar(100), -- Número de la factura
	Ruta_Id int, -- Ruta asociada a la carga
	Tipo_Combustible varchar(30), -- Tipo de combustible (super, diesel, regular)
	Cantidad_Galones decimal(5,2), -- Cantidad de galones cargados
	precio decimal(12,2), -- Precio total o por galón
	Fecha_Carga date, -- Fecha en que se realizó la carga
	Estacion_Id int, -- Estación de servicio utilizada
	Vehiculo_Id varchar(10), -- Vehículo que recibió el combustible

	-- Claves foráneas para relacionar con otras tablas
	constraint fk_Combustible_Vehiculo foreign key(Vehiculo_Id) references Vehiculo(Id_Vehiculo),
	constraint fk_Combustible_Ruta foreign key(Ruta_Id) references Ruta(Id_Ruta),
	constraint fk_Combustible_Gasolinera foreign key(Estacion_Id) references Gasolinera(Id_Estacion),

	-- Restricción para validar tipos de combustible permitidos
	constraint chk_Combustible_Tipo check (Tipo_Combustible in('super','diesel','regular'))
);

-- Tabla de talleres mecánicos
create table Taller
(
	Id_Taller int primary key, -- Identificador único del taller
	nombre varchar(70), -- Nombre del taller
	direccion varchar(200) -- Dirección del taller
);

-- Tabla de registros de mantenimiento de vehículos
create table Mantenimiento
(
	Id_Mantenimiento int primary key, -- Identificador único del mantenimiento
	Fecha date, -- Fecha en que se realizó
	Km_actual decimal(7,2), -- Kilometraje del vehículo al momento del mantenimiento
	Detalle varchar(100), -- Descripción del servicio
	Precio decimal(6,2), -- Costo del mantenimiento
	Taller_Id int, -- Taller que realizó el servicio
	Vehiculo_Id varchar(10), -- Vehículo que recibió el servicio

	-- Claves foráneas para taller y vehículo
	constraint fk_Mantenimiento_Vehiculo foreign key(Vehiculo_Id) references Vehiculo(Id_Vehiculo),
	constraint fk_Mantenimiento_Taller foreign key(Taller_Id) references Taller(Id_Taller)
);

-- Tabla de presupuestos asignados a cada vehículo
create table Presupuesto
(
	Id_Presupuesto int primary key, -- Identificador único del presupuesto
	Tipo_Presupuesto varchar(40), -- Tipo de presupuesto (combustible o mantenimiento)
	Vehiculo_Id varchar(10), -- Vehículo al que se asigna el presupuesto
	Monto decimal(12,2), -- Monto asignado
	
	-- Clave foránea para vehículo
	constraint fk_Presupuesto_Vehiculo foreign key(Vehiculo_Id) references Vehiculo(Id_Vehiculo),

	-- Restricción para validar tipos de presupuesto permitidos
	constraint chk_Presupuesto_Tipo check (Tipo_Presupuesto in('combustible','mantenimiento'))
);
