package entrega4

import org.uqbar.geodds.interfacesExternas.ManejadorDeArchivos
import java.util.Map

class StubManejadorDeArchivos implements ManejadorDeArchivos{
	val Map<String, String> archivos = newHashMap(
		"imagine.txt" -> "Imagine Yoga; Clases Yoga Acroyoga Psicoanalisis",
		"colectivo.txt" -> "110; esto no es un local comercial",
		"rubroEnVezDeNombre.txt" -> "HiperMercado; palabras clave",
		"variasLineas.txt" -> "Walmart; Panadería\nImagine Yoga; Clases Yoga Acroyoga Psicoanalisis"
	)
	
	override leer(String nombreArchivo) {
		archivos.get(nombreArchivo)
	}
	
}