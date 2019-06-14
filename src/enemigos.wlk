import wollok.game.*


class Enemigos {
	var property position
	var property ataque
	var property oldPosition = position
	
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
	var property ataque
	method image()= "fantasma.png"
	method posicionRandom() {
	 	return 1.randomUpTo(12).truncate(0)
	 }
	 method position() {
	 	return game.at(self.posicionRandom(), self.posicionRandom())
	 }
}

class Lobo inherits Enemigos {
		method image()= "lobo.png"
		override method movimiento() {
		if(self.position().x() != 12) {
			position += self.position().x() + 1
		} 
		else {position -= self.position().x() - 1}
	}
}
class Cangrejo inherits Enemigos {
	method image()= "cangrejo.png"
	override method movimiento() {
		if(self.position().x() != 12) {
			position += self.position().x() + 1
			position += self.position().y() + 1
		
		} 
		else {position -= self.position().x() - 1
			  position -= self.position().y() - 1
		}
	}
}
		
	


/*Hay que crear varios tipos de Enemigos. Uno es fantasma que pueda aparecer en una posicion ramdom del tablero
 * Otro cangrejo, que se mueva para adelante, costados y atras. Otro que avance y retroceda (lobo)
 * Nose porque asocie los enemigos con animales pero bueno ajaj, 
 */
