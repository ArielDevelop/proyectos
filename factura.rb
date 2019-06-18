@@IVA = 0.21

class Producto
	attr_reader :precio
	def initialize(nombre, precio)
		@nombre = nombre
		@precio = precio
	end
end

class Promo 
	attr_reader :precio
	def initialize(nombre, precio, productos)
		@precio = precio
		@nombre = nombre
		@productos = productos
	end	
end

class Detalle_factura
	attr_reader :precioSubtotal
	def initialize(cantidad, producto)
		@cantidad = cantidad
		@producto = producto
		@precioSubtotal = cantidad*producto.precio
	end
end

class Factura
	attr_reader :precioNeto, :cantidadIVA, :precioTotal

	def initialize(cliente)
		@cliente = cliente
		@precioNeto = 0
		@detalles = []
		@cantidadIVA = 0
		@precioTotal = 0
	end

	def agregarDetalle(detalle)
		@detalles.push(detalle)
		@precioNeto += detalle.precioSubtotal
	end

	def calcularIVA
		@cantidadIVA = @precioNeto * @@IVA
	end

	def calcularPrecioTotal
		@precioTotal = @precioNeto + @cantidadIVA
	end
end

class Cliente
	def initialize(nombre, direccion, telefono)
		@nombre = nombre
		@direccion = direccion
		@telefono = telefono
	end
end

coca = Producto.new("CocaCola", 20)
galletitas = Producto.new("Sonrisas",15)
promo1 = Promo.new("Promo1", 30, [coca,galletitas])

cliente = Cliente.new("Pedro", "aaa", 1234555)
factura = Factura.new(cliente)

detalleDeFactura1 = Detalle_factura.new(4, coca)
detalleDeFactura2 = Detalle_factura.new(1, galletitas)
detalleDeFactura3 = Detalle_factura.new(1, promo1)

puts "PrecioNeto 1: " + factura.precioNeto.to_s

factura.agregarDetalle(detalleDeFactura1)
puts "PrecioNeto 2: " + factura.precioNeto.to_s

factura.agregarDetalle(detalleDeFactura2)
puts "PrecioNeto 3: " + factura.precioNeto.to_s

factura.agregarDetalle(detalleDeFactura3)
puts "PrecioNeto 4: " + factura.precioNeto.to_s

factura.calcularIVA
puts "IVA calculado: " + factura.cantidadIVA.to_s

factura.calcularPrecioTotal
puts "Precio total calculado: " + factura.precioTotal.to_s