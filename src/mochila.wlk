import harold.*
import niveles.*


object mochila {
	const property llaves = []
	const property comidas = []
	
	method consumirComida(persona) {
			persona.comerPrimeroDeLaMochila()
		}
	method guardarComida(comida) {
		comidas.add(comida)
	}	
		
	method hayLlave() {
		return self.llaves().size() > 0				
		}
	method guardarLlave(llave) {
		llaves.add(llave)
	}
	method estanLasSeisLlavesBuscadas(){
		return self.llaves().size() == 6
	}
	method sacarLlaves(){
		self.llaves().clear()
	}	
}
