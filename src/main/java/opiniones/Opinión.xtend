package opiniones

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import ar.edu.unsam.grupo2.usuarios.Usuario

@Accessors
@Observable
class Opinión {
	int nota
	String comentario
	Usuario usuario

	new(Usuario _usuario) {
		nota = 1
		comentario = ""
		usuario = _usuario
	}

	new(int n, String c, Usuario u) {
		nota = n
		comentario = c
		usuario = u
	}

	override Opinión clone() {
		new Opinión(nota, comentario, usuario)
	}

}
