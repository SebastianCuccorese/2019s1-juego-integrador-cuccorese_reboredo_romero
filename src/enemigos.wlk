import wollok.game.*

class Enemigos {

	var property position
	var property oldPosition = position

	method teEncontro(unPersonaje) {
		unPersonaje.luchar(self)
	}

	method chocarConMuro() {
		position = oldPosition
	}

	method x() {
		return self.position().x()
	}

	method y() {
		return self.position().y()
	}

	method derecha() {
		position = game.at(self.x() + 1, self.y())
	}

	method izquierda() {
		position = game.at(self.x() - 1, self.y())
	}

	method subir() {
		position = game.at(self.x(), self.y() + 1)
	}

	method bajar() {
		position = game.at(self.x(), self.y() - 1)
	}

	method cambioDePosicion() {
		return position != oldPosition
	}

	method recuperarPosicion() {
		position = oldPosition
	}

	method seteoInicial() {
		if (oldPosition == null) {
			oldPosition = position
		}
	}

	method posicionRandom() {
		position = game.at((1.randomUpTo(12)).truncate(0), (1.randomUpTo(12).truncate(0)))
	}

}

class Fantasma inherits Enemigos {

	const property ataque = 20
	var property imagen = "fantasma.png"

	method image() = imagen

	method movimiento() {
		if (self.imagen() == "fantasma.png") {
			imagen = "fantasma_invisible.png"
		} else {
			imagen = "fantasma.png"
		}
	}

}

class Lobo inherits Enemigos {

	const property ataque = 30

	method image() = "lobo.png"

	method movimiento() {
		self.seteoInicial()
		if (self.cambioDePosicion()) {
			self.derecha()
		} else {
			self.izquierda()
		}
	}

}

class Cangrejo inherits Enemigos {

	const property ataque = 10

	method image() = "cangrejo.png"

	method movimiento() {
		self.seteoInicial()
		if (self.cambioDePosicion()) {
			self.subir()
		} else {
			self.bajar()
		}
	}

}

/*seria mmás funcional al juego que el cangrejo se mueva en y Y el lobo en X, no logre que funcione */
/*Hay que crear varios tipos de Enemigos. Uno es fantasma que pueda aparecer en una posicion ramdom del tablero
 * Otro cangrejo, que se mueva para adelante, costados y atras. Otro que avance y retroceda (lobo)
 * Nose porque asocie los enemigos con animales pero bueno ajaj, 
 */
