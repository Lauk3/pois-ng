package ar.edu.unsam.grupo2.usuarios

import ar.edu.unsam.grupo2.procesos.Proceso
import ar.edu.unsam.grupo2.procesos.ProcesoEjecutadoDTO

class ReintentosObserver implements ErrorObserver {
	static val ServiceLocator serviceLocator = ServiceLocator.instance
	var int reintentos
	
	new(int _reintentos) {
		reintentos = _reintentos
	}	
	
	override notificarError(Proceso proceso, Usuario usuario, ProcesoEjecutadoDTO resultado) {
		var _resultado = resultado
		for(var intento = 0; _resultado.error && intento < reintentos ; intento++) {
			_resultado = proceso.ejecutar
			_resultado.usuario = usuario
			serviceLocator.home.registrarEjecucion(_resultado)
		}
	}
	
}