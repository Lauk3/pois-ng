package ar.edu.unsam.grupo2.procesos

import java.util.List
import ar.edu.unsam.grupo2.usuarios.ServiceLocator

class ProcesoMultiple extends Proceso {
	static val ServiceLocator serviceLocator = ServiceLocator.instance
	List<Proceso> procesos = newArrayList
	
	new(List<Proceso> _procesos) {
		procesos = _procesos
	}
	override doEjecutar() {
		
		procesos.forEach[ proceso |
			var resultado = proceso.ejecutar
			serviceLocator.home.registrarEjecucion(resultado)
		]
	}
}