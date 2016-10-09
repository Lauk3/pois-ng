package ar.edu.unsam.grupo2.pois

import org.eclipse.xtend.lib.annotations.Accessors
import java.time.LocalDateTime
import net.sf.oval.constraint.Assert
import com.fasterxml.jackson.annotation.JsonIgnoreProperties

@Accessors
@Assert(expr="false", lang="js")
@JsonIgnoreProperties(#['id', 'opiniones','icono', 'nombre','rating', 'linea'])
class ParadaDeColectivos extends POI {

	LineaDeColectivos linea

	override boolean match(String valorDeBusqueda) {
		linea.match(valorDeBusqueda)
	}

	override double radioDeCercania() { // TEMPLATE METHOD (Primitive)
		0.1
	}

	override disponible(LocalDateTime momento) {
		linea.disponible(momento)
	}

	override String getIcono() {
		linea.icono
	}
	override String getNombre(){
		linea.nombre
	}

}
