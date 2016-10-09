package ar.edu.unsam.grupo2.util

class StringUtil {

	new() {
	}

	static def boolean comienzaCon(String nombre, String valorDeBusqueda) {
		nombre.toLowerySacarAcentos.startsWith(valorDeBusqueda.toLowerySacarAcentos)
	}

	static def boolean equalsIgnoreCaseYAcentos(String nombre, String valorDeBusqueda) {
		toLowerySacarAcentos(nombre).equals(toLowerySacarAcentos(valorDeBusqueda))
	}

	static def String toLowerySacarAcentos(String conAcentosStr) {
		conAcentosStr.toLowerCase.replace('á', 'a').replace('é', 'e').replace('í', 'i').replace('ó', 'o').replace('ú',
			'u')
	}
	static def boolean contiene(String nombre, String valorDeBusqueda) {
		toLowerySacarAcentos(nombre).contains(toLowerySacarAcentos(valorDeBusqueda))
	}

}
