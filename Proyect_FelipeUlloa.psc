Algoritmo VentaProducto
	Definir producto como Cadena;
	Definir precio_original como Real;
	Definir cupon como Real;
	Definir IVA como Real;
	Definir cantidad_articulos Como Entero;
	Definir peso como Real;
	Definir destino como Cadena;
	Definir cantidad_productos Como Entero;
	Definir precio_impuesto Como Real;
	Definir respuesta Como Entero;
	Definir numero_de_producto Como Entero;
	Definir precio_suma Como Real;
	Definir descuentoPorCantidad Como Real;
	Definir envioCostoFijo Como Entero;
	Definir costoPorKilo Como Entero;
	Definir costoEnvio Como Real;
	
	IVA <- 1.12;
	cupon <- 0.95;
	
	Escribir "�Cu�ntos productos distintos desea comprar?";
	Leer cantidad_productos;
	
	Definir productos_por_procesar Como Entero;
	
	productos_por_procesar <- cantidad_productos;
	
	
	
	Dimension productos[cantidad_productos];
	
	numero_de_producto <- 1;
	
	
	precio_suma = 0
	unidades_suma = 0;
	peso_suma = 0;
	
	Mientras (productos_por_procesar > 0) Hacer
		
		Escribir "�Qu� producto desea llevar?";
		Leer producto;
		
		productos[numero_de_producto] <- producto;
		
		Escribir "Ingrese el precio del producto";
		leer precio_original;
		
		Escribir "�Cu�ntas unidades va a comprar?";
		Leer cantidad_articulos;
		
		unidades_suma <- unidades_suma  + cantidad_articulos;
		
		Escribir "�Cu�l es el peso del paquete? (en kg)";
		Leer peso;
		
		peso_suma <- peso_suma  + (peso * cantidad_articulos);
		
		precio_original <- precio_original * IVA;
		subTotal <- precio_original * cantidad_articulos;
		
		Escribir "Cada producto est� sujeto a un cobro de impuestos IVA, el precio total por unidad es de: $", precio_original, " pesos";
		Escribir "El total por la cantidad de productos de un mismo tipo es: $", subTotal, " pesos";
		
		precio_suma <- precio_suma  + subTotal;
		
		productos_por_procesar <- productos_por_procesar - 1;
		numero_de_producto <- numero_de_producto + 1;
		
		
		si (productos_por_procesar = 0) Entonces
			
			Definir DCTO_1 Como caracter;
			Definir porcentajeDCTO_1 Como Real;
			Definir descuentoCupon Como Real;
			Definir cuponSubTotal Como Real;
			
			porcentajeDCTO_1 <- 0.05;
			
			Escribir "Ingrese c�digo de descuento, si no posee, escriba continuar"
			Definir cuponDescuento Como Caracter;
			leer cuponDescuento
			
			si (cuponDescuento = 'DCTO_1') entonces
				descuentoCupon <- subTotal * porcentajeDCTO_1;
				cuponSubTotal <- precio_suma - descuentoCupon;
				
				Escribir "Su descuento del 5% equivalente a: $" descuentoCupon, " pesos ha sido restado exitosamente!";
				Escribir "El Subtotal de su compra es: ", cuponSubTotal;
				Escribir "�D�nde desea enviar su producto?";
				Leer destino;
				
			sino 
				 
				Escribir "El Subtotal de su compra es: ", precio_suma;
				Escribir "�D�nde desea enviar su producto?";
				Leer destino;
			FinSi
			
		FinSi
		
	FinMientras
	
	envioCostoFijo <- 1800;
	costoPorKilo <- 300;
	
	si (destino = caracter) entonces
		
		costoEnvio <-  envioCostoFijo + (peso_suma * costoPorKilo);
		
	FinSi
	
	definir DESCUENTO_10 Como Real;
	Definir DESCUENTO_20 Como Real;	
	Definir DESCUENTO_30 Como Real;
	
	DESCUENTO_30 <- 0.3;
	DESCUENTO_20 <- 0.2;
	DESCUENTO_10 <- 0.1;
	
	
	si (unidades_suma >= 15) entonces
		descuentoPorCantidad <- precio_suma * DESCUENTO_30;
		Escribir "Se ha agregado exitosamente un descuento del 30% al llevar m�s de 15 art�culos!"
	SiNo
		si (unidades_suma >= 10) Entonces
			descuentoPorCantidad <- precio_suma * DESCUENTO_20;
			Escribir "Se ha agregado exitosamente un descuento del 20% al llevar m�s de 10 art�culos!"
		sino 
			si (unidades_suma >= 5) Entonces
				descuentoPorCantidad <- precio_suma * DESCUENTO_10;
				Escribir "Se ha agregado exitosamente un descuento del 10% al llevar m�s de 5 art�culos!"
			SiNo
				descuentoPorCantidad <- 0;
			FinSi
		FinSi
	FinSi
	
	Escribir "==============================================="

	
	Escribir "Usted est� comprando los siguientes productos: ";
	Para i <- 1 Hasta cantidad_productos Hacer
		Escribir productos[i];
	FinPara
	
	Escribir "-----------------------------------------------"
	Escribir "El precio total de su compra m�s costos de env�o da un total de: $" (precio_suma - descuentoPorCantidad), " pesos";
	Escribir "-----------------------------------------------"
	Escribir "Aqu� puede revisar su boleta: ";
	Escribir " Precio total productos: 	$", precio_suma;
	Escribir " Descuento por Cantidad: 	$-", descuentoPorCantidad;
	Escribir " Descuento por Cup�n 	$-", descuentoCupon;
	Escribir " Costo de env�o por peso y destino: 	$", costoEnvio;
	
	
	
FinAlgoritmo