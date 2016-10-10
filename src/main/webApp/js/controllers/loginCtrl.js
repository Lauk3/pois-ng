poiApp.controller('loginCtrl', function(usuariosService, $state) {
	
	var self = this;
	/*
	this.error = ""
	this.usuario = new Usuario("", "");
	this.usuario.gps = new GPS(new Point(-34.573674, -58.510167), new Point(-35.573674, -59.510167));
	this.usuario.agregarAFavoritos(poiService.imagineYoga);
	this.login = function() {
		if (this.usuario.nick == "Ramona" && this.usuario.password=="123")
			$state.go("busqueda");			
		else
			this.error = "Información inválida";
//		var usuario = poiService.crearUsuario(this.usuario);
//		poiService.iniciarSesionmUIsuario(usuario);
//		this.usuario = '';
	}*/
	this.getUsuarios = function() {
		usuariosService.findAll(function(response) {
	    	self.usuarios = response.data;
	    });
	}
});
