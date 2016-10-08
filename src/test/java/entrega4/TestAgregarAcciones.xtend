package entrega4

import ar.edu.unsam.grupo2.procesos.AgregarAcciones
import ar.edu.unsam.grupo2.usuarios.ServiceLocator
import ar.edu.unsam.grupo2.usuarios.Usuario
import ar.edu.unsam.grupo2.usuarios.UsuarioBuilder
import java.util.Set
import org.eclipse.xtend.lib.annotations.Accessors
import org.junit.Assert
import org.junit.Before
import org.junit.Test
import java.util.HashSet
import ar.edu.unsam.grupo2.usuarios.searchObservers.BusquedasPorFechaObserver
import ar.edu.unsam.grupo2.usuarios.searchObservers.GenerarLogObserver

@Accessors
class TestAgregarAcciones {
	val Set<(Usuario)=>void> acciones = newHashSet
	val home = ServiceLocator.instance.home
	var AgregarAcciones procesoAgregar2Acciones
	val observersAgregados = #[new GenerarLogObserver, new BusquedasPorFechaObserver]
	val (Usuario)=>void accionDesactivacion = [registrarBusquedasPorFechaOFF]
	val observerDesactivado = new BusquedasPorFechaObserver
	val procesoAgregarAccionDesactivacion = new AgregarAcciones(new HashSet(#[accionDesactivacion]))

	@Before
	def void init() {
		home.agregarUsuario(new UsuarioBuilder("usuarioConLog@mail.com").activarLogger.build)
		home.agregarUsuario(new UsuarioBuilder("usuarioSinNada@mail.com").build)
		acciones.add([activarLogger])
		acciones.add([registrarBusquedasPorFecha])
		procesoAgregar2Acciones = new AgregarAcciones(acciones)
		procesoAgregar2Acciones.ejecutar
	}

	@Test
	def void TestSeAgreganLasAcciones() {
		Assert.assertTrue(home.usuarios.forall[usuario | usuario.searchObservers.size == 2] )
		Assert.assertTrue(home.usuarios.forall[usuario | usuario.searchObservers.containsAll(observersAgregados)] )
	}

	@Test
	def void testDeshacer() {
		procesoAgregar2Acciones.undo
		Assert.assertTrue(home.usuarios.exists[ usuario | usuario.searchObservers.size == 0] )	// un usuario no tenia nada
		Assert.assertTrue(home.usuarios.exists[ usuario | usuario.searchObservers.size == 1] )	// y el otro tenía el logger activado
	}
	@Test
	def void testLaAccionEsUnaDesactivacion() {
		procesoAgregarAccionDesactivacion.ejecutar
		Assert.assertTrue(home.usuarios.forall[ usuario | ! usuario.searchObservers.contains(observerDesactivado) ] )
	}
	@Test
	def void testDeshacerDesactivacion() {
		procesoAgregarAccionDesactivacion.ejecutar
		procesoAgregarAccionDesactivacion.undo
		Assert.assertTrue(home.usuarios.forall[ usuario | usuario.searchObservers.contains(observerDesactivado) ] )
	}	
}
