poiApp.service('usuariosService', function($http) {
	this.usuarios = null;

	this.findAll = function(callback){
		$http.get('/logInConsulta').then(callback);
	}
	this.inciarSesion = function(str){
		return true;
	};
});
