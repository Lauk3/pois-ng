package ar.edu.unsam.grupo2.server

import org.uqbar.xtrest.api.Result
import org.uqbar.xtrest.api.XTRest
import org.uqbar.xtrest.api.annotation.Body
import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.api.annotation.Get
import org.uqbar.xtrest.api.annotation.Put
import org.uqbar.xtrest.http.ContentType
import org.uqbar.xtrest.json.JSONUtils
import ar.edu.unsam.grupo2.server.repositorios.RepoUsuarios
import ar.edu.unsam.grupo2.usuarios.Usuario
import ar.edu.unsam.grupo2.usuarios.ServiceLocator
import ar.edu.algo3.bootstrap.POIsBootstrap

@Controller
class LoginController {

	extension JSONUtils = new JSONUtils

	@Get("/logInConsulta")
	def Result usuarios() {
		val usuarios = RepoUsuarios.getInstance().allInstances
		response.contentType = ContentType.APPLICATION_JSON
		ok(usuarios.toJson)
	}
	@Get("/pois")
	def Result pois() {
		val pois = ServiceLocator.instance.repositorio.search("")
		response.contentType = ContentType.APPLICATION_JSON
		ok(pois.toJson)
	}


	def static void main(String[] args) {
		(new POIsBootstrap).run
		XTRest.start(LoginController, 9000)
	}

	
}
