# Requerimientos puntuales del proyecto 

 El sistema a desarrollar debe ser un sistema integral. Que pueda gestionar distintos módulos de 
 operación de la compañia Candy UCAB y a su vez funcionar como una tienda online. 

 Para que esto sea posible, es necesario que sea una aplicación web con dos modos de operación o
 dos vistas de usuario, una de administrador (empleado de la compañía) y otra de visitante (cliente
 jurídico o natural).



## Ventas (Lo más importante) 

 Según lo redactado, hay dos maneras de comprar los caramelos de candy ucab:

 Al momento de recibir una compra *virtual* , dicho sistema debe ser capaz de procesar dicha compra:

 - Mostrar precio del producto
 - Descontar de inventario
 - Registrar compra y emitir facturación (medios de pago, cliente, fecha, hora, total facturado, etc)
 - Emitir orden para despachar 
 - Control de entrega
 - Recibir pago mediante targetas de credito (pueden ser varias)

 Al momento la hora de recibir una compra *física* en una de sus tiendas oficiales, el sistema debe manejar dicha venta
 y poder realizar procesos como: 

  - Mostrar precio del producto
  - Descontar del inventario una vez entregado
  - Sumar puntos a la cuenta del cliente por haber comprado en una tienda física (el valor puntos/bsf puede cambiar)
  - Registrar compra (medios de pago, cliente, fecha, hora, total facturado, etc)
  - Capacidad para canjear puntos 
  - Registrar los medios de pago 
  - Generar orden de reposición de inventario por 10000 unidades cuando solo queden 100 de un producto

 El sistema integral debe emitir automáticamente cada 25 días el DiarioDulce (ofertas de caramelos durante 10 días).
 Dicha revista debe ser generada en base a las elecciones hechas por el "gerente general" sobre los caramelos a 
 ofertar.

 La vista usuario o cliente del sistema debe permitir pedir un presupuesto de un posible pedido, para ello
 el cliente debe estar afiliado a la red de la compañía. Si el cliente está conforme debe poder aprobar dicha compra para
 que el sistema pueda fijar una fecha de entrega a través del jefe de tienda mediante el departamento de ventas
 en línea.
 



## Departamentos

 
 El sistema requiere poder gestionar la sección de entrega de pedidos, por ello, debe manejar 4 departamentos:

  (1) Departamento de despacho. Departamento encargado de preparar el producto para ser entregado cuando se hace una compra 
      en línea o un pedido por parte de las tiendas oficiales.

  (2) Departamento de entrega. Encargado de recoger el pedido del departamento de despacho entregar el producto al cliente.

  (3) Departamento de Pedidos internos. Todo lo relacionado al realizar una compra desde una de las tiendas
      oficiales a la misma fábrica.

  (4) Departamento de Ventas en línea. Se encarga de procesar los presupuestos de los pedidos y de fijar fecha para la entrega.

 


## Distribución de los dulces


   una versión simplificada de la distribución de los dulces es:

    - El pedido debe ser recogido por web o por email. Se requiere que el sistema sustituya la funcionalidad del mail por la aplicacion web.
    - La entrega se deben cumplir en menos de 48 horas.

  Se requiere de un sistema que pueda recoger dichos pedidos y procesarlos durante su entrega
  para que no pase de 48 horas. 




## Módulos del sistema

 Se requiere que el sistema esté organizado por módulos de la siguiente forma:


  ### (a) Módulo de gestión de clientes

    Como su nombre lo indica, este módulo del sistema se encarga todo lo relacionado
    a los registros y operaciones con clientes. Venta, compra, canjeo de puntos, datos de clientes.



  ### (b) Módulo de gestión de reportes
  

   este módulo es el encargado de emitir las ordenes de compra, carnet de los clientes, etc.


   
  ### (c) Módulo de control de nómina
   
    Todo lo relacionado con el área de talento humano de la empresa. Controlar los horarios, vacaciones, salarios, beneficios, etc.
    también se requiere que el sistema pueda manejar la hora de llegada y la hora de salida de todos los empleados que trabajan en 
    sucursales y fábricas.



## Tiendas

 Además de poder realizar todas las funcionalidades anteriormente descritas, el sistema debe individualmente gestionar el almacén de 
 cada tienda oficial.

  - El sistema debe interpretar el método pick and mix como una forma de compra, hacer las consultas necesarias para poder 
    hallar un precio final de la venta.
 
  - Organizar productos por zona

  - Generar una orden de compra a la fábrica cuando queden en los almacenes 100 unidades de un producto. La orden de compra debe ser por         10000 (diez mil unidades)

  - Generar alertas al jefe de pasillo cuando queden 20 unidades de un productos en los anaqueles. Dicho producto va a ser restituido por
    los que hay en el almacen (del mismo producto).



## Carnet

 Para poder realizar cualquier compra en las tiendas candy shop , mini candy shop
 o compras a través de la aplicación web es necesario que el cliente esté registrado
 a la red de la compañía.

 Si es primera vez que el cliente compra se requiere que el sistema genere un carnet 
 y registre a dicho cliente basándose en los siguientes datos:

   ### Para personas Naturales (civil común)

       - RIF
       - CI
       - Nombres y Apellidos
       - Teléfonos y Correo Electrónico
       - Dirección de habitación
       - Medios de Pago

   ### Para personas Jurídicas (hoteles, restaurantes, comedores, hospitales...)

       - RIF
       - Denominación comercial y razón social 
       - Teléfonos y correo Electrónico  
       - Página Web   
       - Capital Disponible  
       - Personas de Contacto  
       - Medios de Pago  
       - Dirección Fiscal y Dirección Física Principal 