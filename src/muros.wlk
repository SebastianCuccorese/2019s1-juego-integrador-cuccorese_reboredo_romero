import wollok.game.*

class Muro{
	var property position
	method image() = "muro.png"
	method teEncontro(persona){ persona.chocarConMuro()}
	
}
