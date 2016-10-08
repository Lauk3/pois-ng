package ar.edu.unsam.grupo2.usuarios

import ar.edu.unsam.grupo2.exception.OperacionInvalidaException
import org.uqbar.geodds.interfacesExternas.GPS

class UsuarioBuilder {
	Usuario usuario

	new(String mail) {
		usuario = new Usuario(mail)
	}

	def UsuarioBuilder nickname(String nick) {
		usuario.nickname = nick
		this
	}

	def UsuarioBuilder contraseña(String _contraseña) {
		usuario.contraseña = _contraseña
		this
	}

	def UsuarioBuilder activarLogger() {
		usuario.activarLogger
		this
	}

	def UsuarioBuilder notificarDemora(long milisegundos) {
		usuario.notificarDemora(milisegundos)
		this
	}

	def UsuarioBuilder registrarBusquedasPorFecha() {
		usuario.registrarBusquedasPorFecha
		this
	}

	def UsuarioBuilder registrarCantResultados() {
		usuario.registrarCantResultados
		this
	}

	def UsuarioBuilder hacerAdmin() {
		usuario.setAdmin
		this
	}

	def UsuarioBuilder reintentosAdmin(int reintentos) {
		if(!usuario.admin) throw new OperacionInvalidaException(
			"El usuario debe ser administrador para realizar esta acción")
		usuario.setAdmin(reintentos)
		this
	}

	def UsuarioBuilder notificarErrorAdmin() {
		if(!usuario.admin) throw new OperacionInvalidaException(
			"El usuario debe ser administrador para realizar esta acción")
		(usuario.tipo as Admin).setNotificarFallo
		this
	}

	def Usuario build() {
		usuario
	}
	
	def UsuarioBuilder gps(GPS _gps) {
		usuario.gps = _gps
		this
	}
	
}
