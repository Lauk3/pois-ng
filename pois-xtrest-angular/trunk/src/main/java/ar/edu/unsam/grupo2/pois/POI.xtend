package ar.edu.unsam.grupo2.pois

import ar.edu.unsam.grupo2.repositorio.Entidad
import java.time.LocalDateTime
import java.util.List
import net.sf.oval.constraint.Assert
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import org.uqbar.geodds.Point
import ar.edu.unsam.grupo2.usuarios.Usuario
import java.util.ArrayList
import org.uqbar.commons.utils.Dependencies
import opiniones.Opinión
import com.fasterxml.jackson.annotation.JsonIgnore
import com.fasterxml.jackson.annotation.JsonIgnoreProperties

@Observable
@Accessors
@Assert(expr="_this.ubicacion != null", lang="js")
@JsonIgnoreProperties(#['rating', 'nombre'])
abstract class POI extends Entidad implements Comparable<POI> {
	Point ubicacion
	String barrio
	String icono
	String direccion = ""	

/*****************			Opiniones			********************/

	@JsonIgnore List<Opinión> opiniones = new ArrayList
	
	@Dependencies("opiniones")
	def double getRating(){
		if(opiniones.isEmpty) return 0
		opiniones.fold(
				0,
				[ suma, opinion | suma + opinion.nota ]
			) as double / (opiniones.size as double)
	}
	
	def Opinión getOpinión(Usuario usuario){
		opiniones.findFirst[ op | op.usuario == usuario ]
	}
	def void setOpinion(Opinión opinion){
		opiniones.remove(getOpinión(opinion.usuario))
		opiniones.add(opinion)
	}
	
	
/*****************			POIs			********************/

	def boolean estaCerca(Point unPunto) {
		ubicacion.distance(unPunto) <= radioDeCercania
	/* Template Method  */
	}

	def double radioDeCercania() {
		0.5
	}

	def boolean disponible(LocalDateTime momento)

	def boolean match(String valorDeBusqueda)
	
	def String getNombre()
	
	override compareTo(POI otroPoi) {
		nombre.compareTo( otroPoi.nombre)
	}
}
