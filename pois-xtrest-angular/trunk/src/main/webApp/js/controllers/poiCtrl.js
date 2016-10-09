poiApp.controller('localCtrl', function (poiService, $state) {

    this.detallesLocal = function () {
        $state.go('detallesLocal');
    };
});

poiApp.controller('bancoCtrl', function (poiService, $state) {
    this.detallesBanco = function () {
        $state.go('detallesBanco');
    };
});

poiApp.controller('colectivoCtrl', function (poiService, $state) {
    this.detallesColectivo = function () {
        $state.go('detallesColectivo');
    };
});

poiApp.controller('cgpCtrl', function (poiService, $state) {
    this.detallesCGP = function () {
        $state.go('detallesCGP');
    };
});