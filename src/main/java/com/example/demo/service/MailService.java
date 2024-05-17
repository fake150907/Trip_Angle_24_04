package com.example.demo.service;

import java.io.UnsupportedEncodingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.example.demo.vo.ResultData;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;

// 이 클래스는 이메일 발송과 관련된 작업을 처리하는 서비스 클래스입니다.
@Service
public class MailService {
	
	@Autowired
	private JavaMailSender sender; // JavaMailSender 객체를 주입받습니다.

	@Value("${custom.emailFrom}")
	private String emailFrom; // application.properties에서 설정한 발신자 이메일 주소를 가져옵니다.
	
	@Value("${custom.emailFromName}")
	private String emailFromName; // application.properties에서 설정한 발신자 이름을 가져옵니다.

	// 내부 클래스로 메일 핸들러를 정의합니다.
	private static class MailHandler {
		private JavaMailSender sender;
		private MimeMessage message;
		private MimeMessageHelper messageHelper;

		// 생성자에서 JavaMailSender를 사용하여 MimeMessage 객체를 생성하고 MimeMessageHelper를 초기화합니다.
		public MailHandler(JavaMailSender sender) throws MessagingException {
			this.sender = sender;
			this.message = this.sender.createMimeMessage();
			this.messageHelper = new MimeMessageHelper(message, true, "UTF-8");
		}

		// 발신자 이메일과 이름을 설정합니다.
		public void setFrom(String mail, String name) throws UnsupportedEncodingException, MessagingException {
			messageHelper.setFrom(mail, name);
		}

		// 수신자 이메일을 설정합니다.
		public void setTo(String mail) throws MessagingException {
			messageHelper.setTo(mail);
		}

		// 이메일 제목을 설정합니다.
		public void setSubject(String subject) throws MessagingException {
			messageHelper.setSubject(subject);
		}

		// 이메일 본문을 설정합니다.
		public void setText(String text) throws MessagingException {
			messageHelper.setText(text, true);
		}

		// 이메일을 발송합니다.
		public void send() {
			try {
				sender.send(message);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	// 이메일을 발송하는 메서드입니다.
	public ResultData send(String email, String title, String body) {
		// 메일 핸들러를 생성하고 설정한 내용으로 이메일을 발송합니다.
		MailHandler mail;
		try {
			mail = new MailHandler(sender);
			mail.setFrom(emailFrom.replaceAll(" ", ""), emailFromName); // 발신자 이메일과 이름 설정
			mail.setTo(email); // 수신자 이메일 설정
			mail.setSubject(title); // 이메일 제목 설정
			mail.setText(body); // 이메일 본문 설정
			mail.send(); // 이메일 발송
		} catch (Exception e) {
			e.printStackTrace();
			return ResultData.from("F-1", "메일 발송 실패하였습니다.");
		}

		return ResultData.from("S-1", "메일이 발송되었습니다."); // 발송 성공 시 결과 반환
	}
}
