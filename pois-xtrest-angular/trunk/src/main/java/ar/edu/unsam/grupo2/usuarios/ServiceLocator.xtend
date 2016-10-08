package ar.edu.unsam.grupo2.usuarios

import org.uqbar.geodds.interfacesExternas.MailSender
import org.eclipse.xtend.lib.annotations.Accessors
import ar.edu.unsam.grupo2.repositorio.RepositorioDePOIs
import org.uqbar.geodds.interfacesExternas.ManejadorDeArchivos
import ar.edu.unsam.grupo2.procesos.Home
import org.uqbar.geodds.interfacesExternas.ServicioREST

@Accessors
class ServiceLocator {
	var static ServiceLocator instance
	var MailSender mailSender
	var String mailAdmin
	var RepositorioDePOIs repositorio = new RepositorioDePOIs
	var Metricas metricas = new Metricas
	var ManejadorDeArchivos manejadorDeArchivos
	var Home home = new Home
	var ServicioREST servicioREST
	
	private new() {
		super()
	}

	static def getInstance() {
		if(instance == null) {
			instance = new ServiceLocator
		}
		instance
	}
}