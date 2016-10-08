package entrega3

import ar.edu.unsam.grupo2.usuarios.Usuario
import ar.edu.unsam.grupo2.usuarios.UsuarioBuilder
import entrega2.TestBusquedas
import org.junit.Before
import org.junit.Test

import static org.junit.Assert.*
import org.joda.time.LocalDate
import ar.edu.unsam.grupo2.usuarios.ServiceLocator
import ar.edu.unsam.grupo2.usuarios.Metricas
import ar.edu.unsam.grupo2.usuarios.searchObservers.NotificarDemoraPorMailObserver

class TestDesactivacion {
	val datos = new TestBusquedas
	var Usuario usuario
	Metricas metricas = ServiceLocator.instance.metricas
	
	@Before
	def void init() {
		datos.initRepositorio
		ServiceLocator.instance => [
			mailSender = new StubMailSender
			mailAdmin = "adm@pois.unsam.edu.ar"
			repositorio = datos.repositorio	
		]
		usuario = new UsuarioBuilder("usuariocontodo@test.edu.ar")
			.registrarBusquedasPorFecha
			.registrarCantResultados
			.activarLogger
			.notificarDemora(2)	// milisegundos
			.build
	}
		
	@Test
	def void testDesactivacionYConsultasPorFechaSigueFuncionando(){
		val busquedasHastaAhora = metricas.consultasPorFecha(LocalDate.now)
		usuario => [
			registrarCantResultadosOFF
			loggearOFF
			notificarDemoraOFF			
			buscar("Pizzeria")
			buscar("110")
			buscar("Hipermercado")
		]		
		assertEquals( busquedasHastaAhora + 3, metricas.consultasPorFecha(LocalDate.now) )
	}
	@Test
	def void testDesactivacionYCantResultadosSigueFuncionando(){
		usuario => [
			registrarBusquedasPorFechaOFF
			loggearOFF
			notificarDemoraOFF
			registrarCantResultadosOFF
			registrarCantResultados				
			buscar("7")
		]		
		assertEquals( 1, metricas.cantResultadosPorUsuario(usuario).size )
		assertEquals( 1, metricas.cantResultadosPorUsuario(usuario).get(0) )	
	}
	@Test
	def void testDesactivarTodo(){
		usuario => [
			registrarBusquedasPorFechaOFF
			registrarCantResultadosOFF
			loggearOFF
			notificarDemoraOFF
		]
		assertTrue(usuario.searchObservers.empty)
	}
	@Test
	def void testModificacionDeDemora(){
		val Usuario unUsuario = new UsuarioBuilder("usuario@test.org.ar").notificarDemora(30).build
		unUsuario.notificarDemora(3)
		assertEquals(1, unUsuario.searchObservers.size)
		assertEquals(3, (unUsuario.searchObservers.get(0) as NotificarDemoraPorMailObserver).demoraMaxima )
		
	}
}