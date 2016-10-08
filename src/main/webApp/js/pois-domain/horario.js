"use strict";
function Horario(inicio, fin) {
	this.rangos = [];
	if (inicio) this.conHorario(inicio, fin);
};

Horario.prototype = {
	conHorario: function(inicio, fin) {
        this.rangos.push({
        	inicio:	inicio,
        	fin:	fin,
        });
        return this;
    },
    disponible: function(date) {
    	var hora = horaMilitar(date);
    	return this.rangos.some( function(rango) {
            return rango.inicio <= hora && hora <= rango.fin;
        });
    },
    copyFrom: function(otroHorario) {
    	this.rangos = otroHorario.rangos;
    	return this;
    },
};



