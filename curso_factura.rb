@@IVA = 0.21

class Cliente

	attr_reader :nombre, :direccion, :telefono, :cuil

	def initialize(nombre, direccion, telefono, cuil)
		@nombre = nombre
		@direccion = direccion
		@telefono = telefono
		@cuil = cuil
	end

end


class Producto

	attr_reader :nombre, :descripcion, :precio_unitario

	def initialize(nombre, descripcion, precio_unitario)
		@nombre = nombre
		@descripcion = descripcion
		@precio_unitario = precio_unitario
	end
	
end


class Promo

	attr_reader :precio_promo, :descripcion_promo, :precio_unitario

	def initialize(nombre, descripcion_promo, precio_unitario)
		@nombre = nombre
		@descripcion_promo = descripcion_promo
		@precio_promo = precio_unitario
	end
	
end


class Detella_factura

	attr_reader  :cantidad, :producto, :total_detalle

	def initialize(cantidad, producto)
		@cantidad = cantidad
		@producto = producto
		@total_detalle = cantidad*producto.precio_unitario
	end

end


class Factura

	attr_reader :cliente, :detalles_factura, :total_neto, :total_iva, :total_factura

	def initialize(cliente)
		@cliente = cliente
		@detalles_factura = []
		@total_neto = 0
		@total_iva = 0
		@total_factura = 0
	end

	#Metodos propios
	def agregar_detalle(detalles_factura)
		@detalles_factura.push(detalles_factura)
		@total_neto += detalles_factura.total_detalle
	end

	def calcular_precio_con_iva
		@total_iva += @total_neto * @@IVA
	end

	def calcular_precio_total
		@total_factura += @total_neto + @total_iva
	end

end

gaseosa = Producto.new("coca", "gaseosa cola", 20)
hamburguesa = Producto.new("patagónico", "hamburguesa_con_queso", 35)
#promo1 = Promo.new("promo1", "hamburguesa con gaseosa", 45)
cliente = Cliente.new("Ariel Gutierrez", "Soler 355", 64432342, 25-34534543-5)
cliente2 = Cliente.new("Silvia Ayerdi", "Fragio 7655", 65453445, 27-34534543-1)
detalles_factura1 = Detella_factura.new(4, gaseosa)
detalles_factura2 = Detella_factura.new(2, hamburguesa)
#detalles_factura3 = Detella_factura.new(1, promo1)
detalles_factura3 = Detella_factura.new(1, gaseosa)
detalles_factura4 = Detella_factura.new(1, hamburguesa)

factura = Factura.new(cliente)
puts "Cliente: " + cliente.nombre
puts "Monto detalle: " + factura.agregar_detalle(detalles_factura1).to_s
puts "Monto detalle: " + factura.agregar_detalle(detalles_factura2).to_s
#puts factura.agregar_detalle(detalles_factura3).to_s
puts "Monto IVA: " + factura.calcular_precio_con_iva.to_s
puts "Monto total: " + factura.calcular_precio_total.to_s


factura = Factura.new(cliente2)
puts "Cliente: " + cliente2.nombre
puts "Cantidad: " + detalles_factura3.cantidad.to_s + 
" - Descripcion: " + detalles_factura3.producto.nombre.to_s +  
" - Monto detalle: " + factura.agregar_detalle(detalles_factura3).to_s
puts "Monto detalle: " + factura.agregar_detalle(detalles_factura4).to_s
#puts factura.agregar_detalle(detalles_factura3).to_s
puts "Monto IVA: " + factura.calcular_precio_con_iva.to_s
puts "Monto total: " + factura.calcular_precio_total.to_s

