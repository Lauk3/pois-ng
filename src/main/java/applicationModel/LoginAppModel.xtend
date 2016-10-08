package applicationModel

import ar.edu.unsam.grupo2.procesos.Home
import ar.edu.unsam.grupo2.usuarios.ServiceLocator
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import org.uqbar.commons.model.UserException

@Accessors
@Observable
class LoginAppModel {

	String nick = ""
	String contraseña = ""
	Home home = ServiceLocator.instance.home

	def void validar() {
		if (home.getByNick(nick) == null) {
			throw new UserException("El Usuario es inexistente")

		} else {
			if (home.getByNick(nick).contraseña != contraseña) {
				throw new UserException("La Contraseña es incorrecta")
			}
		}
	}

	def getUsuario() {
		validar
		home.getByNick(nick)
	}

}
