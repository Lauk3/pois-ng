package ar.edu.unsam.grupo2.pois

import java.time.LocalDateTime
import java.util.HashSet
import java.util.Set
import net.sf.oval.constraint.AssertValid
import net.sf.oval.constraint.NotNull
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.geodds.Point

import static extension ar.edu.unsam.grupo2.util.StringUtil.*
import net.sf.oval.constraint.MinSize
import org.uqbar.commons.utils.Observable
import com.fasterxml.jackson.annotation.JsonIgnore

@Accessors
@Observable
class CGP extends POI {
	@NotNull
	@AssertValid
	Comuna comuna
	@NotNull
	@MinSize(1)
	@AssertValid
	@JsonIgnore Set<Servicio> servicios = new HashSet
	static String ICONO_CGP = "/iconos/iconoCGP.png"
	String icono = ICONO_CGP

	override boolean disponible(LocalDateTime momento) {
		servicios.exists[servicio|servicio.disponible(momento)]
	}

	def boolean disponible(LocalDateTime momento, String nombreServicio) {
		servicios.exists[servicio|servicio.disponible(momento, nombreServicio)]
	}

	override match(String valorDeBusqueda) {
		matcheaPorNumeroDeComuna(valorDeBusqueda) || matcheaPorServicios(valorDeBusqueda)
	}

	def boolean matcheaPorNumeroDeComuna(String valorDeBusqueda) {
		comuna.nombre.equalsIgnoreCaseYAcentos(valorDeBusqueda)
	}

	def boolean matcheaPorServicios(String valorDeBusqueda) {
		servicios.exists [ servicio |
			servicio.nombre.comienzaCon(valorDeBusqueda)
		]
	}
	
	override estaCerca(Point unPunto) {
		comuna.isInside(unPunto) || super.estaCerca(unPunto)
	}
	def int numeroComuna() {
		Integer.parseInt(comuna.nombre)
	}
	override String getNombre(){
		return "CGP Nº "+ comuna.nombre
	}
	
	static def setIconoCGP(String _ico){
		ICONO_CGP = _ico
	}
	
}
