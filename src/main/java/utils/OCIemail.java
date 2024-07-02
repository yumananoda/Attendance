import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class OCIemail {
  public static void main(String[] args) {
    try {
      Properties property = new Properties();
      // 各種設定             property.put("mail.smtp.host", "smtp.gmail.com");
      property.put("mail.smtp.auth", "true");
      property.put("mail.smtp.starttls.enable", "true");
      property.put("mail.smtp.host", "smtp.gmail.com");
      property.put("mail.smtp.port", "587");
      property.put("mail.smtp.debug", "true");
      Session session = Session.getInstance(property, new javax.mail.Authenticator() {
        protected PasswordAuthentication getPasswordAuthentication() {
          return new PasswordAuthentication("Saotome.myato@gmail.com", "saotome_hayato");
        }
      });
      MimeMessage mimeMessage = new MimeMessage(session);
      InternetAddress toAddress = new InternetAddress("yuma.nnmn.0930@gmail.com", "yane");
      mimeMessage.setRecipient(Message.RecipientType.TO, toAddress);
      InternetAddress fromAddress = new InternetAddress("送信", "管理者");
      mimeMessage.setFrom(fromAddress);
      mimeMessage.setSubject("テストメール", "ISO-2022-JP");
      mimeMessage.setText("テストメールです", "ISO-2022-JP");
      Transport.send(mimeMessage);
      System.out.println("送信完了");
    } catch (Exception e) {
      System.out.println("エラー");
    }
  }
}