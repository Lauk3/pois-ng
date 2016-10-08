package entrega1

import ar.edu.unsam.grupo2.pois.RangoDiario
import java.time.LocalTime
import java.util.Set
import java.util.TreeSet
import static org.junit.Assert.*
import org.junit.Before
import org.junit.Test
import ar.edu.unsam.grupo2.exception.HorarioInconsistenteException

class TestRango {
	val RangoDiario rango8a11 = new RangoDiario(8,0,11,0)
	val LocalTime hora9 = LocalTime.of(9,0)
	val LocalTime hora18y20 = LocalTime.of(18,20)
	val RangoDiario horario17a21 = new RangoDiario(17,00,21,00)	// 17:00 a 21:00
	val RangoDiario horario16a18 = new RangoDiario(16,00,18,00)	// 16:00 a 18:00
	val RangoDiario horario20a24 = new RangoDiario(20,00,0,00)	// 20:00 a 23:00
	var Set<RangoDiario> rangos16a18y20a24
	
	@Before
	def void init(){
		rangos16a18y20a24 = new TreeSet(#[horario20a24])
		horario16a18.agregarA(rangos16a18y20a24)
	}
	
	@Test
	def void testEnRango(){
		assertTrue(rango8a11.contiene(hora9))
	}
	@Test
	def void testFueraDeRango(){
		assertFalse(rango8a11.contiene(hora18y20))
	}
	
	@Test
	def void rangosDisjuntosSize(){
		assertEquals(2, rangos16a18y20a24.size )	
	}
	@Test
	def void rangosSuperpuestosSize(){
		new RangoDiario(18,30,19,00).agregarA(rangos16a18y20a24)
		assertEquals(3, rangos16a18y20a24.size )
		assertFalse(rangos16a18y20a24.exists[ rango | rango.contiene(hora18y20)])
		horario17a21.agregarA(rangos16a18y20a24)
		assertEquals(1, rangos16a18y20a24.size )	
		assertTrue(rangos16a18y20a24.exists[ rango | rango.contiene(hora18y20)])
	}
	@Test(expected=typeof(HorarioInconsistenteException))
	def void rangoInvalido(){
		new RangoDiario(10,00,5,00)
	}
}