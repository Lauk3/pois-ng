package entrega1

import org.eclipse.xtend.lib.annotations.Accessors
import org.junit.Assert
import org.junit.Test
import org.uqbar.geodds.Point

@Accessors
class TestColectivos extends JuegoDeDatosColectivos {
	@Test
	def void testDisponible(){
		Assert.assertTrue( parada110albarellos3150.disponible(domingo18hs) )
	}
		
	@Test
	def void testEstaCercaLinea(){
		Assert.assertTrue( linea110.estaCerca(albarellosyArgerich) )
	}
	@Test
	def void testPuntoAMenosDe1Cuadra(){
		val Point puntoAMenosDe1CuadraMetrobus=new Point(-34.600905, -58.382986)
		Assert.assertTrue(parada45MetrobusTeatroColon.estaCerca(puntoAMenosDe1CuadraMetrobus))
	}
	
	@Test
	def void testEstaCercaParada(){
		Assert.assertTrue( parada110albarellos3150.estaCerca(albarellosyArgerich) )
	}
	@Test
	def void noEstaCercaDeParada(){
		Assert.assertFalse( parada28Peru10021028.estaCerca(ramonSCastillo119))
	}
	@Test
	def void testMatch(){
		Assert.assertTrue( linea110.match("110") && parada110albarellos3150.match("110") )
	}


}