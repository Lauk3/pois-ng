package applicationModel

import org.uqbar.commons.utils.Observable
import org.eclipse.xtend.lib.annotations.Accessors
import ar.edu.unsam.grupo2.usuarios.Busqueda
import java.util.List
import ar.edu.unsam.grupo2.usuarios.Usuario

@Observable
@Accessors
class BusquedaDePOIs {
	var PoiAppModel seleccionado
	String valorDeBusqueda = ""
	List<PoiAppModel> resultado
	Usuario usuario

	new(Usuario _usuario) {
		usuario = _usuario
		buscar
	}

	def buscar() {
		resultado = new Busqueda().buscar(valorDeBusqueda).resultado.map[poi|new PoiAppModel(poi, usuario)]
	}
}
