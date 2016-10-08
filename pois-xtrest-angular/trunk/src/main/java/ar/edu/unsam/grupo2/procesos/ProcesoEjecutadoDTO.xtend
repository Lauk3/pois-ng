package ar.edu.unsam.grupo2.procesos

import java.time.LocalDateTime
import ar.edu.unsam.grupo2.usuarios.Usuario
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class ProcesoEjecutadoDTO {
	LocalDateTime inicioEjecucion
	LocalDateTime finEjecucion
	Proceso procesoEjecutado
	Usuario usuario
	boolean error
	String mensajeDeError
}