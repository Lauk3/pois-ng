package entrega3

import org.slf4j.Logger
import org.slf4j.Marker
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class LoggerConContadorDecorator implements Logger {
	Logger logger
	int contadorDeLlamadasAInfo = 0
	
	new(Logger _logger) {
		logger = _logger
	}
	
	override info(String msg) {
		logger.info(msg)
		contadorDeLlamadasAInfo++
	}
	override info(String format, Object... arguments) {
		logger.info(format, arguments)
		contadorDeLlamadasAInfo++		
	}
	override debug(String msg) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override debug(String format, Object arg) {

	}
	
	override debug(String format, Object... arguments) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override debug(String msg, Throwable t) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override debug(Marker marker, String msg) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override debug(String format, Object arg1, Object arg2) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override debug(Marker marker, String format, Object arg) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override debug(Marker marker, String format, Object... arguments) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override debug(Marker marker, String msg, Throwable t) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override debug(Marker marker, String format, Object arg1, Object arg2) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override error(String msg) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override error(String format, Object arg) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override error(String format, Object... arguments) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override error(String msg, Throwable t) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override error(Marker marker, String msg) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override error(String format, Object arg1, Object arg2) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override error(Marker marker, String format, Object arg) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override error(Marker marker, String format, Object... arguments) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override error(Marker marker, String msg, Throwable t) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override error(Marker marker, String format, Object arg1, Object arg2) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override getName() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}

	
	override info(String format, Object arg) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	
	override info(String msg, Throwable t) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override info(Marker marker, String msg) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override info(String format, Object arg1, Object arg2) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override info(Marker marker, String format, Object arg) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override info(Marker marker, String format, Object... arguments) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override info(Marker marker, String msg, Throwable t) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override info(Marker marker, String format, Object arg1, Object arg2) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override isDebugEnabled() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override isDebugEnabled(Marker marker) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override isErrorEnabled() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override isErrorEnabled(Marker marker) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override isInfoEnabled() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override isInfoEnabled(Marker marker) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override isTraceEnabled() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override isTraceEnabled(Marker marker) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override isWarnEnabled() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override isWarnEnabled(Marker marker) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override trace(String msg) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override trace(String format, Object arg) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override trace(String format, Object... arguments) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override trace(String msg, Throwable t) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override trace(Marker marker, String msg) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override trace(String format, Object arg1, Object arg2) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override trace(Marker marker, String format, Object arg) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override trace(Marker marker, String format, Object... argArray) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override trace(Marker marker, String msg, Throwable t) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override trace(Marker marker, String format, Object arg1, Object arg2) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override warn(String msg) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override warn(String format, Object arg) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override warn(String format, Object... arguments) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override warn(String msg, Throwable t) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override warn(Marker marker, String msg) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override warn(String format, Object arg1, Object arg2) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override warn(Marker marker, String format, Object arg) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override warn(Marker marker, String format, Object... arguments) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override warn(Marker marker, String msg, Throwable t) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override warn(Marker marker, String format, Object arg1, Object arg2) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	
}