package ar.edu.unsam.grupo2.procesos

import java.time.LocalDateTime
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
abstract class Proceso {
	def ProcesoEjecutadoDTO ejecutar() {
		val resultado = new ProcesoEjecutadoDTO => [
			procesoEjecutado = this
			error = false
			inicioEjecucion = LocalDateTime.now
			try {
				doEjecutar
			} catch (RuntimeException e) {
				mensajeDeError = e.message
				error = true
			}
			finEjecucion = LocalDateTime.now
		]
		resultado
	}
	def void doEjecutar()

}
