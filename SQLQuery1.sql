--En este caso, abordé la solución a través de SQL Server Managment Studio,
--creando el diagrama y las relaciones desde la misma Query. Al no tener la posibilidad de contar con Seeders
--opté por hacer una población manual con datos ficticios.  

--APELLIDO Y NOMBRE: CACERES SOLANGE 

--Creo la base de datos 
CREATE DATABASE DicsysTest


--Creo la tabla llamada cs_proveedores y la poblo para realizar las consultas. 
--Pongo en not null el nombre, y el telefono ya que son los campos basicos para contactar al proveedor

create table cs_proveedores
(cod_proveedor int primary key not null,
nombre varchar(20) not null,
direccion varchar(150),
ciudad varchar(30),
telefono varchar(15) not null
)

INSERT INTO cs_proveedores(cod_proveedor, nombre, direccion, ciudad, telefono) values ('101', 'OREO', 'calle 12 y 23', 'Ciudad A', '2213435567');
INSERT INTO cs_proveedores(cod_proveedor, nombre, direccion, ciudad, telefono) values ('102', 'OBLEA', 'calle 12 y 23', 'Ciudad B', '2213657753');
INSERT INTO cs_proveedores(cod_proveedor, nombre, direccion, ciudad, telefono) values ('103', 'SONRISA', 'calle 12 y 23', 'Ciudad C', '2214323321');
INSERT INTO cs_proveedores(cod_proveedor, nombre, direccion, ciudad, telefono) values ('104', 'Don Satur', 'calle 12 y 23', 'Ciudad D', '2216754532');
INSERT INTO cs_proveedores(cod_proveedor, nombre, direccion, ciudad, telefono) values ('105', 'Marolio', 'calle 12 y 23', 'Ciudad E', '221673424');
INSERT INTO cs_proveedores(cod_proveedor, nombre, direccion, ciudad, telefono) values ('106', 'Luchetti', 'calle 12 y 23', 'Ciudad F', '221674534');


--Creo la tabla llamada cs_productos. 
create table cs_productos
(cod_producto int primary key not null,
desc_producto varchar(30) not null,
precio_costo float not null,
precio_venta float not null,
precio_mercado float not null,
)

insert into cs_productos(cod_producto, desc_producto, precio_costo, precio_venta,precio_mercado) values ('201', 'Galletita Oreo', '3421.13', '4343.10', '5000');
insert into cs_productos(cod_producto, desc_producto, precio_costo, precio_venta,precio_mercado) values ('202', 'Galletita Opera', '4567', '5000', '6000');
insert into cs_productos(cod_producto, desc_producto, precio_costo, precio_venta,precio_mercado) values ('203', 'Galletita Oblea', '6784.15', '7000', '8000');
insert into cs_productos(cod_producto, desc_producto, precio_costo, precio_venta,precio_mercado) values ('204', 'Galletita Sonrisa', '3567.20', '4340', '5000');
insert into cs_productos(cod_producto, desc_producto, precio_costo, precio_venta,precio_mercado) values ('205', 'Chicle Bubbaloo', '4363.10', '4500', '5000');
insert into cs_productos(cod_producto, desc_producto, precio_costo, precio_venta,precio_mercado) values ('206', 'Chocolate Milka', '3421.13', '4000', '5000');
insert into cs_productos(cod_producto, desc_producto, precio_costo, precio_venta,precio_mercado) values ('207', 'Caramelos de miel', '4000.20', '5000', '6000');
insert into cs_productos(cod_producto, desc_producto, precio_costo, precio_venta,precio_mercado) values ('208', 'Galletitas terrabusi', '4034', '5000', '7000');
insert into cs_productos(cod_producto, desc_producto, precio_costo, precio_venta,precio_mercado) values ('210', 'chocolates', '4633', '5000', '7300');
insert into cs_productos(cod_producto, desc_producto, precio_costo, precio_venta,precio_mercado) values ('211', 'chupetines', '4633', '5000', '7300');
insert into cs_productos(cod_producto, desc_producto, precio_costo, precio_venta,precio_mercado) values ('212', 'galletitas', '4633', '5000', '7300');

--Agrego la columna ganancia_real_acumulada en la tabla cs_productos para el ejercicio 4
ALTER TABLE cs_productos
ADD ganancia_real_acumulada float;

--Creo la tabla llamada cs_ordenes. 

create table cs_ordenes
(cod_orden int primary key not null,
fecha_emision_orden date,
fecha_entrega date,
cod_proveedor int,
FOREIGN KEY (cod_proveedor) REFERENCES cs_proveedores(cod_proveedor)
)
insert into cs_ordenes(cod_orden, fecha_emision_orden , fecha_entrega, cod_proveedor) values ('301', '2019-01-01', '2019-01-10', '101');
insert into cs_ordenes(cod_orden, fecha_emision_orden , fecha_entrega, cod_proveedor) values ('302', '2019-02-05', '2010-02-12', '102');
insert into cs_ordenes(cod_orden, fecha_emision_orden , fecha_entrega, cod_proveedor) values ('303', '2019-03-07', '2019-03-14', '103');
insert into cs_ordenes(cod_orden, fecha_emision_orden , fecha_entrega, cod_proveedor) values ('304', '2020-04-20', '2020-04-28', '101');
insert into cs_ordenes(cod_orden, fecha_emision_orden , fecha_entrega, cod_proveedor) values ('305', '2020-05-22', '2020-05-30', '102');
insert into cs_ordenes(cod_orden, fecha_emision_orden , fecha_entrega, cod_proveedor) values ('306', '2020-06-25', '2020-07-02', '104');
insert into cs_ordenes(cod_orden, fecha_emision_orden , fecha_entrega, cod_proveedor) values ('307', '2020-02-01', '2020-02-03', '105');
insert into cs_ordenes(cod_orden, fecha_emision_orden , fecha_entrega, cod_proveedor) values ('308', '2021-02-01', '2021-02-03', '106');

--Creo la tabla llamada cs_items. 

create table cs_items
(cod_orden int primary key not null,
cantidad int,
cod_producto int,
precio_real float
FOREIGN KEY (cod_orden) REFERENCES cs_ordenes(cod_orden),
FOREIGN KEY (cod_producto) REFERENCES cs_productos(cod_producto),
)

insert into cs_items(cod_orden, cantidad, cod_producto, precio_real) values ('301', '1', '201', '4352');
insert into cs_items(cod_orden, cantidad, cod_producto, precio_real) values ('302', '2', '204', '2345');
insert into cs_items(cod_orden, cantidad, cod_producto, precio_real) values ('303', '1', '202', '3452');
insert into cs_items(cod_orden, cantidad, cod_producto, precio_real) values ('304', '1', '203', '4365');
insert into cs_items(cod_orden, cantidad, cod_producto, precio_real) values ('305', '1', '204', '2352');
insert into cs_items(cod_orden, cantidad, cod_producto, precio_real) values ('306', '1', '206', '7456');
insert into cs_items(cod_orden, cantidad, cod_producto, precio_real) values ('307', '1', '208', '4363');
insert into cs_items(cod_orden, cantidad, cod_producto, precio_real) values ('308', '5', '209', '5000');

-------------------------------------------------------------------------------------------
--ENUNCIADO 1
--Seleccionar los proveedores que han emitido órdenes de compra que solo poseen un ítem 
--de producto tipo galletita (Galletitas Oreo, galletita opera, galletitas OBLEA, Galletita
--Sonrisa, etc.) o bien que hayan emitido órdenes de compras en el año 2019 y 2020 inclusive. 
--No se admitirán órdenes de compras que no cumplan con la condición primera o que hayan 
--emitido ordenes solo en el 2019 o solo en el 2020.
--------------------------------------------------------------------------------------------
--PLANTEO DE LA RESOLUCION
--De la tabla cs_proveedores hago un inner join con la tabla cs_ordenes. Una vez verificado eso realizo una subconsulta para ver si el cod_orden
--pertenece a una orden asociada a la tabla cs_item, y a su vez, realizo otra subconsulta para verificar que pertenezca a una descripcion 
--de tipo galletita dentro de la tabla cs_productos.
--Agrupo con GROUP BY el cod_orden de la primer subconsulta y verifico con COUNT(*) = 1 que exista un registro. Ademas, comparo que la 
--fecha de emision este entre el anio 2019 y 2020 inclusive.
--Finalmente, filtro los grupos de proveedores que tengan dos anios diferentes de ordenes.

SELECT  PROV.cod_proveedor, PROV.nombre
FROM cs_proveedores PROV
INNER JOIN cs_ordenes ORD ON PROV.cod_proveedor = ORD.cod_proveedor
WHERE ORD.cod_orden IN (       -- Se va a filtrar el resultado de la consulta sólo a aquellos registros en los que el código de orden esté dentro de una subconsulta
  SELECT cod_orden
  FROM cs_items
  WHERE cod_producto IN (      --Busca todas las ordenes que contengan un producto con la descripcion de tipo "galletita" 
    SELECT cod_producto		   
    FROM cs_productos
    WHERE desc_producto LIKE '%galletita%'
  )
  GROUP BY cod_orden
  HAVING COUNT(*) = 1
)
AND YEAR(ORD.fecha_emision_orden) BETWEEN 2019 AND 2020
GROUP BY  PROV.cod_proveedor, PROV.nombre
HAVING COUNT(DISTINCT YEAR(ORD.fecha_emision_orden)) = 2



-----------------------------------------------------------------------------------
--ENUNCIADO 2
--Eliminar los registros de los proveedores que hayan tenido menos de 3 órdenes de 
--compras en el año 2021.
------------------------------------------------------------------------------------
--PLANTEO DE LA RESOLUCION
--Segun el enunciado interpreto que se pide eliminar los registros de los proveedores que hayan tenido menos de tres ordenes de compras en 
--el 2021, no eliminar los proveedores en si. 
--Primero elimino las filas de cs_items que dependen de las filas que deseo eliminar de cs_ordenes, para luego proceder por la eliminacion de las filas
--en la tabla cs_ordenes sin restricciones de clave foranea.
--La primer consulta elimina los registros de la tabla cs_items, donde el cod_orden se pertenezca a la lista de codigos de orden que se obtiene
--de la subconsulta.
--Esta subconsulta busca los proveedores que han tenido menos de 3 ordenes en el anio 2021, y devuelve una lista de codigos asociados a 
--esos proveedores.
--La segunda, elimina los registros de los proveedores con menos de 3 ordenes en el anio especificado.
--Primero se hace la union de las tablas con inner join entre la tabla cs_proveedores y cs_ordenes, filtrando solo las eminitas en 2021,
--utilizando YEAR. Luego agrupamos y filtramos con la clausula HAVING para que se muestren solo los proveedores que hayan tenido menos de 3
--ordenes en ese anio.

select * from cs_proveedores
select * from cs_ordenes
select * from cs_items

DELETE FROM cs_items
WHERE cod_orden IN (
    SELECT cod_orden
    FROM cs_ordenes
    WHERE cod_proveedor IN (
        SELECT PROV.cod_proveedor
        FROM cs_proveedores PROV
        INNER JOIN cs_ordenes ORD ON PROV.cod_proveedor = ORD.cod_proveedor
        WHERE YEAR(ORD.fecha_emision_orden) = '2021'
        GROUP BY PROV.cod_proveedor
        HAVING COUNT(*) < 3
    )
);

DELETE FROM cs_ordenes
WHERE cod_proveedor IN (
	SELECT PROV.cod_proveedor
	FROM cs_proveedores PROV
	INNER JOIN cs_ordenes ORD ON PROV.cod_proveedor = ORD.cod_proveedor
	WHERE YEAR(ORD.fecha_emision_orden) = '2021'
	GROUP BY PROV.cod_proveedor
	HAVING COUNT(*) < 3
);


-----------------------------------------------------------------------------------------
--ENUNCIADO 3
--Modificar el precio de venta de los productos a razón de 3 veces el precio de compra, 
--solo para aquellos productos que estuvieron en alguna orden de compra cuya diferencia 
--de días entre la "fecha entrega" y la "fecha de emisión" no supere los 3 días.
------------------------------------------------------------------------------------------
--PLANTEO DE LA RESOLUCION
--De la tabla cs_productos hago un inner join cs_items para buscar valores coincidentes con el campo en comun 
--cod_producto y otro inner join con cs_ordenes buscando coincidencia con el campo cod_orden (Es decir, busco el producto que esta asociado a 
--una orden de compra). Luego, realizo la condicion con WHERE utilizando un DATEDIFF para ver que la diferencia de "dias" no supere 
--los tres.
--Luego, seteo que el precio de venta sea tres veces el precio de compra (utilice el precio de costo ya que no tengo otra referencia al 
--precio de compra, y el precio de mercado no me parecia que era correcto utilizarlo).

select * from cs_ordenes
select * from cs_productos

UPDATE cs_productos
SET cs_productos.precio_venta = cs_productos.precio_costo * 3
FROM cs_productos
inner join cs_items ITEM ON cs_productos.cod_producto = ITEM.cod_producto
inner join cs_ordenes ORD ON ITEM.cod_orden = ORD.cod_orden
WHERE DATEDIFF(DAY, ORD.fecha_entrega, ORD.fecha_emision_orden) <= 3;


----------------------------------------------------------------------------------------------
--ENUNCIADO 4
--Insertar en una tabla (supuestamente ya creada), los registros provenientes de una consulta
--SQL que devuelva los 10 productos que hayan sido vendidos en el mes de 
--noviembre de los años 2002, 2003 y 2004. La selección de estos productos debe 
--estar ordenados según la ganancia real acumulada. En otras palabras, generar un 
--ranking de los 10 productos que tuvieron mayor ganancia en noviembre de los años 2002, 
--203 y 2004, dejándolos almacenados en una tabla.
-----------------------------------------------------------------------------------------------
--PLANTEO DE RESOLUCION
--De la tabla cs_items hago un inner join cs_ordenes para buscar valores coincidentes con el campo en comun 
--cod_orden y otro inner join con cs_productos buscando coincidencia con el campo cod_producto.
--Luego, hago la condicion con el WHERE para que la fecha de emision de la orden pertenezca al 2002, 2003, y 2004 y que ademas sea de noviembre.
--Agrupo por cod_producto utilizando GROUP BY.
--Con select, selecciono cod_producto de la tabla cs_productos y la suma del precio_venta - precio_costo de la tabla cs_items para
--obtener la ganancia real acumulada.
--Utilizo el top 10 para tener el ranking de los 10 productos y renombro con as para cargar en memoria la nueva ganancia real acumulada y
--poder insertarla.

INSERT INTO cs_productos(cod_producto, ganancia_real_acumulada)
SELECT TOP 10 PROD.cod_producto, SUM(precio_venta - precio_costo) AS ganancia_real_acumulada
FROM cs_items ITEM
INNER JOIN cs_ordenes ORD ON ITEM.cod_orden = ORD.cod_orden
INNER JOIN cs_productos PROD ON ITEM.cod_producto = PROD.cod_producto
WHERE YEAR(fecha_emision_orden) IN (2002, 2003, 2004) AND MONTH(fecha_emision_orden) = 11
GROUP BY PROD.cod_producto
ORDER BY ganancia_real_acumulada DESC

-----------------------------------------------------------------------
--ENUNCIADO 5
--Actualizar el precio de venta al doble de los productos incluidos en 
--órdenes de compra realizadas en abril.
-----------------------------------------------------------------------
--PLANTEO DE RESOLUCION
--Verifico que el cod_producto pertenezca a la subconsulta, la cual a traves del FROM establezo la union de las tablas cs_items y cs_ordenes
--en base a la igualdad de valores en la columna cod_orden.
--A su vez, establezco la condicion en que el mes de la fecha de emision de la orden tiene que ser igual a 4 (abril) y con select me quedo
--con la columna cod_producto.
--A partir de la lista de codigos obtenidos de la subconsulta, actualizo el precio de venta al doble y actualizo finalmente la tabla
--cs_productos.

UPDATE cs_productos 
SET precio_venta = precio_venta * 2 
WHERE cod_producto IN (
    SELECT cod_producto
    FROM cs_items 
    INNER JOIN cs_ordenes ON cs_items.cod_orden = cs_ordenes.cod_orden 
    WHERE MONTH(fecha_emision_orden) = 4
);

----------------------------------------------------------------------------------------------
--ENUNCIADO 6
--Mostrar las descripciones que estén repetidas, y el precio de venta promedio de los mismos. 
--Como resultado final se pide el producto y el precio de venta promedio únicamente. 
--Esta es una relación de la tabla productos únicamente.
------------------------------------------------------------------------------------------------
--PLANTEO DE RESOLUCION
--De la tabla cs_productos, verifico que desc_producto pertenezca a la subconsulta. Esta subconsulta a su vez, selecciona de la tabla 
--cs_productos los desc_producto y los agrupa. 
--Con having verifico que en la tabla exista el producto mas de una vez en la tabla cs_productos
--Agrupo las descripciones de los productos, selecciono la columna desc_producto y calculo el promedio de la columna precio_venta.

SELECT desc_producto, AVG(precio_venta) AS precio_venta_promedio
FROM cs_productos
WHERE desc_producto IN (
    SELECT desc_producto
    FROM cs_productos
    GROUP BY desc_producto
    HAVING COUNT(*) > 1   --Me devuelve unicamente un desc_producto
)
GROUP BY desc_producto;


-------------------------------------------------------------------------
--ENUNCIADO 7
--Borrar registro e historial de compra de los proveedores 514 y 831.
--------------------------------------------------------------------------
--PLANTEO DE RESOLUCION
--De la tabla cs_items verifico que el codigo de orden pertenezca a la subconsulta.
--En la subconsulta, obtengo todos los cod_orden asociados a los proveedores con codigo 514, 831.
--Luego elimino las ordenes e items asociados a esos codigos.

DELETE FROM cs_items 
WHERE cod_orden IN (
    SELECT cod_orden
    FROM cs_ordenes
    WHERE cod_proveedor IN (514, 831)
);

DELETE FROM cs_ordenes
WHERE cod_proveedor IN (514, 831);

-------------------------------------------------------------------------------------------------
--ENUNCIADO 8
--Crear una tabla con la estructura de cs_productos, nombrarla como desee, e inserte 
--los mismos registros que tiene la tabla cs_productos. Luego actualizar el precio de costo 
--en la nueva tabla con un aumento del 15% en productos con descripción de galletitas, un 5% 
--para productos con descripción de chupetines y un 36% en barra de chocolates.
---------------------------------------------------------------------------------------------------
--PLANTEO DE RESOLUCION
--Como paso inicial, creo la tabla con sus respectivos registros y la poblo de datos.
--Luego, actualizo el valor de la nueva tabla en cada caso dado en el enunciado. 
--En el primer caso, actualizo el precio de costo con el aumento del 15% a las descripciones que sean iguales a "galletita".
--En el segundo, actualizo el precio de costo con el aumento del 5% a las descripciones que sean iguales a "chupetines"
--En el tercero, actualizo el precio de costo con el aumento del 36% a las descripciones que sean iguales a "chocolates", utilice el like 
--en el hipotetico caso de que se requiera que se busque aquellos registros que tengan en la descripcion de producto que contenta
--la cadena de caracteres "chocolate".

CREATE TABLE cs_nueva_productos
(cod_producto int primary key not null,
desc_producto varchar(150),
precio_costo float,
precio_venta float,
precio_mercado float,
)

insert into cs_nueva_productos(cod_producto, desc_producto, precio_costo, precio_venta,precio_mercado) values ('1', 'galletitas', '3421', '3500', '5000');
insert into cs_nueva_productos(cod_producto, desc_producto, precio_costo, precio_venta,precio_mercado) values ('2', 'chocotorta', '4000', '5000', '5500');
insert into cs_nueva_productos(cod_producto, desc_producto, precio_costo, precio_venta,precio_mercado) values ('3', 'chupetines', '3000.30', '3400', '7000');
insert into cs_nueva_productos(cod_producto, desc_producto, precio_costo, precio_venta,precio_mercado) values ('4', 'chocolates', '2600', '3900', '5600');
insert into cs_nueva_productos(cod_producto, desc_producto, precio_costo, precio_venta,precio_mercado) values ('5', 'caramelo', '7450', '8000', '6788');

UPDATE cs_nueva_productos
SET precio_costo = precio_costo * 1.15
WHERE desc_producto = 'galletitas';

UPDATE cs_nueva_productos
SET precio_costo = precio_costo * 1.05
WHERE desc_producto = 'chupetines';

UPDATE cs_nueva_productos
SET precio_costo = precio_costo * 1.36
WHERE desc_producto LIKE '%chocolates%';

--9)
--Crear una estructura procedural que recorra la tabla de productos y que por cada uno 
--de los productos recorridos verifique la existencia del mismo en alguna orden de compra 
--cuya fecha de emisión haya sido anterior al 01/01/2011. En caso de no existir el producto 
--en alguna orden según la lógica antes mencionada, insertar los datos del producto en una 
--tabla incluyendo los datos de código de producto, nombre y última fecha de orden de compra 
--en la cual, incluido el producto, y a su vez disminuir el precio del producto al 90% del 
--valor actual. Construir el bloque de código mediante sentencias PL/SQL de CURSORES, 
--ASIGNACIONES, SELECT, IF, UPDATE, ETC.
--------------------------------------------------------------------------------------------
--PLANTEO DEL ENUNCIADO
--recorre los productos en la tabla "cs_productos" uno por uno utilizando un cursor, y verifica si cada producto aparece en 
--alguna orden de compra anterior al 01/01/2011. Si no se encuentra en ninguna orden de compra, se inserta la información del producto 
--en una nueva tabla llamada "tabla_productos_nueva" junto con su código, nombre y la fecha de la última orden de compra en la que apareció. Además, el precio de venta del producto se reduce en un 10%.

CREATE OR REPLACE PROCEDURE actualizar_productos AS
  v_cod_producto cs_productos.cod_producto%TYPE;
  v_desc_producto cs_productos.desc_producto%TYPE;
  v_precio_costo cs_productos.precio_costo%TYPE;
  v_precio_venta cs_productos.precio_venta%TYPE;
  v_precio_mercado cs_productos.precio_mercado%TYPE;
  v_ultima_fecha date;
  v_precio_reducido FLOAT;
BEGIN
  -- Crear cursor para recorrer la tabla de productos
  FOR c_producto IN (SELECT cod_producto, desc_producto, precio_costo, precio_venta, precio_mercado
                     FROM cs_productos)
  LOOP
    -- Verificar si el producto existe en alguna orden anterior al 01/01/2011
    SELECT MAX(fecha_emision_orden) INTO v_ultima_fecha  --Busca la fecha de emision mas reciente de una orden, y con into se almacena el resultado en la variable
    FROM cs_ordenes o
    JOIN cs_items i ON o.cod_orden = i.cod_orden
    WHERE i.cod_producto = c_producto.cod_producto
      AND o.fecha_emision_orden < TO_DATE('01/01/2011', 'DD/MM/YYYY');
    
    -- Si el producto no existe en alguna orden anterior al 01/01/2011, insertarlo en la tabla y reducir el precio
    IF v_ultima_fecha IS NULL THEN
      v_precio_reducido := c_producto.precio_venta * 0.9; -- Reducir el precio al 90%
      
      INSERT INTO tabla_productos_nueva (cod_producto, nombre, ultima_fecha, precio_reducido)
      VALUES (c_producto.cod_producto, c_producto.desc_producto, v_ultima_fecha, v_precio_reducido);
      
      UPDATE cs_productos SET precio_venta = v_precio_reducido
      WHERE cod_producto = c_producto.cod_producto;
    END IF;
  END LOOP;
END;
/



