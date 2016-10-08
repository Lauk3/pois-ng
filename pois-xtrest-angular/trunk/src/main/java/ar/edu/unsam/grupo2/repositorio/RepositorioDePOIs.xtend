package ar.edu.unsam.grupo2.repositorio


import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import ar.edu.unsam.grupo2.exception.ObjetoSinIdException
import ar.edu.unsam.grupo2.exception.IdInexistenteException
import net.sf.oval.ConstraintViolation
import net.sf.oval.Validator
import ar.edu.unsam.grupo2.exception.ErrorDeValidacionException
import ar.edu.unsam.grupo2.pois.POI
import java.util.SortedSet
import java.util.TreeSet

@Accessors
class RepositorioDePOIs {
	var List<ServicioDeBusqueda<? extends POI>> serviciosDeBusqueda = newArrayList()

	var int nextId = 1
	var SortedSet<POI> objects = new TreeSet<POI>

	def int getNextId() {
		nextId++
	}

	def List<POI> search(String valor) {
		#[
			serviciosDeBusqueda.map[search(valor)].flatten,
			objects.filter[match(valor)]
		].flatten.toList
	}

	def void create(POI poi) {
		validar(poi)
		poi.id = getNextId
		objects.add(poi)
	}
	def void createAll(List<? extends POI> pois) {
		pois.forEach[ poi | create(poi) ]
	}	
	

	def POI searchById(int id) {
		val resultado = objects.findFirst[ object | object.id == id ]
		if (resultado == null) throw new IdInexistenteException("No se encontro el id " + id)
		resultado	
	}

	def update(POI object) {
		validar(object)
		if(object.id == null)
			throw new ObjetoSinIdException("Update de un objeto que no tiene id")
		else {
			var oldObject = searchById(object.id)
			objects.remove(oldObject)
			objects.add(object)
		}
	}
	def delete(POI object) {
		var POI oldObject
		oldObject = searchById(object.id)
		objects.remove(oldObject)
	}
	
	def void validar(POI object) { // constraint = restriccion
		val List<ConstraintViolation> violations = (new Validator).validate(object)
		if (violations.size > 0) {
			val String mensajeDeError = violations.fold("")[ acum, violation  | acum.concat(violation.message + "\n") ]
			throw new ErrorDeValidacionException(mensajeDeError)
		}
	}
	def int size() {
		objects.size
	}
//	var static RepositorioDePOIs instance
//	private new() {
//		super()
//	}
//	static def getInstance() {
//		if(instance == null) {
//			instance = new RepositorioDePOIs
//		}
//		instance
//	}
//	static def reset() {
//		instance = null
//	}
}

