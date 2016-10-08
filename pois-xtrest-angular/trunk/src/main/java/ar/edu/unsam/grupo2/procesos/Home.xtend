package ar.edu.unsam.grupo2.procesos

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import ar.edu.unsam.grupo2.usuarios.Usuario
import java.util.Set
import static extension ar.edu.unsam.grupo2.util.StringUtil.*

@Accessors
class Home {
	List<ProcesoEjecutadoDTO> resultados = newArrayList
	Set<Usuario> usuarios = newHashSet
	
	def registrarEjecucion(ProcesoEjecutadoDTO procesoEjecutado) {
		resultados.add(procesoEjecutado)
	}
	def aplicarATodosLosUsuarios( (Usuario)=>void accion ) {
		usuarios.forEach[ usuario | accion.apply(usuario) ]
	}
	def void setUsuarios(Set<Usuario> _usuarios) {
		usuarios = _usuarios
	}
	def void agregarUsuario(Usuario usuario) {
		usuarios.add(usuario)
	}
	def int cantProcesosEjecutados() {
		resultados.size
	}
	def Usuario getByNick(String nick){
		usuarios.findFirst[ usuario | usuario.nickname.equalsIgnoreCaseYAcentos(nick) ]
	}
}