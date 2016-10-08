package entrega1

import org.eclipse.xtend.lib.annotations.Accessors
import org.junit.Assert
import org.junit.Test
import org.uqbar.geodds.Point

@Accessors
class TestBanco extends JuegoDeDatosBancos {
 	
	
	@Test
// Las mayusculas y minusculas deberían ser indiferentes
	def void matchMayusculasyMinusculasV() {
		Assert.assertTrue(santanderConstituyentes.match("sanTander rio VILLA pueyRredon"))
	}
	@Test
// Da falso porque tiene espacios de más (no se si es lo que queremos)
	def void matchEspaciosDeMasF() {
		Assert.assertFalse(santanderConstituyentes.match("VILLA  pueyrredon  sanTander"))
	}
	@Test
	def void servicioDisponibleV() {
		Assert.assertTrue(santanderConstituyentes.disponible(martes12y10hs))
	}
	@Test
	def void servicioDisponibleConNombreDelServicioV() {
		Assert.assertTrue(santanderConstituyentes.disponible(martes12y10hs, "Cobro de cheques"))
	}
	@Test
	def void servicioDisponibleConNombreDelServicioFV() {
		Assert.assertFalse(santanderConstituyentes.disponible(martes12y10hs, "Venta de dolares"))
	}
	
	@Test
	def void servicioNoDisponibleFueraDelHorarioDeServicio(){
		Assert.assertFalse(bancoCiudadAvTriunvirato.disponible(sabado15y30hs))
	}
	@Test
	def void bancoNoTieneDisponibleDeterminadoServicio(){//duda
		Assert.assertFalse(bancoCredicoopMaipu.disponible(martes12y10hs, "Cobro de cheques"))
		
	}
	@Test
	def void bancoTieneDeterminadoServicioFueraDelHorarioDeAtencion(){
		Assert.assertFalse(bancoCiudadAvTriunvirato.disponible(martes15y30hs, "Banca Electronica"))
	}
	@Test
	def void bancoNoEstaCercaDeUnPuntoParticular(){
		val Point cabildoYJuramento=new Point(-34.562058, -58.456699)
		Assert.assertFalse(bancoSupervielleAvLaPlata.estaCerca(cabildoYJuramento))
	}
	@Test
	def void bancosCercanosEntreSiAmenosDe5Cuadras(){
		Assert.assertTrue(hipotecarioReconquista.estaCerca(bancoNacionBMitre.getUbicacion))
	}
	@Test
	def void testMatchBusquedaConNombreDelBanco(){
		Assert.assertTrue(bancoCiudadAvTriunvirato.match("Ciudad"))
	}
	
	@Test
	def void testMatchSucursalBusquedaComienzaConEnMinuscula(){
		Assert.assertTrue(santanderConstituyentes.match("s"))
	}
	@Test
	def void testMatchSucursalBusquedaComienzaConEnMayuscula(){
		Assert.assertTrue(santanderConstituyentes.match("S"))
	}
	@Test
	def void testMatchSucursalBusquedaComienzaCon(){
		Assert.assertTrue(santanderConstituyentes.match("Santan"))
	}
	@Test
	def void testMatchBusquedaPorNombreSucursalMasElBarrio(){
		Assert.assertTrue(santanderConstituyentes.match("Santander Rio Villa Pueyrredon"))
	}
	@Test
	def void testMatchBusquedaNoEncontradaPorBarrioSolo(){
		Assert.assertFalse(hipotecarioReconquista.match("San Nicolas"))
	}
	@Test
	def void testServiciosAgrupadosPorHorarioDisponibleUnServicio(){
		Assert.assertTrue(bancoFrancesAvCorrientes.disponible(martes12y10hs, "prestamo"))
	}
	@Test
	def void testServiciosAgrupadosPorHorarioMatch(){
		Assert.assertTrue(bancoFrancesAvCorrientes.match("Frances"))
	}


}
