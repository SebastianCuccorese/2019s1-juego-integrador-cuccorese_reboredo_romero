import wollok.game.*
import gameover.*
import zurg.*

object harold {
	var property salud = 100
	var property energia = 10
	const property mochila = []
	var property position = game.at(0,0)
	method image() = "jugador.png"
	method moverse(nuevaPosicion) {
		if (self.energia() > 0) {
			energia -= 1
			position = nuevaPosicion
			self.nivelesDeEnergia() 
		}
		else {
			game.addVisual(gameover)
			game.say(zurg, "Estas muerto")
		}
	}
	
	method guardarComida(comida) {
		game.removeVisual(comida)
		mochila.add(comida) 
	}
	method comerPrimeroDeLaMochila() {
		if(self.mochila().size() > 0 and self.energia() > 0) {
			energia += mochila.first().energia()
			mochila.remove(mochila.first())
		}
		else { throw new Exception("la mochila esta vacia") }
	}
	method chocarEnemigo(enemigo) {
		salud -= enemigo.ataque()
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
}
