-- ============================================================
-- SCRIPT DEL BULK INSERT PROYECTO: GESTIÓN DE FLOTA VEHICULAR
-- Autor: Eliu Asencio
-- Descripción: inserción de datos realizada a
-- cada una de las tablas de la base de datos
-- Observación: Verificar que la ruta de los datos sea la correcta. 
-- ============================================================

--BULK INSERT
BULK INSERT Rol
FROM 'C:\BD\Flota Datos\rol.csv'
WITH (
    FIELDTERMINATOR = ',',  -- Delimitador de campos
    ROWTERMINATOR = '\n',   -- Delimitador de filas
    FIRSTROW = 1,            -- Fila Inicial
    CODEPAGE = '65001' ,--Indica a SQL SERVER que usamos una codificacion UTF-8
	TABLOCK, --Bloquea la tabla hasta que termine la carga de datos
	MAXERRORS =  5, --Indica la cantidad maxima de errores antes de que finalice el proceso, si encuentra una linea con error la omite y continua con la carga, si encuentra la cantidad maxima de errores, detiene la carga de datos.
	ERRORFILE = 'C:\BD\errorInroles_log.csv'--Registra errores.
);

BULK INSERT Gasolinera
FROM 'C:\BD\Flota Datos\gasolinera.csv'
WITH (
    FIELDTERMINATOR = ',',  -- Delimitador de campos
    ROWTERMINATOR = '\n',   -- Delimitador de filas
    FIRSTROW = 1,            -- Fila Inicial
    CODEPAGE = '65001' ,--Indica a SQL SERVER que usamos una codificacion UTF-8
	TABLOCK, --Bloquea la tabla hasta que termine la carga de datos
	MAXERRORS =  5, --Indica la cantidad maxima de errores antes de que finalice el proceso, si encuentra una linea con error la omite y continua con la carga, si encuentra la cantidad maxima de errores, detiene la carga de datos.
	ERRORFILE = 'C:\BD\errorInGasolinera_log.csv'--Registra errores.
);

BULK INSERT Taller
FROM 'C:\BD\Flota Datos\taller.csv'
WITH (
    FIELDTERMINATOR = ',',  -- Delimitador de campos
    ROWTERMINATOR = '\n',   -- Delimitador de filas
    FIRSTROW = 1,            -- Fila Inicial
    CODEPAGE = '65001' ,--Indica a SQL SERVER que usamos una codificacion UTF-8
	TABLOCK, --Bloquea la tabla hasta que termine la carga de datos
	MAXERRORS =  5, --Indica la cantidad maxima de errores antes de que finalice el proceso, si encuentra una linea con error la omite y continua con la carga, si encuentra la cantidad maxima de errores, detiene la carga de datos.
	ERRORFILE = 'C:\BD\errorInTaller_log.csv'--Registra errores.
);

BULK INSERT Marca
FROM 'C:\BD\Flota Datos\marcas.csv'
WITH (
    FIELDTERMINATOR = ',',  -- Delimitador de campos
    ROWTERMINATOR = '\n',   -- Delimitador de filas
    FIRSTROW = 1,            -- Fila Inicial
    CODEPAGE = '65001' ,--Indica a SQL SERVER que usamos una codificacion UTF-8
	TABLOCK, --Bloquea la tabla hasta que termine la carga de datos
	MAXERRORS =  5, --Indica la cantidad maxima de errores antes de que finalice el proceso, si encuentra una linea con error la omite y continua con la carga, si encuentra la cantidad maxima de errores, detiene la carga de datos.
	ERRORFILE = 'C:\BD\errorInMarcas_log.csv'--Registra errores.
);

BULK INSERT Modelo
FROM 'C:\BD\Flota Datos\modelos.csv'
WITH (
    FIELDTERMINATOR = ',',  -- Delimitador de campos
    ROWTERMINATOR = '\n',   -- Delimitador de filas
    FIRSTROW = 1,            -- Fila Inicial
    CODEPAGE = '65001' ,--Indica a SQL SERVER que usamos una codificacion UTF-8
	TABLOCK, --Bloquea la tabla hasta que termine la carga de datos
	MAXERRORS =  5, --Indica la cantidad maxima de errores antes de que finalice el proceso, si encuentra una linea con error la omite y continua con la carga, si encuentra la cantidad maxima de errores, detiene la carga de datos.
	ERRORFILE = 'C:\BD\errorInModelos_log.csv'--Registra errores.
);

BULK INSERT Empleado
FROM 'C:\BD\Flota Datos\empleados.csv'
WITH (
    FIELDTERMINATOR = ',',  -- Delimitador de campos
    ROWTERMINATOR = '\n',   -- Delimitador de filas
    FIRSTROW = 1,            -- Fila Inicial
    CODEPAGE = '65001' ,--Indica a SQL SERVER que usamos una codificacion UTF-8
	TABLOCK, --Bloquea la tabla hasta que termine la carga de datos
	MAXERRORS =  5, --Indica la cantidad maxima de errores antes de que finalice el proceso, si encuentra una linea con error la omite y continua con la carga, si encuentra la cantidad maxima de errores, detiene la carga de datos.
	ERRORFILE = 'C:\BD\errorInEmpleados_log.csv'--Registra errores.
);

BULK INSERT Vehiculo
FROM 'C:\BD\Flota Datos\vehiculo.csv'
WITH (
    FIELDTERMINATOR = ',',  -- Delimitador de campos
    ROWTERMINATOR = '\n',   -- Delimitador de filas
    FIRSTROW = 1,            -- Fila Inicial
    CODEPAGE = '65001' ,--Indica a SQL SERVER que usamos una codificacion UTF-8
	TABLOCK, --Bloquea la tabla hasta que termine la carga de datos
	MAXERRORS =  5, --Indica la cantidad maxima de errores antes de que finalice el proceso, si encuentra una linea con error la omite y continua con la carga, si encuentra la cantidad maxima de errores, detiene la carga de datos.
	ERRORFILE = 'C:\BD\errorInVehiculo_log.csv'--Registra errores.
);

BULK INSERT Ruta
FROM 'C:\BD\Flota Datos\ruta.csv'
WITH (
    FIELDTERMINATOR = ',',  -- Delimitador de campos
    ROWTERMINATOR = '\n',   -- Delimitador de filas
    FIRSTROW = 1,            -- Fila Inicial
    CODEPAGE = '65001' ,--Indica a SQL SERVER que usamos una codificacion UTF-8
	TABLOCK, --Bloquea la tabla hasta que termine la carga de datos
	MAXERRORS =  5, --Indica la cantidad maxima de errores antes de que finalice el proceso, si encuentra una linea con error la omite y continua con la carga, si encuentra la cantidad maxima de errores, detiene la carga de datos.
	ERRORFILE = 'C:\BD\errorInRuta_log.csv'--Registra errores.
);

BULK INSERT Combustible
FROM 'C:\BD\Flota Datos\combustible.csv'
WITH (
    FIELDTERMINATOR = ',',  -- Delimitador de campos
    ROWTERMINATOR = '\n',   -- Delimitador de filas
    FIRSTROW = 1,            -- Fila Inicial
    CODEPAGE = '65001' ,--Indica a SQL SERVER que usamos una codificacion UTF-8
	TABLOCK, --Bloquea la tabla hasta que termine la carga de datos
	MAXERRORS =  5, --Indica la cantidad maxima de errores antes de que finalice el proceso, si encuentra una linea con error la omite y continua con la carga, si encuentra la cantidad maxima de errores, detiene la carga de datos.
	ERRORFILE = 'C:\BD\errorInCombustible_log.csv'--Registra errores.
);

BULK INSERT Presupuesto
FROM 'C:\BD\Flota Datos\presupuesto.csv'
WITH (
    FIELDTERMINATOR = ',',  -- Delimitador de campos
    ROWTERMINATOR = '\n',   -- Delimitador de filas
    FIRSTROW = 1,            -- Fila Inicial
    CODEPAGE = '65001' ,--Indica a SQL SERVER que usamos una codificacion UTF-8
	TABLOCK, --Bloquea la tabla hasta que termine la carga de datos
	MAXERRORS =  5, --Indica la cantidad maxima de errores antes de que finalice el proceso, si encuentra una linea con error la omite y continua con la carga, si encuentra la cantidad maxima de errores, detiene la carga de datos.
	ERRORFILE = 'C:\BD\errorInPresupuesto_log.csv'--Registra errores.
);

BULK INSERT Mantenimiento
FROM 'C:\BD\Flota Datos\mantenimiento.csv'
WITH (
    FIELDTERMINATOR = ',',  -- Delimitador de campos
    ROWTERMINATOR = '\n',   -- Delimitador de filas
    FIRSTROW = 1,            -- Fila Inicial
    CODEPAGE = '65001' ,--Indica a SQL SERVER que usamos una codificacion UTF-8
	TABLOCK, --Bloquea la tabla hasta que termine la carga de datos
	MAXERRORS =  5, --Indica la cantidad maxima de errores antes de que finalice el proceso, si encuentra una linea con error la omite y continua con la carga, si encuentra la cantidad maxima de errores, detiene la carga de datos.
	ERRORFILE = 'C:\BD\errorInMantenimiento_log.csv'--Registra errores.
);
