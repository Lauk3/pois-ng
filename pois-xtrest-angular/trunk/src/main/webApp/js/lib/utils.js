"use strict";
function remove(array, elemento) {
	var index = array.indexOf(elemento);
	if (index > -1) {
		array.splice(index, 1);
	}
};

function contains(array, elemento) {
	return array.indexOf(elemento) != -1;
};

function fixHora(horaStr) {
	return (horaStr.charAt(1) == ':' ? '0' + horaStr : horaStr);
};

function sum(array) {
	return array.reduce(function(total, num) {
		return total + num;
	})
}
function horaMilitar(date){
	return date.getHours() * 100 + date.getMinutes(); 
};
function extendAll(jsonList, tipo){
	return _.map(jsonList, function(elem){
		return angular.extend(tipo, elem);
	});

}