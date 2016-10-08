package entrega2

import org.uqbar.geodds.interfacesExternas.CGPService
import org.uqbar.geodds.interfacesExternas.CentroDTO
import org.uqbar.geodds.interfacesExternas.ServicioDTO
import org.uqbar.geodds.interfacesExternas.RangoServicioDTO
import static extension ar.edu.unsam.grupo2.util.StringUtil.*
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class StubCGPService implements CGPService {
	public static val centroDTO7 = new CentroDTO => [
		numeroComuna = 7
		zonasIcluidas = "Flores, Parque Chacabuco"
		coordenadaX = -34.630224
		coordenadaY = -58.4690907
		nombreDirector = "Guillermo Martín Peña"
		domicilio = "Rivadavia 7202"
		telefono = "4637-2355/ 4145/ 6902 / 4613-1530"
		serviciosDTO = #[new ServicioDTO => [
			nombreServicio = "Tesoreria"
			rangosServicioDTO = #[
				new StubRangoServicioDTO(1, 8, 30, 19, 30),
				new StubRangoServicioDTO(2, 8, 30, 19, 30),
				new StubRangoServicioDTO(3, 8, 30, 19, 30),
				new StubRangoServicioDTO(4, 8, 30, 19, 30),
				new StubRangoServicioDTO(5, 8, 30, 19, 30)
			]
		], new ServicioDTO => [
			nombreServicio = "Atencion Ciudadana"
			rangosServicioDTO = #[
				new StubRangoServicioDTO(1, 8, 00, 19, 00),
				new StubRangoServicioDTO(2, 8, 00, 19, 00),
				new StubRangoServicioDTO(3, 8, 00, 19, 00),
				new StubRangoServicioDTO(4, 8, 00, 19, 00),
				new StubRangoServicioDTO(5, 8, 00, 19, 00)
			]
		]]
	]

	public static val centroDTO1 = new CentroDTO => [
		numeroComuna = 1
		zonasIcluidas = "Retiro, San Nicolás, Puerto Madero, San Telmo, Montserrat, Constitución"
		coordenadaX = -34.600133
		coordenadaY = -58.386658
		nombreDirector = "Roberto Oscar Salcedo"
		domicilio = "Uruguay 740"
		telefono = "4370-9700"
		serviciosDTO = #[new ServicioDTO => [
			nombreServicio = "Mediación Comunitaria"
			rangosServicioDTO = #[
				new StubRangoServicioDTO(1, 9, 00, 16, 00),
				new StubRangoServicioDTO(2, 9, 00, 16, 00),
				new StubRangoServicioDTO(3, 9, 00, 16, 00),
				new StubRangoServicioDTO(4, 9, 00, 16, 00),
				new StubRangoServicioDTO(5, 9, 00, 16, 00)
			]
		], new ServicioDTO => [
			nombreServicio = "Dirección General de la Mujer"
			rangosServicioDTO = #[
				new StubRangoServicioDTO(1, 9, 00, 16, 00),
				new StubRangoServicioDTO(2, 9, 00, 16, 00),
				new StubRangoServicioDTO(3, 9, 00, 16, 00),
				new StubRangoServicioDTO(4, 9, 00, 16, 00),
				new StubRangoServicioDTO(5, 9, 00, 16, 00)
			]
		]]
	]

	public static val centroDTO3 = new CentroDTO => [
		numeroComuna = 3
		zonasIcluidas = "Balvanera,San Cristóbal"
		coordenadaX = -34.602949
		coordenadaY = -58.396580
		nombreDirector = "Carlos Omar Breyaui"
		domicilio = "Junín 521"
		telefono = "4375-0644"
		serviciosDTO = #[new ServicioDTO => [
			nombreServicio = "Rentas"
			rangosServicioDTO = #[
				new StubRangoServicioDTO(1, 9, 30, 15, 30),
				new StubRangoServicioDTO(2, 9, 30, 15, 30),
				new StubRangoServicioDTO(3, 9, 30, 15, 30),
				new StubRangoServicioDTO(4, 9, 30, 15, 30),
				new StubRangoServicioDTO(5, 9, 30, 15, 30)
			]
		], new ServicioDTO => [
			nombreServicio = "Infracciones"
			rangosServicioDTO = #[
				new StubRangoServicioDTO(1, 9, 00, 14, 30),
				new StubRangoServicioDTO(2, 9, 00, 14, 30),
				new StubRangoServicioDTO(3, 9, 00, 14, 30),
				new StubRangoServicioDTO(4, 9, 00, 14, 30),
				new StubRangoServicioDTO(5, 9, 00, 14, 30)
			]
		]]
	]

	public static val centroDTO4 = new CentroDTO => [
		numeroComuna = 4
		zonasIcluidas = "La Boca, Barracas, Parque Patricios, Nueva Pompeya."
		coordenadaX = -34.650430
		coordenadaY = -58.424927
		nombreDirector = "Héctor Jorge Apreda"
		domicilio = "Av. del Barco Centenera 2906"
		telefono = "4918-1815"
		serviciosDTO = #[new ServicioDTO => [
			nombreServicio = "Servicio Social"
			rangosServicioDTO = #[
				new StubRangoServicioDTO(1, 9, 00, 16, 00),
				new StubRangoServicioDTO(2, 9, 00, 16, 00),
				new StubRangoServicioDTO(3, 9, 00, 16, 00),
				new StubRangoServicioDTO(4, 9, 00, 16, 00),
				new StubRangoServicioDTO(5, 9, 00, 16, 00)
			]
		], new ServicioDTO => [
			nombreServicio = "Gestión Urbanística"
			rangosServicioDTO = #[
				new StubRangoServicioDTO(1, 9, 00, 18, 00),
				new StubRangoServicioDTO(2, 9, 00, 18, 00),
				new StubRangoServicioDTO(3, 9, 00, 18, 00),
				new StubRangoServicioDTO(4, 9, 00, 18, 00),
				new StubRangoServicioDTO(5, 9, 00, 18, 00)
			]
		]]
	]

	public static val centroDTO6 = new CentroDTO => [
		numeroComuna = 6
		zonasIcluidas = "Caballito"
		coordenadaX = -34.6058128
		coordenadaY = -58.4348944
		nombreDirector = "Marcelo Alejandro Iambrich"
		domicilio = "Patricias Argentinas 277"
		telefono = "4958-6504 / 7660-7047"
		serviciosDTO = #[new ServicioDTO => [
			nombreServicio = "Atención Ciudadana"
			rangosServicioDTO = #[
				new StubRangoServicioDTO(1, 8, 00, 18, 00),
				new StubRangoServicioDTO(2, 8, 00, 18, 00),
				new StubRangoServicioDTO(3, 8, 00, 18, 00),
				new StubRangoServicioDTO(4, 8, 00, 18, 00),
				new StubRangoServicioDTO(5, 8, 00, 18, 00)
			]
		], new ServicioDTO => [
			nombreServicio = "Denuncias a Administradores"
			rangosServicioDTO = #[
				new StubRangoServicioDTO(1, 10, 00, 14, 00),
				new StubRangoServicioDTO(2, 10, 00, 14, 00),
				new StubRangoServicioDTO(3, 10, 00, 14, 00),
				new StubRangoServicioDTO(4, 10, 00, 14, 00),
				new StubRangoServicioDTO(5, 10, 00, 14, 00)
			]
		]]
	]

	public static val centroDTO14 = new CentroDTO => [
		numeroComuna = 14
		zonasIcluidas = "Palermo"
		coordenadaX = -34.587289
		coordenadaY = -58.409409
		nombreDirector = ""
		domicilio = "Beruti 3325"
		telefono = "4827-5957 / 4827-5954"
		serviciosDTO = #[new ServicioDTO => [
			nombreServicio = "Mediación Comunitaria"
			rangosServicioDTO = #[
				new StubRangoServicioDTO(1, 9, 00, 16, 00),
				new StubRangoServicioDTO(2, 9, 00, 16, 00),
				new StubRangoServicioDTO(3, 9, 00, 16, 00),
				new StubRangoServicioDTO(4, 9, 00, 16, 00),
				new StubRangoServicioDTO(5, 9, 00, 16, 00)
			]
		], new ServicioDTO => [
			nombreServicio = "Registro de Organizaciones de Acción Comunitaria (ROAC)"
			rangosServicioDTO = #[
				new StubRangoServicioDTO(1, 8, 00, 15, 00),
				new StubRangoServicioDTO(2, 8, 00, 15, 00),
				new StubRangoServicioDTO(3, 8, 00, 15, 00),
				new StubRangoServicioDTO(4, 8, 00, 15, 00),
				new StubRangoServicioDTO(5, 8, 00, 15, 00)
			]
		]]
	]

	static val listaCentrosDTO = #[centroDTO7, centroDTO1, centroDTO3, centroDTO4, centroDTO6, centroDTO14]

	static val juegoDeDatos = newHashMap(
		"rivadavia" -> #[centroDTO7],
		"uruguay" -> #[centroDTO1],
		"junin" -> #[centroDTO3],
		"av. del barco centenera" -> #[centroDTO4],
		"patricias argentinas" -> #[centroDTO6],
		"beruti" -> #[centroDTO14]
	)

	override getCGPsByCalleOBarrio(String calleOBarrio) {
		#[
			listaCentrosDTO.filter[centroDTO|centroDTO.zonasIcluidas.contiene(calleOBarrio)],
			juegoDeDatos.get(calleOBarrio.toLowerySacarAcentos) ?: #[]
		].flatten.toList

	}

}

class StubRangoServicioDTO extends RangoServicioDTO {
	new(int _numeroDia, int _horarioDesde, int _minutosDesde, int _horarioHasta, int _minutosHasta) {
		numeroDia = _numeroDia
		horarioDesde = _horarioDesde
		minutosDesde = _minutosDesde
		horarioHasta = _horarioHasta
		minutosHasta = _minutosHasta
	}
}
