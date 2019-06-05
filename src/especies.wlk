import wollok.game.*
import granjero.*
import mercado.*

class Especie {
	
		method teCosecha(granjero) {
		if(self.listaParaCosechar()){
			game.removeVisual(self)
			granjero.agregoEspecie()
		}
		else 
		throw new Exception("No se puede cosechar")
	}

	method cantidadMonedas()

    method listaParaCosechar()

}

class SemillaMaiz inherits Especie {
	var property estaRegada = false
	
   method image() {return	if (self.estaRegada())   "corn_adult.png"
		else "corn_baby.png"
	}

	method seRego(){ estaRegada= true}

	override method listaParaCosechar() = self.estaRegada()

	
	override method cantidadMonedas() = 150
}

class SemillaTrigo inherits Especie {
	var property nivelEvolucion=nivel0
	
	method image() = nivelEvolucion.imagen()
	
	method seRego() { nivelEvolucion.evolucion(self) }
    
  
	override method listaParaCosechar() = self.nivelEvolucion().nivel() > 1

	override method cantidadMonedas() = (nivelEvolucion.nivel() - 1) * 100
	
}

class SemillaTomaco inherits Especie {
	method image() = "tomaco.png"
	
	method seRego() = granjero.position().up(1)
			
	override method listaParaCosechar() = true

	override method cantidadMonedas() = 80
}

object nivel0 {
	var property nivel = 0
     method imagen()="wheat_0.png"
	method evolucion(trigo) { trigo.nivelEvolucion(self) }

}

object nivel1 {

	var property nivel =  1
     method imagen()="wheat_1.png"
	method evolucion(trigo) { trigo.nivelEvolucion(self) }

}

object nivel2 {
	var property nivel = 2
    method imagen()="wheat_2.png"
	method evolucion(trigo) { trigo.nivelEvolucion(self)}
		}
	