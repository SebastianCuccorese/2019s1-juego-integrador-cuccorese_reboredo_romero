import wollok.game.*


class Enemigos {
	var property position
	
	method movimiento(){
		
	}
	method teEncontro(unPersonaje){
		unPersonaje.luchar(self)
	}
}
/*Hay que crear varios tipos de Enemigos. Uno es fantasma que pueda aparecer en una posicion ramdom del tablero
 * Otro cangrejo, que se mueva para adelante, costados y atras. Otro que avance y retroceda (lobo)
 * Nose porque asocie los enemigos con animales pero bueno ajaj, 
 */
