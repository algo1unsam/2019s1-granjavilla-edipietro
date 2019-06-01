import wollok.game.*
import especies.*
import granjero.*

class Mercado {

	var property monedas = 0
	var property inventario = []
	var property position

	method image() = "market.png"

	method agregarEspecies(especie) {
		inventario.addAll(especie)
	}

	method consultaStock() {
		game.say(self, "Tengo " + self.inventariodePlantas().toString() + " plantas en venta y " + self.monedas() + " monedas")
	}

	method inventariodePlantas() = inventario.size()

	method restarMonedas(nuevasMonedas) {
		monedas -= nuevasMonedas
	}

	method comprar(persona) {
		if (persona.monedasacumuladas() < monedas) {
			self.pagoA(persona)
			self.entregolasEspecies(persona)
			self.consultaStock()
		} else game.say(self, "No me alcanzan las monedas")
	}

	method pagoA(persona) {
		persona.agregoMonedas(persona.monedastotales())
	}

	method entregolasEspecies(persona) {
		self.restarMonedas(persona.monedastotales())
		self.agregarEspecies(persona.especiesVendidas())
		persona.borrarEspecie()
	}

}

