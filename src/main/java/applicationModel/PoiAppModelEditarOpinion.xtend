package applicationModel

import ar.edu.unsam.grupo2.pois.POI
import ar.edu.unsam.grupo2.usuarios.Usuario
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import opiniones.Opinión

@Accessors
@Observable
class PoiAppModelEditarOpinion extends PoiAppModel {
	Opinión opinión

	new(POI _poi, Usuario _usuario) {
		super(_poi, _usuario)
		opinión = poi.getOpinión(usuario)?.clone ?: new Opinión(usuario)
	}

	def void updateOpinion() {
		poi.setOpinion(this.opinión.clone)
	}

	def setFavorito(boolean favorito) { // TODO: Puede ir a la subclase?
		if (favorito) {
			usuario.agregarAFavoritos(poi)
		} else {
			usuario.quitarDeFavoritos(poi)
		}
	}
}
