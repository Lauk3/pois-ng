package opiniones

import ar.edu.unsam.grupo2.pois.LocalComercial
import ar.edu.unsam.grupo2.usuarios.UsuarioBuilder
import org.junit.Before
import org.uqbar.geodds.Point
import org.junit.Test
import static org.junit.Assert.*
import opiniones.Opinión

class TestOpiniones {

	val ramona = new UsuarioBuilder("Ramo@mail.net").nickname("Ramona").build
//	val laura = new UsuarioBuilder("lau@mail.org").nickname("Laura").build
//	val opinionLaura = new Opinion(5, "Excelente", laura)
	val opinionRamonaImagine = new Opinión(4, "Me encanta", ramona)
	val nuevaOpinionRamonaImagine = new Opinión(4, "Me encanta!", ramona)
	val opinionRamonaWalmart = new Opinión(3, "Bien", ramona)
	

	val imagine = new LocalComercial => [
		nombreComercial = "Imagine Yoga"
		ubicacion = new Point(-34.573674, -58.510167)
		direccion = "Condarco 666"
		opiniones.add(opinionRamonaImagine)
	]
	val walmart = new LocalComercial => [
		nombreComercial = "Walmart"
		ubicacion = new Point(-34.5720099, -58.5077891)
		direccion = "Av. Constituyentes 6020"	
	]

	val poiAppModelImagineRamona = new applicationModel.PoiAppModelEditarOpinion(imagine, ramona)
	val poiAppModelWalmartRamona = new applicationModel.PoiAppModelEditarOpinion(walmart, ramona)
	
	var Opinión opinionAModificar

	@Before
	def void init() {
		opinionAModificar = poiAppModelImagineRamona.getOpinión
	}

	@Test
	def void testCloneNota() {
		opinionAModificar.nota = 5
		assertNotEquals(imagine.getOpinión(ramona).nota, opinionAModificar.nota)
	}
	@Test
	def void testCloneComentario() {
		opinionAModificar.comentario = "Excelente"
		assertNotEquals(imagine.getOpinión(ramona).comentario, opinionAModificar.comentario)
	}
	@Test
	def void testGetOpinionNoExiste(){
		assertEquals(ramona, poiAppModelWalmartRamona.getOpinión.usuario)
	}
	@Test
	def void testUpdateYaExiste() {
		poiAppModelImagineRamona.setOpinión(nuevaOpinionRamonaImagine)
		poiAppModelImagineRamona.updateOpinion
		assertEquals(imagine.getOpinión(ramona).nota, nuevaOpinionRamonaImagine.nota)
	}
	@Test
	def void testUpdateNoExiste() {
		poiAppModelWalmartRamona.setOpinión(opinionRamonaWalmart)
		poiAppModelWalmartRamona.updateOpinion
		assertEquals(walmart.getOpinión(ramona).nota, opinionRamonaWalmart.nota)
	}

}
