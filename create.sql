create table rol(

 codigo int,
 descripcion varchar(80) not null unique,

 /*constraints*/
 constraint pk_rol primary key (codigo)

);

create table privilegio(

 codigo int,
 descripcion varchar(80) not null unique,

 /*constraints*/
 constraint pk_privilegio primary key (codigo)

);

create table rol_privilegio(

  codigo int,
  c_rol int,
  c_priv int,

  /*constraints*/
  constraint pk_rol_privilegio primary key (codigo,c_rol,c_priv),
  constraint fk_rol_privilegio_rol foreign key (c_rol) references rol(codigo),
  constraint fk_rol_privilegio_privilegio foreign key (c_priv) references privilegio(codigo)

);

create table usuario(

 id int,
 username varchar(20) not null unique,
 password varchar(20) not null,
 puntos int not null,
 fk_rol int not null,

 /*constraints*/
 constraint pk_usuario primary key (id),
 constraint fk_usuario_rol foreign key (fk_rol) references rol(codigo)

);



create table lugar(


 codigo bigint,
 nombre varchar(30) not null,
 tipo varchar(20) not null,
 fk_lugar bigint,

 /*constraints*/
 constraint pk_lugar primary key (codigo),
 constraint fk_lugar_lugar foreign key (fk_lugar) references lugar(codigo)

);




create table juridico(

   rif varchar(40),
   correo varchar(40) not null unique,
   d_social varchar(50) not null,
   r_social varchar(50) not null,
   pagina_web varchar(40) unique,
   capital bigint not null,
   fk_lugar bigint not null,
   fk_usuario bigint not null,

   /*constraints*/
   constraint pk_juridico primary key (rif),
   constraint fk_juridico_lugar foreign key (fk_lugar) references lugar(codigo),
   constraint fk_juridico_usuario foreign key (fk_usuario) references usuario(id)

);


create table natural(

   cedula bigint,
   rif varchar(40) not null unique,
   correo varchar(40) not null unique,
   nombre varchar(40) not null,
   apellido varchar(40) not null,
   fk_lugar bigint not null,
   fk_usuario bigint not null,

   /*constraints*/
   constraint pk_natural primary key (cedula),
   constraint fk_natural_lugar foreign key (fk_lugar) references lugar(codigo),
   constraint fk_natural_usuario foreign key (fk_usuario) references usuaro(id)


);


create table telefono(

   valor bigint,
   tipo varchar(5),
   fk_juridico varchar(40),
   fk_natural bigint,

   /*constraints*/
   constraint pk_telefono primary key (valor),
   constraint fk_telefono_juridico foreign key (fk_juridico) references juridico(rif),
   constraint fk_telefono_natural foreign key (fk_natural) references natural(cedula)

);



create table contacto(

   cedula bigint,
   nombre varchar(40) not null,
   apellido varchar(40) not null,
   funcion varchar (20) not null,
   fk_juridico varchar(40) not null,

   /*constraints*/
   constraint pk_contacto primary key (cedula),
   constraint fk_contacto_juridico foreign key (fk_juridico) references juridico(rif)


);

create table producto(

   codigo int,
   nombre varchar(40) not null,
   descripcion varchar(400) not null,
   precio float not null,
   ranking int,
   foto varchar(70) not null unique,

   /*constraints*/
   constraint pk_producto primary key (codigo)

);

create table empleado(

  cedula bigint,
  nombre varchar(40) not null,
  apellido varchar(40) not null,
  cargo varchar(20) not null,
  fk_usuario int not null,

  /*constraints*/
  constraint pk_empleado primary key (cedula),
  constraint fk_empleado_usuario foreign key (fk_usuario) references usuario(id)

);

create table horario(

   clave int,
   tipo_turno varchar(100) not null,
   llega datetime not null,
   sale datetime not null,

   /*constraints*/
   constraint pk_clave primary key (clave)

);


create table asistencia(

   codigo int,
   c_empleado bigint,
   c_horario int,
   fecha date not null,
   hora_llegada datetime not null,
   hora_salida datetime not null,

   /*constraints*/
   constraint pk_asistencia primary key (codigo, c_empleado, c_horario),
   constraint fk_asistencia_empleado foreign key (c_empleado) references empleado(cedula),
   constraint fk_asistencia_horario foreign key (c_horario) references horario(clave)

);

create table vacacion(

   codigo int,
   tipo varchar(50) not null unique,
   descripcion varchar(100) not null unique,

   /*constraints*/
   constraint pk_vacacion primary key (codigo)

);

create table empleado_vacacion(

  codigo int,
  c_empleado int,
  c_vacacion int,
  fecha_inicial datetime not null,
  fecha_final datetime not null,

  /*constraints*/
  constraint pk_empleado_vacacion primary key (codigo,c_empleado,c_vacacion),
  constraint fk_empleado_vacacion_empleado foreign key (c_empleado) references empleado(cedula),
  constraint fk_empleado_vacacion_vacacion foreign key (c_vacacion) references vacacion(codigo)

);

create table tienda(

  codigo int,
  tipo varchar(50),
  fk_lugar bigint not null,

  /*constraints*/
  constraint pk_tienda primary key (codigo),
  constraint fk_tienda_lugar foreign key (fk_lugar) references lugar(codigo)

);

create table review (

  codigo int,
  c_usuario int,
  c_producto int,
  valoracion int,
  descripcion varchar(400),

  /*constraints*/
  constraint pk_review primary key (codigo,c_usuario,c_producto),
  constraint fk_review_usuario foreign key (c_usuario) references usuario(id),
  constraint fk_review_producto foreign key (c_producto) references producto(codigo)

);

create table inventario (

  codigo int,
  c_tienda int,
  c_producto int,
  zona varchar(10) not null,
  cantidad int not null,
  tipo varchar(10) not null,

  /*constraints*/
  constraint pk_inventario primary key (codigo,c_tienda,c_producto),
  constraint fk_inventario_tienda foreign key (c_tienda) references tienda(codigo),
  constraint fk_inventario_producto foreign key (c_producto) references producto(codigo)

);


create table estatus(

 codigo int,
 descripcion varchar(50) not null,

 /*constraints*/
 constraint pk_estatus primary key (codigo)

);


create table pedido(

  codigo int,
  tipo varchar(100) not null,
  presupuesto bigint not null,
  fk_estatus int not null,
  fk_usuario int,
  fk_tienda int,

  /*constraints*/
  constraint pk_pedido primary key (codigo),
  constraint fk_pedido_estatus foreign key (fk_estatus) references estatus(codigo),
  constraint fk_pedido_usuario foreign key (fk_usuario) references usuario(id),
  constraint fk_pedido_tienda foreign key (fk_tienda) references tienda(codigo)

);


create table factura(

 codigo int,
 monto int not null,
 fecha datetime not null,
 fk_pedido int not null,

 /*constraints*/
 constraint pk_factura primary key (codigo),
 constraint fk_factura_pedido foreign key (fk_pedido) references pedido(codigo)

);

create table producto_factura (

  codigo int,
  c_producto int,
  c_factura int,


  /*constraints*/
  constraint pk_producto_factura primary key (codigo,c_producto,c_factura),
  constraint fk_producto_factura_producto foreign key (c_producto) references producto(codigo),
  constraint fk_producto_factura_factura foreign key (c_factura) references factura(codigo)

);


create table diario(

  codigo int,
  descripcion varchar(70) not null,
  fecha_emision datetime not null,
  fecha_vencimiento datetime not null,
  fk_empleado bigint not null,


  /*constraints*/
  constraint pk_diario primary key (codigo),
  constraint fk_diario_empleado foreign key (fk_empleado) references empleado(cedula)

);

create table descuento(

  codigo int,
  porcentaje int not null,
  descripcion varchar(100) not null,
  fk_pedido int,
  fk_producto int,

  /*constraints*/
  constraint pk_descuento primary key (codigo),
  constraint fk_descuento_pedido foreign key (fk_pedido) references pedido(codigo),
  constraint fk_descuento_producto foreign key (fk_producto) references producto(codigo)

);

create table diario_descuento(

   codigo int,
   c_diario int,
   c_descuento int,

   /*constraints*/
   constraint pk_diario_descuento primary key (codigo,c_diario,c_descuento),
   constraint fk_diario_descuento_diario foreign key (c_diario) references diario(codigo),
   constraint fk_diario_descuento_descuento foreign key (c_descuento) references descuento(codigo)

);



create table medio_pago(

 codigo int,
 tipo varchar (10) not null,
 num_tarjeta bigint,
 num_cheque bigint,

 /*constraints*/
 constraint pk_medio_pago primary key (codigo)

);

create table pago_factura(

 codigo int,
 c_factura int,
 c_medio int,

 /*constraints*/
 constraint pk_pago_factura primary key (codigo,c_factura,c_medio),
 constraint fk_pago_factura_factura foreign key (c_factura) references factura(codigo),
 constraint fk_pago_factura_medio foreign key (c_medio) references medio_pago(codigo)

);
