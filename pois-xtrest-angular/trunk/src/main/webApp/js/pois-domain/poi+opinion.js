"use strict";
function POI() {
    this.icono = "";

    this.radioDeCercania = function(){return 0.5;};

    this.estaCerca = function(unPunto) {
        return (this.ubicacion.distance(unPunto) <= this.radioDeCercania());
    }
};

POI.prototype = {
    initPoi: function() {
        /* Hay que llamar a initPoi en los constructores que tengan a POI como prototipo,
         * sino las opiniones se agregan al prototipo en vez de al poi.*/
        this.ubicacion = null;
        this.barrio = "";
        this.direccion = "";
        this.opiniones = [];
    },
    disponibleAhora: function(){
    	return this.disponible(new Date);
    },
    set: function(atributos){
    	for (var nombreAtributo in atributos) {
    		this[nombreAtributo] = atributos[nombreAtributo];
    	};
    	return this;
    },
    /*****************			POI.opiniones			********************/
    getRating: function() {
        return sum( this.opiniones.map(  function(op){return op.nota } ) ) / this.opiniones.length;
    },

    getOpinion: function(usuario) {
        return this.opiniones.find(function(op) {
            return op.usuario == usuario;
        })
    },
    setOpinion: function(opinion) {
        remove(this.opiniones, this.getOpinion(opinion.usuario));
        this.opiniones.push(opinion);
        return this;
    },
    cantidadOpiniones: function(){
    	return this.opiniones.length;
    }
};

/***************************     Opinion     ***********************/


function Opinion(usuario) {
    this.nota = 1;
    this.comentario = "";
    this.usuario = usuario;
};

Opinion.prototype = {
    agregarNota: function(n) {
        this.nota = n;
        return this;
    },
    agregarComentario: function(c) {
        this.comentario = c;
        return this;
    },
};
