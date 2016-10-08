package ar.edu.unsam.grupo2.repositorio

import ar.edu.unsam.grupo2.pois.HorarioSemanal
import ar.edu.unsam.grupo2.pois.SucursalBanco
import com.eclipsesource.json.JsonArray
import com.eclipsesource.json.JsonObject
import java.time.DayOfWeek
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.geodds.Point
import org.uqbar.geodds.interfacesExternas.BancoService

@Accessors
class BancoServiceAdapter implements ServicioDeBusqueda<SucursalBanco> {

	static BancoService servicioDeBusquedaExterna

	static HorarioSemanal horarioBancario = new HorarioSemanal(
		#[DayOfWeek.MONDAY, DayOfWeek.TUESDAY, DayOfWeek.WEDNESDAY, // Lunes a Viernes de 10:00 a 15:00
		DayOfWeek.THURSDAY, DayOfWeek.FRIDAY], 10, 15)

	new(BancoService _servicioDeBusqueda) {
		servicioDeBusquedaExterna = _servicioDeBusqueda
	}

	override List<SucursalBanco> search(String valorDeBusqueda) {
		servicioDeBusquedaExterna.getSucursalesBancosByNombreBanco(valorDeBusqueda).aSucursalesBanco
	}

	static def List<SucursalBanco> aSucursalesBanco(String listaSucursalesJSON) {
		JsonArray.readFrom(listaSucursalesJSON).values.map [ sucursal |
			val JsonObject sucursalJO = sucursal.asObject
			new SucursalBanco => [
				banco = sucursalJO.get("banco").asString
				barrio = sucursalJO.get("sucursal").asString
				direccion = sucursalJO.get("direccion").asString
				ubicacion = new Point(sucursalJO.get("x").asDouble, sucursalJO.get("y").asDouble)
				horario = horarioBancario
				servicios = sucursalJO.get("servicios").asArray.values.map [ asString ]
		]]
	}
}
