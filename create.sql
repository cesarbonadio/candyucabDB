create table rol(

 codigo numeric(2),
 descripcion varchar(80) not null unique,

 /*constraints*/
 constraint pk_rol primary key (codigo)

);

create table privilegio(

 codigo numeric(2),
 descripcion varchar(80) not null unique,

 /*constraints*/
 constraint pk_privilegio primary key (codigo)

);

create table rol_privilegio(

  codigo numeric(3),
  c_rol numeric(2),
  c_priv numeric(2),

  /*constraints*/
  constraint pk_rol_privilegio primary key (codigo,c_rol,c_priv),
  constraint fk_rol_privilegio_rol foreign key (c_rol) references rol(codigo),
  constraint fk_rol_privilegio_privilegio foreign key (c_priv) references privilegio(codigo)

);

create table usuario(

 id numeric(8),
 username varchar(20) not null unique,
 password varchar(20) not null,
 puntos numeric(18) not null,
 fk_rol numeric(2) not null,

 /*constraints*/
 constraint pk_usuario primary key (id),
 constraint fk_usuario_rol foreign key (fk_rol) references rol(codigo)

);



create table lugar(


 codigo numeric(10),
 nombre varchar(30) not null,
 tipo varchar(20) not null,
 fk_lugar numeric(10),

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
   capital numeric(20,2) not null,
   fk_lugar numeric(10) not null,
   fk_usuario numeric(8) not null,

   /*constraints*/
   constraint pk_juridico primary key (rif),
   constraint fk_juridico_lugar foreign key (fk_lugar) references lugar(codigo),
   constraint fk_juridico_usuario foreign key (fk_usuario) references usuario(id)

);


create table naturale(

   cedula numeric(9),
   rif varchar(40) not null unique,
   correo varchar(40) not null unique,
   nombre varchar(40) not null,
   apellido varchar(40) not null,
   fk_lugar numeric(10) not null,
   fk_usuario numeric(8) not null,

   /*constraints*/
   constraint pk_naturale primary key (cedula),
   constraint fk_naturale_lugar foreign key (fk_lugar) references lugar(codigo),
   constraint fk_naturale_usuario foreign key (fk_usuario) references usuario(id)


);


create table telefono(

   valor numeric(11),
   tipo varchar(5),
   fk_juridico varchar(40),
   fk_naturale numeric(9),

   /*constraints*/
   constraint pk_telefono primary key (valor),
   constraint fk_telefono_juridico foreign key (fk_juridico) references juridico(rif),
   constraint fk_telefono_naturale foreign key (fk_naturale) references naturale(cedula)

);



create table contacto(

   cedula numeric(9),
   nombre varchar(40) not null,
   apellido varchar(40) not null,
   funcion varchar (20) not null,
   fk_juridico varchar(40) not null,

   /*constraints*/
   constraint pk_contacto primary key (cedula),
   constraint fk_contacto_juridico foreign key (fk_juridico) references juridico(rif)


);

create table producto(

   codigo numeric(6),
   nombre varchar(40) not null,
   descripcion varchar(400) not null,
   precio numeric(20,2) not null,
   ranking numeric(10),
   foto varchar(70) not null unique,

   /*constraints*/
   constraint pk_producto primary key (codigo)

);

create table empleado(

  cedula numeric(9),
  nombre varchar(40) not null,
  apellido varchar(40) not null,
  cargo varchar(20) not null,
  fk_usuario numeric(8) not null,

  /*constraints*/
  constraint pk_empleado primary key (cedula),
  constraint fk_empleado_usuario foreign key (fk_usuario) references usuario(id)

);

create table horario(

   clave numeric(5),
   tipo_turno varchar(100) not null,
   llega datetime not null,
   sale datetime not null,

   /*constraints*/
   constraint pk_clave primary key (clave)

);


create table asistencia(

   codigo numeric(8),
   c_empleado numeric(9),
   c_horario numeric(5),
   fecha date not null,
   hora_llegada datetime not null,
   hora_salida datetime not null,

   /*constraints*/
   constraint pk_asistencia primary key (codigo, c_empleado, c_horario),
   constraint fk_asistencia_empleado foreign key (c_empleado) references empleado(cedula),
   constraint fk_asistencia_horario foreign key (c_horario) references horario(clave)

);

create table vacacion(

   codigo numeric(5),
   tipo varchar(50) not null unique,
   descripcion varchar(100) not null unique,

   /*constraints*/
   constraint pk_vacacion primary key (codigo)

);

create table empleado_vacacion(

  codigo numeric(8),
  c_empleado numeric(9),
  c_vacacion numeric(5),
  fecha_inicial datetime not null,
  fecha_final datetime not null,

  /*constraints*/
  constraint pk_empleado_vacacion primary key (codigo,c_empleado,c_vacacion),
  constraint fk_empleado_vacacion_empleado foreign key (c_empleado) references empleado(cedula),
  constraint fk_empleado_vacacion_vacacion foreign key (c_vacacion) references vacacion(codigo)

);

create table tienda(

  codigo numeric(4),
  nombre varchar(50),
  fk_lugar numeric(10) not null,

  /*constraints*/
  constraint pk_tienda primary key (codigo),
  constraint fk_tienda_lugar foreign key (fk_lugar) references lugar(codigo)

);

create table review (

  codigo numeric(10),
  c_usuario numeric(8),
  c_producto numeric(6),
  valoracion numeric(10,1),
  descripcion varchar(400),

  /*constraints*/
  constraint pk_review primary key (codigo,c_usuario,c_producto),
  constraint fk_review_usuario foreign key (c_usuario) references usuario(id),
  constraint fk_review_producto foreign key (c_producto) references producto(codigo)

);

create table inventario (

  codigo numeric(10),
  c_tienda numeric(4),
  c_producto numeric(6),
  zona varchar(10) not null,
  cantidad numeric(5) not null,
  tipo varchar(10) not null,

  /*constraints*/
  constraint pk_inventario primary key (codigo,c_tienda,c_producto),
  constraint fk_inventario_tienda foreign key (c_tienda) references tienda(codigo),
  constraint fk_inventario_producto foreign key (c_producto) references producto(codigo)

);


create table estatus(

 codigo numeric(1),
 descripcion varchar(50) not null,

 /*constraints*/
 constraint pk_estatus primary key (codigo)

);


create table pedido(

  codigo numeric(10),
  tipo varchar(100) not null,
  presupuesto bigint not null,
  fk_estatus numeric(1) not null,
  fk_usuario numeric(8),
  fk_tienda numeric(4),

  /*constraints*/
  constraint pk_pedido primary key (codigo),
  constraint fk_pedido_estatus foreign key (fk_estatus) references estatus(codigo),
  constraint fk_pedido_usuario foreign key (fk_usuario) references usuario(id),
  constraint fk_pedido_tienda foreign key (fk_tienda) references tienda(codigo)

);


create table factura(

 codigo numeric(11),
 monto numeric(20,2) not null,
 fecha datetime not null,
 fk_pedido numeric(10) not null,

 /*constraints*/
 constraint pk_factura primary key (codigo),
 constraint fk_factura_pedido foreign key (fk_pedido) references pedido(codigo)

);

create table producto_factura (

  codigo numeric(10),
  c_producto numeric(6),
  c_factura numeric(11),


  /*constraints*/
  constraint pk_producto_factura primary key (codigo,c_producto,c_factura),
  constraint fk_producto_factura_producto foreign key (c_producto) references producto(codigo),
  constraint fk_producto_factura_factura foreign key (c_factura) references factura(codigo)

);


create table diario(

  codigo numeric(5),
  descripcion varchar(70) not null,
  fecha_emision datetime not null,
  fecha_vencimiento datetime not null,
  fk_empleado numeric(9) not null,


  /*constraints*/
  constraint pk_diario primary key (codigo),
  constraint fk_diario_empleado foreign key (fk_empleado) references empleado(cedula)

);

create table descuento(

  codigo numeric(6),
  porcentaje numeric(3,2) not null,
  descripcion varchar(100) not null,
  fk_pedido numeric(10),
  fk_producto numeric(6),

  /*constraints*/
  constraint pk_descuento primary key (codigo),
  constraint fk_descuento_pedido foreign key (fk_pedido) references pedido(codigo),
  constraint fk_descuento_producto foreign key (fk_producto) references producto(codigo)

);

create table diario_descuento(

   codigo numeric(8),
   c_diario numeric(5),
   c_descuento numeric(6),

   /*constraints*/
   constraint pk_diario_descuento primary key (codigo,c_diario,c_descuento),
   constraint fk_diario_descuento_diario foreign key (c_diario) references diario(codigo),
   constraint fk_diario_descuento_descuento foreign key (c_descuento) references descuento(codigo)

);



create table medio_pago(

 codigo numeric(2),
 tipo varchar (10) not null,
 num_tarjeta numeric(16),
 num_cheque numeric(10),

 /*constraints*/
 constraint pk_medio_pago primary key (codigo)

);

create table pago_factura(

 codigo numeric(12),
 c_factura numeric(11),
 c_medio numeric(2),

 /*constraints*/
 constraint pk_pago_factura primary key (codigo,c_factura,c_medio),
 constraint fk_pago_factura_factura foreign key (c_factura) references factura(codigo),
 constraint fk_pago_factura_medio foreign key (c_medio) references medio_pago(codigo)

);
