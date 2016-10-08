poiApp.config(function($stateProvider, $urlRouterProvider) {

	$urlRouterProvider.otherwise("/");

	$stateProvider
		.state('logIn', {
			url : "/",
			templateUrl : "partials/login.html",
			controller : "loginCtrl as login"
		})
		.state('busqueda', {
			url : "/busqueda",
			templateUrl : "partials/busqueda.html",
			controller : "busquedaCtrl as busqueda"
		});
});