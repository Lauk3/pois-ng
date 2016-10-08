package entrega2

import ar.edu.unsam.grupo2.exception.ErrorDeValidacionException
import ar.edu.unsam.grupo2.exception.IdInexistenteException
import ar.edu.unsam.grupo2.exception.ObjetoSinIdException
import ar.edu.unsam.grupo2.pois.CGP
import ar.edu.unsam.grupo2.pois.HorarioSemanal
import ar.edu.unsam.grupo2.pois.LineaDeColectivos
import ar.edu.unsam.grupo2.pois.LocalComercial
import ar.edu.unsam.grupo2.pois.ParadaDeColectivos
import ar.edu.unsam.grupo2.pois.Servicio
import ar.edu.unsam.grupo2.pois.SucursalBanco
import entrega1.JuegoDeDatosBancos
import entrega1.JuegoDeDatosColectivos
import entrega1.TestCGP
import entrega1.TestLocalesComerciales
import java.time.DayOfWeek
import java.util.HashSet
import org.eclipse.xtend.lib.annotations.Accessors
import org.junit.Before
import org.junit.Test
import org.uqbar.geodds.Point

import static org.junit.Assert.*

import static extension ar.edu.unsam.grupo2.util.StringUtil.contiene
import ar.edu.unsam.grupo2.repositorio.RepositorioDePOIs

@Accessors
class TestRepositorio {
	val RepositorioDePOIs repositorio = new RepositorioDePOIs//.instance
	JuegoDeDatosColectivos fixtureColectivos = new JuegoDeDatosColectivos
	TestLocalesComerciales fixtureLocales = new TestLocalesComerciales
	JuegoDeDatosBancos fixtureBancos = new JuegoDeDatosBancos
	TestCGP fixtureCGP = new TestCGP
	var int id110
	var int idImagine
	val nuevoBancoProvincia = new SucursalBanco => [
		banco = "Provincia"
		barrio = "Villa Luro"
		ubicacion = new Point(-34.6111707,-58.389743)
		horario = fixtureBancos.horarioBancario
		servicios = #["Prestamos", "Clientes VIP"]
	]
	val LineaDeColectivos linea28semirrapido = new LineaDeColectivos(28)
		
		
	@Before
	def void initRepositorio() {
//		RepositorioDePOIs.reset
		fixtureColectivos.toList.forEach[ linea | repositorio.create(linea) ]
		fixtureLocales.toList.forEach[ local | repositorio.create(local) ]
		fixtureBancos.toList.forEach[ banco | repositorio.create(banco) ]
		fixtureCGP.toList.forEach[ cgp | repositorio.create(cgp)]
		id110 = fixtureColectivos.linea110.id
		idImagine = fixtureLocales.imagineYoga.id

	}

/****************************     searchById     ********************************/

	@Test
	def void testSearchById() {
		assertEquals(repositorio.searchById(id110), fixtureColectivos.linea110)
	}
	
	@Test(expected=typeof(IdInexistenteException))
	def void testSearchByIdInexistente() {
		repositorio.delete(fixtureColectivos.linea110)
		repositorio.searchById(id110)
	}
	
/****************************     delete     ********************************/
	@Test
	def void testDelete() {
		val size = repositorio.size
		repositorio.delete(fixtureColectivos.linea110)
		assertEquals(size-1, repositorio.size)
	}
	@Test (expected = typeof(IdInexistenteException))
	def void testDeletePoiInexistente() {
		repositorio.delete(fixtureColectivos.linea110)
		repositorio.delete(fixtureColectivos.linea110)
	}
	@Test
	def void testDeleteDeUnaCopia() {
		val size = repositorio.size
		var copiaLinea110 = new LineaDeColectivos(110) => [
			id = id110
		]
		repositorio.delete(copiaLinea110)
		assertEquals(size-1, repositorio.size)
	}


/****************************     update     ********************************/
	
	@Test
	def void testUpdate() {
		var nuevoImagina = new LocalComercial => [
			id = idImagine
			direccion = "Av Gral Paz 5225"
			agregarPalabraClave("Clases de Yoga")
			nombreComercial = "Imagina Yoga"
			ubicacion = new Point(-34.573674, -58.510167)
			rubro = (repositorio.searchById(idImagine) as LocalComercial).rubro
		]
		nuevoImagina.horarios.add( new HorarioSemanal(#[DayOfWeek.TUESDAY,DayOfWeek.FRIDAY], 11, 0, 12, 15) ) // Martes y Viernes de 11:00 a 12:15
		nuevoImagina.horarios.add(new HorarioSemanal(#[DayOfWeek.MONDAY,DayOfWeek.FRIDAY], 19, 30, 20, 45)) // Lunes y Viernes de 19:30 a 20:45
//		assertNotEquals(nuevoImagina, repositorio.searchById(idImagine))
		repositorio.update(nuevoImagina)
		assertEquals(nuevoImagina, repositorio.searchById(idImagine))		
	}

	@Test(expected=typeof(IdInexistenteException))
	def void testUpdateDeUnObjetoQueNoEstaEnElRepositorio() {
		repositorio.delete(fixtureColectivos.linea110)
		repositorio.update(fixtureColectivos.linea110)
	}
	@Test(expected=typeof(ObjetoSinIdException))
	def void testUpdateDeUnObjetoSinId() {
		val nuevoBancoNacion = new SucursalBanco => [
			banco = "Nacion"
			barrio = "San Nicolas"//a la vuelta del hipotecario
			ubicacion = new Point(-34.606469,-58.371351)
			horario = fixtureBancos.horarioBancario
			servicios = #["Cajeros automáticos", "Venta de Euros", "Guarderia"]
		]
		repositorio.update(nuevoBancoNacion)
	}	
	
/****************************     search     ********************************/
	@Test
	def void TestSearchColectivos() {
		val resultado = repositorio.search("110")
		assertEquals("busca linea de colectivos", 1, resultado.size)
		assertTrue(resultado.contains(fixtureColectivos.linea110))
	}
	@Test
	def void TestSearchLocales() {
		val resultado = repositorio.search("Hipermercado")
		assertEquals("busca locales comerciales", 2, resultado.size)
		assertTrue(resultado.containsAll(#[fixtureLocales.walmartConstituyentes, fixtureLocales.cotoVillaCrespo]))		
	}
	@Test
	def void TestSearchBancos() {
		val resultado = repositorio.search("credicoop monserrat")
		assertEquals("busca banco", 1, resultado.size)
		assertTrue(resultado.contains(fixtureBancos.bancoCredicoopMaipu))		
	}
	@Test
	def void TestSearchCGP() {
		val resultado = repositorio.search("7")
		assertEquals("busca CGP", 1, resultado.size)
		assertTrue(resultado.contains(fixtureCGP.CGP7))
	}

/****************************     create     ********************************/

	@Test
	def void TestCreate() {
		assertEquals(repositorio.size,
			fixtureCGP.toList.size + fixtureColectivos.toList.size + fixtureBancos.toList.size + fixtureLocales.toList.size
		)
	}
	@Test
	def void TestCreateElIdYaExiste() {
		val size = repositorio.size 
		val idViejo = nuevoBancoProvincia.id
		repositorio.create(nuevoBancoProvincia)	
		assertEquals(size+1, repositorio.size)
		assertNotEquals(idViejo, nuevoBancoProvincia.id)
	}		
	
/****************************     Validación     ********************************/
	@Test
	def void TestNoSeAgreganLosPOIsInvalidos(){
		val size = repositorio.size
		try {
			repositorio.create(fixtureColectivos.parada110albarellos3150)
		} catch (ErrorDeValidacionException e) {
			assertEquals(size, repositorio.size)
		}
	}	
	@Test (expected=typeof(ErrorDeValidacionException))
	def void TestValidacionParadaDeColectivo(){
		repositorio.create(fixtureColectivos.parada110albarellos3150)
	}

	@Test(expected=typeof(ErrorDeValidacionException))
	def void TestValidacionPOISinUbicacion(){
		nuevoBancoProvincia.ubicacion = null
		repositorio.update(nuevoBancoProvincia)
	}
	
	@Test(expected=typeof(ErrorDeValidacionException))
	def void TestCreateSucursalBancoSinBarrio(){
		nuevoBancoProvincia.barrio = null
		repositorio.create(nuevoBancoProvincia)
	}
	
	@Test(expected=typeof(ErrorDeValidacionException))
	def void TestCreateCGPSinHorarioDeServicio(){
		var CGP otroCGP9 = new CGP => [
			barrio = "Mataderos"
			comuna = fixtureCGP.comuna9
			ubicacion = new Point(-34.6596604,-58.5072427)
			servicios = new HashSet(#[new Servicio => [
				horarios = new HorarioSemanal
			]])
		]
		repositorio.update(otroCGP9)
	}
	@Test(expected=typeof(ErrorDeValidacionException))
	def void TestLineaDeColectivosSinParadas(){
		linea28semirrapido.paradas = #[]
		repositorio.update(linea28semirrapido)
	}
	@Test(expected=typeof(ErrorDeValidacionException))
	def void TestLineaDeColectivosSinUbicacion(){
		linea28semirrapido.paradas = #[new ParadaDeColectivos]
		repositorio.update(linea28semirrapido)
	}
	@Test
	def void TestMensajeDeError(){
		linea28semirrapido.paradas = #[]
		linea28semirrapido.nroLinea = null
		try {
			repositorio.update(linea28semirrapido)	
		} catch (ErrorDeValidacionException e) {
			assertEquals( 3, e.message.split("\n").size )
			assertTrue( e.message.contiene("paradas") )
			assertTrue( e.message.contiene("ubicacion") )
			assertTrue( e.message.contiene("nroLinea") )
		}
	}	
}
