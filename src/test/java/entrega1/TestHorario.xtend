package entrega1

import ar.edu.unsam.grupo2.exception.HorarioInconsistenteException
import ar.edu.unsam.grupo2.pois.HorarioSemanal
import java.time.DayOfWeek
import java.time.LocalDate
import java.time.LocalDateTime
import java.time.LocalTime
import java.time.Month
import org.junit.Assert
import org.junit.Before
import org.junit.Test

class TestHorario {
	val LocalDate miercoles = LocalDate.of(2016,Month.MARCH,16)
	val LocalDate jueves = LocalDate.of(2016,Month.MARCH,17)
	val LocalDateTime miercoles0hs = LocalDateTime.of(miercoles, LocalTime.of(00, 00, 00))
	val LocalDateTime jueves0hs = LocalDateTime.of(jueves, LocalTime.of(00, 00, 00))
	val LocalDateTime miercoles1950hs = LocalDateTime.of(miercoles, LocalTime.of(19, 50, 00))
	
	val HorarioSemanal horarioHastaMedianoche = new HorarioSemanal(#[DayOfWeek.WEDNESDAY] ,20,00)	// Miercoles de 20:00 a 24:00
	val HorarioSemanal horario17a21 = new HorarioSemanal(#[DayOfWeek.WEDNESDAY] ,17,21)	// Miercoles de 17:00 a 21:00
	val HorarioSemanal horario16a18 = new HorarioSemanal(#[DayOfWeek.WEDNESDAY] ,16,18)	// Miercoles de 16:00 a 18:00

	var HorarioSemanal miercoles16a18y20a24 = new HorarioSemanal
	
	@Before
	def void init(){
		miercoles16a18y20a24.add(horarioHastaMedianoche)
		miercoles16a18y20a24.add(horario16a18)		
	}
	
	@Test (expected=typeof(HorarioInconsistenteException))
	def void testHorarioMalConstruido(){
		new HorarioSemanal(#[DayOfWeek.MONDAY],23,18)
	}
	@Test
	def void testMedianoche(){
		Assert.assertFalse(horarioHastaMedianoche.contiene(miercoles0hs))
	}
	@Test
	def void testMedianocheDiaSiguiente(){
		Assert.assertFalse(horarioHastaMedianoche.contiene(jueves0hs))
	}
	@Test
	def void rangosDisjuntos(){
		Assert.assertFalse(miercoles16a18y20a24.contiene(miercoles1950hs))	
	}	
	@Test
	def void rangosSuperpuestos(){
		miercoles16a18y20a24.add(horario17a21)
		Assert.assertTrue(miercoles16a18y20a24.contiene(miercoles1950hs))	
	}		
}