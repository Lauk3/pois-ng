package entrega4

import ar.edu.unsam.grupo2.procesos.Proceso

class StubProcesoDaError2Veces extends Proceso {
	var int contador = 0
	
	override doEjecutar() {
		if ( contador++ < 2 )
			throw new UnsupportedOperationException("error ad hoc")
	}
	
}