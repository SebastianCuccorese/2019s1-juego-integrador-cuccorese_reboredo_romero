import wollok.game.*
import estadosDeJuego.*
import zurg.*
import arma.*
import barrasDeEnergia.*
import niveles.*
import mochila.*

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
			self.darAConocerEstadoDeJuego()  //se analiza si perdio o derroto a zurg
		}
	}

	method derrotarAZurg(){ //este metodo es para que cuando se gane en la batalla final deje de poder moverse
		derroteAZurg = true
	}
	
	method darAConocerEstadoDeJuego(){
		if( not derroteAZurg){
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

	method guardarLlaves(llave) {
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
	
	method encontroLasLlaves(){return true}  //por el momento retorno true como prueba

}

