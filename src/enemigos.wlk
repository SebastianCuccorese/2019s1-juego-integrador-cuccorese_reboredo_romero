import wollok.game.*


class Enemigos {
	var property position
	var oldPosition = position
	
	method movimiento(){
		
	}
	method teEncontro(unPersonaje){
		unPersonaje.luchar(self)
	}
	method chocarConMuro() {
		position = oldPosition
	}
}

class Fantasma  {
	var property position
	const property ataque = 20
	method image()= "fantasma.png"
	method posicionRandom() {
	 	return 1.randomUpTo(12).truncate(0)
	 }
	 method position() {
	 	return game.at(self.posicionRandom(), self.posicionRandom())
	 }
	 method teEncontro(unPersonaje){
		unPersonaje.luchar(self)
	}
}

class Lobo inherits Enemigos {
		const property ataque = 30
		method image()= "lobo.png"
		override method movimiento() {
		if(self.position()== oldPosition) {
			position = game.at(self.position().x() + 1, self.position().y())
		} 
		else {position = game.at(self.position().x() - 1, self.position().y())}
	}
}
class Cangrejo inherits Enemigos {
	const property ataque = 10
	method image()= "cangrejo.png"
	override method movimiento() {
		if(self.position() == oldPosition) {
			position = game.at(self.position().x(), self.position().y() - 1)
		} 
		else {position = game.at(self.position().x(), self.position().y() - 1)}
	}
}


/*seria mmás funcional al juego que el cangrejo se mueva en y Y el lobo en X, no logre que funcione */
		
	


/*Hay que crear varios tipos de Enemigos. Uno es fantasma que pueda aparecer en una posicion ramdom del tablero
 * Otro cangrejo, que se mueva para adelante, costados y atras. Otro que avance y retroceda (lobo)
 * Nose porque asocie los enemigos con animales pero bueno ajaj, 
 */
