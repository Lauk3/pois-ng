package entrega2

import ar.edu.unsam.grupo2.pois.CGP
import java.util.List
import static extension org.junit.Assert.*
import org.junit.Before
import org.junit.Test
import entrega1.JuegoDeDatosBancos
import ar.edu.unsam.grupo2.repositorio.CGPServiceAdapter

class TestAdapterCGPs {
	var List<CGP> cGPs
	StubCGPService stubCGPService
	CGPServiceAdapter cGPServiceAdapter
	val fixture = new JuegoDeDatosBancos
	
	@Before
	def void init(){
		stubCGPService = new StubCGPService
		cGPServiceAdapter = new CGPServiceAdapter(stubCGPService)
	}
	@Test
	def void testAdapterMatch(){
		cGPs = cGPServiceAdapter.search("Patricias Argentinas")
		assertEquals(1, cGPs.size)
		assertTrue(cGPs.get(0).match("6"))		
	}
	@Test
	def void testHorarioCerrado(){
		cGPs = cGPServiceAdapter.search("Parque Patricios")
		assertEquals(1, cGPs.size)
		assertFalse(cGPs.get(0).disponible(fixture.sabado15y30hs))		
	}	
	@Test
	def void testServicioDisponible(){
		cGPs = cGPServiceAdapter.search("Balvanera")
		assertEquals(1, cGPs.size)
		assertTrue(cGPs.get(0).disponible(fixture.martes14y50hs, "rentas"))		
	}
	@Test
	def void testMatchNumeroDeComuna(){
		cGPs = cGPServiceAdapter.search("constitucion")
		assertEquals(1, cGPs.size)
		val CGP cGP1 = cGPs.get(0)
		assertTrue(cGP1.match("1"))	
	}
	@Test
	def void testDireccion(){
		cGPs = cGPServiceAdapter.search("San Nicolas")
		assertEquals(1, cGPs.size)
		val CGP cGP1 = cGPs.get(0)
		assertEquals(cGP1.direccion, StubCGPService.centroDTO1.domicilio)
	}
}