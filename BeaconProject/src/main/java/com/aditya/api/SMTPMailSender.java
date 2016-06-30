package com.aditya.api;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

@Service
public class SMTPMailSender {
	
	@Autowired
	private JavaMailSenderImpl javaMailSender;
	
	public void send(String to, String subject , String body) throws MessagingException{
		
	   MimeMessage mimeMessage = javaMailSender.createMimeMessage();
   	   MimeMessageHelper mailMsg = new MimeMessageHelper(mimeMessage);
   	   mailMsg.setFrom("pavanaditya473@gmail.com");
   	   mailMsg.setTo(to);
   	   mailMsg.setSubject(subject);
   	   mailMsg.setText(body);
	   javaMailSender.send(mimeMessage);
	   System.out.println("---Done---");
	}
	
	
}
