package ar.edu.unsam.grupo2.pois

import java.time.LocalDateTime
import java.util.ArrayList
import java.util.List
import net.sf.oval.constraint.MinSize
import net.sf.oval.constraint.NotNull
import org.uqbar.geodds.Point

import static extension ar.edu.unsam.grupo2.util.StringUtil.*
import org.uqbar.commons.utils.Observable


@Observable
class LineaDeColectivos extends POI {
	@NotNull
	String nroLinea
	@NotNull
	@MinSize(1)
	List<ParadaDeColectivos> paradas = new ArrayList<ParadaDeColectivos>

	new(int _nroLinea) {
		nroLinea = _nroLinea.toString
	}
	def getNroLinea() {
		nroLinea
	}
	override Point getUbicacion() {
		try {
			paradas?.get(0).ubicacion
		} catch (IndexOutOfBoundsException e) {
			null
		}
	}
	def void setParadas(List<ParadaDeColectivos> _paradas){
		paradas = _paradas
		paradas.forEach[ parada | parada.linea = this ]
	}
	def void addParada(ParadaDeColectivos parada) {
		parada.linea = this
		paradas.add(parada)
	}
	def void setNroLinea(String numeroDeLinea) {
		nroLinea = numeroDeLinea
	}

	override boolean estaCerca(Point unPunto) {
		paradas.exists[parada|parada.estaCerca(unPunto)]
	}

	override boolean disponible(LocalDateTime momento) {
		true
	}

	override boolean match(String valorDeBusqueda) {
		nroLinea.equalsIgnoreCaseYAcentos(valorDeBusqueda) || valorDeBusqueda.isEmpty()
	}

	override String getNombre() {
		return "Colectivo Nº " + nroLinea
	}

	def int getCantidadDeParadas() {
		paradas.size
	}
}
