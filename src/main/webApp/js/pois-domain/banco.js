"use strict";

function Banco(nombre) {
	this.initPoi();
    this.banco = nombre;
    this.servicios = [];
};

Banco.prototype = new POI();

Banco.prototype.getNombre = function() {
	return ("Banco " + this.banco + " " + this.barrio);
};

Banco.prototype.horarios = new Horario(1000, 1500);

Banco.prototype.conServicio = function(nombreServicio){
	this.servicios.push(nombreServicio);
	return this;
},
Banco.prototype.disponible = function(date) {
	return this.horarios.disponible(date);
};
Banco.prototype.servicio = function(nombreServicio) {
	if (!contains(this.servicios, nombreServicio)) throw new Error("El servicio no existe");
	return new Servicio(nombreServicio).copyFrom(this.horarios);
};