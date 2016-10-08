"use strict";
function Local(nombre) {
	this.initPoi();
    this.nombreComercial = nombre;
    this.horarios = new Horario;
    this.rubro = null;
};

Local.prototype = new POI();

Local.prototype.disponible = function(date){
	return this.horarios.disponible(date);
}

Local.prototype.getNombre = function() {
    return (this.nombreComercial);
};

Local.prototype.conHorario = function(inicio, fin){
	this.horarios.conHorario(inicio, fin);
	return this;
}

Local.prototype.radioDeCercania = function(){
	return this.rubro.radioDeCercania;
}
/******************* Rubro *******************/

function Rubro(nombre, radio) {
    this.radioDeCercania = radio;
    this.nombre = nombre;
};
