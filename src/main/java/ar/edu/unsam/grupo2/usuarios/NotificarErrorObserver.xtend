package ar.edu.unsam.grupo2.usuarios

import ar.edu.unsam.grupo2.procesos.Proceso
import ar.edu.unsam.grupo2.procesos.ProcesoEjecutadoDTO
import org.uqbar.geodds.interfacesExternas.Mail

class NotificarErrorObserver implements ErrorObserver{
	static val ServiceLocator serviceLocator = ServiceLocator.instance
		
	override notificarError(Proceso proceso, Usuario usuario, ProcesoEjecutadoDTO resultado) {
		val mailNotificacion = new Mail => [
				from = serviceLocator.mailAdmin
				to = usuario.mail
				titulo = "Notificacion de fallo"
			]
		mailNotificacion.message = "Hubo un error durante la ejecución del proceso: " + resultado.mensajeDeError
		serviceLocator.mailSender.send(	mailNotificacion )
	}
}