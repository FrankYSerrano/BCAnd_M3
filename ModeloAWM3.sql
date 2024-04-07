create database if not exists alke_wallet;
use alke_wallet;

-- creacion tabla usuarios --
create table if not exists usuarios(
	user_id int auto_increment primary key,
	nombre varchar(50),
	correo_electronico varchar(50),
	contrasena varchar(50),
	saldo decimal(10,2),
	fecha_creacion timestamp default current_timestamp
);

-- creacion tabla transacciones --
create table if not exists transacciones(
	transaction_id int auto_increment primary key,
	sender_user_id int,
	receiver_user_id int,
	importe decimal(10,2),
	fecha_transaccion timestamp default current_timestamp,
	foreign key(sender_user_id ) references usuarios(user_id),
	foreign key(receiver_user_id) references usuarios(user_id)
);

-- creacion tabla monedas --
create table if not exists monedas(
	currency_id int auto_increment primary key,
	currency_name varchar(20),
	currency_symbol varchar(3),
	fecha_creacion timestamp default current_timestamp
);
