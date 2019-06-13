import wollok.game.*
import gameover.*
import zurg.*
import arma.*

object harold {
	var property salud = 100
	var property energia = 100
	const property mochila = []
	var property espada = false
	var property position = game.at(0,0)
	var property oldPosition = game.at(0,0)
	method image() = "jugador.png"
	method moverse(nuevaPosicion) {
		if (self.energia() > 0) {
			energia -= 1
			oldPosition = position
			position = nuevaPosicion
			self.nivelesDeEnergia() 
		}
		else {
			game.addVisual(gameover)
			game.say(zurg, "Estas muerto")
		}
	}
	
	method guardarComida(comida) {

		mochila.add(comida) 
		game.removeVisual(comida)
		}
	method comerPrimeroDeLaMochila() {
		if(self.mochila().size() > 0 and self.energia() > 0) {
			energia += mochila.first().energia()
			mochila.remove(mochila.first())
		}
		else { throw new Exception("la mochila esta vacia") }
	}/*Cambio valor de Chocar enemigo luchar */
	method luchar(enemigo) {
		if(not self.espada()) {
		salud -= enemigo.ataque() }
		else {game.removeVisual(enemigo)}
		
	}
	method nivelesDeEnergia(){
		//tengo que editar barras
		if(energia >= 10){
			//barra al 100
		}
		else if(energia < 10 and energia >= 5){
			//barra al 50
		}
		else if(energia == 3){
			//barra casi en 0
			game.say(self,"necesito energía")
		}
	}
	method agarrarEspada() {
			espada = true		
	}
	method perderEspada(){
		espada = false
	}
	method chocarConMuro() {
		salud -= 10
		position = oldPosition
	}
	method teEncontro(persona){}
}