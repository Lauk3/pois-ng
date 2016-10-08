package entrega2

import org.junit.Assert
import org.junit.Before
import org.junit.Test
import ar.edu.unsam.grupo2.repositorio.BancoServiceAdapter
import ar.edu.unsam.grupo2.repositorio.CGPServiceAdapter
import ar.edu.unsam.grupo2.repositorio.RepositorioDePOIs

class TestBusquedas {
	val datos = new TestRepositorio
	var StubBancoService stubBancoService
	var BancoServiceAdapter bancoServiceAdapter
	var StubCGPService stubCGPService
	var CGPServiceAdapter cGPServiceAdapter
	
	@Before
	def void initRepositorio() {
		datos.initRepositorio
		stubBancoService = new StubBancoService
		bancoServiceAdapter = new BancoServiceAdapter(stubBancoService)
		stubCGPService = new StubCGPService
		cGPServiceAdapter = new CGPServiceAdapter(stubCGPService)
		datos.repositorio =>[
			serviciosDeBusqueda.add(bancoServiceAdapter)	
			serviciosDeBusqueda.add(cGPServiceAdapter)	
		]
	}
	def RepositorioDePOIs getRepositorio(){
		datos.repositorio
	}

	@Test
	def void TestBusquedaUsaBusquedaExternaDeBancos() {
		Assert.assertEquals(3, datos.repositorio.search("Patagonia").size)		
	}
	@Test
	def void TestBusquedaUsaBusquedaExternaDeBancos2() {
		Assert.assertEquals(2, datos.repositorio.search("Galicia").size)
	}
	@Test
	def void TestBusquedaUsaBusquedaExternaDeCGPs() {
		Assert.assertEquals(1, datos.repositorio.search("palermo").size)
	}
	@Test
	def void TestBusquedaUsaBusquedaExternaDeCGPs2() {
		Assert.assertEquals(1, datos.repositorio.search("Rivadavia").size)
	}
	@Test
	def void TestBusquedaUsaRepositorio() {
		Assert.assertEquals(1, datos.repositorio.search("110").size)
	}

	@Test
	def void TestBusquedaUsaRepositorioYBusquedaExterna() {
		val resultadoBusqueda = datos.repositorio.search("Frances")
		Assert.assertEquals(3, resultadoBusqueda.size)
		Assert.assertTrue(resultadoBusqueda.contains(datos.fixtureBancos.bancoFrancesAvCorrientes))
	}
	@Test
	def void TestBusquedaSinResultados() {
		val resultadoBusqueda = datos.repositorio.search("Hamburguesas")
		Assert.assertEquals(#[], resultadoBusqueda)	
	}
}
