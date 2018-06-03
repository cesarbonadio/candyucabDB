create table rol(

 codigo int not null auto_increment,
 descripcion varchar(80) not null unique

);

create table privilegio(

 codigo int not null auto_increment,
 descripcion varchar(80) not null unique

);

create table rol_privilegio(

  codigo int not null auto_increment,
  c_rol int,
  c_priv int

);

create table usuario(

 id int not null auto_increment,
 username varchar(20) not null unique,
 password varchar(20) not null,
 puntos int not null,
 fk_rol int not null,
 fk_juridico varchar(40),
 fk_naturale int,
 fk_empleado int

);



create table lugar(

 codigo int,
 nombre varchar(40) not null,
 tipo varchar(30) not null,
 fk_lugar int

);



create table juridico(

   rif varchar(40),
   correo varchar(40) not null unique,
   d_social varchar(50) not null,
   r_social varchar(50) not null,
   pagina_web varchar(40) unique,
   capital numeric(20,2) not null,
   fk_lugar int not null,
   fk_lugar_fiscal int not null,
   fk_tienda int

);



create table naturale(

   cedula int,
   rif varchar(40) not null unique ,
   correo varchar(40) not null unique ,
   nombre varchar(40) not null ,
   apellido varchar(40) not null ,
   fk_lugar int not null,
   fk_tienda int

);


create table telefono(

   valor int,
   tipo varchar(15),
   fk_juridico varchar(40),
   fk_naturale int

);



create table contacto(

   cedula int,
   nombre varchar(40) not null,
   apellido varchar(40) not null,
   funcion varchar (20) not null,
   fk_juridico varchar(40) not null

);

create table producto(

   codigo int not null auto_increment,
   nombre varchar(40) not null,
   descripcion varchar(400),
   precio numeric(20,2) not null,
   ranking int,
   foto varchar(70) unique,
   fk_tipo int


);

create table tipo(

   codigo int,
   descripcion varchar(80)

);

create table empleado(

  cedula int,
  nombre varchar(40) not null,
  apellido varchar(40) not null,
  cargo varchar(20) not null,
  salario int

);

create table horario(

   clave int,
   dia varchar (15) not null,
   hora_inicio datetime not null,
   hora_fin datetime not null

);


create table asistencia(

   codigo int,
   c_empleado int,
   c_horario int,
   fecha date not null,
   hora_entrada datetime not null,
   hora_salida datetime not null

);

create table vacacion(

   codigo int,
   fecha_inicial date not null,
   fecha_final date not null,
   descripcion varchar(50),
   fk_empleado int

);


create table tienda(

  codigo int,
  tipo varchar(20) not null,
  nombre varchar(50) not null,
  fk_lugar int not null


);

create table departamento(

  codigo int,
  tipo varchar(15),
  fk_tienda int not null

);

create table review (

  codigo int not null auto_increment,
  c_usuario int,
  c_producto int,
  valoracion int /*cantidad de estrellas*/,
  descripcion varchar(400)

);

create table inventario (

  codigo int not null auto_increment,
  c_tienda int,
  c_producto int,
  zona varchar(10) not null,
  cantidad int not null

);


create table pedido_estatus(

 codigo int not null auto_increment,
 c_pedido int,
 c_estatus int,
 cantidad int,
 precio numeric(20,2)

);


create table estatus(

 codigo int,
 descripcion varchar(50) not null

);


create table pedido(

  codigo int not null auto_increment,
  fecha date not null,
  c_presupuesto int not null

);


create table presupuesto(

  codigo int not null auto_increment,
  total numeric (20,2) not null,
  fecha date not null,
  fk_juridico varchar(40),
  fk_naturale int,
  fk_tienda int,
  fk_usuario int

);


create table producto_presupuesto(

  codigo int not null auto_increment,
  cantidad int not null,
  precio int not null
  c_presupuesto int not null,
  c_producto int not null

);


create table pago(

 codigo int not null auto_increment,
 monto numeric(20,2) not null,
 fecha date not null,
 fk_pedido int,
 fk_medio_pago int

);


create table medio_pago(

 codigo int,
 tipo varchar (10) not null,
 num_tarjeta int,
 num_cheque int,
 fk_juridico varchar(40),
 fk_naturale int

);


create table diario(

  codigo int not null auto_increment,
  descripcion varchar(600) not null,
  fecha_emision datetime not null,
  fecha_vencimiento datetime not null,
  fk_empleado int not null,

);

create table descuento(

  codigo int not null auto_increment,
  porcentaje int not null,
  descripcion varchar(200) not null,
  fk_producto int

);

create table diario_descuento(

   codigo int not null auto_increment,
   c_diario int not null,
   c_descuento int not null

);

create table punto_cliente (

   codigo int not null auto_increment,
   adquirido int,
   valor int,
   fk_juridico varchar(40),
   fk_naturale int,
   fk_punto int

);


create table punto (

   codigo int not null auto_increment,
   fecha_inicio date not null,
   fecha_fin date not null,
   valor int

);
