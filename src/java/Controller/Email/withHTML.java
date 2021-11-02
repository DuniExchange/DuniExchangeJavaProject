/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.Email;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author truon
 */
public class withHTML {
 
//  public static void main(String args[]) throws AddressException, MessagingException {
//    sendHTML("trangttude150338@fpt.edu.vn","123456");
//  }
// 
  public static void sendHTML(String mail,String code) throws AddressException, MessagingException {
    Properties mailServerProperties;
    Session getMailSession;
    MimeMessage mailMessage;
 
    // Step1: setup Mail Server
    mailServerProperties = System.getProperties();
    mailServerProperties.put("mail.smtp.port", "587");
    mailServerProperties.put("mail.smtp.auth", "true");
    mailServerProperties.put("mail.smtp.starttls.enable", "true");
 
    // Step2: get Mail Session
    getMailSession = Session.getDefaultInstance(mailServerProperties, null);
    mailMessage = new MimeMessage(getMailSession);
 
    mailMessage.addRecipient(Message.RecipientType.TO, new InternetAddress(mail)); //Thay abc bằng địa chỉ người nhận
 
    // Bạn có thể chọn CC, BCC
//    generateMailMessage.addRecipient(Message.RecipientType.CC, new InternetAddress("cc@gmail.com")); //Địa chỉ cc gmail
 
 
    mailMessage.setSubject("Welcome to DuniExchange");
    String emailBody = "<!DOCTYPE html>\n" +
"<html>\n" +
"\n" +
"<head>\n" +
"    <title></title>\n" +
"    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />\n" +
"    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n" +
"    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\" />\n" +
"    <style type=\"text/css\">\n" +
"        @media screen {\n" +
"            @font-face {\n" +
"                font-family: 'Noto Sans', sans-serif !important;\n" +
"                font-style: normal;\n" +
"                font-weight: 400;\n" +
"                src: local('Lato Regular'), local('Lato-Regular'), url(https://fonts.gstatic.com/s/lato/v11/qIIYRU-oROkIk8vfvxw6QvesZW2xOQ-xsNqO47m55DA.woff) format('woff');\n" +
"            }\n" +
"\n" +
"            @font-face {\n" +
"                font-family: 'Noto Sans', sans-serif !important;\n" +
"                font-style: normal;\n" +
"                font-weight: 700;\n" +
"                src: local('Lato Bold'), local('Lato-Bold'), url(https://fonts.gstatic.com/s/lato/v11/qdgUG4U09HnJwhYI-uK18wLUuEpTyoUstqEm5AMlJo4.woff) format('woff');\n" +
"            }\n" +
"\n" +
"            @font-face {\n" +
"                font-family: 'Noto Sans', sans-serif !important;\n" +
"                font-style: italic;\n" +
"                font-weight: 400;\n" +
"                src: local('Lato Italic'), local('Lato-Italic'), url(https://fonts.gstatic.com/s/lato/v11/RYyZNoeFgb0l7W3Vu1aSWOvvDin1pK8aKteLpeZ5c0A.woff) format('woff');\n" +
"            }\n" +
"\n" +
"            @font-face {\n" +
"                font-family: 'Noto Sans', sans-serif !important;\n" +
"                font-style: italic;\n" +
"                font-weight: 700;\n" +
"                src: local('Lato Bold Italic'), local('Lato-BoldItalic'), url(https://fonts.gstatic.com/s/lato/v11/HkF_qI1x_noxlxhrhMQYELO3LdcAZYWl9Si6vvxL-qU.woff) format('woff');\n" +
"            }\n" +
"        }\n" +
"\n" +
"        /* CLIENT-SPECIFIC STYLES */\n" +
"        body,\n" +
"        table,\n" +
"        td,\n" +
"        a {\n" +
"            -webkit-text-size-adjust: 100%;\n" +
"            -ms-text-size-adjust: 100%;\n" +
"        }\n" +
"\n" +
"        table,\n" +
"        td {\n" +
"            mso-table-lspace: 0pt;\n" +
"            mso-table-rspace: 0pt;\n" +
"        }\n" +
"\n" +
"        img {\n" +
"            -ms-interpolation-mode: bicubic;\n" +
"        }\n" +
"\n" +
"        /* RESET STYLES */\n" +
"        img {\n" +
"            border: 0;\n" +
"            height: auto;\n" +
"            line-height: 100%;\n" +
"            outline: none;\n" +
"            text-decoration: none;\n" +
"        }\n" +
"\n" +
"        table {\n" +
"            border-collapse: collapse !important;\n" +
"        }\n" +
"\n" +
"        body {\n" +
"            height: 100% !important;\n" +
"            margin: 0 !important;\n" +
"            padding: 0 !important;\n" +
"            width: 100% !important;\n" +
"        }\n" +
"\n" +
"        /* iOS BLUE LINKS */\n" +
"        a[x-apple-data-detectors] {\n" +
"            color: inherit !important;\n" +
"            text-decoration: none !important;\n" +
"            font-size: inherit !important;\n" +
"            font-family: inherit !important;\n" +
"            font-weight: inherit !important;\n" +
"            line-height: inherit !important;\n" +
"        }\n" +
"\n" +
"        /* MOBILE STYLES */\n" +
"        @media screen and (max-width:600px) {\n" +
"            h1 {\n" +
"                font-size: 32px !important;\n" +
"                line-height: 32px !important;\n" +
"            }\n" +
"        }\n" +
"\n" +
"        /* ANDROID CENTER FIX */\n" +
"        div[style*=\"margin: 16px 0;\"] {\n" +
"            margin: 0 !important;\n" +
"        }\n" +
"    </style>\n" +
"</head>\n" +
"\n" +
"<body style=\"background-color: #f4f4f4; margin: 0 !important; padding: 0 !important;\">\n" +
"    <!-- HIDDEN PREHEADER TEXT -->\n" +
"    <div style=\"display: none; font-size: 1px; color: #fefefe; line-height: 1px; font-family: 'Lato', Helvetica, Arial, sans-serif; max-height: 0px; max-width: 0px; opacity: 0; overflow: hidden;\"> We're thrilled to have you here! Get ready to dive into your new account. </div>\n" +
"    <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n" +
"        <!-- LOGO -->\n" +
"        <tr>\n" +
"            <td bgcolor=\"#fd5631\" align=\"center\">\n" +
"                <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"max-width: 600px;\">\n" +
"                    <tr>\n" +
"                        <td align=\"center\" valign=\"top\" style=\"padding: 40px 10px 40px 10px;\"> </td>\n" +
"                    </tr>\n" +
"                </table>\n" +
"            </td>\n" +
"        </tr>\n" +
"        <tr>\n" +
"            <td bgcolor=\"#fd5631\" align=\"center\" style=\"padding: 0px 10px 0px 10px;\">\n" +
"                <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"max-width: 600px;\">\n" +
"                    <tr>\n" +
"                        <td bgcolor=\"#ffffff\" align=\"center\" valign=\"top\" style=\"padding: 40px 20px 20px 20px; border-radius: 4px 4px 0px 0px; color: #111111; font-family: 'Lato', Helvetica, Arial, sans-serif; font-size: 48px; font-weight: 400; letter-spacing: 4px; line-height: 48px;\">\n" +
"                            <h1 style=\"font-size: 48px; font-weight: 400; margin: 2;\">Welcome to DuniExchange!</h1> <img src=\" https://img.icons8.com/clouds/100/000000/handshake.png\" width=\"125\" height=\"120\" style=\"display: block; border: 0px;\" />\n" +
"                        </td>\n" +
"                    </tr>\n" +
"                </table>\n" +
"            </td>\n" +
"        </tr>\n" +
"        <tr>\n" +
"            <td bgcolor=\"#f4f4f4\" align=\"center\" style=\"padding: 0px 10px 0px 10px;\">\n" +
"                <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"max-width: 600px;\">\n" +
"                    <tr>\n" +
"                        <td bgcolor=\"#ffffff\" align=\"left\" style=\"padding: 20px 30px 40px 30px; color: #666666; font-family: 'Lato', Helvetica, Arial, sans-serif; font-size: 18px; font-weight: 400; line-height: 25px;\">\n" +
"                            <p style=\"margin: 0;\">You need to confirm your email. Here is your code:</p>\n" +
"                        </td>\n" +
"                    </tr>\n" +
"                    <tr>\n" +
"                        <td bgcolor=\"#ffffff\" align=\"left\">\n" +
"                            <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n" +
"                                <tr>\n" +
"                                    <td bgcolor=\"#ffffff\" align=\"center\" style=\"padding: 20px 30px 60px 30px;\">\n" +
"                                        <table border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n" +
"                                            <tr>\n" +
"                                                <td align=\"center\" style=\"border-radius: 3px;font-size: 20px; font-family: Helvetica, Arial, sans-serif; color: #ffffff; text-decoration: none; color: #ffffff; text-decoration: none; padding: 15px 25px; border-radius: 2px; border: 1px solid #fd5631;\" bgcolor=\"#fd5631\">\n" +
"                                                    "+code+"\n" +
"                                                </td>\n" +
"                                            </tr>\n" +
"                                        </table>\n" +
"                                    </td>\n" +
"                                </tr>\n" +
"                            </table>\n" +
"                        </td>\n" +
"                    </tr> <!-- COPY -->\n" +
"                    <tr>\n" +
"                        <td bgcolor=\"#ffffff\" align=\"left\" style=\"padding: 0px 30px 20px 30px; color: #666666; font-family: 'Lato', Helvetica, Arial, sans-serif; font-size: 18px; font-weight: 400; line-height: 25px;\">\n" +
"                            <p style=\"margin: 0;\">If you have any questions, just reply to this email—we're always happy to help out.</p>\n" +
"                        </td>\n" +
"                    </tr>\n" +
"                    <tr>\n" +
"                        <td bgcolor=\"#ffffff\" align=\"left\" style=\"padding: 0px 30px 40px 30px; border-radius: 0px 0px 4px 4px; color: #666666; font-family: 'Lato', Helvetica, Arial, sans-serif; font-size: 18px; font-weight: 400; line-height: 25px;\">\n" +
"                            <p style=\"margin: 0;\">Cheers,<br>Apollo Team</p>\n" +
"                        </td>\n" +
"                    </tr>\n" +
"                </table>\n" +
"            </td>\n" +
"        </tr>\n" +
"        <tr>\n" +
"            <td bgcolor=\"#f4f4f4\" align=\"center\" style=\"padding: 30px 10px 0px 10px;\">\n" +
"                <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"max-width: 600px;\">\n" +
"                    <tr>\n" +
"                        <td bgcolor=\"#FFECD1\" align=\"center\" style=\"padding: 30px 30px 30px 30px; border-radius: 4px 4px 4px 4px; color: #666666; font-family: 'Lato', Helvetica, Arial, sans-serif; font-size: 18px; font-weight: 400; line-height: 25px;\">\n" +
"                            <h2 style=\"font-size: 20px; font-weight: 400; color: #111111; margin: 0;\">Need more help?</h2>\n" +
"                            <p style=\"margin: 0;\"><a href=\"#\" target=\"_blank\" style=\"color: #fd5631;\">We&rsquo;re here to help you out</a></p>\n" +
"                        </td>\n" +
"                    </tr>\n" +
"                </table>\n" +
"            </td>\n" +
"        </tr>\n" +
"        <tr>\n" +
"            <td bgcolor=\"#f4f4f4\" align=\"center\" style=\"padding: 0px 10px 0px 10px;\">\n" +
"                <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"max-width: 600px;\">\n" +
"                    <tr>\n" +
"                        <td bgcolor=\"#f4f4f4\" align=\"left\" style=\"padding: 0px 30px 30px 30px; color: #666666; font-family: 'Lato', Helvetica, Arial, sans-serif; font-size: 14px; font-weight: 400; line-height: 18px;\"> <br>\n" +
"                            <p style=\"margin: 0;\">If these emails get annoying, please feel free to <a href=\"#\" target=\"_blank\" style=\"color: #111111; font-weight: 700;\">unsubscribe</a>.</p>\n" +
"                        </td>\n" +
"                    </tr>\n" +
"                </table>\n" +
"            </td>\n" +
"        </tr>\n" +
"    </table>\n" +
"</body>\n" +
"\n" +
"</html>";
    mailMessage.setContent(emailBody, "text/html");
 
    // Step3: Send mail
    Transport transport = getMailSession.getTransport("smtp");
 
    // Thay your_gmail thành gmail của bạn, thay your_password thành mật khẩu gmail của bạn
    transport.connect("smtp.gmail.com", "duniexchange@gmail.com", "duniexchange@pass123"); 
    transport.sendMessage(mailMessage, mailMessage.getAllRecipients());
    transport.close();
  }
 
}
