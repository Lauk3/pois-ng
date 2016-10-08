package entrega3

import org.uqbar.geodds.interfacesExternas.MailSender
import org.uqbar.geodds.interfacesExternas.Mail
import java.util.List

class StubMailSender implements MailSender {
	List<Mail> mailsEnviados = newArrayList
	
	def List<Mail> mailsDe(String _from) {
		mailsEnviados.filter[ from == _from ].toList
	}
	
	override send(Mail mail) {
		mailsEnviados.add(mail)
	}
	def int getCantMailsEnviados() {
		mailsEnviados.size
	}
	
}