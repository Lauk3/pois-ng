package entrega1

import ar.edu.unsam.grupo2.pois.Comuna
import ar.edu.unsam.grupo2.pois.HorarioSemanal
import ar.edu.unsam.grupo2.pois.Servicio
import java.time.DayOfWeek
import java.time.LocalDate
import java.time.LocalDateTime
import java.time.LocalTime
import java.time.Month
import org.junit.Assert
import org.junit.Before
import org.junit.Test
import org.uqbar.geodds.Point
import org.uqbar.geodds.Polygon
import ar.edu.unsam.grupo2.pois.CGP
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class TestCGP {
	/*<--------------------------COMUNA 7-------------------------------------------> */
	Comuna comuna7
	CGP CGP7
	val HorarioSemanal horarioComuna7T = new HorarioSemanal(#[DayOfWeek.MONDAY,
				DayOfWeek.TUESDAY,
				DayOfWeek.WEDNESDAY,	
				DayOfWeek.THURSDAY,
				DayOfWeek.FRIDAY], 8, 30, 19, 30) // TESORERIA
	val HorarioSemanal horarioComuna7AC = new HorarioSemanal(#[DayOfWeek.MONDAY,
				DayOfWeek.TUESDAY,
				DayOfWeek.WEDNESDAY,	
				DayOfWeek.THURSDAY,
				DayOfWeek.FRIDAY], 8, 19) // ATENCION CIUDADANA
	val LocalDate jueves31 = LocalDate.of(2016, Month.MARCH, 31)
	val LocalDateTime jueves15y10hs = LocalDateTime.of(jueves31, LocalTime.of(15, 10, 00))

	@Before
	def void initializeComuna7() {
		comuna7 = new Comuna => [
			setNumeroDeComuna(7)
			zona = new Polygon(#[new Point(-34.622505, -58.477644),
				new Point(-34.614028, -58.459619),
				new Point(-34.630768, -58.451551),
				new Point(-34.627095, -58.426832),
				new Point(-34.640019, -58.423742),
				new Point(-34.654087, -58.463638)
			])	
		]
		CGP7 = new CGP => [
			barrio = "Flores"
			comuna = comuna7
			ubicacion = new Point(-34.630224, -58.4690907)
			direccion="Av. Rivadavia 7202"
			servicios.add(new Servicio => [
				horarios.add(horarioComuna7T)
				nombre = "Tesoreria"
			])
			servicios.add(new Servicio => [
				horarios.add(horarioComuna7AC)
				nombre = "Atención Ciudadana"
			])
		]
	}

	/*<--------------------------COMUNA 13-------------------------------------------> */
	Comuna comuna13
	CGP CGP13
	val HorarioSemanal horarioComuna13Rentas = new HorarioSemanal(#[DayOfWeek.MONDAY,
				DayOfWeek.TUESDAY,
				DayOfWeek.WEDNESDAY,	
				DayOfWeek.THURSDAY,
				DayOfWeek.FRIDAY], 8, 30, 19, 00)
	val HorarioSemanal horarioComuna13RegistroCivil = new HorarioSemanal(#[DayOfWeek.MONDAY,
				DayOfWeek.TUESDAY,
				DayOfWeek.WEDNESDAY,	
				DayOfWeek.THURSDAY,
				DayOfWeek.FRIDAY], 7, 30, 18, 30)
	val LocalDate viernes1 = LocalDate.of(2016, Month.APRIL, 1)
	val LocalDateTime viernes15y10hs = LocalDateTime.of(viernes1, LocalTime.of(15, 10, 00))

	@Before
	def void initializeComuna13() {
		comuna13 = new Comuna => [
			setNumeroDeComuna(13)
			zona = new Polygon(#[new Point(-34.526796, -58.458160),
				new Point(-34.549421, -58.430694),
				new Point(-34.581509, -58.445371),
				new Point(-34.566810, -58.472151)
			])	

		]
		CGP13 = new CGP => [
			barrio = "Belgrano"
			comuna = comuna13
			ubicacion = new Point(-34.5537306, -58.463814)
			direccion="Av. Cabildo 3067"
			servicios.add(new Servicio => [
				horarios.add(horarioComuna13Rentas)
				nombre = "Rentas"
			])
			servicios.add(new Servicio => [
				horarios.add(horarioComuna13RegistroCivil)
				nombre = "Registro Civil - Identificación"
			])
		]
	}
	
	/*<--------------------------COMUNA 9--------------------------------------------> */
	Comuna comuna9
	CGP CGP9
	val HorarioSemanal horarioComuna9Infracciones = new HorarioSemanal(#[DayOfWeek.MONDAY,
				DayOfWeek.TUESDAY,
				DayOfWeek.WEDNESDAY,	
				DayOfWeek.THURSDAY,
				DayOfWeek.FRIDAY], 8, 30, 14, 00)
	val HorarioSemanal horarioComuna9RGBR = new HorarioSemanal(#[DayOfWeek.MONDAY,
				DayOfWeek.TUESDAY,
				DayOfWeek.WEDNESDAY,	
				DayOfWeek.THURSDAY,
				DayOfWeek.FRIDAY], 7, 30, 18, 30)//Registro de grupos y bandas de Rock
	val LocalDate sabado2 = LocalDate.of(2016, Month.APRIL, 2)
	val LocalDateTime sabado17y10hs = LocalDateTime.of(sabado2, LocalTime.of(17, 10, 00))

	@Before
	def void initializeComuna9() {
		comuna9 = new Comuna => [
			setNumeroDeComuna(9)
			zona = new Polygon(#[new Point(-34.634765, -58.530384),
				new Point(-34.653971, -58.529183),
				new Point(-34.673879, -58.502575),
				new Point(-34.657501, -58.479229),
				new Point(-34.664561, -58.469960),
				new Point(-34.656513, -58.460861),
				new Point(-34.651853, -58.467041),
				new Point(-34.646063, -58.463265),
				new Point(-34.637307, -58.478886),
				new Point(-34.646204, -58.501717)
			])

		]
		CGP9 = new CGP => [
			barrio = "Mataderos"
			comuna = comuna9
			ubicacion = new Point(-34.6596604,-58.5072427)
			direccion="Av. Directorio 4360"
			servicios.add(new Servicio => [
				horarios.add(horarioComuna9Infracciones)
				nombre = "Infracciones"
			])
			servicios.add(new Servicio => [
				horarios.add(horarioComuna9RGBR)
				nombre = "Registro de grupos y bandas de Rock"
			])
		]
	}
	
	/*<--------------------------COMUNA 12-------------------------------------------> */
	Comuna comuna12
	CGP CGP12
	val HorarioSemanal horarioComuna12DefensaConsumidor = new HorarioSemanal(#[DayOfWeek.MONDAY,
				DayOfWeek.TUESDAY,
				DayOfWeek.WEDNESDAY,	
				DayOfWeek.THURSDAY,
				DayOfWeek.FRIDAY], 9, 00, 15, 00)
	val HorarioSemanal horarioComuna12DNNA = new HorarioSemanal(#[DayOfWeek.MONDAY,
				DayOfWeek.TUESDAY,
				DayOfWeek.WEDNESDAY,	
				DayOfWeek.THURSDAY,
				DayOfWeek.FRIDAY], 9, 00, 16, 00)//Defensoría de niños, niñas y adolescentes
	val LocalDate domingo3 = LocalDate.of(2016, Month.APRIL, 3)
	val LocalDateTime domingo17y10hs = LocalDateTime.of(domingo3, LocalTime.of(17, 10, 00))

	@Before
	def void initializeComuna12() {
		comuna12 = new Comuna => [
			setNumeroDeComuna(12)
			zona = new Polygon(#[new Point(-34.580868, -58.514974),
				new Point(-34.549344, -58.500726),
				new Point(-34.538881, -58.476007),
				new Point(-34.548637, -58.468797),
				new Point(-34.552172, -58.474805),
				new Point(-34.562068, -58.467252),
				new Point(-34.566309, -58.473775),
				new Point(-34.572670, -58.468625),
				new Point(-34.593445, -58.503644)
			])

		]
		CGP12 = new CGP => [
			barrio = "Coghlan"
			comuna = comuna12
			ubicacion = new Point(-34.5687931,-58.4851772)
			direccion="Miller 2751"
			servicios.add(new Servicio => [
				horarios.add(horarioComuna12DefensaConsumidor)
				nombre = "Defensa al Consumidor"
			])
			servicios.add(new Servicio => [
				horarios.add(horarioComuna12DNNA)
				nombre = "Defensoría de niños, niñas y adolescentes"
			])
		]
	}
	
	/*<--------------------------COMUNA 5--------------------------------------------> */
	Comuna comuna5
	CGP CGP5
	val HorarioSemanal horarioComuna5Casamiento = new HorarioSemanal(#[DayOfWeek.MONDAY,
				DayOfWeek.TUESDAY,
				DayOfWeek.WEDNESDAY,	
				DayOfWeek.THURSDAY,
				DayOfWeek.FRIDAY], 9, 30, 14, 30)
	val HorarioSemanal horarioComuna5Infracciones = new HorarioSemanal(#[DayOfWeek.MONDAY,
				DayOfWeek.TUESDAY,
				DayOfWeek.WEDNESDAY,	
				DayOfWeek.THURSDAY,
				DayOfWeek.FRIDAY], 8, 00, 14, 00)
	val LocalDate lunes4 = LocalDate.of(2016, Month.APRIL, 4)
	val LocalDateTime lunes12y50hs = LocalDateTime.of(lunes4, LocalTime.of(12, 50, 00))

	@Before
	def void initializeComuna5() {
		comuna5 = new Comuna => [
			setNumeroDeComuna(5)
			zona = new Polygon(#[new Point(-34.599629, -58.429894),
				new Point(-34.598146, -58.412127),
				new Point(-34.637913, -58.411354),
				new Point(-34.639961, -58.423285)
			])
		]
		CGP5 = new CGP => [
			barrio = "Boedo"
			comuna = comuna5
			ubicacion = new Point(-34.6214453,-58.4132494)
			direccion="Carlos Calvo 3307"
			servicios.add(new Servicio => [
				horarios.add(horarioComuna5Casamiento)
				nombre = "Casamiento"
			])
			servicios.add(new Servicio => [
				horarios.add(horarioComuna5Infracciones)
				nombre = "Infracciones"
			])
		]
	}
	
	/*<--------------------------COMUNA 11------------------------------------------> */
	Comuna comuna11
	CGP CGP11
	val HorarioSemanal horarioComuna11TurnosReclamos = new HorarioSemanal(#[DayOfWeek.MONDAY,
				DayOfWeek.TUESDAY,
				DayOfWeek.WEDNESDAY,	
				DayOfWeek.THURSDAY,
				DayOfWeek.FRIDAY], 9, 00, 16, 00)
	val HorarioSemanal horarioComuna11ProgramaCastraciones = new HorarioSemanal(#[DayOfWeek.MONDAY,
				DayOfWeek.TUESDAY,
				DayOfWeek.WEDNESDAY,	
				DayOfWeek.THURSDAY,
				DayOfWeek.FRIDAY], 9, 00, 15, 00)
	val LocalDate martes5 = LocalDate.of(2016, Month.APRIL, 5)
	val LocalDateTime martes13y30hs = LocalDateTime.of(martes5, LocalTime.of(13, 30, 00))
	
	@Before
	def void initializeComuna11() {
		comuna11 = new Comuna => [
			setNumeroDeComuna(11)
			zona = new Polygon(#[new Point(-34.610450, -58.528902),
				new Point(-34.581199, -58.514997),
				new Point(-34.604657, -58.459379),
				new Point(-34.624012, -58.482381),
				new Point(-34.608754, -58.500062),
				new Point(-34.619774, -58.516714)
			])

		]
		CGP11 = new CGP => [
			barrio = "Villa Del Parque"
			comuna = comuna11
			ubicacion = new Point(-34.5934624,-58.5266787)
			direccion="Av. Beiró 4680"
			servicios.add(new Servicio => [
				horarios.add(horarioComuna11TurnosReclamos)
				nombre = "Turnos y reclamos"
			])
			servicios.add(new Servicio => [
				horarios.add(horarioComuna11ProgramaCastraciones)
				nombre = "Programa Castraciones"
			])
		]
	}
	
	/*<--------------------------COMUNA 2--------------------------------------------> */
	Comuna comuna2
	CGP CGP2
	val HorarioSemanal horarioComuna2ApoyoEscolar = new HorarioSemanal(#[DayOfWeek.MONDAY,
				DayOfWeek.TUESDAY,
				DayOfWeek.WEDNESDAY,	
				DayOfWeek.THURSDAY,
				DayOfWeek.FRIDAY], 16, 30, 19, 00)
	val HorarioSemanal horarioComuna2EcoBici = new HorarioSemanal(#[DayOfWeek.MONDAY,
				DayOfWeek.TUESDAY,
				DayOfWeek.WEDNESDAY,	
				DayOfWeek.THURSDAY,
				DayOfWeek.FRIDAY], 8, 30, 17, 30)
	val LocalDate miercoles6 = LocalDate.of(2016, Month.APRIL, 6)
	val LocalDateTime miercoles16y30hs = LocalDateTime.of(miercoles6, LocalTime.of(16, 30, 00))
	
	@Before
	def void initializeComuna2() {
		comuna2 = new Comuna => [
			setNumeroDeComuna(2)
			zona = new Polygon(#[new Point(-34.597721, -58.415912),
				new Point(-34.599064, -58.386987),
				new Point(-34.579562, -58.376774),
				new Point(-34.569880, -58.399261)
			])

		]
		CGP2 = new CGP => [
			barrio = "Recoleta"
			comuna = comuna2
			ubicacion = new Point(-34.605841,-58.4328221)
			direccion="Pres. José E. Uriburu 1022"
			servicios.add(new Servicio => [
				horarios.add(horarioComuna2ApoyoEscolar)
				nombre = "Apoyo Escolar"
			])
			servicios.add(new Servicio => [
				horarios.add(horarioComuna2EcoBici)
				nombre = "EcoBici"
			])
		]
	}
	
	/*<--------------------------COMUNA 8--------------------------------------------> */
	Comuna comuna8
	CGP CGP8
	val HorarioSemanal horarioComuna8DirecciónGeneralMujer = new HorarioSemanal(#[DayOfWeek.MONDAY,
				DayOfWeek.WEDNESDAY,	
				DayOfWeek.FRIDAY], 9, 00, 16, 00)
	val HorarioSemanal horarioComuna8ServicioSocial = new HorarioSemanal(#[DayOfWeek.MONDAY,
				DayOfWeek.TUESDAY,
				DayOfWeek.WEDNESDAY,	
				DayOfWeek.THURSDAY,
				DayOfWeek.FRIDAY], 9, 00, 16, 00)
	val LocalDate jueves7 = LocalDate.of(2016, Month.APRIL, 7)
	val LocalDateTime jueves12y10hs = LocalDateTime.of(jueves7, LocalTime.of(12, 10, 00))
	
	@Before
	def void initializeComuna8() {
		comuna8 = new Comuna => [
			setNumeroDeComuna(8)
			zona = new Polygon(#[new Point(-34.704940, -58.461278),
				new Point(-34.661887, -58.424371),
				new Point(-34.650732, -58.453897),
				new Point(-34.664852, -58.469861),
				new Point(-34.658216, -58.478788)
			])

		]
		CGP8 = new CGP => [
			barrio = ""
			comuna = comuna8
			ubicacion = new Point(-34.6860319,-58.4577205)
			direccion="Av. Roca 5252"
			servicios.add(new Servicio => [
				horarios.add(horarioComuna8DirecciónGeneralMujer)
				nombre = "Dirección General de la Mújer"
			])
			servicios.add(new Servicio => [
				horarios.add(horarioComuna8ServicioSocial)
				nombre = "Servicio Social"
			])
		]
	}
	
	/*<--------------------------COMUNA 10-------------------------------------------> */
	Comuna comuna10
	CGP CGP10
	val HorarioSemanal horarioComuna10DGPPD = new HorarioSemanal(#[DayOfWeek.MONDAY,
				DayOfWeek.TUESDAY,
				DayOfWeek.WEDNESDAY,	
				DayOfWeek.THURSDAY,
				DayOfWeek.FRIDAY], 9, 00, 16, 00)
	val HorarioSemanal horarioComuna10AJG = new HorarioSemanal(#[DayOfWeek.MONDAY,
				DayOfWeek.TUESDAY,
				DayOfWeek.WEDNESDAY,	
				DayOfWeek.THURSDAY,
				DayOfWeek.FRIDAY], 9, 00, 16, 00)
	val LocalDate viernes8 = LocalDate.of(2016, Month.APRIL, 8)
	val LocalDateTime viernes5y15hs = LocalDateTime.of(viernes8, LocalTime.of(05, 15, 00))
	
	@Before
	def void initializeComuna10() {
		comuna10 = new Comuna => [
			setNumeroDeComuna(10)
			zona = new Polygon(#[new Point(-34.634317, -58.530389),
				new Point(-34.611009, -58.529359),
				new Point(-34.620051, -58.516999),
				new Point(-34.609314, -58.500348),
				new Point(-34.636436, -58.471509),
				new Point(-34.645475, -58.502580)
			])

		]
		CGP10 = new CGP => [
			barrio = "Floresta"
			comuna = comuna10
			ubicacion = new Point(-34.6324105,-58.4833006)
			direccion="Bacacay 3968"
			servicios.add(new Servicio => [
				horarios.add(horarioComuna10DGPPD)
				nombre = "Dirección General de Política de Prevención del Delito"
			])
			servicios.add(new Servicio => [
				horarios.add(horarioComuna10AJG)
				nombre = "Asesoramiento Jurídico gratuito"
			])
		]
	}
	
	/*<--------------------------COMUNA 15-------------------------------------------> */
	Comuna comuna15
	CGP CGP15
	val HorarioSemanal horarioComuna15DefensaConsumidor = new HorarioSemanal(#[DayOfWeek.MONDAY,
				DayOfWeek.TUESDAY,
				DayOfWeek.WEDNESDAY,	
				DayOfWeek.THURSDAY,
				DayOfWeek.FRIDAY], 9, 00, 14, 30)
	val HorarioSemanal horarioComuna15Infracciones = new HorarioSemanal(#[DayOfWeek.MONDAY,
				DayOfWeek.TUESDAY,
				DayOfWeek.WEDNESDAY,	
				DayOfWeek.THURSDAY,
				DayOfWeek.FRIDAY], 8, 00, 14, 00)
	val LocalDate sabado9 = LocalDate.of(2016, Month.APRIL, 9)
	val LocalDateTime sabado15y15hs = LocalDateTime.of(sabado9, LocalTime.of(15, 15, 00))
	
	@Before
	def void initializeComuna15() {
		comuna15 = new Comuna => [
			setNumeroDeComuna(15)
			zona = new Polygon(#[new Point(-34.572596, -58.467366),
				new Point(-34.597611, -58.423936),
				new Point(-34.607219, -58.446423),
				new Point(-34.593654, -58.502213),
				new Point(-34.6324105,-58.4833006)
			])

		]
		CGP15 = new CGP => [
			barrio = "Chacarita"
			comuna=comuna15
			ubicacion = new Point(-34.6324105,-58.4833006)
			direccion="Av. Córdoba 5690"
			servicios.add(new Servicio => [
				horarios.add(horarioComuna15DefensaConsumidor)
				nombre = "Defensa al Consumidor"
			])
			servicios.add(new Servicio => [
				horarios.add(horarioComuna15Infracciones)
				nombre = "Infracciones"
			])
		]
	}
	
	def List<CGP> toList(){
		initializeComuna7
		initializeComuna13
		initializeComuna9
		initializeComuna12
		initializeComuna5
		initializeComuna11
		initializeComuna2
		initializeComuna8
		initializeComuna10
		initializeComuna15
		#[ CGP7 , CGP13 , CGP9 , CGP12 , CGP5 , CGP11 , CGP2 , CGP8 , CGP10 , CGP15 ]
	}
	
	@Test
	def void cgp7NoestaCercaCGP13() {
 	Assert.assertFalse("El CGP 13 no esta cerca del CGP 7", CGP7.estaCerca(CGP13.ubicacion))
	}
	
	@Test
	def void cgp15FueraDelRadioDeSuComuna(){
		val Point pto6CuadrasDeComuna15=new Point(-34.575918, -58.481442)
		Assert.assertFalse(CGP15.estaCerca(pto6CuadrasDeComuna15))
	}
			
	@Test
	def void testEstaDisponibleServicio(){
		val LocalDate lunes1 = LocalDate.of(2016, Month.MARCH, 1)
		val LocalDateTime lunes12y15hs = LocalDateTime.of(lunes1, LocalTime.of(12, 15, 00))
		Assert.assertTrue(CGP15.disponible(lunes12y15hs,"Infracciones"))
	}
	@Test
	def void testNoEstaDisponibleServicio(){
		Assert.assertFalse(CGP10.disponible(viernes5y15hs ,"Dirección General de Política de Prevención del Delito"))
	}
	
	@Test
	def void testExisteAlMenosUnServicio(){
		Assert.assertTrue(CGP8.disponible(jueves12y10hs))
	}
	@Test
	def void testNoHayServiciosDisponiblesEnHorario(){
		val LocalDate lunes1 = LocalDate.of(2016, Month.MARCH, 1)
		val LocalDateTime lunes20y10hs = LocalDateTime.of(lunes1, LocalTime.of(20, 10, 00))
		Assert.assertFalse(CGP7.disponible(lunes20y10hs))
	}
	@Test
	def void testBusquedaPorNumeroDeComunaExacto() {
		Assert.assertTrue(CGP7.match("7"))
	}

	@Test
	def void testBusquedaPorServicioEmpiezaCon() {
		Assert.assertTrue(CGP7.match("teso"))
	}
	

}
