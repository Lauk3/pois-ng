package ar.edu.unsam.grupo2.repositorio

import ar.edu.unsam.grupo2.pois.CGP
import ar.edu.unsam.grupo2.pois.Comuna
import ar.edu.unsam.grupo2.pois.HorarioSemanal
import ar.edu.unsam.grupo2.pois.Servicio
import java.time.DayOfWeek
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.geodds.Point
import org.uqbar.geodds.interfacesExternas.CGPService
import org.uqbar.geodds.interfacesExternas.CentroDTO
import org.uqbar.geodds.interfacesExternas.ServicioDTO

@Accessors
class CGPServiceAdapter implements ServicioDeBusqueda<CGP> {

	static CGPService servicioDeBusquedaExterna

	new(CGPService _servicioDeBusqueda) {
		servicioDeBusquedaExterna = _servicioDeBusqueda
	}

	override List<CGP> search(String valorDeBusqueda) {

		servicioDeBusquedaExterna.getCGPsByCalleOBarrio(valorDeBusqueda).conversionCentroDTOACGP
	}

	static def List<CGP> conversionCentroDTOACGP(List<CentroDTO> listaDeCentrosDTO) {
		listaDeCentrosDTO.map[ deCentroDTOaCGP ]
	}

	static def CGP deCentroDTOaCGP(CentroDTO dto) {
		new CGP => [
			comuna = new Comuna(dto.numeroComuna)
			servicios = dto.serviciosDTO.map[ coversionServicio ].toSet
			ubicacion = new Point(dto.coordenadaX, dto.coordenadaY)
			direccion = dto.domicilio
		]
	}
	static def Servicio coversionServicio(ServicioDTO servicioDTO) {
		new Servicio => [
			nombre = servicioDTO.nombreServicio
			servicioDTO.rangosServicioDTO.forEach [ rango |
				horarios.add(new HorarioSemanal(
					#[DayOfWeek.of(rango.numeroDia)],
					rango.horarioDesde,
					rango.minutosDesde,
					rango.horarioHasta,
					rango.minutosHasta))
		]]
	}

}
