import wollok.game.*

object barraEnergia {
	var property position = game.at(9,0)
	var estado
	method image()= "energia-" + estado + ".png"
	method energiaDe_(persona){
		if(persona.energia() >= 150){
			estado = 1
		}
		else if(persona.energia() < 150 and persona.energia() > 75){
			estado = 1
		}
		else if(persona.energia() <= 75 and persona.energia() > 20){
			estado = 2
		}
		else if(persona.energia() <= 20 and persona.energia() > 0){
			estado = 3
		}
		else if(persona.energia() == 0){
			estado = 4
		}
	}
	
}

object energia{
	var property position = game.at(8,0)
	method image()="energia.jpg"
}

object barraDeSalud{
	var property position = game.at(6,0)
	var estado
	method image()= "energia-" + estado + ".png"
	
	method saludDe_(persona){
		if(persona.salud() <= 150 and persona.salud() > 75){
			estado = 1
		}
		else if(persona.salud() <= 75 and persona.salud() > 30){
			estado = 2
		}
		else if(persona.salud() <= 30 and persona.salud() > 0){
			estado = 3
		}
		else if(persona.salud() <= 0){
			estado = 4
		}
	}
}

object salud{
	var property position = game.at(5,0)
	method image()="salud.jpg"
}