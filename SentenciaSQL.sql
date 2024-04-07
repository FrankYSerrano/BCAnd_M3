-- creación de base de datos
create database if not exists alke_wallet;
use alke_wallet;

-- creacion tabla usuarios --
create table if not exists usuarios(
	user_id int auto_increment primary key,
	nombre varchar(50) NOT NULL,
	correo_electronico varchar(50) NOT NULL,
	contrasena varchar(50),
	saldo decimal(10,2),
	fecha_creacion timestamp default current_timestamp
);

-- creacion tabla monedas --
create table if not exists monedas(
	currency_id int auto_increment primary key,
	currency_name varchar(20) NOT NULL,
	currency_symbol varchar(3) NOT NULL,
	fecha_creacion timestamp default current_timestamp
);

-- creacion tabla transacciones --
create table if not exists transacciones(
	transaction_id int auto_increment primary key,
	sender_user_id int,
	receiver_user_id int,
	importe decimal(10,2),
    currency_id int,
	fecha_transaccion timestamp default current_timestamp,
	foreign key(sender_user_id ) references usuarios(user_id),
	foreign key(receiver_user_id) references usuarios(user_id),
	foreign key(currency_id) references monedas(currency_id)
);

-- cargar datos a tabla monedas
INSERT INTO monedas (currency_name, currency_symbol) VALUES ('Dólar', '$');
INSERT INTO monedas (currency_name, currency_symbol) VALUES ('Euro', '€');
INSERT INTO monedas (currency_name, currency_symbol) VALUES ('BitCoin', 'BTC');

-- cargar datos a tabla usuarios
INSERT INTO usuarios (nombre, correo_electronico, contrasena, saldo) 
VALUES ('Usuario Uno', 'Uno.Usuario@alkemail.com', '111', 1000.00);
INSERT INTO usuarios (nombre, correo_electronico, contrasena, saldo) 
VALUES ('Usuario Dos', 'Dos.Usuario@alkemail.com', '222', 2000.00);
INSERT INTO usuarios (nombre, correo_electronico, contrasena, saldo) 
VALUES ('Usuario Tres', 'Tres.Usuario@alkemail.com', '333', 3000.00);
INSERT INTO usuarios (nombre, correo_electronico, contrasena, saldo) 
VALUES ('Usuario Cuatro', 'Cuatro.Usuario@alkemail.com', '444', 4000.00);
INSERT INTO usuarios (nombre, correo_electronico, contrasena, saldo) 
VALUES ('Usuario Cinco', 'Cinco.Usuario@alkemail.com', '555', 5000.00);

-- cargar datos a tabla transacciones
INSERT INTO transacciones (sender_user_id, receiver_user_id, importe, currency_id) VALUES (1, 2, 100.00, 1);
INSERT INTO transacciones (sender_user_id, receiver_user_id, importe, currency_id) VALUES (2, 3, 200.00, 2);
INSERT INTO transacciones (sender_user_id, receiver_user_id, importe, currency_id) VALUES (3, 4, 300.00, 3);
INSERT INTO transacciones (sender_user_id, receiver_user_id, importe, currency_id) VALUES (4, 5, 450.00, 2);
INSERT INTO transacciones (sender_user_id, receiver_user_id, importe, currency_id) VALUES (1, 4, 350.00, 1);
INSERT INTO transacciones (sender_user_id, receiver_user_id, importe, currency_id) VALUES (3, 4, 250.00, 2);
INSERT INTO transacciones (sender_user_id, receiver_user_id, importe, currency_id) VALUES (2, 1, 190.00, 3);

-- Consulta para obtener el nombre de la moneda elegida por un usuario específico
Select currency_name from monedas where currency_id = 1;
-- Consulta para obtener las transacciones realizadas por un usuario específico
select * from transacciones where sender_user_id = 1 or receiver_user_id = 1;
-- Consulta para obtener todos los usuarios registrados
Select * from usuarios;
-- Consulta para obtener todas las monedas registradas
Select * from monedas;
-- Consulta para obtener todas las transacciones registradas
Select * from transacciones;
-- Consulta para obtener todas las transacciones enviadas por un usuario específico
select * from transacciones where sender_user_id = 4;
-- Consulta para obtener todas las transacciones recibidas por un usuario específico
select * from transacciones where receiver_user_id = 1;
-- Sentencia DML para modificar el campo correo electrónico de un usuario específico
UPDATE usuarios SET correo_electronico = 'nuevoemail@alkemail.com' WHERE user_id = 1;
-- Sentencia para eliminar los datos de una transacción (eliminado de la fila completa)
DELETE FROM transacciones WHERE transaction_id = 1;
-- Sentencia para DDL modificar el nombre de la columna correo_electronico por email
ALTER TABLE usuarios CHANGE COLUMN correo_electronico email VARCHAR(50);
