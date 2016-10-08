poiApp.service('poiService', function($http) {
	
	this.findAll =function(callback){
		$http.get('/pois').then(callback);
			
	}
	
	this.imagineYoga = new Local("ImagineYoga").conHorario(1800, 2045).set({
		ubicacion: new Point(-34.573674, -58.510167),
		rubro: new Rubro("Yoga", 0.2),
		direccion: "Condarco 666",
		barrio: "Villa Pueyrredon",
	});
	this.buscar = function(str){

        var coto = new Local("Coto").conHorario(1500, 1700).set({
        	direccion: "Siempre Viva 123",
        	barrio: "Sprinfield",
        	ubicacion: new Point(-35.573674, -59.510167),
        	rubro: new Rubro("Supermercado", 0.8),
        });
        
        var banco = new Banco("Ciudad").conServicio("Prestamos").conServicio("Hipotecas").set({
        	barrio: "Villa Urquiza",
        	ubicacion: new Point(-34.573674, -58.510167),
        	direccion: "Av. Triunvirato 4444",
    	});
		if (str=="yoga") return [ this.imagineYoga ];
		if (str=="coto") return [ coto ];
		if (str=="banco") return [ banco ];
		if (str=="") return [ this.imagineYoga, coto, banco ];
		return [];
	};
	
	
});
