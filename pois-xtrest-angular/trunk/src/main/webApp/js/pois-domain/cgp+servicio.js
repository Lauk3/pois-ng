"use strict";

function CGP(comuna) {
	this.initPoi();
    this.comuna = comuna;
    this.servicios = [];
};

CGP.prototype = new POI();

CGP.prototype.disponible = function(date) {
    return this.servicios.some(function(servicio) {
        return servicio.disponible(date);
    });
};
CGP.prototype.servicio = function(nombreServicio) {
	var servicio = this.servicios.find(function(s) {
        return s.nombre == nombreServicio;
    });
	if (!servicio) throw new Error("El servicio no existe");
	return servicio;
};
	
CGP.prototype.getNombre = function() {
    return ( "CGP Nº" + this.comuna.nombre);
};
CGP.prototype.conServicio = function(servicio){
	this.servicios.push(servicio);
	return this;
};

CGP.prototype.superEstaCerca = CGP.prototype.estaCerca;
CGP.prototype.estaCerca = function(unPunto) {
	return (this.comuna.isInside(unPunto) || this.superEstaCerca(unPunto));
}

/********************** Servicio ***************************/

function Servicio(nombre) {
    this.nombre = nombre;
    this.rangos = [];
};

Servicio.prototype = new Horario();



/******************* Comuna ***********************/

function Comuna(nro) {
	this.nro = nro;
	this.zona = null; //Polygon de librería 
}

Comuna.prototype.isInside = function(unPunto) {
	return this.zona.isInside(unPunto);
}
