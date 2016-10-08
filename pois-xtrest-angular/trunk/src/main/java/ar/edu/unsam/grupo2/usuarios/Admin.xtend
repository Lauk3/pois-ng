package ar.edu.unsam.grupo2.usuarios

import ar.edu.unsam.grupo2.procesos.Proceso
import java.util.Set

class Admin extends TipoDeUsuario{
	static val ServiceLocator serviceLocator = ServiceLocator.instance
	Set<ErrorObserver> errorObservers = newHashSet
	
	new(){}
	
	new(int reintentos) {
		errorObservers.add(new ReintentosObserver(reintentos))	
	}
	override admin() {
		true
	}
	override void run(Proceso proceso, Usuario usuario) {
		val resultado = proceso.ejecutar
		resultado.usuario = usuario
		serviceLocator.home.registrarEjecucion(resultado)

		if (resultado.error) errorObservers.forEach[ notificarError(proceso, usuario, resultado) ]	
	}
	def void setNotificarFallo(){
		errorObservers.add(new NotificarErrorObserver)
	}
}