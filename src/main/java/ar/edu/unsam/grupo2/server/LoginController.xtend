package ar.edu.unsam.grupo2.server

import ar.edu.algo3.bootstrap.POIsBootstrap
import ar.edu.unsam.grupo2.server.repositorios.RepoUsuarios
import org.uqbar.xtrest.api.Result
import org.uqbar.xtrest.api.XTRest
import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.api.annotation.Get
import org.uqbar.xtrest.http.ContentType
import org.uqbar.xtrest.json.JSONUtils

@Controller
class LoginController {

	extension JSONUtils = new JSONUtils

	@Get("/logInConsulta")
	def Result usuarios() {
		val usuarios = RepoUsuarios.getInstance().allInstances
		response.contentType = ContentType.APPLICATION_JSON
		ok(usuarios.toJson)
	}



	def static void main(String[] args) {
		(new POIsBootstrap).run
		XTRest.start(LoginController, 9000)
	}

}
