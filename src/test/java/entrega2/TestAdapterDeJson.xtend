package entrega2

import ar.edu.unsam.grupo2.pois.SucursalBanco
import entrega1.JuegoDeDatosBancos
import java.util.List
import org.junit.Assert
import org.junit.Before
import org.junit.Test
import ar.edu.unsam.grupo2.repositorio.BancoServiceAdapter

class TestAdapterDeJson extends JuegoDeDatosBancos {
	var List<SucursalBanco> sucursales
	StubBancoService stubBancoService = new StubBancoService
	@Before
	def void init(){

		sucursales = BancoServiceAdapter.aSucursalesBanco(stubBancoService.getSucursalesBancosByNombreBanco("Frances"))
	}
	@Test
	def void testParserNombreYBarrio(){
		Assert.assertTrue(sucursales.get(1).match("frances caballito"))		
	}
	@Test
	def void testParserHorarioCerrado(){
		Assert.assertFalse(sucursales.get(1).disponible(sabado15y30hs))		
	}	
	@Test
	def void testParserServicioDisponible(){
		Assert.assertTrue(sucursales.get(1).disponible(martes14y50hs, "seguros"))		
	}
	@Test
	def void testParser(){
		Assert.assertTrue(sucursales.get(0).nombresServicios.containsAll(StubBancoService.bancoFrances1.servicios))		
	}
	
	
	

}