package ar.edu.unsam.grupo2.usuarios

import ar.edu.unsam.grupo2.procesos.Proceso

class Basico extends TipoDeUsuario{
	
	override admin() {
		false
	}
	
	override run(Proceso proceso, Usuario usuario) {
		throw new UnsupportedOperationException("El usuario no tiene privilegios para ejecutar la accion solicitada")
	}
	
}