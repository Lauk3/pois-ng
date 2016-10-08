package ar.edu.unsam.grupo2.repositorio

import java.util.List

interface ServicioDeBusqueda<T> {
	def List<? extends T> search(String valor)

}
