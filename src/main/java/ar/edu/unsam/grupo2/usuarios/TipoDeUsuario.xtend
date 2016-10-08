package ar.edu.unsam.grupo2.usuarios

import ar.edu.unsam.grupo2.procesos.Proceso

abstract class TipoDeUsuario implements Cloneable{
	def boolean admin()
	def void run(Proceso proceso, Usuario usuario)
	
	override clone() {
		super.clone
	}
}