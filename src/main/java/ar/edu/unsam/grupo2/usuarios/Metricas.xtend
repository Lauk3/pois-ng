package ar.edu.unsam.grupo2.usuarios


import java.util.Map
import org.joda.time.LocalDate
import java.util.List

class Metricas {
	Map<Usuario, List<Integer>> cantidadDeResultados = newHashMap
	Map<LocalDate, Integer> busquedasPorFecha = newHashMap

	def int consultasPorFecha(LocalDate date) {
		busquedasPorFecha.get(date)?:0
	}
	def List<Integer> cantResultadosPorUsuario(Usuario usuario) {
		cantidadDeResultados.get(usuario)?:newArrayList
	}
	def void setConsultasPorFecha(LocalDate date, int consultas) {
		busquedasPorFecha.put(date, consultas)
	}
	def  setCantResultadosPorUsuario(Usuario usuario, List<Integer> cantResultados) {
		cantidadDeResultados.put(usuario, cantResultados)
	}
}