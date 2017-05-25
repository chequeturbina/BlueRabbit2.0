/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.PasswordAuthentication;
/**
 *
 * @author Abraham
 */
public class Mensajero {
 
        public void enviaCorreo(String correo, String contrasenia) {
        
        final String username = "mezamartinezzz@gmail.com";
	final String password = "Huevos12";

        Properties props = new Properties();
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "587");
                props.put("mail.smtp.ssl.trust", "smtp.gmail.com");

		Session session = Session.getInstance(props,
		  new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		  });

		try {

			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress("mezamartinezzz@gmail.com"));
			message.setRecipients(Message.RecipientType.TO,
				InternetAddress.parse(correo));
                        message.setSubject("Alta en sistema Blue Rabbit");
                        String mensaje = "Estimado comensal:\n\nHa sido registrado en la plataforma de gestion de comida Blue Rabbit" +
                                        "\n\nPara acceder utilice los siguientes datos:\n" +
                                        "\nUsuario: %s"+
                                        "\nContraseña: %s"+
                                        "\n\nSaludos,"+
                                        "\n\nHuman Quality Research.";
                        String mensaje_correo = String.format(mensaje, correo, contrasenia);
                        message.setText(mensaje_correo);
                        Transport.send(message);
			System.out.println("Correo Enviado");

		} catch (MessagingException e) {
			throw new RuntimeException(e);
		}
	}

}
