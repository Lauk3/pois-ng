package entrega4

import entrega2.TestBusquedas
import ar.edu.unsam.grupo2.repositorio.RepositorioDePOIs
import ar.edu.unsam.grupo2.usuarios.ServiceLocator
import ar.edu.unsam.grupo2.procesos.Home
import org.junit.Before
import ar.edu.unsam.grupo2.usuarios.Usuario
import ar.edu.unsam.grupo2.usuarios.UsuarioBuilder
import entrega3.StubMailSender

class AbstractTestProceso {
	val protected Usuario usuarioAdmin = new UsuarioBuilder("un.admin@test.edu.ar").hacerAdmin.build
	var protected Home _home
	val protected datos = new TestBusquedas
	var protected RepositorioDePOIs repo

	@Before
	def void initServiceLocator() {
		datos.initRepositorio
		ServiceLocator.instance => [
			repositorio = datos.repositorio
			servicioREST = new StubServicioREST
			manejadorDeArchivos = new StubManejadorDeArchivos
			home = new Home
			mailSender = new StubMailSender
		]
	}
	
}