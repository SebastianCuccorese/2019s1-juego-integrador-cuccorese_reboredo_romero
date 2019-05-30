object harold  {
	var property salud = 100
	var property energia = 10
	const property mochila = []
	var property posicion = game.at(0,0)
	
	method perderSalud(numero) {
		salud -= numero
	}
	method moverse(direccion) {
	energia -= 1
	self.posicion(direccion)
	}
	method agregarComidaALaMochila(comida) {
		mochila.add(comida)
	}
	method comerDeLaMochila() {
		if(mochila.size() > 0) {
			energia += mochila.first()
			mochila.remove().first()
		}
		else {throw new Exception ("La mochila esta vacia")}
	}
}
