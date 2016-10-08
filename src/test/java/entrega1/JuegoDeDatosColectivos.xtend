package entrega1

import ar.edu.unsam.grupo2.pois.LineaDeColectivos
import ar.edu.unsam.grupo2.pois.ParadaDeColectivos
import java.time.LocalDate
import java.time.LocalDateTime
import java.time.LocalTime
import java.time.Month
import org.junit.Before
import org.uqbar.geodds.Point
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List

@Accessors
class JuegoDeDatosColectivos {
	val Point albarellosyArgerich = new Point(-34.578442,-58.5117908)
	
	val LocalDate domingo = LocalDate.of(2016,Month.MARCH,13)
	val LocalDateTime domingo18hs = LocalDateTime.of(domingo, LocalTime.of(18, 00, 00))
	
	//PARADAS 110
	val Point albarellos3150 = new Point(-34.5787695,-58.512585)
	val Point albarellos30013059 = new Point(-34.577958,-58.509655)
	val Point albarellos2964 = new Point(-34.578236,-58.509966)
	val Point Albarellos28512899 = new Point(-34.578236,-58.509966)
	val Point albarellos26022700 = new Point(-34.577088,-58.509708)
	val Point Helguera5621 = new Point(-34.580515,-58.510234)
	val Point Franco3079 = new Point(-34.581513,-58.50899)
	val Point Franco2975 = new Point(-34.581513,-58.50899)
	val Point Nazca53025350 = new Point(-34.581513,-58.50899)
	val Point Nazca5093 = new Point(-34.582388,-58.507766)
	var LineaDeColectivos linea110
	
	ParadaDeColectivos parada110albarellos3150
	ParadaDeColectivos parada110Albarellos30013059
	ParadaDeColectivos parada110Albarellos2964
	ParadaDeColectivos parada110Albarellos28512899
	ParadaDeColectivos parada110Albarellos26022700
	ParadaDeColectivos parada110Helguera5621
	ParadaDeColectivos parada110Franco3079
	ParadaDeColectivos parada110Franco2975
	ParadaDeColectivos parada110Nazca53025350
	ParadaDeColectivos parada110Nazca5093
	
	@Before
	def void initializeLinea110(){
		linea110 = new LineaDeColectivos(110)=>[
			direccion=" Zufriategui 4871"
		]
		
		parada110albarellos3150 = new ParadaDeColectivos() => [
			ubicacion = albarellos3150
		]	
		
		parada110Albarellos30013059 = new ParadaDeColectivos() => [
			ubicacion = albarellos30013059
		]
		
		parada110Albarellos2964 = new ParadaDeColectivos() => [
			ubicacion = albarellos2964
		]
		
		parada110Albarellos28512899 = new ParadaDeColectivos() => [
			ubicacion = Albarellos28512899
		]
		
		parada110Albarellos26022700 = new ParadaDeColectivos() => [
			ubicacion = albarellos26022700
		]
		
		parada110Helguera5621 = new ParadaDeColectivos() => [
			ubicacion = Helguera5621
		]
		
		parada110Franco3079 = new ParadaDeColectivos() => [
			ubicacion = Franco3079
		]
		
		parada110Franco2975 = new ParadaDeColectivos() => [
			ubicacion = Franco2975
		]
		
		parada110Nazca53025350 = new ParadaDeColectivos() => [
			ubicacion = Nazca53025350
		]
		
		parada110Nazca5093 = new ParadaDeColectivos() => [
			ubicacion = Nazca5093
		]
		
		linea110.paradas = #[parada110albarellos3150,
			parada110Albarellos30013059,
			parada110Albarellos2964,
			parada110Albarellos28512899,
			parada110Albarellos26022700,
			parada110Helguera5621,
			parada110Franco3079,
			parada110Franco2975,
			parada110Nazca53025350,
			parada110Nazca5093]
	}
	
	//PARADAS 45
	val Point RamosMejia132 = new Point(-34.591838,-58.375031)
	val Point SanMartin11331199 = new Point(-34.593242,-58.376072)
	val Point ComodoroPy19102200 = new Point(-34.589806,-58.370686)
	val Point ComodoroPy1923 = new Point(-34.588535,-58.368658)
	val Point RamonSCastillo131 = new Point(-34.586146,-58.367843)
	val Point RamonSCastillo132 = new Point(-34.58401,-58.368476)
	val Point SantaFe801859 = new Point(-34.595452,-58.376919)
	val Point CarlosPellegrini10711099 = new Point(-34.595412,-58.380871)
	val Point MetrobusTeatroColon = new Point(-34.600843,-58.382042)
	val Point RamonSCastillo119 = new Point(-34.580741,-58.376836)
	
	LineaDeColectivos linea45
	ParadaDeColectivos parada45RamosMejia132
	ParadaDeColectivos parada45SanMartin11331199
	ParadaDeColectivos parada45ComodoroPy19102200
	ParadaDeColectivos parada45ComodoroPy1923
	ParadaDeColectivos parada45RamonSCastillo131
	ParadaDeColectivos parada45RamonSCastillo132
	ParadaDeColectivos parada45SantaFe801859
	ParadaDeColectivos parada45CarlosPellegrini10711099
	ParadaDeColectivos parada45MetrobusTeatroColon
	ParadaDeColectivos parada45RamonSCastillo119
	
	@Before
	def void initializeLinea45(){
		linea45 = new LineaDeColectivos(45)=>[
			direccion=" 14 de Julio 4100"
		]
		
		parada45RamosMejia132 = new ParadaDeColectivos() => [
			linea = linea45
			ubicacion = RamosMejia132
		]	
		
		parada45SanMartin11331199 = new ParadaDeColectivos() => [
			linea = linea45
			ubicacion = SanMartin11331199
		]
		
		parada45ComodoroPy19102200 = new ParadaDeColectivos() => [
			linea = linea45
			ubicacion = ComodoroPy19102200
		]
		
		parada45ComodoroPy1923 = new ParadaDeColectivos() => [
			linea = linea45
			ubicacion = ComodoroPy1923
		]
		
		parada45RamonSCastillo131 = new ParadaDeColectivos() => [
			linea = linea45
			ubicacion = RamonSCastillo131
		]
		
		parada45RamonSCastillo132 = new ParadaDeColectivos() => [
			linea = linea45
			ubicacion = RamonSCastillo132
		]
		
		parada45SantaFe801859 = new ParadaDeColectivos() => [
			linea = linea45
			ubicacion = SantaFe801859
		]
		
		parada45CarlosPellegrini10711099 = new ParadaDeColectivos() => [
			linea = linea45
			ubicacion = CarlosPellegrini10711099
		]
		
		parada45MetrobusTeatroColon = new ParadaDeColectivos() => [
			linea = linea45
			ubicacion = MetrobusTeatroColon
		]
		
		parada45RamonSCastillo119 = new ParadaDeColectivos() => [
			linea = linea45
			ubicacion = RamonSCastillo119
		]
		
		linea45.addParada(parada45RamosMejia132)
		linea45.addParada(parada45SanMartin11331199)
		linea45.addParada(parada45ComodoroPy19102200)
		linea45.addParada(parada45ComodoroPy1923)
		linea45.addParada(parada45RamonSCastillo131)
		linea45.addParada(parada45RamonSCastillo132)
		linea45.addParada(parada45SantaFe801859)
		linea45.addParada(parada45CarlosPellegrini10711099)
		linea45.addParada(parada45MetrobusTeatroColon)
		linea45.addParada(parada45RamonSCastillo119)
	}
	
	//PARADAS 28
	val Point SanMartin12451269 = new Point(-34.592356,-58.375756)
	val Point Paraguay = new Point(-34.596848,-58.373773)
	val Point Alem494 = new Point(-34.600778,-58.371916)
	val Point HipolitoYrigoyen315369 = new Point(-34.607622,-58.369712)
	val Point Piedras416 = new Point(-34.611808,-58.374765)
	val Point JulioARoca791 = new Point(-34.612576,-58.375194)
	val Point Belgrano502600 = new Point(-34.612576,-58.375194)
	val Point Bolivar583 = new Point(-34.612938,-58.375194)
	val Point Bolivar701799 = new Point(-34.615913,-58.375194)
	val Point Peru10021028 = new Point(-34.618615,-58.374754)
	
	LineaDeColectivos linea28
	ParadaDeColectivos parada28SanMartin12451269
	ParadaDeColectivos parada28Paraguay
	ParadaDeColectivos parada28Alem494
	ParadaDeColectivos parada28HipolitoYrigoyen315369
	ParadaDeColectivos parada28Piedras416
	ParadaDeColectivos parada28JulioARoca791
	ParadaDeColectivos parada28Belgrano502600
	ParadaDeColectivos parada28Bolivar583
	ParadaDeColectivos parada28Bolivar701799
	ParadaDeColectivos parada28Peru10021028
	
	@Before
	def void initializeLinea28(){
		linea28 = new LineaDeColectivos(28)=>[
			direccion=" Echauri 1567 "
		]
		
		parada28SanMartin12451269 = new ParadaDeColectivos() => [
			linea = linea28
			ubicacion = SanMartin12451269
		]	
		
		parada28Paraguay = new ParadaDeColectivos() => [
			linea = linea28
			ubicacion = Paraguay
		]
		
		parada28Alem494 = new ParadaDeColectivos() => [
			linea = linea28
			ubicacion = Alem494
		]
		
		parada28HipolitoYrigoyen315369 = new ParadaDeColectivos() => [
			linea = linea28
			ubicacion = HipolitoYrigoyen315369
		]
		
		parada28Piedras416 = new ParadaDeColectivos() => [
			linea = linea28
			ubicacion = Piedras416
		]
		
		parada28JulioARoca791 = new ParadaDeColectivos() => [
			linea = linea28
			ubicacion = JulioARoca791
		]
		
		parada28Belgrano502600 = new ParadaDeColectivos() => [
			linea = linea28
			ubicacion = Belgrano502600
		]
		
		parada28Bolivar583 = new ParadaDeColectivos() => [
			linea = linea28
			ubicacion = Bolivar583
		]
		
		parada28Bolivar701799 = new ParadaDeColectivos() => [
			linea = linea28
			ubicacion = Bolivar701799
		]
		
		parada28Peru10021028 = new ParadaDeColectivos() => [
			linea = linea28
			ubicacion = Peru10021028
		]
		
		linea28.addParada(parada28SanMartin12451269)
		linea28.addParada(parada28Paraguay)
		linea28.addParada(parada28Alem494)
		linea28.addParada(parada28HipolitoYrigoyen315369)
		linea28.addParada(parada28Piedras416)
		linea28.addParada(parada28JulioARoca791)
		linea28.addParada(parada28Belgrano502600)
		linea28.addParada(parada28Bolivar583)
		linea28.addParada(parada28Bolivar701799)
		linea28.addParada(parada28Peru10021028)
	}
	
	def List<LineaDeColectivos> toList(){
		initializeLinea110
		initializeLinea45
		initializeLinea28
		#[linea110, linea45, linea28]
	}
}