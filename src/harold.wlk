import wollok.game.*
import estadosDeJuego.*
import zurg.*
import arma.*
import barrasDeEnergia.*
import niveles.*
import mochila.*
import meta.*

object harold {

	var property salud = 100
	var property energia = 300
	const property mochilaDeHarold = mochila
	var property espada = false
	var property position = game.at(0, 0)
	var property oldPosition = game.at(0, 0)
	var derroteAZurg = false

	method image() = "jugador.png"

	method moverse(nuevaPosicion) {
		if (self.energia() > 0 and self.salud() > 0 and not derroteAZurg) {
			energia -= 1
			oldPosition = position
			position = nuevaPosicion
			self.estadoDeEnergia()
		} else {
			self.darAConocerEstadoDeJuego() // se analiza si perdio o derroto a zurg
		}
	}

	method derrotarAZurg() { // este metodo es para que cuando se gane en la batalla final deje de poder moverse
		derroteAZurg = true
	}

	method darAConocerEstadoDeJuego() {
		if (not derroteAZurg) {
			self.gameOverYReset()
		}
	}

	method gameOverYReset() {
		game.addVisual(gameover)
		game.addVisual(restart)
		game.say(zurg, "Estas muerto")
		keyboard.enter().onPressDo{ nivel1.setear()} // vuelve a iniciar el juego
	}

	method setearEnergiaYSalud(num) {
		energia = num
		salud = num
	}

	method guardarLlave(llave) {
		mochilaDeHarold.guardarLlave(llave)
		game.removeVisual(llave)
	}

	method guardarComida(comida) {
		mochilaDeHarold.guardarComida(comida)
		game.removeVisual(comida)
	}

	method comerPrimeroDeLaMochila() {
		if (self.mochilaDeHarold().comidas().size() > 0 and self.energia() > 0) {
			energia += mochilaDeHarold.comidas().first().energia()
			mochilaDeHarold.comidas().remove(mochilaDeHarold.comidas().first())
			self.estadoDeEnergia()
		} else {
			throw new Exception("la mochila esta vacia")
		}
	} 

	method luchar(enemigo) {
		if (not self.espada()) {
			salud -= enemigo.ataque()
			position = oldPosition
			self.estadoDeSalud()
			game.say(self, "No puedo pelear sin la espada")
		} else {
			game.removeVisual(enemigo)
		}
	}

	method estadoDeEnergia() {
		barraEnergia.energiaDe_(self)
		game.addVisual(barraEnergia)
	}

	method estadoDeSalud() {
		barraDeSalud.saludDe_(self)
		game.addVisual(barraDeSalud)
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
		self.estadoDeSalud()
	}

	method teEncontro(persona) {
	}

	method conocerEstadoDeSalud() {
		game.say(self, "tengo" + self.salud() + "de salud") // para que el usuario sepa cuanto tiene de salud
	}

	method encontroLasLlaves() {
		return mochilaDeHarold.estanLasSeisLlavesBuscadas()
	}

	method soltarLlaves() {
		mochilaDeHarold.sacarLlaves()
	}

	method tieneLlave() {
		return mochilaDeHarold.hayLlave()
	}

	method cantidadDeComida() {
		return mochilaDeHarold.cantidadDeComida()
	}
	method puedePasarDeNivel(){
		return ((meta.position() ==  self.position()) and (self.tieneLlave()))
	}
	method porqueNoPuedePasar(){
		if (meta.position() !=  self.position()){
			game.say(self, "No estoy en la posicion de la Meta")
		}else{
			game.say(self, "No recolecte la llave correspondiente")
		}
	}

}

