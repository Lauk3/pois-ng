"use strict";
function GPS(puntoOrigen, puntoDestino) {
    this.origen = puntoOrigen;
    this.destino = puntoDestino;
    this.ubicacion = puntoOrigen;
    this.hora = new Date();
};

GPS.prototype = {
	cambiarUbicacion: function() {
		this.ubicacion = (this.ubicacion == this.origen ? this.destino : this.origen);
	},
	posicion: function() {
		//Si la hora no fué seteada...
		if ( !this.hora ) this.hora = new Date(); //Se crea la hora actual
		var horaActual = new Date(); //Se obtiene la hora actual de la consulta
		var diffInMillis = horaActual.getTime() - this.hora.getTime(); //Obtengo la diferencia en milisegundos
		
		if (diffInMillis > 3000) //Si se pasó mas de 3seg, vuelvo a calcular los randoms
			this.cambiarUbicacion();
		//actualiza la hora actual
		this.hora = new Date(); //Se crea la hora actual
		//Devuelve el punto ficticio del usuario
		return this.ubicacion;
	},
}