package ar.edu.unsam.grupo2.procesos

import ar.edu.unsam.grupo2.usuarios.ServiceLocator

import java.util.Set
import org.eclipse.xtend.lib.annotations.Accessors
import ar.edu.unsam.grupo2.usuarios.Usuario

@Accessors
class AgregarAcciones extends Proceso {
	static val ServiceLocator serviceLocator = ServiceLocator.instance
	Set<(Usuario)=>void> acciones = newHashSet
	Set<Usuario> backup
	
	new(Set<(Usuario)=>void> _acciones) {
		acciones = _acciones
	}
	override doEjecutar() {
		backup = newHashSet
		serviceLocator.home.usuarios.forEach[ usuario | backup.add(usuario.clone) ]
		acciones.forEach[ accion | serviceLocator.home.aplicarATodosLosUsuarios(accion) ]
	}
	def void undo() {
		serviceLocator.home.setUsuarios(backup)
	}
}
