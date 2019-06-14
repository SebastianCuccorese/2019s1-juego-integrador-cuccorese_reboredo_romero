import wollok.game.*

object barraEnergia {
	var property position = game.at(9,0)
	var estado
	method image()= "energia-" + estado + ".png"
	method energiaDe_(persona){
		if(persona.energia() >= 10){
			estado = 1
		}
		else if(persona.energia() < 10 and persona.energia() >= 5){
			estado = 2
		}
		else if(persona.energia() == 3){
			estado = 3
		}
		else if(persona.energia() == 0){
			estado = 4
		}
	}
	
}
