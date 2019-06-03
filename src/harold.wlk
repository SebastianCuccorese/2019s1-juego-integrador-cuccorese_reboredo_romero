import wollok.game.*

object harold {
	var property salud = 100
	var property energia = 10
	const property mochila = []
	var property posicion = game.at(0,0)
	
	method moverse(nuevaPosicion) {
		energia -= 1
		posicion = nuevaPosicion
	}
	method image() {return "jugador.png"}
	method guardarComida(comida) {
		mochila.add(comida)
	}
	method comerPrimeroDeLaMochila() {
		if(self.mochila().size() > 0) {
			energia += mochila.first().energia()
		}
		else { throw new Exception("la mochila esta vacia") }
	}
	method chocarEnemigo(enemigo) {
		salud -= enemigo.ataque()
	}
}
