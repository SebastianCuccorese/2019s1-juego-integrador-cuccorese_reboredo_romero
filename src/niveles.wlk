import wollok.game.*
import harold.*
import muros.*
import comida.*
import meta.*
import arma.*
import zurg.*

class Niveles{
	var property niveles = [nivel1, nivel2, nivel3, nivel4, nivel5]
	method nivel(){
		self.niveles(niveles.drop(1))
		return self.niveles().first()
	}
	method setear(){}
	method complejidad(){}
	method murosLaterales(){
	game.addVisual(new Muro(position = game.at(11,11)))
	game.addVisual(new Muro(position = game.at(10,11)))
	game.addVisual(new Muro(position = game.at(9,11)))
	game.addVisual(new Muro(position = game.at(8,11)))
	game.addVisual(new Muro(position = game.at(7,11)))
	game.addVisual(new Muro(position = game.at(6,11)))
	game.addVisual(new Muro(position = game.at(5,11)))
	game.addVisual(new Muro(position = game.at(4,11)))
	game.addVisual(new Muro(position = game.at(3,11)))
	game.addVisual(new Muro(position = game.at(2,11)))
	game.addVisual(new Muro(position = game.at(1,11)))
	game.addVisual(new Muro(position = game.at(0,11)))
	game.addVisual(new Muro(position = game.at(0,1)))
	game.addVisual(new Muro(position = game.at(0,2)))
	game.addVisual(new Muro(position = game.at(0,3)))
	game.addVisual(new Muro(position = game.at(0,4)))
	game.addVisual(new Muro(position = game.at(0,5)))
	game.addVisual(new Muro(position = game.at(0,6)))
	game.addVisual(new Muro(position = game.at(0,7)))
	game.addVisual(new Muro(position = game.at(0,8)))
	game.addVisual(new Muro(position = game.at(0,9)))
	game.addVisual(new Muro(position = game.at(0,10)))
	game.addVisual(new Muro(position = game.at(0,11)))
	game.addVisual(new Muro(position = game.at(2,0)))
	game.addVisual(new Muro(position = game.at(3,0)))
	game.addVisual(new Muro(position = game.at(4,0)))
	game.addVisual(new Muro(position = game.at(5,0)))
	game.addVisual(new Muro(position = game.at(6,0)))
	game.addVisual(new Muro(position = game.at(7,0)))
	game.addVisual(new Muro(position = game.at(8,0)))
	game.addVisual(new Muro(position = game.at(9,0)))
	game.addVisual(new Muro(position = game.at(10,0)))
	game.addVisual(new Muro(position = game.at(11,0)))
	game.addVisual(new Muro(position = game.at(11,9)))
	game.addVisual(new Muro(position = game.at(11,8)))
	game.addVisual(new Muro(position = game.at(11,7)))
	game.addVisual(new Muro(position = game.at(11,6)))
	game.addVisual(new Muro(position = game.at(11,5)))
	game.addVisual(new Muro(position = game.at(11,4)))
	game.addVisual(new Muro(position = game.at(11,3)))
	game.addVisual(new Muro(position = game.at(11,2)))
	game.addVisual(new Muro(position = game.at(11,1)))
	}
}


object nivel1 inherits Niveles{
	override method complejidad(){
		game.addVisual(new Muro(position = game.at(1,10)))							game.addVisual(new Muro(position = game.at(8,10)))			
game.addVisual(new Muro(position = game.at(1,9)))		game.addVisual(new Muro(position = game.at(3,9)))			game.addVisual(new Muro(position = game.at(6,9)))	game.addVisual(new Muro(position = game.at(7,9)))	game.addVisual(new Muro(position = game.at(8,9)))		game.addVisual(new Muro(position = game.at(10,9)))	
game.addVisual(new Muro(position = game.at(1,8)))	game.addVisual(new Muro(position = game.at(2,8)))		game.addVisual(new Muro(position = game.at(4,8)))				game.addVisual(new Muro(position = game.at(8,8)))			
							game.addVisual(new Muro(position = game.at(8,7)))	game.addVisual(new Muro(position = game.at(9,7)))		
	game.addVisual(new Muro(position = game.at(2,6)))	game.addVisual(new Muro(position = game.at(3,6)))	game.addVisual(new Muro(position = game.at(4,6)))	game.addVisual(new Muro(position = game.at(5,6)))	game.addVisual(new Muro(position = game.at(6,6)))					
	game.addVisual(new Muro(position = game.at(2,5)))	game.addVisual(new Muro(position = game.at(3,5)))					game.addVisual(new Muro(position = game.at(8,5)))	game.addVisual(new Muro(position = game.at(9,5)))	game.addVisual(new Muro(position = game.at(10,5)))	
game.addVisual(new Muro(position = game.at(1,4)))	game.addVisual(new Muro(position = game.at(2,4)))	game.addVisual(new Muro(position = game.at(3,4)))		game.addVisual(new Muro(position = game.at(5,4)))		game.addVisual(new Muro(position = game.at(7,4)))				
	game.addVisual(new Muro(position = game.at(2,3)))			game.addVisual(new Muro(position = game.at(5,3)))						
			
	}
	override method setear(){
	
	//Muros
	self.murosLaterales()
	self.complejidad()
		
	// elementos
	game.addVisual(new Guiso(position = game.at(5,3)))
	game.addVisual(new Hamburguesa(position = game.at(5,9)))
	game.addVisual(new Empanadas(position = game.at(7,4)))
	game.addVisual(new Espada(position= game.at(4,3)))
	
	//Personajes y enemigos
	
	game.addVisual(harold)
	game.addVisual(meta)
	game.addVisual(zurg)//OJO ZURG DEBERIA ESTAR ARRIBA DE UN PEDESTAL. BUSCAR IMG
	
	//Colisiones
	game.whenCollideDo(meta, {meta => meta.siguienteNivel(self.nivel())})
	}
}

object nivel2 inherits Niveles{
	override method complejidad(){
	}
	override method setear(){
	game.clear()
	//Muros
	self.murosLaterales()
	self.complejidad()
	game.addVisual(harold)	
	// elementos
	/*game.addVisual(new Guiso(position = game.at(5,3)))
	game.addVisual(new Hamburguesa(position = game.at(5,9)))
	game.addVisual(new Empanadas(position = game.at(7,4)))
	game.addVisual(new Espada(position= game.at(4,3)))
	
	//Personajes y enemigos
	
	game.addVisual(harold)
	game.addVisual(meta)
	game.addVisual(zurg)//OJO ZURG DEBERIA ESTAR ARRIBA DE UN PEDESTAL. BUSCAR IMG*/
	
	//Colisiones
	game.whenCollideDo(meta, {meta => meta.siguienteNivel(self.nivel())})
	}
	}
	object nivel3 inherits Niveles{
	override method complejidad(){
	}
	override method setear(){
	
	//Muros
	self.murosLaterales()
	self.complejidad()
		
	// elementos
	game.addVisual(new Guiso(position = game.at(5,3)))
	game.addVisual(new Hamburguesa(position = game.at(5,9)))
	game.addVisual(new Empanadas(position = game.at(7,4)))
	game.addVisual(new Espada(position= game.at(4,3)))
	
	//Personajes y enemigos
	
	game.addVisual(harold)
	game.addVisual(meta)
	game.addVisual(zurg)//OJO ZURG DEBERIA ESTAR ARRIBA DE UN PEDESTAL. BUSCAR IMG
	
	//Colisiones
	game.whenCollideDo(meta, {cosa => cosa.teEncontro(harold)})
	}
	}
	object nivel4 inherits Niveles{
	override method complejidad(){
	}
	override method setear(){
	
	//Muros
	self.murosLaterales()
	self.complejidad()
		
	// elementos
	game.addVisual(new Guiso(position = game.at(5,3)))
	game.addVisual(new Hamburguesa(position = game.at(5,9)))
	game.addVisual(new Empanadas(position = game.at(7,4)))
	game.addVisual(new Espada(position= game.at(4,3)))
	
	//Personajes y enemigos
	
	game.addVisual(harold)
	game.addVisual(meta)
	game.addVisual(zurg)//OJO ZURG DEBERIA ESTAR ARRIBA DE UN PEDESTAL. BUSCAR IMG
	
	//Colisiones
	game.whenCollideDo(meta, {cosa => cosa.teEncontro(harold)})
	}
	}
	object nivel5 inherits Niveles{
	override method complejidad(){
	}
	override method setear(){
	
	//Muros
	self.murosLaterales()
	self.complejidad()
		
	// elementos
	game.addVisual(new Guiso(position = game.at(5,3)))
	game.addVisual(new Hamburguesa(position = game.at(5,9)))
	game.addVisual(new Empanadas(position = game.at(7,4)))
	game.addVisual(new Espada(position= game.at(4,3)))
	
	//Personajes y enemigos
	
	game.addVisual(harold)
	game.addVisual(meta)
	game.addVisual(zurg)//OJO ZURG DEBERIA ESTAR ARRIBA DE UN PEDESTAL. BUSCAR IMG
	
	//Colisiones
	game.whenCollideDo(meta, {cosa => cosa.teEncontro(harold)})
	}
	}