'use strict';
poiApp.controller("busquedaCtrl", function(poiService) {
	var self = this;

	this.usuario = new Usuario("Ramona", "123");
	this.usuario.gps = new GPS(new Point(-34.573674, -58.510167), new Point(
			-35.573674, -59.510167));
	this.usuario.agregarAFavoritos(poiService.imagineYoga);
	this.criterio = "";
//
//	this.buscar = function() {
//		poiService.findAll(function(response) {
//			self.resultado = _.map(response.data, POI.asPOI);
//		});
//
//	}

	this.buscarPorCriterio = function() {console.log("el criterio es: " + self.criterio);
		poiService.findByCriterio(self.criterio, function(response) {
			self.resultado = _.map(response.data, POI.asPOI);
		});
	};

});
