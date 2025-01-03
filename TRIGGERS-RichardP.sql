-- Richard Padilla
CREATE DATABASE PrTriggers;
USE  PrTriggers;

CREATE TABLE empleados (
    EmpID INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(100) NOT NULL,
    Departamento VARCHAR(50) NOT NULL,
    Salario DECIMAL(10, 2) NOT NULL
);

CREATE TABLE auditoria (
    AudID INT PRIMARY KEY AUTO_INCREMENT,
    Accion VARCHAR(10) NOT NULL, -- INSERT, UPDATE o DELETE
    EmpID INT,
    Nombre VARCHAR(100),
    Departamento VARCHAR(50),
    Salario DECIMAL(10, 2),
    Fecha DATETIME NOT NULL
);

-- Para insertar 
DELIMITER $$

CREATE TRIGGER trigger_auditoria_insert
AFTER INSERT ON empleados
FOR EACH ROW
BEGIN
    INSERT INTO auditoria (Accion, EmpID, Nombre, Departamento, Salario, Fecha)
    VALUES ('INSERT', NEW.EmpID, NEW.Nombre, NEW.Departamento, NEW.Salario, NOW());
END$$

DELIMITER ;

-- Para actualizar
DELIMITER $$

CREATE TRIGGER trigger_auditoria_update
AFTER UPDATE ON empleados
FOR EACH ROW
BEGIN
    INSERT INTO auditoria (Accion, EmpID, Nombre, Departamento, Salario, Fecha)
    VALUES ('UPDATE', NEW.EmpID, NEW.Nombre, NEW.Departamento, NEW.Salario, NOW());
END$$

DELIMITER ;

-- Para eliminar
DELIMITER $$

CREATE TRIGGER trigger_auditoria_delete
AFTER DELETE ON empleados
FOR EACH ROW
BEGIN
    INSERT INTO auditoria (Accion, EmpID, Nombre, Departamento, Salario, Fecha)
    VALUES ('DELETE', OLD.EmpID, OLD.Nombre, OLD.Departamento, OLD.Salario, NOW());
END$$

DELIMITER ;

-- Insertar empleados
INSERT INTO empleados (Nombre, Departamento, Salario)
VALUES ('Juan Pérez', 'Finanzas', 5000.00);

-- aCTUALIZAR SALARIO DE LOS EMPLEADOS 
UPDATE empleados
SET Salario = 5500.00
WHERE EmpID = 1;

-- Eliminar un empleado
DELETE FROM empleados
WHERE EmpID = 1;


SELECT * FROM auditoria;
