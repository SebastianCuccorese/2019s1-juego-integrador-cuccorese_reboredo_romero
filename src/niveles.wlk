import wollok.game.*
import harold.*
import muros.*
import comida.*
import meta.*
import arma.*
import zurg.*
import barrasDeEnergia.*
import enemigos.*
import llaves.*
import estadosDeJuego.*

class Niveles {

	method siguienteNivel() {
		return nivel1
	}

	method pasarASiguienteNivel(personaje) {
		if (meta.position() == harold.position()) {
			harold.perderEspada()
			self.siguienteNivel().setear()
		} else {
			game.say(harold, "No puedo pasar de Nivel")
		}
	}

	method setear() {
		// Limpio todo primero que nada
		game.clear()
			// Muros
		self.murosLaterales()
		self.complejidad()
			// Personajes
		self.elementosEstandar()
		self.controles()
			// Colisiones
		self.colisionesEstandar()
	}

	method complejidad() {
	}

	method murosLaterales() {
		game.addVisual(new Muro(position = game.at(11, 11)))
		game.addVisual(new Muro(position = game.at(10, 11)))
		game.addVisual(new Muro(position = game.at(9, 11)))
		game.addVisual(new Muro(position = game.at(8, 11)))
		game.addVisual(new Muro(position = game.at(7, 11)))
		game.addVisual(new Muro(position = game.at(6, 11)))
		game.addVisual(new Muro(position = game.at(5, 11)))
		game.addVisual(new Muro(position = game.at(4, 11)))
		game.addVisual(new Muro(position = game.at(3, 11)))
		game.addVisual(new Muro(position = game.at(2, 11)))
		game.addVisual(new Muro(position = game.at(1, 11)))
		game.addVisual(new Muro(position = game.at(0, 11)))
		game.addVisual(new Muro(position = game.at(0, 1)))
		game.addVisual(new Muro(position = game.at(0, 2)))
		game.addVisual(new Muro(position = game.at(0, 3)))
		game.addVisual(new Muro(position = game.at(0, 4)))
		game.addVisual(new Muro(position = game.at(0, 5)))
		game.addVisual(new Muro(position = game.at(0, 6)))
		game.addVisual(new Muro(position = game.at(0, 7)))
		game.addVisual(new Muro(position = game.at(0, 8)))
		game.addVisual(new Muro(position = game.at(0, 9)))
		game.addVisual(new Muro(position = game.at(0, 10)))
		game.addVisual(new Muro(position = game.at(0, 11)))
		game.addVisual(new Muro(position = game.at(2, 0)))
		game.addVisual(new Muro(position = game.at(3, 0)))
		game.addVisual(new Muro(position = game.at(4, 0)))
		game.addVisual(new Muro(position = game.at(5, 0)))
		game.addVisual(new Muro(position = game.at(6, 0)))
		game.addVisual(new Muro(position = game.at(7, 0)))
		game.addVisual(new Muro(position = game.at(8, 0)))
		game.addVisual(new Muro(position = game.at(9, 0)))
		game.addVisual(new Muro(position = game.at(10, 0)))
		game.addVisual(new Muro(position = game.at(11, 0)))
		game.addVisual(new Muro(position = game.at(11, 9)))
		game.addVisual(new Muro(position = game.at(11, 8)))
		game.addVisual(new Muro(position = game.at(11, 7)))
		game.addVisual(new Muro(position = game.at(11, 6)))
		game.addVisual(new Muro(position = game.at(11, 5)))
		game.addVisual(new Muro(position = game.at(11, 4)))
		game.addVisual(new Muro(position = game.at(11, 3)))
		game.addVisual(new Muro(position = game.at(11, 2)))
		game.addVisual(new Muro(position = game.at(11, 1)))
	}

	method controles() {
		keyboard.up().onPressDo{ harold.moverse(harold.position().up(1))}
		keyboard.down().onPressDo{ harold.moverse(harold.position().down(1))}
		keyboard.right().onPressDo{ harold.moverse(harold.position().right(1))}
		keyboard.left().onPressDo{ harold.moverse(harold.position().left(1))}
		keyboard.z().onPressDo{ harold.comerPrimeroDeLaMochila()}
		keyboard.p().onPressDo{ self.pasarASiguienteNivel(harold)}
	}

	method elementosEstandar() {
		harold.position(game.at(0, 0))
		game.addVisual(harold)
		game.addVisual(meta)
		game.addVisual(zurg)
		harold.estadoDeEnergia() // asi la barra de energia siempre aparece
	}

	method colisionesEstandar() {
		game.whenCollideDo(harold, { cosa => cosa.teEncontro(harold)})
	}

}

object nivel1 inherits Niveles {

	override method siguienteNivel() {
		return nivel2
	}

	method estadoInicial() { // configura a harold en su estado inicial(para el reset)
		harold.setearEnergiaYSalud(300)
		harold.perderEspada()
	}

	method alimentos() {
		game.addVisual(new Guiso(position = game.at(1, 5)))
		game.addVisual(new Guiso(position = game.at(10, 6)))
		game.addVisual(new Hamburguesa(position = game.at(1, 3)))
		game.addVisual(new Hamburguesa(position = game.at(6, 1)))
		game.addVisual(new Empanadas(position = game.at(2, 10)))
	}

	method armas() {
		game.addVisual(new Espada(position = game.at(3, 3)))
	}

	method villanos() {
		var cangrejo = new Cangrejo(position = game.at(6, 5))
		game.addVisual(cangrejo)
		game.onTick(1000, "Canjero ataca", { cangrejo.movimiento()})
	}

	method murosInternos() {
		game.addVisual(new Muro(position = game.at(1, 10)))
		game.addVisual(new Muro(position = game.at(8, 10)))
		game.addVisual(new Muro(position = game.at(1, 9)))
		game.addVisual(new Muro(position = game.at(3, 9)))
		game.addVisual(new Muro(position = game.at(6, 9)))
		game.addVisual(new Muro(position = game.at(7, 9)))
		game.addVisual(new Muro(position = game.at(8, 9)))
		game.addVisual(new Muro(position = game.at(10, 9)))
		game.addVisual(new Muro(position = game.at(1, 8)))
		game.addVisual(new Muro(position = game.at(2, 8)))
		game.addVisual(new Muro(position = game.at(4, 8)))
		game.addVisual(new Muro(position = game.at(8, 8)))
		game.addVisual(new Muro(position = game.at(8, 7)))
		game.addVisual(new Muro(position = game.at(9, 7)))
		game.addVisual(new Muro(position = game.at(2, 6)))
		game.addVisual(new Muro(position = game.at(3, 6)))
		game.addVisual(new Muro(position = game.at(4, 6)))
		game.addVisual(new Muro(position = game.at(5, 6)))
		game.addVisual(new Muro(position = game.at(6, 6)))
		game.addVisual(new Muro(position = game.at(2, 5)))
		game.addVisual(new Muro(position = game.at(3, 5)))
		game.addVisual(new Muro(position = game.at(8, 5)))
		game.addVisual(new Muro(position = game.at(9, 5)))
		game.addVisual(new Muro(position = game.at(10, 5)))
		game.addVisual(new Muro(position = game.at(1, 4)))
		game.addVisual(new Muro(position = game.at(2, 4)))
		game.addVisual(new Muro(position = game.at(3, 4)))
		game.addVisual(new Muro(position = game.at(5, 4)))
		game.addVisual(new Muro(position = game.at(7, 4)))
		game.addVisual(new Muro(position = game.at(2, 3)))
		game.addVisual(new Muro(position = game.at(5, 3)))
		game.addVisual(new Muro(position = game.at(5, 2)))
		game.addVisual(new Muro(position = game.at(7, 2)))
		game.addVisual(new Muro(position = game.at(8, 2)))
		game.addVisual(new Muro(position = game.at(9, 2)))
		game.addVisual(new Muro(position = game.at(10, 2)))
		game.addVisual(new Muro(position = game.at(5, 1)))
	}

	override method complejidad() {
		self.murosInternos()
		self.alimentos()
		self.villanos()
		self.estadoInicial()
		self.armas()
	}

}

object nivel2 inherits Niveles {

	override method siguienteNivel() {
		return nivel3
	}

	method murosInternos() {
		game.addVisual(new Muro(position = game.at(5, 10)))
		game.addVisual(new Muro(position = game.at(5, 9)))
		game.addVisual(new Muro(position = game.at(9, 9)))
		game.addVisual(new Muro(position = game.at(5, 8)))
		game.addVisual(new Muro(position = game.at(8, 8)))
		game.addVisual(new Muro(position = game.at(2, 7)))
		game.addVisual(new Muro(position = game.at(3, 7)))
		game.addVisual(new Muro(position = game.at(10, 7)))
		game.addVisual(new Muro(position = game.at(2, 6)))
		game.addVisual(new Muro(position = game.at(3, 6)))
		game.addVisual(new Muro(position = game.at(4, 6)))
		game.addVisual(new Muro(position = game.at(7, 6)))
		game.addVisual(new Muro(position = game.at(10, 6)))
		game.addVisual(new Muro(position = game.at(5, 5)))
		game.addVisual(new Muro(position = game.at(7, 5)))
		game.addVisual(new Muro(position = game.at(8, 5)))
		game.addVisual(new Muro(position = game.at(10, 5)))
		game.addVisual(new Muro(position = game.at(1, 4)))
		game.addVisual(new Muro(position = game.at(5, 4)))
		game.addVisual(new Muro(position = game.at(7, 4)))
		game.addVisual(new Muro(position = game.at(7, 3)))
		game.addVisual(new Muro(position = game.at(9, 3)))
		game.addVisual(new Muro(position = game.at(10, 3)))
		game.addVisual(new Muro(position = game.at(2, 2)))
		game.addVisual(new Muro(position = game.at(3, 2)))
		game.addVisual(new Muro(position = game.at(4, 2)))
		game.addVisual(new Muro(position = game.at(6, 2)))
		game.addVisual(new Muro(position = game.at(7, 2)))
		game.addVisual(new Muro(position = game.at(8, 2)))
	}

	method armas() {
		game.addVisual(new Espada(position = game.at(10, 1)))
	}

	method alimentos() {
		game.addVisual(new Hamburguesa(position = game.at(1, 3)))
		game.addVisual(new Hamburguesa(position = game.at(8, 7)))
		game.addVisual(new Hamburguesa(position = game.at(1, 10)))
		game.addVisual(new Guiso(position = game.at(10, 4)))
		game.addVisual(new Guiso(position = game.at(1, 5)))
		game.addVisual(new Guiso(position = game.at(6, 10)))
		game.addVisual(new Empanadas(position = game.at(4, 10)))
		game.addVisual(new Empanadas(position = game.at(6, 3)))
	}

	method villanos() {
		var cangrejo = new Cangrejo(position = game.at(5, 3))
		var lobo = new Lobo(position = game.at(6, 7))
		var fantasma1 = new Fantasma(position = game.at(2, 5))
		var fantasma2 = new Fantasma(position = game.at(3, 8))
		game.addVisual(cangrejo)
		game.addVisual(lobo)
		game.addVisual(fantasma1)
		game.addVisual(fantasma2)
		game.onTick(750, "Canjero ataca", { cangrejo.movimiento()})
		game.onTick(750, "Lobo ataca", { lobo.movimiento()})
		game.onTick(5000, "fantasma ataca", { fantasma1.movimiento()})
		game.onTick(5000, "fantasma ataca", { fantasma2.movimiento()})
	}

	override method complejidad() {
		self.murosInternos()
		self.armas()
		self.alimentos()
		self.villanos()
	}

}

object nivel3 inherits Niveles {

	override method siguienteNivel() {
		return nivel4
	}

	method murosInternos() {
		game.addVisual(new Muro(position = game.at(9, 10)))
		game.addVisual(new Muro(position = game.at(4, 9)))
		game.addVisual(new Muro(position = game.at(9, 9)))
		game.addVisual(new Muro(position = game.at(2, 8)))
		game.addVisual(new Muro(position = game.at(4, 8)))
		game.addVisual(new Muro(position = game.at(5, 8)))
		game.addVisual(new Muro(position = game.at(6, 8)))
		game.addVisual(new Muro(position = game.at(9, 8)))
		game.addVisual(new Muro(position = game.at(2, 7)))
		game.addVisual(new Muro(position = game.at(4, 7)))
		game.addVisual(new Muro(position = game.at(2, 6)))
		game.addVisual(new Muro(position = game.at(4, 6)))
		game.addVisual(new Muro(position = game.at(10, 6)))
		game.addVisual(new Muro(position = game.at(2, 5)))
		game.addVisual(new Muro(position = game.at(5, 5)))
		game.addVisual(new Muro(position = game.at(6, 5)))
		game.addVisual(new Muro(position = game.at(7, 5)))
		game.addVisual(new Muro(position = game.at(9, 5)))
		game.addVisual(new Muro(position = game.at(2, 4)))
		game.addVisual(new Muro(position = game.at(3, 4)))
		game.addVisual(new Muro(position = game.at(2, 3)))
		game.addVisual(new Muro(position = game.at(3, 3)))
		game.addVisual(new Muro(position = game.at(5, 3)))
		game.addVisual(new Muro(position = game.at(6, 3)))
		game.addVisual(new Muro(position = game.at(7, 3)))
		game.addVisual(new Muro(position = game.at(8, 3)))
		game.addVisual(new Muro(position = game.at(9, 3)))
		game.addVisual(new Muro(position = game.at(3, 2)))
		game.addVisual(new Muro(position = game.at(8, 2)))
		game.addVisual(new Muro(position = game.at(3, 1)))
		game.addVisual(new Muro(position = game.at(8, 1)))
	}

	method armas() {
		game.addVisual(new Espada(position = game.at(7, 2)))
		game.addVisual(new Espada(position = game.at(3, 5)))
	}

	method alimentos() {
		game.addVisual(new Hamburguesa(position = game.at(2, 2)))
		game.addVisual(new Hamburguesa(position = game.at(10, 5)))
		game.addVisual(new Hamburguesa(position = game.at(8, 10)))
		game.addVisual(new Guiso(position = game.at(5, 7)))
		game.addVisual(new Guiso(position = game.at(9, 2)))
		game.addVisual(new Empanadas(position = game.at(10, 1)))
		game.addVisual(new Empanadas(position = game.at(4, 10)))
	}

	method villanos() {
		var cangrejo1 = new Cangrejo(position = game.at(2, 10))
		var cangrejo2 = new Cangrejo(position = game.at(8, 5))
		var lobo1 = new Lobo(position = game.at(8, 9))
		var fantasma = new Fantasma(position = game.at(9, 7))
		game.addVisual(cangrejo1)
		game.addVisual(cangrejo2)
		game.addVisual(lobo1)
		game.addVisual(fantasma)
		game.onTick(500, "Canjero1 ataca", { cangrejo1.movimiento()})
		game.onTick(500, "Canjero2 ataca", { cangrejo2.movimiento()})
		game.onTick(750, "Lobo1 ataca", { lobo1.movimiento()})
		game.onTick(3000, "fantasma ataca", { fantasma.movimiento()})
	}

	override method complejidad() {
		self.murosInternos()
		self.murosInternos()
		self.armas()
		self.alimentos()
		self.villanos()
	}

}

object nivel4 inherits Niveles {

	override method siguienteNivel() {
		return nivel5
	}

	method murosInternos() {
		game.addVisual(new Muro(position = game.at(4, 10)))
		game.addVisual(new Muro(position = game.at(2, 9)))
		game.addVisual(new Muro(position = game.at(4, 9)))
		game.addVisual(new Muro(position = game.at(6, 9)))
		game.addVisual(new Muro(position = game.at(8, 9)))
		game.addVisual(new Muro(position = game.at(10, 9)))
		game.addVisual(new Muro(position = game.at(2, 8)))
		game.addVisual(new Muro(position = game.at(4, 8)))
		game.addVisual(new Muro(position = game.at(6, 8)))
		game.addVisual(new Muro(position = game.at(8, 8)))
		game.addVisual(new Muro(position = game.at(10, 8)))
		game.addVisual(new Muro(position = game.at(2, 7)))
		game.addVisual(new Muro(position = game.at(6, 7)))
		game.addVisual(new Muro(position = game.at(8, 7)))
		game.addVisual(new Muro(position = game.at(10, 7)))
		game.addVisual(new Muro(position = game.at(2, 6)))
		game.addVisual(new Muro(position = game.at(3, 6)))
		game.addVisual(new Muro(position = game.at(5, 6)))
		game.addVisual(new Muro(position = game.at(8, 6)))
		game.addVisual(new Muro(position = game.at(3, 5)))
		game.addVisual(new Muro(position = game.at(5, 5)))
		game.addVisual(new Muro(position = game.at(7, 6)))
		game.addVisual(new Muro(position = game.at(8, 5)))
		game.addVisual(new Muro(position = game.at(9, 5)))
		game.addVisual(new Muro(position = game.at(1, 4)))
		game.addVisual(new Muro(position = game.at(3, 4)))
		game.addVisual(new Muro(position = game.at(4, 4)))
		game.addVisual(new Muro(position = game.at(5, 4)))
		game.addVisual(new Muro(position = game.at(7, 4)))
		game.addVisual(new Muro(position = game.at(1, 3)))
		game.addVisual(new Muro(position = game.at(9, 3)))
		game.addVisual(new Muro(position = game.at(1, 2)))
		game.addVisual(new Muro(position = game.at(2, 2)))
		game.addVisual(new Muro(position = game.at(3, 2)))
		game.addVisual(new Muro(position = game.at(4, 2)))
		game.addVisual(new Muro(position = game.at(5, 2)))
		game.addVisual(new Muro(position = game.at(6, 2)))
		game.addVisual(new Muro(position = game.at(7, 2)))
		game.addVisual(new Muro(position = game.at(8, 4)))
		game.addVisual(new Muro(position = game.at(9, 2)))
		game.addVisual(new Muro(position = game.at(9, 1)))
	}

	method armas() {
		game.addVisual(new Espada(position = game.at(4, 5)))
		game.addVisual(new Espada(position = game.at(7, 5)))
	}

	method alimentos() {
		game.addVisual(new Hamburguesa(position = game.at(3, 10)))
		game.addVisual(new Hamburguesa(position = game.at(8, 3)))
		game.addVisual(new Guiso(position = game.at(10, 1)))
		game.addVisual(new Guiso(position = game.at(7, 7)))
		game.addVisual(new Empanadas(position = game.at(1, 1)))
		game.addVisual(new Empanadas(position = game.at(10, 6)))
	}

	method villanos() {
		var cangrejo1 = new Cangrejo(position = game.at(6, 6))
		var cangrejo2 = new Cangrejo(position = game.at(9, 10))
		var lobo1 = new Lobo(position = game.at(5, 7))
		var lobo2 = new Lobo(position = game.at(10, 4))
		var fantasma = new Fantasma(position = game.at(2, 5))
		game.addVisual(cangrejo1)
		game.addVisual(cangrejo2)
		game.addVisual(lobo1)
		game.addVisual(lobo2)
		game.addVisual(fantasma)
		game.onTick(500, "Canjero1 ataca", { cangrejo1.movimiento()})
		game.onTick(500, "Canjero2 ataca", { cangrejo2.movimiento()})
		game.onTick(750, "Lobo1 ataca", { lobo1.movimiento()})
		game.onTick(750, "Lobo2 ataca", { lobo2.movimiento()})
		game.onTick(2000, "fantasma ataca", { fantasma.movimiento()})
	}

	override method complejidad() {
		self.murosInternos()
		self.murosInternos()
		self.armas()
		self.alimentos()
		self.villanos()
	}

}

object nivel5 inherits Niveles {

	override method siguienteNivel() {
		return batallaFinal
	}

	method murosInternos() {
		game.addVisual(new Muro(position = game.at(1, 10)))
		game.addVisual(new Muro(position = game.at(2, 10)))
		game.addVisual(new Muro(position = game.at(6, 10)))
		game.addVisual(new Muro(position = game.at(1, 9)))
		game.addVisual(new Muro(position = game.at(7, 9)))
		game.addVisual(new Muro(position = game.at(9, 9)))
		game.addVisual(new Muro(position = game.at(10, 9)))
		game.addVisual(new Muro(position = game.at(1, 8)))
		game.addVisual(new Muro(position = game.at(3, 8)))
		game.addVisual(new Muro(position = game.at(4, 8)))
		game.addVisual(new Muro(position = game.at(5, 8)))
		game.addVisual(new Muro(position = game.at(7, 8)))
		game.addVisual(new Muro(position = game.at(1, 7)))
		game.addVisual(new Muro(position = game.at(5, 7)))
		game.addVisual(new Muro(position = game.at(7, 7)))
		game.addVisual(new Muro(position = game.at(3, 6)))
		game.addVisual(new Muro(position = game.at(5, 6)))
		game.addVisual(new Muro(position = game.at(7, 6)))
		game.addVisual(new Muro(position = game.at(9, 6)))
		game.addVisual(new Muro(position = game.at(1, 5)))
		game.addVisual(new Muro(position = game.at(2, 5)))
		game.addVisual(new Muro(position = game.at(3, 5)))
		game.addVisual(new Muro(position = game.at(5, 5)))
		game.addVisual(new Muro(position = game.at(7, 5)))
		game.addVisual(new Muro(position = game.at(8, 5)))
		game.addVisual(new Muro(position = game.at(9, 5)))
		game.addVisual(new Muro(position = game.at(1, 4)))
		game.addVisual(new Muro(position = game.at(2, 4)))
		game.addVisual(new Muro(position = game.at(3, 4)))
		game.addVisual(new Muro(position = game.at(5, 4)))
		game.addVisual(new Muro(position = game.at(1, 3)))
		game.addVisual(new Muro(position = game.at(2, 3)))
		game.addVisual(new Muro(position = game.at(3, 3)))
		game.addVisual(new Muro(position = game.at(5, 3)))
		game.addVisual(new Muro(position = game.at(3, 2)))
		game.addVisual(new Muro(position = game.at(5, 2)))
		game.addVisual(new Muro(position = game.at(6, 2)))
		game.addVisual(new Muro(position = game.at(7, 2)))
		game.addVisual(new Muro(position = game.at(8, 2)))
		game.addVisual(new Muro(position = game.at(9, 2)))
	}

	method armas() {
		game.addVisual(new Espada(position = game.at(1, 6)))
		game.addVisual(new Espada(position = game.at(8, 6)))
	}

	method alimentos() {
		game.addVisual(new Hamburguesa(position = game.at(3, 10)))
		game.addVisual(new Hamburguesa(position = game.at(10, 1)))
		game.addVisual(new Hamburguesa(position = game.at(4, 7)))
		game.addVisual(new Guiso(position = game.at(6, 3)))
		game.addVisual(new Empanadas(position = game.at(10, 8)))
	}

	method villanos() {
		var cangrejo1 = new Cangrejo(position = game.at(2, 8))
		var cangrejo2 = new Cangrejo(position = game.at(2, 2))
		var cangrejo3 = new Cangrejo(position = game.at(8, 7))
		var lobo1 = new Lobo(position = game.at(8, 10))
		var lobo2 = new Lobo(position = game.at(10, 4))
		var fantasma = new Fantasma(position = game.at(6, 4))
		var fantasma2 = new Fantasma(position = game.at(10, 10))
		game.addVisual(cangrejo1)
		game.addVisual(cangrejo2)
		game.addVisual(cangrejo3)
		game.addVisual(lobo1)
		game.addVisual(lobo2)
		game.addVisual(fantasma)
		game.addVisual(fantasma2)
		game.onTick(500, "Canjero1 ataca", { cangrejo1.movimiento()})
		game.onTick(500, "Canjero2 ataca", { cangrejo2.movimiento()})
		game.onTick(500, "Canjero3 ataca", { cangrejo3.movimiento()})
		game.onTick(750, "Lobo1 ataca", { lobo1.movimiento()})
		game.onTick(750, "Lobo2 ataca", { lobo2.movimiento()})
		game.onTick(1500, "fantasma ataca", { fantasma.movimiento()})
		game.onTick(1500, "fantasma2 ataca", { fantasma2.movimiento()})
	}

	override method complejidad() {
		self.murosInternos()
		self.murosInternos()
		self.armas()
		self.alimentos()
		self.villanos()
	}

}

object batallaFinal inherits Niveles {

	override method siguienteNivel() {
		return nivel1
	}

	override method elementosEstandar() {
		harold.position(game.at(2, 6))
		zurg.position(game.at(9, 6))
		game.addVisual(zurg)
		game.addVisual(harold)
		harold.estadoDeEnergia()
	}

	override method pasarASiguienteNivel(personaje) {
		self.siguienteNivel().setear()
	}

	method murosInternos() {
		game.addVisual(new Muro(position = game.at(0, 0)))
		game.addVisual(new Muro(position = game.at(1, 0)))
		game.addVisual(new Muro(position = game.at(11, 10)))
		game.addVisual(new Muro(position = game.at(6, 1)))
		game.addVisual(new Muro(position = game.at(7, 1)))
		game.addVisual(new Muro(position = game.at(8, 1)))
		game.addVisual(new Muro(position = game.at(8, 2)))
		game.addVisual(new Muro(position = game.at(8, 3)))
		game.addVisual(new Muro(position = game.at(8, 4)))
		game.addVisual(new Muro(position = game.at(8, 5)))
		game.addVisual(new Muro(position = game.at(7, 5)))
		game.addVisual(new Muro(position = game.at(5, 2)))
		game.addVisual(new Muro(position = game.at(4, 3)))
		game.addVisual(new Muro(position = game.at(3, 4)))
		game.addVisual(new Muro(position = game.at(2, 5)))
		game.addVisual(new Muro(position = game.at(2, 7)))
		game.addVisual(new Muro(position = game.at(3, 8)))
		game.addVisual(new Muro(position = game.at(4, 9)))
		game.addVisual(new Muro(position = game.at(6, 10)))
		game.addVisual(new Muro(position = game.at(4, 8)))
		game.addVisual(new Muro(position = game.at(7, 8)))
		game.addVisual(new Muro(position = game.at(8, 7)))
		game.addVisual(new Muro(position = game.at(8, 8)))
		game.addVisual(new Muro(position = game.at(8, 9)))
		game.addVisual(new Muro(position = game.at(8, 10)))
		game.addVisual(new Muro(position = game.at(5, 8)))
	}

	method villanos() {
		var cangrejo1 = new Cangrejo(position = game.at(3, 7))
		var cangrejo2 = new Cangrejo(position = game.at(5, 7))
		var cangrejo3 = new Cangrejo(position = game.at(6, 5))
		var cangrejo4 = new Cangrejo(position = game.at(7, 3))
		var lobo1 = new Lobo(position = game.at(6, 3))
		var lobo2 = new Lobo(position = game.at(4, 5))
		var lobo3 = new Lobo(position = game.at(7, 7))
		var lobo4 = new Lobo(position = game.at(7, 9))
		game.addVisual(cangrejo1)
		game.addVisual(cangrejo2)
		game.addVisual(cangrejo3)
		game.addVisual(lobo1)
		game.addVisual(lobo2)
		game.addVisual(lobo3)
		game.addVisual(lobo4)
		game.onTick(500, "Canjero1 ataca", { cangrejo1.movimiento()})
		game.onTick(500, "Canjero2 ataca", { cangrejo2.movimiento()})
		game.onTick(500, "Canjero3 ataca", { cangrejo3.movimiento()})
		game.onTick(500, "Canjero4 ataca", { cangrejo4.movimiento()})
		game.onTick(500, "Lobo1 ataca", { lobo1.movimiento()})
		game.onTick(500, "Lobo2 ataca", { lobo2.movimiento()})
		game.onTick(500, "Lobo3 ataca", { lobo3.movimiento()})
		game.onTick(500, "Lobo4 ataca", { lobo4.movimiento()})
	}

	method llaves() {
		game.addVisual(new Llave(position = game.at(4, 4)))
		game.addVisual(new Llave(position = game.at(4, 7)))
		game.addVisual(new Llave(position = game.at(6, 2)))
		game.addVisual(new Llave(position = game.at(7, 6)))
		game.addVisual(new Llave(position = game.at(7, 4)))
		game.addVisual(new Llave(position = game.at(5, 9)))
	}

	override method controles() {
		keyboard.up().onPressDo{ harold.moverse(harold.position().up(1))}
		keyboard.down().onPressDo{ harold.moverse(harold.position().down(1))}
		keyboard.right().onPressDo{ harold.moverse(harold.position().right(1))}
		keyboard.left().onPressDo{ harold.moverse(harold.position().left(1))}
		keyboard.z().onPressDo{ harold.comerPrimeroDeLaMochila()}
		keyboard.x().onPressDo{ self.vencerAZurg()} // esto sigue la logica de p con la meta, pero con zurg
		// tuve que sobreescribir los controles porque crei que era mejor sacar la opcion de apretar p porque el objetivo es vencer a zurg no pasar de nivel
	}

	method vencerAZurg() {
		if (harold.encontroLasLlaves() and harold.position() == zurg.position()) { // metodo que retorna true cuando harold posee 6 llaves (que son las de la batalla), no toco eso hasta que este la mochila
			harold.derrotarAZurg()
			game.removeVisual(zurg)
			game.addVisual(youWin)
			game.addVisual(restart)
			keyboard.enter().onPressDo{ self.pasarASiguienteNivel(harold)}
		} else {
			game.say(harold, "no puedo derrotar a Zurg aún")
		}
	}

	override method complejidad() {
		self.murosInternos()
		self.villanos()
		self.llaves()
	}

}

/*bueno como ven la batalla final esta pensada como otro nivel, use solo cangrejos y lobos porque sus movimientos me venian bien, aca no hay espadas por lo que 
 * harold tiene que solo esquivar los villanos y buscar las 6 llaves, cuando se para sobre zurrg se apreta x para derrotarlo y se gana la partida, esta la opcion de volver a jugar al final
 * asi como sta ya pude probarlo y anda, falta terminar la parte de la mochila y la llave que al colisionar con harold da error, seba toque un poco a harold porque queria que no pueda moverse 
 * cuando gane, esta todo comentado. siento que estoy escribiendo un re texto tengo sueño bai
 * 
 */
