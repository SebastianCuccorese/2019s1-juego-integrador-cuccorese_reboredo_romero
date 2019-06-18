import wollok.game.*
import gameover.*
import zurg.*
import arma.*
import barrasDeEnergia.*
import niveles.*

object harold {

	var property salud = 100
	var property energia = 300
	const property mochila = []
	var property espada = false
	var property position = game.at(0, 0)
	var property oldPosition = game.at(0, 0)

	method image() = "jugador.png"

	method moverse(nuevaPosicion) {
		if (self.energia() > 0 and self.salud() > 0) {
			energia -= 1
			oldPosition = position
			position = nuevaPosicion
			self.estadoDeEnergia()
		} else {
			self.gameOverYReset()
		}
	}

	method gameOverYReset() {
		game.addVisual(gameover)
		game.addVisual(restart) // en gameover.wlk
		game.say(zurg, "Estas muerto")
		keyboard.enter().onPressDo{ nivel1.setear()} // vuelve a iniciar el juego
	}

	method setearEnergiaYSalud(num) {
		energia = num
		salud = num
	}

	method guardarComida(comida) {
		mochila.add(comida)
		game.removeVisual(comida)
	}

	method comerPrimeroDeLaMochila() {
		if (self.mochila().size() > 0 and self.energia() > 0) {
			energia += mochila.first().energia()
			mochila.remove(mochila.first())
		} else {
			throw new Exception("la mochila esta vacia")
		}
	} /*Cambio valor de Chocar enemigo luchar */

	method luchar(enemigo) {
		if (not self.espada()) {
			salud -= enemigo.ataque()
			position = oldPosition
			game.say(self, "No puedo pelear sin la espada")
		} else {
			game.removeVisual(enemigo)
		}
	}

	method estadoDeEnergia() {
		barraEnergia.energiaDe_(self)
		game.addVisual(barraEnergia)
	}

	method agarrarEspada() {
		espada = true
	}

	method perderEspada() {
		espada = false
	}

	method chocarConMuro() {
		salud -= 10
		position = oldPosition
	}

	method teEncontro(persona) {
	}

	method conocerEstadoDeSalud() {
		game.say(self, "tengo" + self.salud() + "de salud") // para que el usuario sepa cuanto tiene de salud
	}

}

