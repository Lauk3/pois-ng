package ar.edu.unsam.grupo2.pois

import java.time.LocalDateTime
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import static extension ar.edu.unsam.grupo2.util.StringUtil.*
import java.util.Set
import java.util.HashSet
import net.sf.oval.constraint.NotNull
import net.sf.oval.constraint.Assert
import net.sf.oval.constraint.AssertValid
import net.sf.oval.constraint.MinSize
import org.uqbar.commons.utils.Observable
import com.fasterxml.jackson.annotation.JsonIgnore

@Accessors
@Observable
@Assert(expr="_this.barrio != null", lang="js")
class SucursalBanco extends POI {
	@NotNull
	String banco
	@NotNull
	@AssertValid
	@JsonIgnore HorarioSemanal horario
	@NotNull
	@MinSize(1)
	Set<String> nombresServicios
	var static String ICONO_BANCO
	String icono = ICONO_BANCO

	static def setIconoBanco(String ico) {
		ICONO_BANCO = ico
	}
	override boolean match(String valorDeBusqueda) {
		matchearPorNombreDeBanco(valorDeBusqueda) || matchearPorNombreDeBancoMasBarrioExacto(valorDeBusqueda)
	}

	def boolean matchearPorNombreDeBanco(String valorDeBusqueda) {
		banco.comienzaCon(valorDeBusqueda)
	}

	def boolean matchearPorNombreDeBancoMasBarrioExacto(String valorDeBusqueda) {
		valorDeBusqueda.equalsIgnoreCaseYAcentos(banco + " " + barrio) ||
			valorDeBusqueda.equalsIgnoreCaseYAcentos(barrio + " " + banco)
	}

	override boolean disponible(LocalDateTime momento) {
		horario.contiene(momento)
	}

	def boolean disponible(LocalDateTime momento, String _nombreServicio) {
		disponible(momento) && nombresServicios.exists[servicio|servicio.equalsIgnoreCaseYAcentos(_nombreServicio)]
	}
	def void setServicios(List<String> listaServicios){
		nombresServicios = new HashSet<String>(listaServicios)
	}
	override String getNombre(){
		return "Banco "+ banco + " " + barrio
	}
	def setBanco(String nombre_banco){
		if ( nombre_banco.comienzaCon("Banco ") )
			banco = nombre_banco.substring(6)
		else
			banco = nombre_banco
	}
}
