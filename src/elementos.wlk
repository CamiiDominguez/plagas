class Barrio {
	var property elementos = []

	method todosLosBuenos() = elementos.filter({e => e.esBueno()}).size()
	method todosLosNoBuenos() = elementos.filter({e => not e.esBueno()}).size()
	method esCopado() = self.todosLosBuenos() > self.todosLosNoBuenos() 

}
class Elemento {
	method esBueno()	
}
class Hogar inherits Elemento {
	var property nivelDeMugre
	var property confortQueOfrece
	
	override method esBueno() = nivelDeMugre <= confortQueOfrece / 2 
}

class Huerta inherits Elemento {
	var property capacidadDeProduccion
	const property nivel
	
	override method esBueno() = capacidadDeProduccion > nivel
}

class Mascota inherits Elemento {
	var property nivelDeSalud
	
	override method esBueno() = nivelDeSalud > 250
	method masSaludable(numero) = nivelDeSalud > numero 
}