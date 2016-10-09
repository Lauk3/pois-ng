"use strict";
function Colectivo(nro) {
    this.initPoi();
    this.nroLinea = nro;
    this.paradas = [];
};

Colectivo.prototype = new POI();

(function () {
    this.disponible = function () {
        return true;
    };

    this.getNombre = function () {
        return "Colectivo Nº " + this.nroLinea;
    };

    this.estaCerca = function (unPunto) {
        return this.paradas.some(function (parada) {
            return parada.estaCerca(unPunto);
        });

    };

    this.setParadas = function (_paradas) {
        this.paradas = _paradas
    };

    this.addParada = function (parada) {
        this.paradas.linea = this;
        this.paradas.push(parada);
    };

    this.getCantidadDeParadas = function () {
        paradas.size();
    }

}).apply(Colectivo.prototype);


/* ******************* PARADAS DE COLECTIVO ******************** */
function ParadaDeColectivo(point) {
    this.ubicacion = point;
    //TODO: radioDeCercania, Redefinirlo en las subCLASES
};

ParadaDeColectivo.prototype = new POI();
ParadaDeColectivo.prototype.radioDeCercania = function () {
    return 0.1;
};