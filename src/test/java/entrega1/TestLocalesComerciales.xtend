package entrega1

import ar.edu.unsam.grupo2.pois.HorarioSemanal
import ar.edu.unsam.grupo2.pois.LocalComercial
import ar.edu.unsam.grupo2.pois.Rubro
import java.time.DayOfWeek
import java.time.LocalDate
import java.time.LocalDateTime
import java.time.LocalTime
import java.time.Month
import org.junit.Assert
import org.junit.Before
import org.junit.Test
import org.uqbar.geodds.Point
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class TestLocalesComerciales {
	/*<------------------------------Imagine Yoga------------------------------------> */
	LocalComercial imagineYoga
	val Point aMasDe2CuadrasyMenosDe5DeImagine = new Point(-34.574451, -58.507582)
	val LocalDate martes29 = LocalDate.of(2016, Month.MARCH, 29)
	val LocalDateTime martes12y10hs = LocalDateTime.of(martes29, LocalTime.of(12, 10, 00))
	val LocalDate lunes21 = LocalDate.of(2016, Month.MARCH, 21)
	val LocalDateTime lunes12y10hs = LocalDateTime.of(lunes21, LocalTime.of(12, 10, 00))

	@Before
	def void inicializeImagineYoga() {
		imagineYoga = new LocalComercial => [
			agregarPalabraClave("Clases de Yoga")
			agregarPalabraClave("Acroyoga")
			agregarPalabraClave("Profesorado")
			nombreComercial = "Imagine Yoga"
			ubicacion = new Point(-34.573674, -58.510167)
			direccion="Condarco 6066"
			rubro = new Rubro => [
				radioDeCercania = 0.2 // 0.2 Kilometros (2 cuadras)
				nombre = "Yoga"
			]
		]
		imagineYoga.horarios.add( new HorarioSemanal(#[DayOfWeek.TUESDAY,DayOfWeek.FRIDAY], 11, 0, 12, 15) ) // Martes y Viernes de 11:00 a 12:15
		imagineYoga.horarios.add(new HorarioSemanal(#[DayOfWeek.MONDAY,DayOfWeek.FRIDAY], 19, 30, 20, 45)) // Lunes y Viernes de 19:30 a 20:45

		
	}
	
	/*<----------------------------------COTO-----------------------------------------> */
	LocalComercial cotoVillaCrespo
	val Point cercaDeCoto = new Point(-34.574451, -58.507582)
	val LocalDate miercoles30 = LocalDate.of(2016, Month.MARCH, 30)
	val LocalDateTime miercoles12y10hs = LocalDateTime.of(miercoles30, LocalTime.of(12, 10, 00))
	@Before
	def void inicializeCoto() {
		cotoVillaCrespo = new LocalComercial => [
			agregarPalabraClave("Carniceria")
			agregarPalabraClave("Electrodomestico")
			agregarPalabraClave("Zona de Juegos")
			nombreComercial = "Coto"
			ubicacion = new Point(-34.595098, -58.4462477)
			direccion="Av. Corrientes 5748"
			rubro = new Rubro => [
				radioDeCercania = 0.1
				nombre = "HiperMercado"
			]
			horarios.add(new HorarioSemanal(#[DayOfWeek.MONDAY,
				DayOfWeek.TUESDAY,
				DayOfWeek.WEDNESDAY,	
				DayOfWeek.THURSDAY,
				DayOfWeek.FRIDAY,
				DayOfWeek.SATURDAY], 8, 30, 21, 30)) // lunes a sabado de 8:30 a 21:30
			horarios.add(new HorarioSemanal(#[DayOfWeek.SUNDAY], 9, 00, 15, 00)) // domingos de 9 a 15 hs
		]
	}

	/*<----------------------------------WALMART-------------------------------------> */
	LocalComercial walmartConstituyentes
	val Point estaCercaDeImagineYoga = new Point(-34.573674, -58.510167)
	val LocalDate jueves31 = LocalDate.of(2016, Month.MARCH, 31)
	val LocalDateTime jueves15y50hs = LocalDateTime.of(jueves31, LocalTime.of(15, 50, 00))
	@Before
	def void inicializeWalmart() {
		walmartConstituyentes = new LocalComercial => [
			agregarPalabraClave("Ferretería")
			agregarPalabraClave("Juguetería")
			agregarPalabraClave("Perfumería")
			nombreComercial = "Walmart"
			ubicacion = new Point(-34.5720099, -58.5077891)
			direccion="Av. Constituyentes 6020"
			rubro = new Rubro => [
				radioDeCercania = 0.3
				nombre = "HiperMercado"
			]
			horarios.add(new HorarioSemanal(#[DayOfWeek.MONDAY,
				DayOfWeek.TUESDAY,
				DayOfWeek.WEDNESDAY,	
				DayOfWeek.THURSDAY,
				DayOfWeek.FRIDAY,
				DayOfWeek.SATURDAY,
				DayOfWeek.SUNDAY], 8, 00, 22, 00)) // lunes a domingo de 8 a 22 hs
		]
	}
	
	/*<----------------------------PIZZERIA IMPERIO---------------------------------> */
	LocalComercial pizzeriaImperioAvCorrientes
	val LocalDate lunes28 = LocalDate.of(2016, Month.MARCH, 28)
	val LocalDateTime lunes15y50hs = LocalDateTime.of(lunes28, LocalTime.of(15, 50, 00))
	@Before
	def void inicializePizzeriaImperio() {
		pizzeriaImperioAvCorrientes = new LocalComercial => [
			agregarPalabraClave("Pizza")
			agregarPalabraClave("Muzzarella")
			agregarPalabraClave("Aceituna")
			nombreComercial = "Pizzería 'Imperio'"
			ubicacion = new Point(-34.586915,-58.4569547)
			direccion="Av. Corrientes 6899"
			rubro = new Rubro => [
				radioDeCercania = 0.11
				nombre = "Pizzeria"
			]
			horarios.add(new HorarioSemanal(#[DayOfWeek.MONDAY,
				DayOfWeek.TUESDAY,
				DayOfWeek.WEDNESDAY,	
				DayOfWeek.THURSDAY,
				DayOfWeek.FRIDAY,
				DayOfWeek.SUNDAY], 5, 00, 00, 00)) 
			horarios.add(new HorarioSemanal(#[DayOfWeek.SATURDAY], 00, 00, 00, 00)) // todo el dia
		]
	}
	
	/*<-----------------------------PUERTA UNO BAR-----------------------------------> */
	LocalComercial puertaUnoBarJuramento
	val LocalDate martes29m = LocalDate.of(2016, Month.MARCH, 29)
	val LocalDateTime martes00y50hs = LocalDateTime.of(martes29m, LocalTime.of(00, 50, 00))
	val LocalDate lunes28m = LocalDate.of(2016, Month.MARCH, 28)
	val LocalDateTime martes5y50hs = LocalDateTime.of(lunes28m, LocalTime.of(05, 50, 00))
	@Before
	def void inicializePuertaUnoBar() {
		puertaUnoBarJuramento = new LocalComercial => [
			agregarPalabraClave("Cafe")
			agregarPalabraClave("Desayuno")
			agregarPalabraClave("Facturas")
			nombreComercial = "Puerta Uno Bar"
			ubicacion = new Point(-34.5577916,-58.4497323)
			direccion="Av. Juramento 1667"
			rubro = new Rubro => [
				radioDeCercania = 0.12
				nombre = "Bar"
			]
			horarios.add(new HorarioSemanal(#[DayOfWeek.WEDNESDAY,	
				DayOfWeek.THURSDAY,
				DayOfWeek.FRIDAY,
				DayOfWeek.SATURDAY,
				DayOfWeek.SUNDAY], 00, 00, 5, 00)) 
			horarios.add(new HorarioSemanal(#[DayOfWeek.TUESDAY,
				DayOfWeek.WEDNESDAY,	
				DayOfWeek.THURSDAY,
				DayOfWeek.FRIDAY,
				DayOfWeek.SATURDAY,
				DayOfWeek.SUNDAY], 20, 00, 00, 00)) 

		]
	}
	
	/*<----------------------------ZAPATERÍA OGGI------------------------------------> */
	LocalComercial zapateriaOggiAvCabildo
	val LocalDate jueves31m = LocalDate.of(2016, Month.MARCH, 31)
	val LocalDateTime jueves9y50hs = LocalDateTime.of(jueves31m, LocalTime.of(9, 50, 00))
	@Before
	def void inicializeZapateriaOggi() {
		zapateriaOggiAvCabildo = new LocalComercial => [
			agregarPalabraClave("Zapatilla")
			agregarPalabraClave("Cordon")
			agregarPalabraClave("Ojota")
			nombreComercial = "Zapatería 'Oggi'"
			ubicacion = new Point(-34.5662697,-58.4542791)
			direccion="Av. Cabildo 1582"
			rubro = new Rubro => [
				radioDeCercania = 0.12
				nombre = "Zapatería"
			]
			horarios.add(new HorarioSemanal(#[DayOfWeek.MONDAY,
				DayOfWeek.TUESDAY,
				DayOfWeek.WEDNESDAY,	
				DayOfWeek.THURSDAY,
				DayOfWeek.FRIDAY], 9, 30, 19, 30))
			horarios.add(new HorarioSemanal(#[DayOfWeek.SATURDAY], 9, 00, 19, 00))
		]
	}
	
	/*<------------------------------ORQUESTA UNO-----------------------------------> */
	LocalComercial orquestaUno
	val LocalDate miercoles30m = LocalDate.of(2016, Month.MARCH, 30)
	val LocalDateTime miercoles10y10hs = LocalDateTime.of(miercoles30m, LocalTime.of(10, 10, 00))
	@Before
	def void inicializeOrquestaUno() {
		orquestaUno = new LocalComercial => [
			agregarPalabraClave("Xaxofon")
			agregarPalabraClave("Guitarra")
			agregarPalabraClave("Ukelele")
			nombreComercial = "Orquesta Uno"
			ubicacion = new Point(-34.6007989,-58.423848)
			direccion="Gazcon 883"
			rubro = new Rubro => [
				radioDeCercania = 0.4
				nombre = "Instrumentos Musicales"
			]
			horarios.add(new HorarioSemanal(#[DayOfWeek.MONDAY,
				DayOfWeek.TUESDAY,
				DayOfWeek.WEDNESDAY,	
				DayOfWeek.THURSDAY,
				DayOfWeek.FRIDAY], 10, 00, 14, 00))
			horarios.add(new HorarioSemanal(#[DayOfWeek.MONDAY,
				DayOfWeek.TUESDAY,
				DayOfWeek.WEDNESDAY,	
				DayOfWeek.THURSDAY,
				DayOfWeek.FRIDAY], 15, 30, 19, 00)) 
			horarios.add(new HorarioSemanal(#[DayOfWeek.SATURDAY], 10, 00, 13, 00))
		]
	}
	
	/*<--------------------------PASTELERIA EL PROGRESO------------------------------> */
	LocalComercial pasteleriaElProgreso
	val LocalDate sabado30 = LocalDate.of(2016, Month.MARCH, 30)
	val LocalDateTime sabado20y10hs = LocalDateTime.of(sabado30, LocalTime.of(20, 10, 00))
	@Before
	def void inicializePasteleriaElProgreso() {
		pasteleriaElProgreso = new LocalComercial => [
			agregarPalabraClave("Torta")
			agregarPalabraClave("Confites")
			agregarPalabraClave("Bizcochuelo")
			nombreComercial = "Pastelería 'El Progreso'"
			ubicacion = new Point(-34.592374,-58.4085567)
			direccion="Av. Santa Fe 2820"
			rubro = new Rubro => [
				radioDeCercania = 0.2
				nombre = "Pastelería"
			]
			horarios.add(new HorarioSemanal(#[DayOfWeek.MONDAY,
				DayOfWeek.TUESDAY,
				DayOfWeek.WEDNESDAY,	
				DayOfWeek.THURSDAY,
				DayOfWeek.FRIDAY,
				DayOfWeek.SATURDAY], 8, 00, 21, 00))
			horarios.add(new HorarioSemanal(#[DayOfWeek.SUNDAY], 8, 30, 20, 00))
		]
	}
	
	
	/*<----------------------------FLORERIA SU FLOR----------------------------------> */
	LocalComercial floreriaSuFlor
	val LocalDate lunes4 = LocalDate.of(2016, Month.APRIL, 4)
	val LocalDateTime lunes10y00hs = LocalDateTime.of(lunes4, LocalTime.of(10, 00, 00))
	@Before
	def void inicializeFloreriaSuFlor() {
		floreriaSuFlor = new LocalComercial => [
			agregarPalabraClave("Margarita")
			agregarPalabraClave("Ramo")
			agregarPalabraClave("Petalo")
			nombreComercial = "Florería 'Su Flor'"
			ubicacion = new Point(-34.6728504,-58.4866172)
			direccion="Av. Argentina 5979"
			rubro = new Rubro => [
				radioDeCercania = 0.2
				nombre = "Florería"
			]
			horarios.add(new HorarioSemanal(#[DayOfWeek.MONDAY,
				DayOfWeek.TUESDAY,
				DayOfWeek.WEDNESDAY,	
				DayOfWeek.THURSDAY,
				DayOfWeek.FRIDAY], 9, 00, 13, 00))
			horarios.add(new HorarioSemanal(#[DayOfWeek.MONDAY,
				DayOfWeek.TUESDAY,
				DayOfWeek.WEDNESDAY,	
				DayOfWeek.THURSDAY,
				DayOfWeek.FRIDAY], 17, 00, 20, 00))
		]
	}
	
	/*<---------------------FERRETERÍA INDUSTRIAL PORTUGAL---------------------------> */
	LocalComercial ferreteriaIndustrialPortugal
	val LocalDate domingo3 = LocalDate.of(2016, Month.APRIL, 3)
	val LocalDateTime domingo8y00hs = LocalDateTime.of(domingo3, LocalTime.of(8, 00, 00))
	@Before
	def void inicializeFerreteriaIndustrialPortugal() {
		ferreteriaIndustrialPortugal = new LocalComercial => [
			agregarPalabraClave("Llave Cruz")
			agregarPalabraClave("Tornillo")
			agregarPalabraClave("Candado")
			nombreComercial = "Ferretería Industrial Portugal"
			ubicacion = new Point(-34.5639435,-58.7391698)
			direccion="Av Rivadavia 4109"
			rubro = new Rubro => [
				radioDeCercania = 0.2
				nombre = "Ferreteria"
			]
			horarios.add(new HorarioSemanal(#[DayOfWeek.MONDAY,
				DayOfWeek.TUESDAY,
				DayOfWeek.WEDNESDAY,	
				DayOfWeek.THURSDAY,
				DayOfWeek.FRIDAY,
				DayOfWeek.SATURDAY], 8, 30, 19, 00))
		]
	}
	def List<LocalComercial> toList(){
		inicializeImagineYoga
		inicializeCoto
		inicializeWalmart
		inicializePizzeriaImperio
		inicializePuertaUnoBar
		inicializeZapateriaOggi
		inicializeOrquestaUno
		inicializePasteleriaElProgreso
		inicializeFloreriaSuFlor
		inicializeFerreteriaIndustrialPortugal
		#[imagineYoga, cotoVillaCrespo, walmartConstituyentes, pizzeriaImperioAvCorrientes, puertaUnoBarJuramento,
			zapateriaOggiAvCabildo, orquestaUno, pasteleriaElProgreso, floreriaSuFlor, ferreteriaIndustrialPortugal
		]
	}
	
	
	@Test
	def void testPreguntaSiEstaCercaYNoEsta() {
		Assert.assertFalse(imagineYoga.estaCerca(aMasDe2CuadrasyMenosDe5DeImagine))
	}
	
	@Test
	def void testEstaCercaDelPuntoaMasDe2CuadrasyMenosDe5DeImagine(){
		Assert.assertFalse(imagineYoga.estaCerca(aMasDe2CuadrasyMenosDe5DeImagine) )
	}
		
	@Test
	def void estaCerradoLocalComercial(){
		Assert.assertFalse(pasteleriaElProgreso.disponible(domingo8y00hs))
	}
	
	@Test
	def void testNoEstaDentroDelRadioDeCercaniaDeAcuerdoAlRubro(){
		val Point aMasCuadrasDeRadioDeCercania=new Point(-34.561337, -58.743751)
		Assert.assertFalse(ferreteriaIndustrialPortugal.estaCerca(aMasCuadrasDeRadioDeCercania))
	}

	@Test
	def void testPuntoEstaDentroDelRadioDeLocalComercial(){
		val Point menosDeUnaCuadraDeZapateria=new Point(-34.566526, -58.454944)
		Assert.assertTrue(zapateriaOggiAvCabildo.estaCerca(menosDeUnaCuadraDeZapateria))
	}

	@Test
	def void estaAbiertoLocalComercial(){
		Assert.assertTrue(pasteleriaElProgreso.disponible(sabado20y10hs))
	}

	@Test
	def void testDisponibleAbierto() {
		Assert.assertTrue(imagineYoga.disponible(martes12y10hs))
	}

	@Test
	def void testEstaCerradoLocalComercial() {
		Assert.assertFalse(imagineYoga.disponible(lunes12y10hs))
	}

	@Test
	def void testMatchPalabrasClaves() {
		Assert.assertTrue(imagineYoga.match("Profesorado"))
	}

	@Test
	def void testMatchPorRubro(){
		Assert.assertTrue(floreriaSuFlor.match("Floreria"))
	}

	@Test
	def void testMatchPorRubroConCaracteresEspeciales(){
		Assert.assertTrue(floreriaSuFlor.match("Florería"))
	}

	@Test
	def void testMatchPorComienzaCon(){
		Assert.assertTrue(orquestaUno.match("oRques"))
	}

	@Test
	def void testMatchNoCumpleConCriterios(){
		Assert.assertFalse(puertaUnoBarJuramento.match("cafeteria"))
	}
}
