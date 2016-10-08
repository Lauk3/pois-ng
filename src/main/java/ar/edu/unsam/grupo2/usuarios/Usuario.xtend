package ar.edu.unsam.grupo2.usuarios

import ar.edu.unsam.grupo2.exception.UsuarioSinGPSException
import ar.edu.unsam.grupo2.pois.POI
import ar.edu.unsam.grupo2.procesos.Proceso
import ar.edu.unsam.grupo2.usuarios.searchObservers.BusquedasPorFechaObserver
import ar.edu.unsam.grupo2.usuarios.searchObservers.CantResultadosPorBusquedaObserver
import ar.edu.unsam.grupo2.usuarios.searchObservers.GenerarLogObserver
import ar.edu.unsam.grupo2.usuarios.searchObservers.NotificarDemoraPorMailObserver
import ar.edu.unsam.grupo2.usuarios.searchObservers.SearchObserver
import java.util.List
import java.util.Set
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.geodds.interfacesExternas.GPS
import com.fasterxml.jackson.annotation.JsonIgnore

@Accessors
class Usuario implements Cloneable, Comparable<Usuario> {
	var Set<SearchObserver> searchObservers = newHashSet
	String mail
	@JsonIgnore TipoDeUsuario tipo
	String nickname
	String contraseña
	Set<POI> favoritos = newHashSet
	GPS gps
	
	new(String direccionMail) {
		mail = direccionMail
		tipo = new Basico
	}

	def boolean getAdmin() {
		tipo.admin
	}

	def setAdmin(int reintentos) {
		tipo = new Admin(reintentos)
	}

	def setAdmin() {
		tipo = new Admin(0)
	}

	def List<POI> buscar(String valor) {
		val busqueda = new Busqueda().buscar(valor)
		busqueda.usuario = this
		searchObservers.forEach[notificarSearch(busqueda)]
		busqueda.resultado
	}

	def void run(Proceso proceso) {
		tipo.run(proceso, this)
	}

	override Usuario clone() {
		new Usuario(mail) => [
			this.searchObservers.forEach[observer|it.searchObservers.add(observer)]
			it.tipo = this.tipo.clone as TipoDeUsuario
			it.mail = this.mail
			it.nickname = this.nickname
			it.contraseña = this.contraseña
		]
	}

	/**************************** (  Activacion de observers  ) *****************************/
	def void activarLogger() {
		searchObservers.add(new GenerarLogObserver)

	}

	def void notificarDemora(long demoraMaxima) {
		notificarDemoraOFF // para que se actualice la demora maxima
		searchObservers.add(new NotificarDemoraPorMailObserver(demoraMaxima))
	}

	def void registrarBusquedasPorFecha() {
		searchObservers.add(new BusquedasPorFechaObserver)

	}

	def void registrarCantResultados() {
		searchObservers.add(new CantResultadosPorBusquedaObserver)

	}

	/**************************** (  Desactivacion de observers  ) *****************************/
	def void loggearOFF() {
		searchObservers.remove(new GenerarLogObserver)
	}

	def void notificarDemoraOFF() {
		searchObservers.remove(new NotificarDemoraPorMailObserver(0))
	}

	def void registrarBusquedasPorFechaOFF() {
		searchObservers.remove(new BusquedasPorFechaObserver)
	}

	def void registrarCantResultadosOFF() {
		searchObservers.remove(new CantResultadosPorBusquedaObserver)
	}

	override compareTo(Usuario otroUsuario) {
		this.nickname.compareTo(otroUsuario.nickname)
	}
	
	
	/****************************  (   Agregar POI a favoritos    )  ****************************/

	def void agregarAFavoritos(POI unPoi){
		favoritos.add(unPoi)
	} 

	def void quitarDeFavoritos(POI unPoi){
		favoritos.remove(unPoi)		
	}
	
	/****************************  (   GPS    )  ****************************/
	@JsonIgnore
	def getPosicion(){
		if(this.gps == null){
			throw new UsuarioSinGPSException("El usuario actual no tiene un sistema de GPS.")
		}
		this.gps.posicion
	}
	
}
