package ar.edu.unsam.grupo2.pois

import java.time.DayOfWeek
import java.time.LocalDateTime
import java.util.List
import java.util.Map
import java.util.SortedSet
import java.util.TreeMap
import java.util.TreeSet
import net.sf.oval.constraint.MinSize
import net.sf.oval.constraint.NotNull

class HorarioSemanal {
	@NotNull
	@MinSize(1)
	Map<DayOfWeek, SortedSet<RangoDiario>> mapaHorarios = new TreeMap<DayOfWeek, SortedSet<RangoDiario>>
	static val nombresDias = #["Lunes", "Martes", "Miercoles", "Jueves", "Viernes"]

	def contiene(LocalDateTime momento) {
		val dia = momento.getDayOfWeek()
		mapaHorarios.containsKey(dia) && mapaHorarios.get(dia).exists[rango|rango.contiene(momento.toLocalTime())]
	}

	def void setHorarios(List<DayOfWeek> _dias, int horaInicio, int minutosInicio, int horaFin, int minutosFin) {
		val RangoDiario rango = new RangoDiario(horaInicio, minutosInicio, horaFin, minutosFin)
		_dias.forEach[dia|mapaHorarios.put(dia, new TreeSet(#[rango]))]
	}

	new(List<DayOfWeek> _dias, int horaInicio, int minutosInicio, int horaFin, int minutosFin) {
		setHorarios(_dias, horaInicio, minutosInicio, horaFin, minutosFin)
	}

	new(List<DayOfWeek> _dias, int horaInicio, int horaFin) {
		setHorarios(_dias, horaInicio, 0, horaFin, 0)
	}

	new() {
	}

	def void add(HorarioSemanal _horario) {
		_horario.mapaHorarios.forEach [ _dia, _rangos |
			this.mapaHorarios.compute(_dia, [dia, rangos|_rangos.unirCon(rangos)])
		]
	}

	def SortedSet<RangoDiario> unirCon(SortedSet<RangoDiario> unSetDeRangos, SortedSet<RangoDiario> otroSetDeRangos) {
		otroSetDeRangos?.forEach[rango|rango.agregarA(unSetDeRangos)]
		unSetDeRangos
	}
	def String aString(SortedSet<RangoDiario> rangos) {
		" de " + rangos.drop(1).fold(
			rangos.get(0).toString,
			[ acum, rango | acum + " y de " + rango.toString ]
		)
	}
	override toString() {
		mapaHorarios.keySet.map [ dia |
			nombresDias.get(dia.value - 1) + mapaHorarios.get(dia).aString + "\n"
		].join
	}

}
