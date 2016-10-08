package ar.edu.unsam.grupo2.usuarios.searchObservers

import org.joda.time.LocalDate
import ar.edu.unsam.grupo2.usuarios.Busqueda
import ar.edu.unsam.grupo2.usuarios.ServiceLocator

class BusquedasPorFechaObserver extends SearchObserver {
	val metricas = ServiceLocator.instance.metricas
	override notificarSearch(Busqueda busqueda) {
		val valor = metricas.consultasPorFecha(LocalDate.now)
		metricas.setConsultasPorFecha(LocalDate.now, valor + 1)
	}

}
