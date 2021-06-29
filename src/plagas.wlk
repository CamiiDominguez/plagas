class Plaga {
	var property poblacion
	
	method nivelDeDanio() 
	method transmiteEnfermedades() = poblacion >= 10
} 
class Cucarachas inherits Plaga {
	var property pesoPromedio
	
	override method nivelDeDanio() = poblacion / 2
	override method transmiteEnfermedades() = super() and pesoPromedio >= 10 
}
class Mosquitos inherits Plaga {
	override method nivelDeDanio() = poblacion
	override method transmiteEnfermedades() = super() and poblacion % 3 == 0 
}
class Pulgas inherits Plaga {
	override method nivelDeDanio() = poblacion * 2
}
class Garrapatas inherits Pulgas { }