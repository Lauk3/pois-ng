package ar.edu.unsam.grupo2.pois

import java.time.LocalTime
import ar.edu.unsam.grupo2.exception.HorarioInconsistenteException
import java.util.Set

class RangoDiario implements Comparable<RangoDiario> {
	LocalTime inicio
	LocalTime fin

	new(int horaInicio, int minutosInicio, int horaFin, int minutosFin) {
		this(LocalTime.of(horaInicio, minutosInicio), LocalTime.of(horaFin, minutosFin))
	}

	new(LocalTime _inicio, LocalTime _fin) {
		if (_inicio.isAfter(_fin) && !_fin.equals(LocalTime.MIDNIGHT))
			throw new HorarioInconsistenteException("La hora final debe ser posterior a la inicial")
		inicio = _inicio
		if (_fin.equals(LocalTime.MIDNIGHT)) 
			fin = LocalTime.MAX
		else
			fin = _fin
	}

	def contiene(LocalTime hora) {
		!hora.isBefore(inicio) && !hora.isAfter(fin)
	}

	def contiene(RangoDiario unRango) {
		contiene(unRango.inicio) && contiene(unRango.fin)
	}

	def agregarA(Set<RangoDiario> rangos) {
		inicio = rangos.findFirst[rango|rango.contiene(inicio)]?.inicio ?: inicio
		fin = rangos.findLast[rango|rango.contiene(fin)]?.fin ?: fin
		rangos.removeIf[rango|this.contiene(rango)]
		rangos.add(this)
	}

	override compareTo(RangoDiario otroRango) {
		if(inicio == otroRango.inicio)
			fin.compareTo(otroRango.fin)
		else inicio.compareTo(otroRango.inicio)
	}
	
	override toString() {
		inicio.toString + " a " + fin.toString
	}
	
}
