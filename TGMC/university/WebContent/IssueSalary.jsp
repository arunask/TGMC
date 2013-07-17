<%-- 
    Document   : IssueSalary.jsp
    Created on : Apr 9, 2013, 11:57:18 PM
    Author     : Aruna
--%><%@page import="javax.swing.JOptionPane"%>
<%@page import="javax.mail.internet.MimeMultipart"%>
<%@page import="javax.mail.internet.MimeBodyPart"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.MimeMessage"%>


<!DOCTYPE HTML><%@page language="java"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
	<%@page import="java.sql.*" language="java" contentType="text/html; charset=ISO-8859-1" %>
	<%@page import="java.util.*" language="java" contentType="text/html; charset=ISO-8859-1" %>
	<%@page import="javax.mail.*" language="java" contentType="text/html; charset=ISO-8859-1"%>
<html>
<head>
<title>Salary Issue</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body>
You are about to send a salary issued notification to employees! Please do ensure university funds are sufficient and also ensure the bank is informed!!"
<form action="IssueSalary.jsp">
<input type="submit" name="but1" value="SEND EMAILS">
</form>

<%
    String action=request.getParameter("but1");
 if(action.equals("but1"))
 {
try
{
			Class.forName("com.ibm.db2.jcc.DB2Driver");
 			 System.out.println("driver loaded sucesssssssssssssssssss"); 
			String sql="select * from univ.faculty";
			Connection con=DriverManager.getConnection("jdbc:db2://localhost:50000/univdb","db2admin","aruna");
			PreparedStatement pstmt=con.prepareStatement(sql);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next())
		{
		
			 Properties properties = new Properties();
		String host = "smtp.gmail.com";
        String port = "587";
        final String userName = "labs.ssn@gmail.com";
        final String password = "timcookjobs";
        String subject = "Salary Issue Reports";
        String message = "Dear"+rs.getString(2)+"<br>Your Monthly salary of"+rs.getString(12)+"has been credited to your account..Wish you a great month!";
        properties.put("mail.smtp.host", host);
        properties.put("mail.smtp.port", port);
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.userName", userName);
        properties.put("mail.password", password);
 		String toAddress=rs.getString(6);
        // creates a new session with an authenticator
        Authenticator auth = new Authenticator() {
            public PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(userName, password);
            }
        };
        Session session1 = Session.getInstance(properties, auth);
 
        // creates a new e-mail message
        Message msg = new MimeMessage(session1);
 
        msg.setFrom(new InternetAddress(userName));
        InternetAddress[] toAddresses = { new InternetAddress(toAddress) };
        msg.setRecipients(Message.RecipientType.TO, toAddresses);
        msg.setSubject(subject);
//        msg.setSentDate(new Date());
 
        // creates message part
        MimeBodyPart messageBodyPart = new MimeBodyPart();
        messageBodyPart.setContent(message, "text/html");
 
        // creates multi-part
        Multipart multipart = new MimeMultipart();
        multipart.addBodyPart(messageBodyPart);
 
        // adds attachments
        /*if (attachFiles != null && attachFiles.length > 0) {
            for (String filePath : attachFiles) {
                MimeBodyPart attachPart = new MimeBodyPart();
 
                try {
                    attachPart.attachFile(filePath);
                } catch (IOException ex) {
                    ex.printStackTrace();
                }
 
                multipart.addBodyPart(attachPart);
            }
        }*/
 
        // sets the multi-part as e-mail's content
        msg.setContent(multipart);
 
        // sends the e-mail
        Transport.send(msg);
 
    }
JOptionPane.showMessageDialog(null,"SALARY ISSUE MAILS SENT");
}
catch(Exception E)
{
System.out.println(E);
}
 }
 %>

</body>
</html>