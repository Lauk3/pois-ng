package ar.edu.unsam.grupo2.server.repositorios

import ar.edu.unsam.grupo2.server.StubGPS
import ar.edu.unsam.grupo2.server.UsuarioAdapter
import ar.edu.unsam.grupo2.usuarios.UsuarioBuilder
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.CollectionBasedRepo

@Accessors
class RepoUsuarios extends CollectionBasedRepo<UsuarioAdapter>  {

	/* Singleton */
	static RepoUsuarios repoUsuarios
	
	def static RepoUsuarios getInstance() {
		if (repoUsuarios == null) {
			repoUsuarios = new RepoUsuarios
		}
		repoUsuarios
	}
	

	new() {
		val ramona = new UsuarioAdapter(new UsuarioBuilder("Ramo@mail.net").nickname("Ramona").contraseña("123").build) //Usuario sin gps
		val laura = new UsuarioAdapter(new UsuarioBuilder("lau@mail.org").nickname("Laura").contraseña("666").gps(new StubGPS).build)
		val sil = new UsuarioAdapter(new UsuarioBuilder("sil@mail").nickname("Silvina").contraseña("566").gps(new StubGPS).build)
		val mariana = new UsuarioAdapter(new UsuarioBuilder("mariana@mail").nickname("Mariana").contraseña("288").gps(new StubGPS).build)
		val alberto = new UsuarioAdapter(new UsuarioBuilder("alberto@mail").nickname("Alberto").contraseña("999").gps(new StubGPS).build)
		
		this.create(ramona)
		this.create(laura)
		this.create(sil)
		this.create(mariana)
		this.create(alberto)
	}
	
	override protected getCriterio(UsuarioAdapter arg0) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override createExample() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override getEntityType() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}

	
	

	
}