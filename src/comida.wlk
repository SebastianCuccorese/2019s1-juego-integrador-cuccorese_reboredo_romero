class Comida{
	method teEncontro(persona){
		persona.guardarComida(self)
	}
}

class Guiso inherits Comida{
	var property position
	method image()= "guiso.png"
	method energia() = 15
	
}

class Empanadas inherits Comida{
	var property position
	method image()= "empanadas.png"
	method energia() = 10
}

class Hamburguesa inherits Comida{
	var property position
	method image()= "hamburguesa.png"
	method energia() = 8
}