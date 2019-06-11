import wollok.game.*
import gameover.*
import zurg.*
import arma.*

object harold {
	var property salud = 100
	var property energia = 10
	const property mochila = []
	var property espada = false
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
	method chocarConMuro(muro) {
		self.chocarConMurosLaterales(muro)
	}
	
	
	method chocarConMurosLaterales(muro) {
	if(muro.position().y() == 11) {
		self.colisionConMuroSuperior(muro) 
		}	
	else if(muro.position().x() == 12) {
		self.colisionConMuroDerecha(muro)
		}
	else if(muro.position().y() == 1) {
		self.colisionConMuroInferior(muro)
		}
	else if(muro.position().x() == 1) {
		self.colisionConMuroIzquierda(muro)
		}
	}
	method colisionConMuroSuperior(muro) {
		if(muro.position().y() == self.position().y()) {
			salud -= 10
		self.moverse(self.position().down(1))
		}
	}
		method colisionConMuroDerecha(muro) {
		if(muro.position().x() == self.position().x()) {
			salud -= 10
		self.moverse(self.position().left(1))
		}
	}
		method colisionConMuroInferior(muro) {
		if(muro.position().y() == self.position().y()) {
			salud -= 10
		self.moverse(self.position().up(1))
		}	
	}
		method colisionConMuroIzquierda(muro) {
		if(muro.position().x() == self.position().x()) {
			salud -= 10
		self.moverse(self.position().right(1))
		}
	}
}