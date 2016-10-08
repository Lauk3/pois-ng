package ar.edu.unsam.grupo2.procesos

import ar.edu.unsam.grupo2.pois.LocalComercial
import java.util.List
import ar.edu.unsam.grupo2.pois.POI
import java.util.HashSet
import ar.edu.unsam.grupo2.usuarios.ServiceLocator
import ar.edu.unsam.grupo2.exception.ErrorDeValidacionException

class ActualizacionLocalComercial extends Proceso {
	static var ServiceLocator serviceLocator = ServiceLocator.instance
	String archivo
	
	new(String _archivo){
		archivo = _archivo
	}
	
	override doEjecutar() {
		val String tareas = serviceLocator.manejadorDeArchivos.leer(archivo)
		tareas.split("\n").forEach[ linea | 
			val nuevaInfo = linea.split(";")
			val List<POI> poisQueMatchean = serviceLocator.repositorio.search(nuevaInfo.get(0))
			val HashSet<String> nuevasPalabrasClave = newHashSet
			nuevaInfo.get(1).split(" ").forEach[ nuevasPalabrasClave.add(it)]
			poisQueMatchean.forEach[ poi | 
				 if ((poi as LocalComercial).nombreComercial !=  nuevaInfo.get(0) )
				 	throw new ErrorDeValidacionException("Formato de archivo incorrecto, la linea debe comenzar con el nombre de fantasia del local")
				(poi as LocalComercial).palabrasClaves = nuevasPalabrasClave
			]
		]
	}
}