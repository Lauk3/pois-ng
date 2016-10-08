package ar.edu.unsam.grupo2.procesos

import com.eclipsesource.json.JsonObject
import ar.edu.unsam.grupo2.usuarios.ServiceLocator

class BajaDePOIs extends Proceso {
	static var ServiceLocator serviceLocator = ServiceLocator.instance
		
	override doEjecutar() {
		val JsonObject pOIaBorrarJO = JsonObject.readFrom(serviceLocator.servicioREST.invocar)
		serviceLocator.repositorio.search( pOIaBorrarJO.get("valorBuscado").asString ).forEach[ poi |
			serviceLocator.repositorio.delete(poi)
		]
	}
}