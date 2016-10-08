package entrega1
import ar.edu.unsam.grupo2.pois.HorarioSemanal
import ar.edu.unsam.grupo2.pois.SucursalBanco
import java.time.DayOfWeek
import java.time.LocalDate
import java.time.LocalDateTime
import java.time.LocalTime
import java.time.Month
import org.junit.Before
import org.uqbar.geodds.Point
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List

@Accessors
class JuegoDeDatosBancos {
	
	val HorarioSemanal horarioBancario = new HorarioSemanal(#[
		DayOfWeek.MONDAY,
		DayOfWeek.TUESDAY,
		DayOfWeek.WEDNESDAY,	// Lunes a Viernes de 10:00 a 15:00
		DayOfWeek.THURSDAY,
		DayOfWeek.FRIDAY
	] ,10,15)
	
	val LocalDate martes29 = LocalDate.of(2016, Month.MARCH, 29)
	val LocalDateTime martes15y30hs = LocalDateTime.of(martes29, LocalTime.of(15, 30, 00))

	val LocalDate sabado26 = LocalDate.of(2016, Month.MARCH, 26)
	val LocalDateTime sabado15y30hs = LocalDateTime.of(sabado26, LocalTime.of(15, 30, 00))

	/*<--------------------------SANTADER RIO----------------------------------------> */
	SucursalBanco SantanderConstituyentes
	val LocalDate martes = LocalDate.of(2016, Month.MARCH, 29)
	val LocalDateTime martes12y10hs = LocalDateTime.of(martes, LocalTime.of(12, 10, 00))
	@Before
	def void initializeSantander() {

		SantanderConstituyentes = new SucursalBanco => [
			banco = "Santander Rio"
			barrio = "Villa Pueyrredon"
			ubicacion = new Point(-34.5730459, -58.5057959)
			direccion="Av. De Los Constituyentes 5857 "
			horario = horarioBancario
			servicios = #["Transferencia", "Cobro de cheques"]
		]
	}
	
	/*<------------------------BANCO HIPOTECARIO-------------------------------------> */
	SucursalBanco hipotecarioReconquista
	val  LocalDate miercoles = LocalDate.of(2016, Month.MARCH, 30)
	val  LocalDateTime martes14y50hs = LocalDateTime.of(miercoles, LocalTime.of(14, 50, 00))
	@Before
	def void initializeHipotecario() {

		hipotecarioReconquista = new SucursalBanco => [
			banco = "Hipotecario"
			barrio = "San Nicolas"
			ubicacion = new Point(-34.6064765,-58.3742187)
			direccion="Reconquista 101"
			horario = horarioBancario
			servicios = #["Hipotecas", "Servicios Financieros"]
		]
	}
	
	/*<---------------------------BANCO NACIÓN-------------------------------------> */
	SucursalBanco bancoNacionBMitre
	val LocalDate jueves = LocalDate.of(2016, Month.MARCH, 31)
	val LocalDateTime jueves14y50hs = LocalDateTime.of(jueves, LocalTime.of(14, 50, 00))
	@Before
	def void initializeBancoNacionBMitre() {

		bancoNacionBMitre = new SucursalBanco => [
			banco = "Nacion"
			barrio = "San Nicolas"//a la vuelta del hipotecario
			ubicacion = new Point(-34.606469,-58.371351)
			direccion="SAN Martin 1155"
			horario = horarioBancario
			servicios = #["Memoria y Balances", "Cajeros automáticos"]
			
		]
	}
	
	/*<--------------------------BANCO PROVINCIA------------------------------------> */
	SucursalBanco bancoProvinciaAlsina
	val LocalDate viernes = LocalDate.of(2016, Month.APRIL, 1)
	val LocalDateTime viernes14y50hs = LocalDateTime.of(viernes, LocalTime.of(14, 50, 00))
	@Before
	def void initializeBancoProvincia() {
		bancoProvinciaAlsina = new SucursalBanco => [
			banco = "Provincia"
			barrio = "Monserrat"
			ubicacion = new Point(-34.6111707,-58.389743)
			direccion="Adolfo Alsina 1502"
			horario = horarioBancario
			servicios = #["Tarjetas Banco Provincia", "Programa de Beneficios"]
		]
	}
	
	/*<-----------------------------BANCO FRANCES------------------------------------> */
	SucursalBanco bancoFrancesAvCorrientes
	val LocalDate sabado = LocalDate.of(2016, Month.APRIL, 2)
	val LocalDateTime sabado14y50hs = LocalDateTime.of(sabado, LocalTime.of(14, 50, 00))
	@Before
	def void initializeBancoFrances() {
		bancoFrancesAvCorrientes = new SucursalBanco => [
			banco = "Frances"
			barrio = "Balvanera"//no estoy seguro
			ubicacion = new Point(-34.6039959,-58.4151927)
			horario = horarioBancario
			direccion="Av. Rivadavia 2577"
			servicios = #["Prestamo", "Inversión"]
		]
	}
	
	/*<-----------------------------BANCO COMAFI------------------------------------> */
	SucursalBanco bancoComafiAvCallao
	val LocalDate domingo = LocalDate.of(2016, Month.APRIL, 3)
	val LocalDateTime domingo14y50hs = LocalDateTime.of(domingo, LocalTime.of(14, 50, 00))
	@Before
	def void initializeBancoComafi() {
		bancoComafiAvCallao = new SucursalBanco => [
			banco = "Comafi"
			barrio = "Recoleta"
			ubicacion = new Point(-34.594256,-58.395213)
			direccion="Av. Callao 1279"
			horario = horarioBancario
			servicios = #["Seguro", "Operaciones con el exterior"]
		]
	}
	
	/*<-------------------------------BANCO HSBC-------------------------------------> */
	SucursalBanco bancoHSBCAvRivadavia
	val LocalDate lunes = LocalDate.of(2016, Month.APRIL, 4)
	val LocalDateTime lunes14y30hs = LocalDateTime.of(lunes, LocalTime.of(14, 30, 00))
	@Before
	def void initializeBancoHSBC() {
		bancoHSBCAvRivadavia = new SucursalBanco => [
			banco = "HSBC"
			barrio = "Almagro"
			ubicacion = new Point(-34.6118831,-58.4241891)
			direccion="Av. Rivadavia 3473"
			horario = horarioBancario
			servicios = #["Préstamos Visa", "Tarjetas"]
		]
	}
	
	/*<-------------------------------BANCO CREDICOOP--------------------------------> */
	SucursalBanco bancoCredicoopMaipu
	val LocalDate martes5 = LocalDate.of(2016, Month.APRIL, 5)
	val LocalDateTime martes14y30hs = LocalDateTime.of(martes5, LocalTime.of(14, 30, 00))
	@Before
	def void initializeBancoCredicoop() {
		bancoCredicoopMaipu = new SucursalBanco => [
			banco = "Credicoop"
			barrio = "Monserrat"
			ubicacion = new Point(-34.6118831,-58.4241891)
			direccion="Maipu 72"
			horario = horarioBancario
			servicios = #["Créditos Personales", "Créditos Vivienda"]
		]
	}
	
	/*<-----------------------------BANCO SUPERVIELLE--------------------------------> */
	SucursalBanco bancoSupervielleAvLaPlata
	val LocalDate miercoles6 = LocalDate.of(2016, Month.APRIL, 6)
	val LocalDateTime miercoles14y30hs = LocalDateTime.of(miercoles6, LocalTime.of(14, 30, 00))
	@Before
	def void initializeBancoSupervielle() {
		bancoSupervielleAvLaPlata = new SucursalBanco => [
			banco = "Supervielle"
			barrio = "Caballito"
			ubicacion = new Point(-34.6198608,-58.4341724)
			direccion="Av. La Plata 537"
			horario = horarioBancario
			servicios = #["Cuenta Corriente", "Comercio Exterior"]
		]
	}
	
	/*<-------------------------------BANCO CIUDAD-----------------------------------> */
	SucursalBanco bancoCiudadAvTriunvirato
	val LocalDate jueves7 = LocalDate.of(2016, Month.APRIL, 7)
	val LocalDateTime jueves14y30hs = LocalDateTime.of(jueves7, LocalTime.of(14, 30, 00))
	@Before
	def void initializeBancoCiudad() {
		bancoCiudadAvTriunvirato = new SucursalBanco => [
			banco = "Ciudad"
			barrio = "Villa Urquiza"
			ubicacion = new Point(-34.5738226,-58.4875521)
			direccion="Av Triunvirato 4600"
			horario = horarioBancario
			servicios = #["Banca Electrónica", "Transferencias Múltiples"]
		]
	}
	def List<SucursalBanco> toList(){
		initializeSantander
		initializeHipotecario
		initializeBancoNacionBMitre
		initializeBancoProvincia
		initializeBancoFrances
		initializeBancoComafi
		initializeBancoHSBC
		initializeBancoCredicoop
		initializeBancoSupervielle
		initializeBancoCiudad
		#[SantanderConstituyentes, hipotecarioReconquista, bancoNacionBMitre,bancoProvinciaAlsina, bancoFrancesAvCorrientes,
			bancoComafiAvCallao, bancoHSBCAvRivadavia, bancoCredicoopMaipu, bancoSupervielleAvLaPlata, bancoCiudadAvTriunvirato
		]
	}
}