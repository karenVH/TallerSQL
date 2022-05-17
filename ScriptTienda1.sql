-- MySQL Script generated by MySQL Workbench
-- Mon May 16 22:40:32 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema tiendadb
-- -----------------------------------------------------
drop table Venta;
-- -----------------------------------------------------
-- Schema tiendadb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `tiendadb` DEFAULT CHARACTER SET utf8 ;
USE `tiendadb` ;

-- -----------------------------------------------------
-- Table `tiendadb`.`Proveedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tiendadb`.`Proveedor` (
  `idProveedor` INT NOT NULL AUTO_INCREMENT,
  `nombreProveedor` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`idProveedor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tiendadb`.`Producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tiendadb`.`Productos` (
  `idProducto` INT NOT NULL AUTO_INCREMENT,
  `nombreProducto` VARCHAR(100) NOT NULL,
  `fechaVencimiento` DATE NOT NULL,
  `Proveedor_idProveedor` INT NOT NULL,
  PRIMARY KEY (`idProducto`, `Proveedor_idProveedor`),
  CONSTRAINT `fk_Producto_Proveedor` FOREIGN KEY (`Proveedor_idProveedor`)
    REFERENCES `tiendadb`.`Proveedor` (`idProveedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tiendadb`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tiendadb`.`Cliente` (
  `idCliente` INT NOT NULL AUTO_INCREMENT,
  `tipoDocumento` VARCHAR(10) NOT NULL,
  `numeroDocumento` VARCHAR(45) NOT NULL,
  `nombre` VARCHAR(45) NULL,
  PRIMARY KEY (`idCliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tiendadb`.`Venta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tiendadb`.`Venta` (
  `idVenta` INT NOT NULL AUTO_INCREMENT,
  `fechaVenta` DATE NOT NULL,
  `cantidad` INT NOT NULL,
  `Cliente_idCliente` INT NOT NULL,
  `Producto_idProducto` INT NOT NULL,
  `Producto_Proveedor_idProveedor` INT NOT NULL,
  PRIMARY KEY (`idVenta`, `Cliente_idCliente`, `Producto_idProducto`, `Producto_Proveedor_idProveedor`),
  CONSTRAINT `fk_Venta_Cliente1`
    FOREIGN KEY (`Cliente_idCliente`)
    REFERENCES `tiendadb`.`Cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Venta_Producto1`
    FOREIGN KEY (`Producto_idProducto` , `Producto_Proveedor_idProveedor`)
    REFERENCES `tiendadb`.`Producto` (`idProducto` , `Proveedor_idProveedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = MyISAM;

USE `tiendadb` ;

-- -----------------------------------------------------
-- Placeholder table for view `tiendadb`.`view1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tiendadb`.`view1` (`id` INT);

-- -----------------------------------------------------
-- View `tiendadb`.`view1`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tiendadb`.`view1`;
USE `tiendadb`;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -------------------------------------------------------------------------------------------------------------------
-- 3. Realizar dos borrados lógicos y dos borrados físicos de ventas realizadas.
-- -------------------------------------------------------------------------------------------------------------
-- BORRADO FISICO
DELETE FROM venta WHERE idVenta = 1;
DELETE FROM venta WHERE idVenta = 10;
-- 
-- BORRADO LOGICO
ALTER TABLE venta ADD banActivo BIT;
-- Solo se mostraran las ventas donde el estado esté activo, es decir, esté en 1
SELECT * FROM venta WHERE banActivo = 1;
-- Por lo cual la venta que no se mostrará es la que estado es 0	 
UPDATE venta  SET banActivo = 0 WHERE idVenta = 4;
UPDATE venta SET banActivo = 0 WHERE idVenta = 9;

-- ----------------------------------------------------------------------------------------------------------------
-- 4. Modificar tres productos en su nombre y proveedor que los provee.
-- ---------------------------------------------------------------------------------------------------------------
UPDATE `tiendadb`.`productos` SET `nombreProducto` = 'Galletas de Sal', `Proveedor_idProveedor` = '1' WHERE (`idProducto` = '3') and (`Proveedor_idProveedor` = '3');
UPDATE `tiendadb`.`productos` SET `Proveedor_idProveedor` = '3' WHERE (`idProducto` = '4') and (`Proveedor_idProveedor` = '2');
UPDATE `tiendadb`.`productos` SET `nombreProducto` = 'Jamon', `Proveedor_idProveedor` = '2' WHERE (`idProducto` = '5') and (`Proveedor_idProveedor` = '1');



