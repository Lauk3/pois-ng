package entrega1

import ar.edu.unsam.grupo2.pois.LineaDeColectivos
import ar.edu.unsam.grupo2.pois.ParadaDeColectivos
import ar.edu.unsam.grupo2.pois.SucursalBanco
import org.junit.Assert
import org.junit.Before
import org.junit.Test
import ar.edu.unsam.grupo2.pois.CGP

class TestIcono {
	SucursalBanco unBanco
	SucursalBanco otroBanco
	CGP unCGP
	LineaDeColectivos unaLinea
	ParadaDeColectivos paradaDeUnaLinea
	LineaDeColectivos otraLinea
	
	@Before
	def void init(){
		unBanco = new SucursalBanco
		otroBanco = new SucursalBanco
		unCGP = new CGP
		unaLinea = new LineaDeColectivos(169)
		paradaDeUnaLinea = new ParadaDeColectivos => [
			linea = unaLinea
		]
		otraLinea = new LineaDeColectivos(88)
		unaLinea.icono = "/iconos/linea169.png"
		otraLinea.icono = "/iconos/linea88.png"
	}
	
	@Test
	def void testIconosIgualesBancos() {
		Assert.assertEquals(unBanco.icono, otroBanco.icono)
	}
	@Test
	def void testIconosDistintos() {
		Assert.assertNotEquals(unBanco.icono, unCGP.icono)
	}
	@Test
	def void testIconosIgualesEnLineayParada(){
		Assert.assertEquals(unaLinea.icono, paradaDeUnaLinea.icono)
	}
	@Test
	def void testIconosDistintosColectivos(){
		Assert.assertNotEquals(unaLinea.icono, otraLinea.icono)
	}
	
}