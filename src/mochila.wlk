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
		
	method revisarSiHayLlave() {
		return self.llaves().size() > 0				
		}
	method guardarLlaves(llave) {
		llaves.add(llave)
	}	
	}
