package ar.edu.unsam.grupo2.usuarios.searchObservers

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.geodds.interfacesExternas.Mail
import ar.edu.unsam.grupo2.usuarios.ServiceLocator
import ar.edu.unsam.grupo2.usuarios.Busqueda

@Accessors
class NotificarDemoraPorMailObserver extends SearchObserver {
	static val ServiceLocator serviceLocator = ServiceLocator.instance
	long demoraMaxima

	new(long milisegundos) {
		demoraMaxima = milisegundos
	}

	override notificarSearch(Busqueda busqueda) {
		if (busqueda.demora > demoraMaxima)
			serviceLocator.mailSender.send(
				new Mail => [
					from = busqueda.usuario.mail
					to = serviceLocator.mailAdmin
					titulo = "Notificacion de demora"
					message = "La busqueda de  '" + busqueda.valorDeBusqueda + "' demoro " + busqueda.demora + " milisegundos."
			])
	}
	
}
