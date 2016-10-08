package applicationModel

import ar.edu.unsam.grupo2.pois.POI
import ar.edu.unsam.grupo2.usuarios.Usuario
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Observable
@Accessors
class PoiAppModel {
	POI poi
	Usuario usuario

	new(POI _poi, Usuario _usuario) {
		poi = _poi
		usuario = _usuario
	}
		
	def boolean getFavorito(){
		usuario.favoritos.contains(poi)
	}

	def String distancia(){
		val roundOff = poi.ubicacion.distance(usuario.posicion)
		String.format("%.2f", roundOff) + " km"
	}
	
	def getEstaCerca(){
		poi.estaCerca(usuario.posicion)
	}
}
