USE Flota

-- ============================================================
-- SCRIPT DE CONSULTAS PARA PROYECTO: GESTIÓN DE FLOTA VEHICULAR
-- Autor: Eliu Asencio
-- Descripción: Consultas optimizadas y documentadas para 
-- explorar datos clave del sistema de flota.
-- ============================================================

-- ================================
-- 1. Listado de empleados con su rol
-- ================================
SELECT 
    e.DPI,
    CONCAT(e.Nombre, ' ', e.Apellido) AS Nombre_Completo,
    e.Licencia,
    e.Estado,
    r.Departamento AS Rol
FROM Empleado e
JOIN Rol r ON e.Rol_Id = r.Id_Rol
ORDER BY e.Estado, Nombre_Completo;


-- ================================
-- 2. Vehículos con su marca, modelo y presupuesto
-- ================================
SELECT 
    v.Id_Vehiculo,
    m.nombre AS Marca,
    mo.nombre AS Modelo,
    v.Estado,
    v.Km_Total,
    v.Frecuencia_Mantenimiento,
    v.Presupuesto_Mensual_Mantenimiento,
    v.Presupuesto_Mensual_Combustible
FROM Vehiculo v
JOIN Marca m ON v.Marca_Id = m.Id_Marca
JOIN Modelo mo ON v.Modelo_Id = mo.Id_Modelo
ORDER BY v.Estado DESC, v.Km_Total DESC;


-- ================================
-- 3. Rutas realizadas con detalles de responsable
-- ================================
SELECT 
    r.Id_Ruta,
    r.Vehiculo_Id,
    CONCAT(e.Nombre, ' ', e.Apellido) AS Responsable,
    r.Destino_Inicial,
    r.Destino_Final,
    r.Km_Inicial,
    r.Km_Final,
    DATEDIFF(DAY, r.Fecha_Inicial, r.Fecha_Final) AS Duracion_Dias
FROM Ruta r
JOIN Empleado e ON r.Responsable_DPI = e.DPI
ORDER BY r.Fecha_Final DESC;


-- ================================
-- 4. Cargas de combustible con información de estación y vehículo
-- ================================
SELECT 
    c.Factura_Numero,
    v.Id_Vehiculo,
    g.nombre AS Gasolinera,
    c.Tipo_Combustible,
    c.Cantidad_Galones,
    c.precio,
    c.Fecha_Carga
FROM Combustible c
JOIN Vehiculo v ON c.Vehiculo_Id = v.Id_Vehiculo
JOIN Gasolinera g ON c.Estacion_Id = g.Id_Estacion
ORDER BY c.Fecha_Carga DESC;


-- ================================
-- 5. Historial de mantenimientos con taller y precio
-- ================================
SELECT 
    m.Id_Mantenimiento,
    m.Fecha,
    m.Km_actual,
    m.Detalle,
    m.Precio,
    t.nombre AS Taller,
    v.Id_Vehiculo
FROM Mantenimiento m
JOIN Taller t ON m.Taller_Id = t.Id_Taller
JOIN Vehiculo v ON m.Vehiculo_Id = v.Id_Vehiculo
ORDER BY m.Fecha DESC;


-- ================================
-- 6. Presupuestos asignados por vehículo y tipo
-- ================================
SELECT 
    p.Id_Presupuesto,
    v.Id_Vehiculo,
    p.Tipo_Presupuesto,
    p.Monto
FROM Presupuesto p
JOIN Vehiculo v ON p.Vehiculo_Id = v.Id_Vehiculo 
ORDER BY v.Id_Vehiculo, p.Tipo_Presupuesto;
