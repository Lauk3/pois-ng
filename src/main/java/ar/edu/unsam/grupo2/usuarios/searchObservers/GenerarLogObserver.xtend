package ar.edu.unsam.grupo2.usuarios.searchObservers

import org.slf4j.Logger
import org.slf4j.LoggerFactory
import ar.edu.unsam.grupo2.usuarios.Busqueda

class GenerarLogObserver extends SearchObserver {

	static Logger logger = LoggerFactory.getLogger(GenerarLogObserver)

	def static Logger getLogger(){
		logger
	}
	def static void setLogger(Logger _logger ){
		logger = _logger
	}	
	override notificarSearch(Busqueda busqueda) {
		logger.info(
			"Busqueda: '{}'\tResultados: {}\tDemora: {} milisegundos",
			busqueda.valorDeBusqueda,
			busqueda.cantResultados,
			busqueda.demora ) 
	}
	
}
