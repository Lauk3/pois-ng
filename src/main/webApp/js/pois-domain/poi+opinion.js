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

POI.asPOI = function(jsonPOI){
	var poi;
		/***		BANCOS		*****/
	
	if (jsonPOI.banco)
		poi = angular.extend(new Banco(), jsonPOI);
		
		/***		COLECTIVOS		*****/
		
	else if (jsonPOI.paradas) {
		poi = angular.extend(new Colectivo(), jsonPOI);
		poi.paradas = _.map(poi.paradas, function(parada){
			parada = angular.extend(new ParadaDeColectivo(), parada);
			parada.ubicacion = angular.extend(new Point, parada.ubicacion)
			return parada;
		});

	}
		/***		CGPS		*****/
	
	else if (jsonPOI.comuna) {
		poi = angular.extend(new CGP(), jsonPOI);
		poi.servicios = extendAll(poi.servicios, new Servicio());
		poi.comuna = angular.extend(new Comuna(), poi.comuna);
		poi.comuna.zona = angular.extend(new Polygon(), poi.comuna.zona);
		poi.comuna.zona.surface =_.map(poi.comuna.zona.surface, function(elem){
			return angular.extend(new Point(), elem);
		});
	}		
		
		/***		LOCALES		*****/
		
	else {
		poi = angular.extend(new Local(), jsonPOI);
		poi.horarios = angular.extend(new Horario(), poi.horarios);
	}
	poi.opiniones = _.map(poi.opiniones, function(elem){
		return angular.extend(new Opinion(), elem);
	});
	poi.ubicacion = angular.extend(new Point, poi.ubicacion);
	return poi;
};
