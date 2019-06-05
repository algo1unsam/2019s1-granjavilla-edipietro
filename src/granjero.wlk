import wollok.game.*
import mercado.*
import especies.*

object granjero {

	var property monedasacumuladas = 0
	var property especie = []
	var property position = game.at(8, 5)

	method move(nuevaPosicion) {
		self.position(nuevaPosicion)
	}

	method image() = "player.png"

	method agregoEspecie(especie_) {
		especie.add(especie_)
	}

	method cuantoTengo() {
		game.say(self, "Tengo " + self.cantidadEspecies().toString() + " especies y $ " + self.monedasacumuladas())
	}

	method agregoMonedas(monedas) {
		monedasacumuladas += monedas
	}

	method cantidadEspecies() = especie.size()

	method siembra(semilla) {
		if (self.nadaSembrado()) {
			game.addVisualIn(semilla,self.position())
		}
	}

	method regar() {
		(game.colliders(self)).forEach{ planta => planta.seRego()}
	}

	method nadaSembrado() = game.colliders(self).isEmpty()

	method error() {
		throw new Exception ("No hay nada para regar")
	}

	method noHaynadaparaRegar() {
		game.colliders(self).isEmpty()
	}

	method cosechar() {
		game.colliders(self).forEach{ especie_ => especie_.cosechar(self)}
	}

	method monedastotales() = especie.sum{ especie_ => especie_.cantidadMonedas() }

	method borrarespecie() {
		especie.clear()
	}

	method especieVendida() = especie

	method vender() {
		self.agregoMonedas(self.monedasacumuladas())
		self.borrarespecie()
	}

}

