create table rol(

 codigo int not null auto_increment,
 descripcion varchar(80) not null unique,

 constraint pk_rol primary key (codigo)

);

create table privilegio(

 codigo int not null auto_increment,
 descripcion varchar(80) not null unique,

 constraint pk_privilegio primary key (codigo)

);

create table rol_privilegio(

  codigo int not null auto_increment,
  c_rol int,
  c_priv int,

  constraint pk_rol_privilegio primary key (codigo)

);

create table usuario(

 id int not null auto_increment,
 username varchar(20) not null unique,
 password varchar(20) not null,
 puntos int not null,
 fk_rol int not null,
 fk_juridico varchar(40),
 fk_naturale int,
 fk_empleado int,

 constraint pk_usuario primary key (id)

);



create table lugar(

 codigo int,
 nombre varchar(40) not null,
 tipo varchar(30) not null,
 fk_lugar int,

 constraint pk_lugar primary key (codigo)

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
   fk_tienda int,
   num_carnet varchar(50),

   constraint pk_juridico primary key (rif)

);



create table naturale(

   cedula int,
   rif varchar(40) not null unique ,
   correo varchar(40) not null unique ,
   nombre varchar(40) not null ,
   apellido varchar(40) not null ,
   fk_lugar int not null,
   fk_tienda int,
   num_carnet varchar(50),

   constraint pk_naturale primary key (cedula)

);


create table telefono(

   valor varchar(15),
   tipo varchar(15),
   fk_juridico varchar(40),
   fk_naturale int,

   constraint pk_telefono primary key (valor)

);



create table contacto(

   cedula int,
   nombre varchar(40) not null,
   apellido varchar(40) not null,
   funcion varchar (20) not null,
   fk_juridico varchar(40) not null,

   constraint pk_contacto primary key (cedula)

);

create table producto(

   codigo int not null auto_increment,
   nombre varchar(40) not null,
   descripcion varchar(400),
   precio numeric(20,2) not null,
   ranking int,
   foto varchar(70) unique,
   fk_tipo int,

   constraint pk_producto primary key (codigo)


);

create table tipo(

   codigo int,
   descripcion varchar(80),

   constraint pk_tipo primary key (codigo)

);

create table empleado(

  cedula int,
  nombre varchar(40) not null,
  apellido varchar(40) not null,
  cargo varchar(20) not null,
  salario int,

  constraint pk_empleado primary key (cedula)

);

create table horario(

   clave int,
   tipo varchar (15) not null,
   hora_inicio time not null,
   hora_fin time not null,

   constraint pk_horario primary key (clave)

);


create table asistencia(

   codigo int,
   c_empleado int,
   c_horario int,
   hora_entrada datetime not null,
   hora_salida datetime not null,

   constraint pk_asistencia primary key (codigo)

);

create table vacacion(

   codigo int,
   fecha_inicial date not null,
   fecha_final date not null,
   descripcion varchar(50),
   fk_empleado int,

   constraint pk_vacacion primary key (codigo)

);


create table tienda(

  codigo int,
  tipo varchar(20) not null,
  nombre varchar(50) not null,
  fk_lugar int not null,

  constraint pk_tienda primary key (codigo)

);

create table departamento(

  codigo int,
  tipo varchar(15),
  fk_tienda int not null,

  constraint pk_departamento primary key (codigo)

);

create table review (

  codigo int not null auto_increment,
  c_usuario int,
  c_producto int,
  valoracion int /*cantidad de estrellas*/,
  descripcion varchar(400),

  constraint pk_review primary key (codigo)

);

create table inventario (

  codigo int not null auto_increment,
  c_tienda int,
  c_producto int,
  zona varchar(10) not null,
  cantidad int not null,

  constraint pk_inventario primary key (codigo)

);


create table pedido_estatus(

 codigo int not null auto_increment,
 c_pedido int,
 c_estatus int,

 constraint pk_pedido_estatus primary key (codigo)

);


create table estatus(

 codigo int,
 descripcion varchar(50) not null,

 constraint pk_estatus primary key (codigo)

);


create table pedido(

  codigo int not null auto_increment,
  fecha datetime not null,
  c_presupuesto int not null,

  constraint pk_pedido primary key (codigo)

);


create table presupuesto(

  codigo int not null auto_increment,
  total numeric (20,2) not null,
  fecha datetime not null,
  fk_juridico varchar(40),
  fk_naturale int,
  fk_tienda int,
  fk_usuario int,

  constraint pk_presupuesto primary key (codigo)

);


create table producto_presupuesto(

  codigo int not null auto_increment,
  cantidad int not null,
  precio int not null,
  c_presupuesto int not null,
  c_producto int not null,

  constraint pk_producto_presupuesto primary key (codigo)

);


create table pago(

 codigo int not null auto_increment,
 monto numeric(20,2) not null,
 fecha datetime not null,
 fk_pedido int,
 fk_medio_pago int,

 constraint pk_pago primary key (codigo)

);


create table medio_pago(

 codigo int auto_increment,
 tipo varchar (10) not null,
 num_tarjeta int,
 num_cheque int,
 fk_juridico varchar(40),
 fk_naturale int,

 constraint pk_medio_pago primary key (codigo)

);


create table diario(

  codigo int not null auto_increment,
  descripcion varchar(600) not null,
  fecha_emision datetime not null,
  fecha_vencimiento datetime not null,
  fk_empleado int not null,

  constraint pk_diario primary key (codigo)

);

create table descuento(

  codigo int not null auto_increment,
  porcentaje int not null,
  descripcion varchar(200) not null,
  fk_producto int,

  constraint pk_descuento primary key (codigo)

);

create table diario_descuento(

   codigo int not null auto_increment,
   c_diario int not null,
   c_descuento int not null,

   constraint pk_diario_descuento primary key (codigo)

);

create table punto_cliente (

   codigo int not null auto_increment,
   adquirido int,
   valor int,
   fk_juridico varchar(40),
   fk_naturale int,
   fk_punto int,

   constraint pk_punto_cliente primary key (codigo)

);


create table punto (

   codigo int not null auto_increment,
   fecha_inicio datetime not null,
   fecha_fin datetime,
   valor int,

   constraint pk_punto primary key (codigo)

);
