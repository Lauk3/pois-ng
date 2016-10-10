package ar.edu.unsam.grupo2.server

import com.fasterxml.jackson.annotation.JsonIgnoreProperties
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.Entity
import ar.edu.unsam.grupo2.usuarios.Usuario

@JsonIgnoreProperties(ignoreUnknown = true)
@Accessors
class UsuarioAdapter extends Entity {
	
	String nickname
	String password

	new() {
		
	}	
	
	new(Usuario usuario) {
		this.nickname = usuario.nickname
		this.password = usuario.contraseña
	}
	
}