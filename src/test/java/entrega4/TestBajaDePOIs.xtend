package entrega4

import ar.edu.unsam.grupo2.usuarios.ServiceLocator
import org.junit.Before
import org.junit.Test
import static org.junit.Assert.*
import ar.edu.unsam.grupo2.procesos.BajaDePOIs
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class TestBajaDePOIs extends AbstractTestProceso {
	var BajaDePOIs procesoBorrarPOI
	var StubServicioREST servicioRest

	@Before
	def void init() {
		repo = ServiceLocator.instance.repositorio
		servicioRest = ServiceLocator.instance.servicioREST as StubServicioREST
		procesoBorrarPOI = new BajaDePOIs
	}

	@Test
	def void testBorrarPOI() {
		procesoBorrarPOI.ejecutar
		assertEquals(0, repo.search("Imagine Yoga").size)
	}
	@Test
	def void testSoloSeBorraUnPOI() {
		val cantPOIs = repo.size
		procesoBorrarPOI.ejecutar
		assertEquals(cantPOIs-1, repo.size)
	}
	@Test
	def void testElPOINoExiste() {
		servicioRest.valorDeBusqueda = "ningún POI matchea esto"
		val cantPOIs = repo.size
		procesoBorrarPOI.ejecutar
		assertEquals(cantPOIs, repo.size)
	}
}
