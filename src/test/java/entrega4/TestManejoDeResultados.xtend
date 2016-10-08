package entrega4

import ar.edu.unsam.grupo2.usuarios.ServiceLocator
import org.junit.Before
import org.junit.Test
import static org.junit.Assert.*
import ar.edu.unsam.grupo2.procesos.ActualizacionLocalComercial
import ar.edu.unsam.grupo2.usuarios.UsuarioBuilder
import entrega3.StubMailSender

class TestManejoDeResultados extends AbstractTestProceso {
	val procesoOK = new ActualizacionLocalComercial("imagine.txt")
	val procesoError = new ActualizacionLocalComercial("colectivo.txt")
	var StubMailSender stubMailSender
	val StubProcesoDaError2Veces stubProcesoDaError2Veces= new StubProcesoDaError2Veces
	
	@Before
	def void init() {
		_home = ServiceLocator.instance.home
		stubMailSender =  ServiceLocator.instance.mailSender as StubMailSender
	}
	
	@Test
	def void testSeAlmacenaElResultadoDelProceso() {
		usuarioAdmin.run(procesoOK)
		assertEquals( usuarioAdmin, _home.resultados.get(0).usuario )	
	}	
	@Test
	def void testError() {
		usuarioAdmin.run(procesoError)
		assertTrue( _home.resultados.get(0).error )		
	}
	@Test
	def void testSeEjecutanTresProcesos() {
		usuarioAdmin.run(procesoOK)		
		usuarioAdmin.run(procesoError)
		usuarioAdmin.run(procesoOK)
		assertEquals( 3, _home.resultados.size )	
	}
	@Test
	def void testReintentos() {	
		val adminConReintentos = new UsuarioBuilder("un.admin@test.edu.ar").hacerAdmin.reintentosAdmin(2).build
		adminConReintentos.run(procesoError)
		assertEquals( 3, _home.resultados.size )	
	}
	@Test
	def void testReintentosYOK() {	
		val adminConReintentos = new UsuarioBuilder("un.admin@test.edu.ar").hacerAdmin.reintentosAdmin(100).build	
		adminConReintentos.run(stubProcesoDaError2Veces)
		assertEquals( 3, _home.resultados.size )	
	}
	@Test
	def void testNotificacionDeError(){
		val adminConNotificacion = new UsuarioBuilder("un.admin@test.edu.ar").hacerAdmin.notificarErrorAdmin.build
		adminConNotificacion.run(procesoError)
		assertEquals( 1, stubMailSender.mailsDe(ServiceLocator.instance.mailAdmin).size )	
	}
}