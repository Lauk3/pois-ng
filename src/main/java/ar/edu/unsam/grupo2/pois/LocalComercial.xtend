package ar.edu.unsam.grupo2.pois

import static extension ar.edu.unsam.grupo2.util.StringUtil.*
import java.util.HashSet
import java.util.Set
import org.eclipse.xtend.lib.annotations.Accessors
import java.time.LocalDateTime
import net.sf.oval.constraint.NotNull
import net.sf.oval.constraint.AssertValid
import org.uqbar.commons.utils.Observable
import com.fasterxml.jackson.annotation.JsonIgnore

@Accessors
@Observable
class LocalComercial extends POI {
	Rubro rubro
	@NotNull
	String nombreComercial
	Set<String> palabrasClaves = new HashSet
	@AssertValid
	@JsonIgnore HorarioSemanal horarios = new HorarioSemanal

	def agregarPalabraClave(String unaPalabra) {
		palabrasClaves.add(unaPalabra)
	}

	override match(String valorDeBusqueda) {
		( matchearPorNombreComercial(valorDeBusqueda) ||
			((matchearPorPalabraClave(valorDeBusqueda)) || (matchearPorRubro(valorDeBusqueda))) )
	}

	def boolean matchearPorPalabraClave(String valorDeBusqueda) {
		palabrasClaves.exists[palabra|palabra.equalsIgnoreCaseYAcentos(valorDeBusqueda)]
	}

	def boolean matchearPorRubro(String valorDeBusqueda) {
		valorDeBusqueda.equalsIgnoreCaseYAcentos(rubro.nombre)
	}

	def boolean matchearPorNombreComercial(String valorDeBusqueda) {
		nombreComercial.comienzaCon(valorDeBusqueda)
	}

	override double radioDeCercania() {
		rubro.radioDeCercania
	}

	override boolean disponible(LocalDateTime momento) {
		horarios.contiene(momento)
	}
	override String getNombre(){
		return nombreComercial
	}
}
