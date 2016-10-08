package entrega3

import ar.edu.unsam.grupo2.usuarios.Metricas
import ar.edu.unsam.grupo2.usuarios.ServiceLocator
import ar.edu.unsam.grupo2.usuarios.Usuario
import ar.edu.unsam.grupo2.usuarios.UsuarioBuilder
import ar.edu.unsam.grupo2.usuarios.searchObservers.GenerarLogObserver
import entrega2.TestBusquedas
import org.joda.time.DateTimeUtils
import org.joda.time.LocalDate
import org.junit.Before
import org.junit.Test

import static org.joda.time.DateTimeUtils.*
import static org.junit.Assert.*

class TestUsuario {
	val datos = new TestBusquedas
	var Usuario usuarioConTodoY2SegDemora
	val stubMailSender = new StubMailSender
	Metricas metricas = ServiceLocator.instance.metricas

	@Before
	def void init() {
		datos.initRepositorio
		ServiceLocator.instance => [
			mailSender = stubMailSender
			mailAdmin = "adm@pois.unsam.edu.ar"
			repositorio = datos.repositorio
		]	
		usuarioConTodoY2SegDemora = new UsuarioBuilder("usuariocontodo@test.edu.ar")
			.registrarBusquedasPorFecha
			.registrarCantResultados
			.activarLogger
			.notificarDemora(2)	// milisegundos
			.build
		usuarioConTodoY2SegDemora => [
			buscar("Patagonia")
			buscar("Imagine")
			buscar("Frances")
			buscar("Hipermercado")
			buscar("Hamburguesas")			
		]
	}

	@Test
	def void testRegistrarBusquedasPorFechaManiana(){
		DateTimeUtils.currentMillisOffset = 1000*60*60*24	// mañana
		usuarioConTodoY2SegDemora => [
			buscar("Perpignan")
			buscar("Morita")
			buscar("Kiosko")		
		]		
		DateTimeUtils.setCurrentMillisSystem
		assertEquals(3, metricas.consultasPorFecha(LocalDate.now.plusDays(1)))
	}
	@Test
	def void testRegistrarBusquedasPorFechaAyer(){
		assertEquals(0, metricas.consultasPorFecha(LocalDate.now.minusDays(1)))
	}	
	@Test
	def void testRegistrarCantResultados(){
		assertEquals(5, metricas.cantResultadosPorUsuario(usuarioConTodoY2SegDemora).size)
		assertEquals("Se esperan 2 resultados para la busqueda 'Hipermercado'",2, metricas.cantResultadosPorUsuario(usuarioConTodoY2SegDemora).get(3))
	}
	@Test
	def void testCantResultadosUsuarioNuevo(){
		val usuarioNuevo = new UsuarioBuilder("usuario.nuevo@test.edu.ar").build
		assertTrue(metricas.cantResultadosPorUsuario(usuarioNuevo).empty)
	}	
	@Test
	def void testLogger(){
		val loggerConContador = new LoggerConContadorDecorator(GenerarLogObserver.logger)
		GenerarLogObserver.logger = loggerConContador
		usuarioConTodoY2SegDemora.buscar("Mac Donalds")
		usuarioConTodoY2SegDemora.buscar("Burger King")		
		assertEquals(2, loggerConContador.contadorDeLlamadasAInfo)
	}
	@Test
	def void TestNotificarDemoraEnviaMails() {
		 new UsuarioBuilder("hay.demora@test.edu.ar").notificarDemora(-1).build => [
			buscar("127")
			buscar("Nacion")
			buscar("Verduleria")
			buscar("Coto")
		]
		assertEquals(4, stubMailSender.mailsDe("hay.demora@test.edu.ar").size)
	}

	@Test
	def void TestNotificarDemoraNoHayDemora() {
		new UsuarioBuilder("no.hay.demora@test.edu.ar").notificarDemora(10000).build => [
			buscar("127")
			buscar("Nacion")
			buscar("Verduleria")
			buscar("Coto")
		]
		assertEquals(0, stubMailSender.mailsDe("no.hay.demora@test.edu.ar").size)
	}
	@Test
	def void testClone(){
		val unUsuario = new UsuarioBuilder("clone@test.edu.ar").nickname("ramona").contraseña("1234").notificarDemora(10000).build
		val clon = unUsuario.clone
		assertEquals(unUsuario.contraseña, clon.contraseña)
	}
}