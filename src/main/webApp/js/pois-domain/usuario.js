"use strict";
function Usuario(nick, password) {
    this.nick = nick;
    this.password = password;
    this.favoritos = [];
}

Usuario.prototype = {
    agregarAFavoritos: function(unPoi) {
        if (!this.estaEnFavoritos(unPoi)) this.favoritos.push(unPoi);
    },

    quitarDeFavoritos: function(unPoi) {
        remove(this.favoritos, unPoi);
    },

    estaEnFavoritos: function(unPoi) {
        return contains(this.favoritos, unPoi);

    },
    /****************************  (   GPS    )  ****************************/
    getPosicion: function() {
//    	return new Point(-34.573674, -58.510167);	// TODO: esto
    	if (this.gps == null) {
            throw new UsuarioSinGPSException("El usuario actual no tiene un sistema de GPS.");
        }
        return this.gps.posicion();
    }
}
