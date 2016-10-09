poiApp.config(function ($stateProvider, $urlRouterProvider) {

    $urlRouterProvider.otherwise("/");

    $stateProvider
        .state('logIn', {
            url: "/",
            templateUrl: "partials/login.html",
            controller: "loginCtrl as login"
        })
        .state('busqueda', {
            url: "/busqueda",
            templateUrl: "partials/busqueda.html",
            controller: "busquedaCtrl as busqueda"
        })
        .state('detallesLocal', {
            url: "/local",
            templateUrl: "partials/detalles_local.html",
            contoller: "localCtrl as Local"
        })
        .state('detallesColectivo', {
            url: "/colectivo",
            templateUrl: "partials/detalles_colectivo.html",
            contoller: "colectivoCtrl as colectivo"
        })
        .state('detallesBanco', {
            url: "/banco",
            templateUrl: "partials/detalles_banco.html",
            contoller: "bancoCtrl as banco"
        })
        .state('detallesCGP', {
            url: "/cgp",
            templateUrl: "partials/detalles_cgp.html",
            contoller: "cgpCtrl as cgp"
        });
});