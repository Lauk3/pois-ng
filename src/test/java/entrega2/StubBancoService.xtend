package entrega2

import org.uqbar.geodds.interfacesExternas.BancoService
import java.util.List
import com.eclipsesource.json.JsonObject
import com.eclipsesource.json.JsonArray
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.Map
import static extension entrega2.StubBancoDTO.toJson
import static extension ar.edu.unsam.grupo2.util.StringUtil.*

@Accessors
class StubBancoService implements BancoService {

	public static StubBancoDTO bancoFrances1 = new StubBancoDTO => [
		banco = "Frances"
		x = -35.9338322
		y = 72.348353
		sucursal = "Avellaneda"
		gerente = "Javier Loeschbor"
		servicios = #["cobro cheques", "depósitos", "extracciones", "transferencias", "créditos"]
		direccion = "Mitre 602"
	]
	public static StubBancoDTO bancoFrances2 = new StubBancoDTO => [
		banco = "Frances"
		x = -35.9345681
		y = 72.344546
		sucursal = "Caballito"
		gerente = "Fabián Fantaguzzi"
		servicios = #["depósitos", "extracciones", "transferencias", "seguros"]
		direccion = "Rivadavia 5300"
	]
	public static StubBancoDTO bancoPatagonia1 = new StubBancoDTO => [
		banco = "Banco Patagonia"
		x = -34.606539
		y = -58.366559
		sucursal = "Puerto Madero"
		gerente = "Marcelo Vecchi"
		servicios = #["cajeros automáticos", "extracciones", "pago de tarjetas", "pago electrónico de servicios", "depósitos"]
		direccion = "Alicia Moreau de Justo 750"

	]
	public static StubBancoDTO bancoPatagonia2 = new StubBancoDTO => [
		banco = "Banco Patagonia"
		x = -34.603858
		y = -58.410266
		sucursal = "Abasto"
		gerente = "Juan Tobar"
		servicios = #["cajeros automáticos", "terminal autoservicios", "pago de tarjetas", "depósitos"]
		direccion = "Corrientes 2171"
	]
	public static StubBancoDTO bancoPatagonia3 = new StubBancoDTO => [
		banco = "Banco Patagonia"
		x = -34.563444
		y = -58.455191
		sucursal = "Belgrano"
		gerente = "Daniel Galeano"
		servicios = #["cajeros automáticos", "prestamos", "seguro", "depósitos"]
		direccion = "Cabildo 1939"
	]
	public static StubBancoDTO bancoGalicia1 = new StubBancoDTO => [
		banco = "Banco Galicia"
		x = -34.576589
		y = -58.448957
		sucursal = "Colegiales"
		gerente = "Mariela Andrea Rinque"
		servicios = #["cajeros automáticos", "prestamos", "tarjetas", "seguro", "cajas de seguridad", "inversiones"]
		direccion = "Av. Federico Lacroze 3101"
	]
	public static StubBancoDTO bancoGalicia2 = new StubBancoDTO => [
		banco = "Banco Galicia"
		x = -34.616530
		y = -58.369590
		sucursal = "San Telmo"
		gerente = "Fabian Kon"
		servicios = #["cobro cheques", "cajeros automáticos", "prestamos", "seguro", "cajas de seguridad", "inversiones"]
		direccion = "Av. Paseo Colón 793"
	]

	static val Map<String, String> juegoDeDatos = newHashMap(
		"frances" -> #[bancoFrances1, bancoFrances2].toJson.toString,
		"banco patagonia" -> #[bancoPatagonia1, bancoPatagonia2, bancoPatagonia3].toJson.toString,
		"banco galicia" -> #[bancoGalicia1, bancoGalicia2].toJson.toString,
		"patagonia" -> #[bancoPatagonia1, bancoPatagonia2, bancoPatagonia3].toJson.toString,
		"galicia" -> #[bancoGalicia1, bancoGalicia2].toJson.toString
	)

	override getSucursalesBancosByNombreBanco(String nombreBanco) {
		juegoDeDatos.get(nombreBanco.toLowerySacarAcentos) ?: "[]"
	}

}

@Accessors
class StubBancoDTO {
	String banco
	double x
	double y
	String sucursal
	String gerente
	List<String> servicios
	String direccion

	def JsonObject toJson() {
		val JsonArray jsonArrayServicios = new JsonArray
		servicios.forEach[servicio|jsonArrayServicios.add(servicio)]
		new JsonObject().add("banco", banco).add("x", x).add("y", y).add("sucursal", sucursal)
			.add("direccion", direccion).add("gerente", gerente).add("servicios", jsonArrayServicios)
	}

	static def JsonArray toJson(List<StubBancoDTO> bancos) {
		val JsonArray jsonArrayBancos = new JsonArray
		bancos.forEach[banco|jsonArrayBancos.add(banco.toJson)]
		jsonArrayBancos
	}
}
