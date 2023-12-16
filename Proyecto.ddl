

/* Steven Murillo - Gary Trujillo */


/* TABLAS */


CREATE TABLE CIUDAD (
    id_ciudad INT NOT NULL PRIMARY KEY ,
    nomCiud VARCHAR(30) NOT NULL UNIQUE
);

-- INSERTAR CIUDAD
INSERT INTO CIUDAD (id_ciudad, nomCiud) VALUES (1, 'Cali');
INSERT INTO CIUDAD (id_ciudad, nomCiud) VALUES (2, 'Buga');
INSERT INTO CIUDAD (id_ciudad, nomCiud) VALUES (3, 'Medellin');
-- ... (resto de las ciudades)

-- ACTUALIZAR CIUDAD
UPDATE CIUDAD SET nomCiud='Pasto' WHERE CIUDAD.id_ciudad=1;
-- ... (resto de las actualizaciones)

-- ELIMINAR CIUDAD
DELETE FROM CIUDAD WHERE CIUDAD.id_ciudad=1;
-- ... (resto de las eliminaciones)


CREATE TABLE TEATRO (
    id_teatro INT PRIMARY KEY,
    nomTeatro VARCHAR(50),
    id_ciudad INT NOT NULL,
    FOREIGN KEY (id_ciudad) REFERENCES CIUDAD(id_ciudad)
);

-- INSERTAR TEATRO
INSERT INTO TEATRO (id_teatro, nomTeatro, id_ciudad) VALUES (1, 'Teatro Colon', 1);
INSERT INTO TEATRO (id_teatro, nomTeatro, id_ciudad) VALUES (2, 'Teatro Libre', 2);
INSERT INTO TEATRO (id_teatro, nomTeatro, id_ciudad) VALUES (3, 'Teatro Nacional', 3);
-- ... (resto de los teatros)

-- ACTUALIZAR TEATRO
UPDATE TEATRO SET nomTeatro= 'Teatro vibras', id_ciudad=1 WHERE TEATRO.id_teatro=1;
-- ... (resto de las actualizaciones)

-- ELIMINAR TEATRO
DELETE FROM TEATRO WHERE TEATRO.id_teatro=1;
-- ... (resto de las eliminaciones)


CREATE TABLE SALAS (
    id_salas INT PRIMARY KEY,
    capaSala INT,
    sillaVIP INT,
    sillaGen INT,
    id_teatro INT,
    numBoletas INT,
    sillasDispo INT,
    FOREIGN KEY (id_teatro) REFERENCES TEATRO(id_teatro)
);

-- INSERTAR SALAS
INSERT INTO SALAS (id_salas, capaSala, sillaVIP, sillaGen, id_teatro, numBoletas, sillasDispo) VALUES (1, 100, 80, 10, 1, 50, 10);
INSERT INTO SALAS (id_salas, capaSala, sillaVIP, sillaGen, id_teatro, numBoletas, sillasDispo) VALUES (2, 150, 20, 65, 2, 70, 65);
INSERT INTO SALAS (id_salas, capaSala, sillaVIP, sillaGen, id_teatro, numBoletas, sillasDispo) VALUES (3, 120, 95, 13, 3, 60, 12);
-- ... (resto de las salas)

-- ACTUALIZAR SALAS
UPDATE SALAS SET capaSala=120, sillaVIP=100, sillaGen=20, id_teatro=1, numBoletas=60, sillasDispo=20 WHERE SALAS.id_salas=1;
-- ... (resto de las actualizaciones)

-- ELIMINAR SALAS
DELETE FROM SALAS WHERE SALAS.id_salas=1;
-- ... (resto de las eliminaciones)


CREATE TABLE PELICULA (
    id_pelicula INT PRIMARY KEY,
    nomPeli VARCHAR(100) NOT NULL UNIQUE,
    duracion TIME,
    categoriaPeli VARCHAR(50)
);

-- INSERTAR PELICULA
INSERT INTO PELICULA (id_pelicula, nomPeli, duracion, categoriaPeli) VALUES (1, 'Jupiter', '2:30:08', 'Acción');
INSERT INTO PELICULA (id_pelicula, nomPeli, duracion, categoriaPeli) VALUES (2, 'La monja', '1:40:25', 'Terror');
INSERT INTO PELICULA (id_pelicula, nomPeli, duracion, categoriaPeli) VALUES (3, 'A dos metros de ti','2:05:09' , 'Romance');
-- ... (resto de las películas)

-- ACTUALIZAR PELICULA
UPDATE PELICULA SET nomPeli= 'Contrareloj', duracion='2:50:08', categoriaPeli='Accion' WHERE PELICULA.id_pelicula=1;
-- ... (resto de las actualizaciones)

-- ELIMINAR PELICULA
DELETE FROM PELICULA WHERE PELICULA.id_pelicula=1;
-- ... (resto de las eliminaciones)


CREATE TABLE FUNCIONES (
    id_funcion INT PRIMARY KEY,
    id_pelicula INT NOT NULL,
    id_sala INT NOT NULL,
    fecha DATE,
    hora TIME,
    FOREIGN KEY (id_pelicula) REFERENCES PELICULA(id_pelicula),
    FOREIGN KEY (id_sala) REFERENCES SALAS(id_salas)
);

-- INSERTAR FUNCIONES
INSERT INTO FUNCIONES (id_funcion, id_pelicula, id_sala, fecha, hora) VALUES (1, 1, 1, '2023-01-15', '18:00:00');
INSERT INTO FUNCIONES (id_funcion, id_pelicula, id_sala, fecha, hora) VALUES (2, 2, 2, '2023-01-16', '19:30:00');
INSERT INTO FUNCIONES (id_funcion, id_pelicula, id_sala, fecha, hora) VALUES (3, 3, 3, '2023-01-17', '20:15:00');
-- ... (resto de las funciones)

-- ACTUALIZAR FUNCIONES
UPDATE FUNCIONES SET id_pelicula=4, id_sala=4, fecha='2023-01-18', hora='21:00:00' WHERE FUNCIONES.id_funcion=4;
-- ... (resto de las actualizaciones)

-- ELIMINAR FUNCIONES
DELETE FROM FUNCIONES WHERE FUNCIONES.id_funcion=1;
-- ... (resto de las eliminaciones)


CREATE TABLE CLIENTE (
    id_cliente INT PRIMARY KEY,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    celular VARCHAR(15) UNIQUE
);

-- INSERTAR CLIENTE
INSERT INTO CLIENTE (id_cliente, nombre, apellido, celular) VALUES (1, 'Juan', 'Perez', '3001234567');
INSERT INTO CLIENTE (id_cliente, nombre, apellido, celular) VALUES (2, 'Maria', 'Gomez', '3109876543');
INSERT INTO CLIENTE (id_cliente, nombre, apellido, celular) VALUES (3, 'Carlos', 'Lopez', '3207654321');
-- ... (resto de los clientes)

-- ACTUALIZAR CLIENTE
UPDATE CLIENTE SET nombre='Pedro', apellido='Ramirez', celular='3218765432' WHERE CLIENTE.id_cliente=1;
-- ... (resto de las actualizaciones)

-- ELIMINAR CLIENTE
DELETE FROM CLIENTE WHERE CLIENTE.id_cliente=1;
-- ... (resto de las eliminaciones)


CREATE TABLE VENTAS (
    id_ventas INT PRIMARY KEY,
    id_funcion INT NOT NULL,
    id_cliente INT NOT NULL,
    nroFactura INT NOT NULL UNIQUE,
    numBoleVend INT,
    FOREIGN KEY (id_funcion) REFERENCES FUNCIONES(id_funcion),
    FOREIGN KEY (id_cliente) REFERENCES CLIENTE(id_cliente)
);

-- INSERTAR VENTAS
INSERT INTO VENTAS (id_ventas, id_funcion, id_cliente, nroFactura, numBoleVend) VALUES (1, 1, 1, 1001, 6);
INSERT INTO VENTAS (id_ventas, id_funcion, id_cliente, nroFactura, numBoleVend) VALUES (2, 2, 2, 1002, 12);
INSERT INTO VENTAS (id_ventas, id_funcion, id_cliente, nroFactura, numBoleVend) VALUES (3, 3, 3, 1003, 24);
-- ... (resto de las ventas)

-- ACTUALIZAR VENTAS
UPDATE VENTAS SET id_funcion=4, id_cliente=4, nroFactura=1004, numBoleVend=26 WHERE VENTAS.id_ventas=4;
-- ... (resto de las actualizaciones)

-- ELIMINAR VENTAS
DELETE FROM VENTAS WHERE VENTAS.id_ventas=1;
-- ... (resto de las eliminaciones)




/*iNSTANCIAS*/

public class Ciudad {
    private int idCiudad;
    private String nomCiud;

    // Constructor, getters y setters
}

public class Teatro {
    private int idTeatro;
    private String nomTeatro;
    private Ciudad ciudad; // Relación con la tabla CIUDAD

    // Constructor, getters y setters
}

public class Sala {
    private int idSala;
    private int capaSala;
    private int sillaVIP;
    private int sillaGen;
    private int numBoletas;
    private int sillasDispo;
    private Teatro teatro; // Relación con la tabla TEATRO

    // Constructor, getters y setters
}

public class Pelicula {
    private int idPelicula;
    private String nomPeli;
    private Time duracion;
    private String categoriaPeli;

    // Constructor, getters y setters
}

import java.util.Date;

public class Funcion {
    private int idFuncion;
    private Date fecha;
    private Sala sala; // Relación con la tabla SALAS
    private Pelicula pelicula; // Relación con la tabla PELICULA

    // Constructor, getters y setters
}

public class Cliente {
    private int idCliente;
    private String nombre;
    private String apellido;
    private String celular;

    // Constructor, getters y setters
}

public class Venta {
    private int idVenta;
    private Funcion funcion; // Relación con la tabla FUNCIONES
    private Cliente cliente; // Relación con la tabla CLIENTE
    private int nroFactura;
    private int numBoleVend;

    // Constructor, getters y setters
}


