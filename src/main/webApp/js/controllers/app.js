'use strict';
var poiApp = angular.module('poiApp', ['ui.router']);

	var self = this;
poiApp.service('usuariosService', function ($http) {
  this.findAll = function (callback, errorHandler) {
    $http.get('/logInConsulta').then(callback, errorHandler);
  }
});



