# Requerimientos puntuales del proyecto 

 El sistema a desarrollar debe ser un sistema integral. Que pueda gestionar distintos m�dulos de 
 operaci�n de la compa�ia Candy UCAB y a su vez funcionar como una tienda online. 

 Para que esto sea posible, es necesario que sea una aplicaci�n web con dos modos de operaci�n o
 dos vistas de usuario, una de administrador (empleado de la compa��a) y otra de visitante (cliente
 jur�dico o natural).



## Ventas (Lo m�s importante) 

 Seg�n lo redactado, hay dos maneras de comprar los caramelos de candy ucab:

 Al momento de recibir una compra *virtual* , dicho sistema debe ser capaz de procesar dicha compra:

 - Mostrar precio del producto
 - Descontar de inventario
 - Registrar compra y emitir facturaci�n (medios de pago, cliente, fecha, hora, total facturado, etc)
 - Emitir orden para despachar 
 - Control de entrega
 - Recibir pago mediante targetas de credito (pueden ser varias)

 Al momento la hora de recibir una compra *f�sica* en una de sus tiendas oficiales, el sistema debe manejar dicha venta
 y poder realizar procesos como: 

  - Mostrar precio del producto
  - Descontar del inventario una vez entregado
  - Sumar puntos a la cuenta del cliente por haber comprado en una tienda f�sica (el valor puntos/bsf puede cambiar)
  - Registrar compra (medios de pago, cliente, fecha, hora, total facturado, etc)
  - Capacidad para canjear puntos 
  - Registrar los medios de pago 
  - Generar orden de reposici�n de inventario por 10000 unidades cuando solo queden 100 de un producto

 El sistema integral debe emitir autom�ticamente cada 25 d�as el DiarioDulce (ofertas de caramelos durante 10 d�as).
 Dicha revista debe ser generada en base a las elecciones hechas por el "gerente general" sobre los caramelos a 
 ofertar.

 La vista usuario o cliente del sistema debe permitir pedir un presupuesto de un posible pedido, para ello
 el cliente debe estar afiliado a la red de la compa��a. Si el cliente est� conforme debe poder aprobar dicha compra para
 que el sistema pueda fijar una fecha de entrega a trav�s del jefe de tienda mediante el departamento de ventas
 en l�nea.
 



## Departamentos

 
 El sistema requiere poder gestionar la secci�n de entrega de pedidos, por ello, debe manejar 4 departamentos:

  (1) Departamento de despacho. Departamento encargado de preparar el producto para ser entregado cuando se hace una compra 
      en l�nea o un pedido por parte de las tiendas oficiales.

  (2) Departamento de entrega. Encargado de recoger el pedido del departamento de despacho entregar el producto al cliente.

  (3) Departamento de Pedidos internos. Todo lo relacionado al realizar una compra desde una de las tiendas
      oficiales a la misma f�brica.

  (4) Departamento de Ventas en l�nea. Se encarga de procesar los presupuestos de los pedidos y de fijar fecha para la entrega.

 


## Distribuci�n de los dulces


   una versi�n simplificada de la distribuci�n de los dulces es:

    - El pedido debe ser recogido por web o por email. Se requiere que el sistema sustituya la funcionalidad del mail por la aplicacion web.
    - La entrega se deben cumplir en menos de 48 horas.

  Se requiere de un sistema que pueda recoger dichos pedidos y procesarlos durante su entrega
  para que no pase de 48 horas. 




## M�dulos del sistema

 Se requiere que el sistema est� organizado por m�dulos de la siguiente forma:


  ### (a) M�dulo de gesti�n de clientes

    Como su nombre lo indica, este m�dulo del sistema se encarga todo lo relacionado
    a los registros y operaciones con clientes. Venta, compra, canjeo de puntos, datos de clientes.



  ### (b) M�dulo de gesti�n de reportes
  

   este m�dulo es el encargado de emitir las ordenes de compra, carnet de los clientes, etc.


   
  ### (c) M�dulo de control de n�mina
   
    Todo lo relacionado con el �rea de talento humano de la empresa. Controlar los horarios, vacaciones, salarios, beneficios, etc.
    tambi�n se requiere que el sistema pueda manejar la hora de llegada y la hora de salida de todos los empleados que trabajan en 
    sucursales y f�bricas.



## Tiendas

 Adem�s de poder realizar todas las funcionalidades anteriormente descritas, el sistema debe individualmente gestionar el almac�n de 
 cada tienda oficial.

  - El sistema debe interpretar el m�todo pick and mix como una forma de compra, hacer las consultas necesarias para poder 
    hallar un precio final de la venta.
 
  - Organizar productos por zona

  - Generar una orden de compra a la f�brica cuando queden en los almacenes 100 unidades de un producto. La orden de compra debe ser por         10000 (diez mil unidades)

  - Generar alertas al jefe de pasillo cuando queden 20 unidades de un productos en los anaqueles. Dicho producto va a ser restituido por
    los que hay en el almacen (del mismo producto).



## Carnet

 Para poder realizar cualquier compra en las tiendas candy shop , mini candy shop
 o compras a trav�s de la aplicaci�n web es necesario que el cliente est� registrado
 a la red de la compa��a.

 Si es primera vez que el cliente compra se requiere que el sistema genere un carnet 
 y registre a dicho cliente bas�ndose en los siguientes datos:

   ### Para personas Naturales (civil com�n)

       - RIF
       - CI
       - Nombres y Apellidos
       - Tel�fonos y Correo Electr�nico
       - Direcci�n de habitaci�n
       - Medios de Pago

   ### Para personas Jur�dicas (hoteles, restaurantes, comedores, hospitales...)

       - RIF
       - Denominaci�n comercial y raz�n social 
       - Tel�fonos y correo Electr�nico  
       - P�gina Web   
       - Capital Disponible  
       - Personas de Contacto  
       - Medios de Pago  
       - Direcci�n Fiscal y Direcci�n F�sica Principal 