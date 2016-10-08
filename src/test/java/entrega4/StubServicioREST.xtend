package entrega4

import org.uqbar.geodds.interfacesExternas.ServicioREST
import com.eclipsesource.json.JsonObject
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class StubServicioREST implements ServicioREST {
	var String valorDeBusqueda = "Imagine Yoga"
	
	override String invocar() {
		new JsonObject().add("valorBuscado", valorDeBusqueda).add("fecha", "10/5/2016").toString
	}
}
