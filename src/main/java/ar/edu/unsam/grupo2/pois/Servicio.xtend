package ar.edu.unsam.grupo2.pois

import java.time.LocalDateTime
import net.sf.oval.constraint.AssertValid
import net.sf.oval.constraint.NotNull
import org.eclipse.xtend.lib.annotations.Accessors

import static extension ar.edu.unsam.grupo2.util.StringUtil.*

@Accessors
class Servicio {
	@NotNull
	@AssertValid
	HorarioSemanal horarios = new HorarioSemanal
	String nombre

	def boolean disponible(LocalDateTime momento) {
		horarios.contiene(momento)
	}

	def boolean disponible(LocalDateTime momento, String nombreServicio) {
		disponible(momento) && nombre.equalsIgnoreCaseYAcentos(nombreServicio)
	}
	def void conHorario(HorarioSemanal hs){
		horarios.add(hs)
	}
}
