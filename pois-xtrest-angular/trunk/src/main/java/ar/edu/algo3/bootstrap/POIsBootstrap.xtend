package ar.edu.algo3.bootstrap

import ar.edu.unsam.grupo2.pois.CGP
import ar.edu.unsam.grupo2.pois.SucursalBanco
import ar.edu.unsam.grupo2.procesos.Home
import ar.edu.unsam.grupo2.repositorio.RepositorioDePOIs
import ar.edu.unsam.grupo2.usuarios.ServiceLocator
import ar.edu.unsam.grupo2.usuarios.UsuarioBuilder
import opiniones.Opinión

class POIsBootstrap {
	
	val ramona = new UsuarioBuilder("Ramo@mail.net").nickname("Ramona").contraseña("123").build //Usuario sin gps
	val laura = new UsuarioBuilder("lau@mail.org").nickname("Laura").contraseña("666").build
	val sil = new UsuarioBuilder("sil@mail").nickname("Silvina").contraseña("566").build
	val mariana = new UsuarioBuilder("mariana@mail").nickname("Mariana").contraseña("288").build
	val alberto = new UsuarioBuilder("alberto@mail").nickname("Alberto").contraseña("999").build
	
	new() {
		ServiceLocator.instance => [
			repositorio = new RepositorioDePOIs
			home = new Home() => [
				agregarUsuario(ramona)
				agregarUsuario(laura)
				agregarUsuario(sil)
				agregarUsuario(mariana)
				agregarUsuario(alberto)
			]
		]
		SucursalBanco.iconoBanco = "banco.png"
		CGP.iconoCGP = "CGP.png"
	}

	def run() {
		val locales = new JuegoDeDatosLocales().toList
		val imagine = locales.findFirst[ nombreComercial == "Imagine Yoga" ]
		val coto = locales.findFirst[ nombreComercial == "Coto" ]
		
		
		ServiceLocator.instance.repositorio => [
			createAll(new JuegoDeDatosColectivos().toList)
			createAll(new JuegoDeDatosBancos().toList)
			createAll(new JuegoDeDatosCGP().toList)
			createAll(locales)
		]
		imagine.opiniones => [
			add( new Opinión(5, "Excelente", laura))
			add(new Opinión(4, "Me encanta", ramona))
		]
		locales.forEach[ local | alberto.agregarAFavoritos(local) ] 
		locales.forEach[ local | ramona.agregarAFavoritos(local) ] 
	}
}
