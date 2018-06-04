/*rol_privilegio*/
alter table rol_privilegio add constraint fk_rol_privilegio_rol foreign key (c_rol) references rol(codigo);
alter table rol_privilegio add constraint fk_rol_privilegio_privilegio foreign key (c_priv) references privilegio(codigo);

/*usuario*/
alter table usuario add constraint fk_usuario_rol foreign key (fk_rol) references rol(codigo);
alter table usuario add constraint fk_usuario_juridico foreign key (fk_juridico) references juridico(rif);
alter table usuario add constraint fk_usuario_naturale foreign key (fk_naturale) references naturale(cedula);
alter table usuario add constraint fk_usuario_empleado foreign key (fk_empleado) references empleado(cedula);


/*lugar*/
alter table lugar add constraint fk_lugar_lugar foreign key (fk_lugar) references lugar(codigo);

/*juridico*/
alter table juridico add constraint fk_juridico_lugar foreign key (fk_lugar) references lugar(codigo);
alter table juridico add constraint fk_juridico_lugar_fiscal foreign key (fk_lugar_fiscal) references lugar(codigo);
alter table juridico add constraint fk_juridico_tienda foreign key (fk_tienda) references tienda(codigo);

/*naturale*/
alter table naturale add constraint fk_naturale_lugar foreign key (fk_lugar) references lugar(codigo);
alter table naturale add constraint fk_naturale_tienda foreign key (fk_tienda) references tienda(codigo);

/*telefono*/
alter table telefono add constraint fk_telefono_juridico foreign key (fk_juridico) references juridico(rif);
alter table telefono add constraint fk_telefono_naturale foreign key (fk_naturale) references naturale(cedula);

/*contacto*/
alter table contacto add constraint fk_contacto_juridico foreign key (fk_juridico) references juridico(rif);

/*producto*/
alter table producto add constraint fk_producto_tipo foreign key (fk_tipo) references tipo(codigo);

/*asistencia*/
alter table asistencia add constraint fk_asistencia_empleado foreign key (c_empleado) references empleado(cedula);
alter table asistencia add constraint fk_asistencia_horario foreign key (c_horario) references horario(clave);

/*vacacion*/
alter table vacacion add constraint fk_vacacion_empleado foreign key (fk_empleado) references empleado(cedula);

 /*tienda*/
 alter table tienda add constraint fk_tienda_lugar foreign key (fk_lugar) references lugar(codigo);

 /*departamento*/
 alter table departamento add constraint fk_departamento_tienda foreign key (fk_tienda) references tienda(codigo);

 /*review*/
 alter table review add constraint fk_review_usuario foreign key (c_usuario) references usuario(id);
 alter table review add constraint fk_review_producto foreign key (c_producto) references producto(codigo);

 /*inventario*/
 alter table inventario add constraint fk_inventario_tienda foreign key (c_tienda) references tienda(codigo);
 alter table inventario add constraint fk_inventario_producto foreign key (c_producto) references producto(codigo);

 /*pedido_estatus*/
 alter table pedido_estatus add constraint fk_pedido_estatus_pedido foreign key (c_pedido) references pedido(codigo);
 alter table pedido_estatus add constraint fk_pedido_estatus_estatus foreign key (c_estatus) references estatus(codigo);


 /*pedido*/
 alter table pedido add constraint fk_pedido_presupuesto foreign key (c_presupuesto) references presupuesto(codigo);

 /*presupuesto*/
 alter table presupuesto add constraint fk_presupuesto_juridico foreign key (fk_juridico) references juridico(rif);
 alter table presupuesto add constraint fk_presupuesto_naturale foreign key (fk_naturale) references naturale(cedula);
 alter table presupuesto add constraint fk_presupuesto_tienda foreign key (fk_tienda) references tienda(codigo);
 alter table presupuesto add constraint fk_presupuesto_usuario foreign key (fk_usuario) references usuario(id);

/*producto_presupuesto*/
alter table producto_presupuesto add constraint fk_producto_presupuesto_presupuesto foreign key (c_presupuesto) references presupuesto(codigo);
alter table producto_presupuesto add constraint fk_producto_presupuesto_producto foreign key (c_producto) references producto(codigo);


 /*pago*/
 alter table pago add constraint fk_pago_pedido foreign key (fk_pedido) references pedido(codigo);
 alter table pago add constraint fk_pago_medio_pago foreign key (fk_medio_pago) references medio_pago(codigo);

 /*medio pago*/
 alter table medio_pago add constraint fk_medio_pago_juridico foreign key (fk_juridico) references juridico(rif);
 alter table medio_pago add constraint fk_medio_pago_naturale foreign key (fk_naturale) references naturale(cedula);

/*diario*/
alter table diario add constraint fk_diario_empleado foreign key (fk_empleado) references empleado(cedula);

/*descuento*/
alter table descuento add constraint fk_descuento_producto foreign key (fk_producto) references producto(codigo);


/*diario_descuento*/
alter table diario_descuento add constraint fk_diario_descuento_diario foreign key (c_diario) references diario(codigo);
alter table diario_descuento add constraint fk_diario_descuento_descuento foreign key (c_descuento) references descuento(codigo);

/*punto_cliente*/
alter table punto_cliente add constraint fk_punto_cliente_juridico foreign key (fk_juridico) references juridico(rif);
alter table punto_cliente add constraint fk_punto_cliente_naturale foreign key (fk_naturale) references naturale(cedula);
alter table punto_cliente add constraint fk_punto_cliente_punto foreign key (fk_punto) references punto(codigo);
