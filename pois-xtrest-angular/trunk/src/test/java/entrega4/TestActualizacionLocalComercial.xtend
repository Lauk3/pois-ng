package entrega4

import ar.edu.unsam.grupo2.usuarios.ServiceLocator
import org.junit.Before
import org.junit.Test
import static org.junit.Assert.*
import ar.edu.unsam.grupo2.procesos.ActualizacionLocalComercial
import ar.edu.unsam.grupo2.pois.LocalComercial

class TestActualizacionLocalComercial extends AbstractTestProceso {
	var LocalComercial localAModificar
	var LocalComercial walmart 
	val procesoOK = new ActualizacionLocalComercial("imagine.txt")
	val procesoNoEsLocal = new ActualizacionLocalComercial("colectivo.txt")
	val procesoNoEsNombre = new ActualizacionLocalComercial("rubroEnVezDeNombre.txt")
	
	
	@Before
	def void init() {
		repo = ServiceLocator.instance.repositorio
		localAModificar = repo.search("Imagine Yoga").get(0) as LocalComercial
		walmart = repo.search("Walmart").get(0) as LocalComercial
	}
	
	@Test
	def void testCambiarPalabrasClave() {
		assertFalse( localAModificar.palabrasClaves.contains("Yoga") )
		assertFalse( localAModificar.palabrasClaves.contains("Psicoanalisis") )
		assertTrue( localAModificar.palabrasClaves.contains("Profesorado") )	

		procesoOK.ejecutar
		assertTrue( localAModificar.palabrasClaves.contains("Yoga") )
		assertTrue( localAModificar.palabrasClaves.contains("Psicoanalisis") )
		assertFalse( localAModificar.palabrasClaves.contains("Profesorado") )	
	}
	@Test
	def void testSeRegistraElResultadoDelProceso() {
		val resultado = procesoOK.ejecutar
		assertEquals( procesoOK, resultado.procesoEjecutado )	
	}	

	@Test
	def void testErrorNoEsUnLocalComercial() {
		val resultado = procesoNoEsLocal.ejecutar
		assertTrue( resultado.error )					
		assertTrue( resultado.mensajeDeError.contains("cannot be cast") )			
	}
	@Test
	def void testErrorEnElArchivo() {
		val resultado = procesoNoEsNombre.ejecutar
		assertTrue( resultado.error )					
		assertTrue( resultado.mensajeDeError.contains("Formato de archivo incorrecto") )			
	}
	@Test
	def void testArchivoDeVariasLineas() {
		new ActualizacionLocalComercial("variasLineas.txt").ejecutar
		assertTrue( localAModificar.palabrasClaves.contains("Psicoanalisis") )
		assertTrue( walmart.palabrasClaves.contains("Panadería") )		
	}	
}