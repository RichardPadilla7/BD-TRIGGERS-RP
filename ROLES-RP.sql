-- Richard Padilla
CREATE USER 'SuperAdministrador'@'localhost' IDENTIFIED BY 'SuperAdmin_123!';
CREATE USER 'Administrador'@'localhost' IDENTIFIED BY 'Admin_456!';
CREATE USER 'CRUD'@'localhost' IDENTIFIED BY 'Crud_789!';
CREATE USER 'CRU'@'localhost' IDENTIFIED BY 'Cru_101!';
CREATE USER 'SoloLectura'@'localhost' IDENTIFIED BY 'ReadOnly_202!';

-- SuperAdministrador: Crear y eliminar bases de datos
GRANT CREATE, DROP ON *.* TO 'SuperAdministrador'@'localhost';

-- Administrador: Crear usuarios y procesos
GRANT CREATE USER, PROCESS ON *.* TO 'Administrador'@'localhost';

-- CRUD: Insertar, actualizar y eliminar datos
GRANT INSERT, UPDATE, DELETE ON *.* TO 'CRUD'@'localhost';

-- CRU: Insertar y actualizar datos, pero sin eliminar
GRANT INSERT, UPDATE ON *.* TO 'CRU'@'localhost';

-- SoloLectura: Realizar consultas a las tablas
GRANT SELECT ON *.* TO 'SoloLectura'@'localhost';

-- Aplicar cambios
FLUSH PRIVILEGES;

-- Verificar permisos para cada usuario
SHOW GRANTS FOR 'SuperAdministrador'@'localhost';
SHOW GRANTS FOR 'Administrador'@'localhost';
SHOW GRANTS FOR 'CRUD'@'localhost';
SHOW GRANTS FOR 'CRU'@'localhost';
SHOW GRANTS FOR 'SoloLectura'@'localhost';

