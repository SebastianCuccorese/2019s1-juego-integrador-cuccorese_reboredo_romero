import wollok.game.*
class Espada{
	var property position
	method image()= "espada (1).png"
	method teEncontro(persona, siguienteNivel){
		persona.agarrarEspada()
		game.removeVisual(self)
	}
}
