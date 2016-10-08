package entrega4

import org.junit.Before
import ar.edu.unsam.grupo2.procesos.ProcesoMultiple
import org.junit.Test
import ar.edu.unsam.grupo2.usuarios.ServiceLocator
import static org.junit.Assert.*
import ar.edu.unsam.grupo2.procesos.BajaDePOIs
import ar.edu.unsam.grupo2.procesos.ActualizacionLocalComercial
import ar.edu.unsam.grupo2.pois.LocalComercial

class TestProcesoMultiple extends AbstractTestProceso {
	var ProcesoMultiple procesoMultiple
	var LocalComercial walmart
		
	@Before
	def void init() {
		procesoMultiple = new ProcesoMultiple(#[
			new BajaDePOIs,
			new ActualizacionLocalComercial("variasLineas.txt")
		])
		_home = ServiceLocator.instance.home
		repo = ServiceLocator.instance.repositorio
		walmart = repo.search("Walmart").get(0) as LocalComercial
	}
	@Test
	def void TestSeEjecutanLosProcesosHijos() {
		usuarioAdmin.run(procesoMultiple)
		assertEquals(3,  _home.cantProcesosEjecutados)
	}
	@Test
	def void TestSeDaDeBaja() {
		val cantPOIs = repo.size
		usuarioAdmin.run(procesoMultiple)
		assertEquals(cantPOIs-1,  repo.size)
	}
	@Test
	def void TestSeActualizaElLocal() {
		usuarioAdmin.run(procesoMultiple)
		assertTrue( walmart.palabrasClaves.contains("Panadería") )
	}
}