package ar.edu.unsam.grupo2.pois

import org.uqbar.geodds.Polygon
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.geodds.Point
import net.sf.oval.constraint.NotNull

@Accessors
class Comuna {
	@NotNull
	String nombre
	Polygon zona
	
	new(int numeroDeComuna) {
		setNumeroDeComuna(numeroDeComuna)
	}
	
	new() {}
	
	def void setNumeroDeComuna(int numeroDeComuna) {
		nombre = numeroDeComuna.toString
	}
	
	def boolean isInside(Point unPunto) {
		zona.isInside(unPunto)
	}

}
