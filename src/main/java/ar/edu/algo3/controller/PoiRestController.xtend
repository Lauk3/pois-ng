package ar.edu.algo3.controller

import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.json.JSONUtils
import org.uqbar.xtrest.api.annotation.Get
import org.uqbar.xtrest.api.Result
import org.uqbar.xtrest.api.XTRest
import org.uqbar.xtrest.http.ContentType
import ar.edu.unsam.grupo2.usuarios.ServiceLocator
import ar.edu.algo3.bootstrap.POIsBootstrap

@Controller
class PoiRestController {

	extension JSONUtils = new JSONUtils

	@Get("/pois")
	def Result pois() {
		val pois = ServiceLocator.instance.repositorio.search("")
		response.contentType = ContentType.APPLICATION_JSON
		ok(pois.toJson)
	}


	def static void main(String[] args) {
		(new POIsBootstrap).run
		XTRest.start(PoiRestController, 9000)
	}

}
