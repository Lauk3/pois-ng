package ar.edu.unsam.grupo2.usuarios

import ar.edu.unsam.grupo2.procesos.ProcesoEjecutadoDTO
import ar.edu.unsam.grupo2.procesos.Proceso

interface ErrorObserver {
	def void notificarError(Proceso proceso, Usuario usuario,ProcesoEjecutadoDTO resultado)
}