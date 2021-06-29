import plagas.*
class Barrio {
	var property elementos = []

	method todosLosBuenos() = elementos.filter({e => e.esBueno()}).size()
	method todosLosNoBuenos() = elementos.filter({e => not e.esBueno()}).size()
	method esCopado() = self.todosLosBuenos() > self.todosLosNoBuenos() 

}
class Elemento {
	method esBueno()
	method efectoDeAtaque(plaga)
}
class Hogar inherits Elemento {
	var property nivelDeMugre
	var property confortQueOfrece
	
	override method esBueno() = nivelDeMugre <= confortQueOfrece / 2 
	override method efectoDeAtaque(plaga) { plaga.nivelDeDanio() + self.nivelDeMugre() }   
}

class Huerta inherits Elemento {
	var property capacidadDeProduccion
	const property nivel
	
	override method esBueno() = capacidadDeProduccion > nivel
	override method efectoDeAtaque(plaga) { 
		 self.capacidadDeProduccion() - (plaga.nivelDeDanio() * 0.1)
		if (plaga.transmiteEnfermedades()) { self.capacidadDeProduccion() - 18 }
	}
}

class Mascota inherits Elemento {
	var property nivelDeSalud
	
	override method esBueno() = nivelDeSalud > 250
	method masSaludable(numero) = nivelDeSalud > numero 
	override method efectoDeAtaque(plaga) {
		if (plaga.transmiteEnfermedades()) self.nivelDeSalud() - plaga.nivelDeDanio()
	}
}