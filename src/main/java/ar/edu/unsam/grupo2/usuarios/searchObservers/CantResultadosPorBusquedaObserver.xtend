package ar.edu.unsam.grupo2.usuarios.searchObservers

import ar.edu.unsam.grupo2.usuarios.Busqueda
import ar.edu.unsam.grupo2.usuarios.ServiceLocator

class CantResultadosPorBusquedaObserver extends SearchObserver {
	val metricas = ServiceLocator.instance.metricas

	override notificarSearch(Busqueda busqueda) {
		val cantidadDeResultados = metricas.cantResultadosPorUsuario(busqueda.usuario)
		cantidadDeResultados.add(busqueda.cantResultados)
		metricas.setCantResultadosPorUsuario(busqueda.usuario, cantidadDeResultados)
	}
}
