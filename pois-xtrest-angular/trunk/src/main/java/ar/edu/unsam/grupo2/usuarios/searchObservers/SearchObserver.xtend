package ar.edu.unsam.grupo2.usuarios.searchObservers

import ar.edu.unsam.grupo2.usuarios.Busqueda

abstract class SearchObserver {
	def void notificarSearch(Busqueda busqueda)
	
	override boolean equals(Object otro) {
		otro.class == this.class
	}
	override int hashCode() {
		class.hashCode
	}
}
