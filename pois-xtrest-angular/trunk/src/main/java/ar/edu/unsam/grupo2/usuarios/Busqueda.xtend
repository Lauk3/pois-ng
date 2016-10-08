package ar.edu.unsam.grupo2.usuarios

import ar.edu.unsam.grupo2.pois.POI
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Accessors
@Observable
class Busqueda {
	static val ServiceLocator serviceLocator = ServiceLocator.instance
	String valorDeBusqueda
	List<POI> resultado
	long demora
	Usuario usuario

	def Busqueda buscar(String _valor) {
		valorDeBusqueda = _valor
		val long tiempo = System.currentTimeMillis
		resultado = serviceLocator.repositorio.search(valorDeBusqueda)
		demora = System.currentTimeMillis - tiempo
		this
	}

	def int cantResultados() {
		resultado.size
	}

//	def String mostrarFavoritos() {
//		usuario.favoritos.forEach [ poi |
//			if (resultado.contains(poi)) {
//				return "SI"
//			} else {
//				return "NO"
//			}
//		]
//	}
}
