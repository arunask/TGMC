<!DOCTYPE HTML><%@page language="java"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<%@ page import="university.*"%> 
<%@ page import="javax.swing.*"%> 
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>SSN College Of Engineering</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600" rel="stylesheet" type="text/css" />
<link href="default.css" rel="stylesheet" type="text/css" media="all" />
<style>
	input
	{width:100%;padding:10px;}
	</style>
</head>
<body>
<div id="wrapper">
	<div id="header">
		<div id="logo">
			<h1><a href="index.html">SSN Intranet</a></h1>
		</div>
	</div>
	<!-- end #header -->
	<div id="menu">
		<ul>
			<li><a href="home.html">Home</a></li>
			<li><a href="#">Student</a></li>
			<li><a href="facultylogin.jsp">Faculty</a></li>
			<li class="current_page_item"><a href="ParentLogin.jsp">Parents</a></li>
			<li><a href="AdminLogin.jsp">Admin</a></li>
			<li><a href="Help.jsp">Help</a></li>
			<li class="last"><a href="AboutUs.jsp">About us</a></li>
		</ul>
	</div>
	<div id="one-column" >
		<h2>Parent Login</h2>
		<div class="content" >
			<div id="column" >
				<center>
                <p> Enter your login details here:</p>
                <form method="post" action="ParentLogin.jsp">
                    <table style="width:30%; padding:10px;">
                        <tr>
                            <td style="width: 40%; padding: 20px">Username</td>
                            <td style=" padding: 10px"><input type="text" name="user" style="width: 100%"/></td>
                        </tr>
                        <tr>
                            <td style="width: 40%; padding: 20px;">Password</td>
                            <td style="padding: 10px"><input type="password" name="passwd" style="width: 100%"/></td>
                        </tr>
                        <tr>
                            <td style="width: 40%; padding:0px;text-align: center;" colspan="2"><input type="submit" name="markaction" value="Login" class="button-style" style="width:40%; padding:10px 15px;"/></td>
                        </tr>
                    </table>
                </form>
            </center>
			</div>
			
		</div>
	</div>
	<div id="footer">
		<p>Copyright (c) 2013 Universal Parent Identification using RFID. All rights reserved. Design by Prolific Coderz.</p>
	</div>
	
</div>

<%
String user=request.getParameter("user");
String pass=request.getParameter("passwd");
Connection con;
if(user!=null)
{
String sql="select * from univ.parent where userName=? and password=?";
String userName = "db2admin";
String password = "aruna";
String url = "jdbc:db2://127.0.0.1:50000/univdb";
Class.forName("com.ibm.db2.jcc.DB2Driver").newInstance();
//JOptionPane.showMessageDialog(null, "Driver found!!");
con = DriverManager.getConnection(url, userName, password);
//JOptionPane.showMessageDialog(null, "Conn established!!");
PreparedStatement stmt=con.prepareStatement(sql);
stmt.setString(1,user);
stmt.setString(2,pass);
ResultSet rs=stmt.executeQuery();
if(rs.next())
{
        String sid=rs.getString("studentid");
        String strViewPage="Parentindex.jsp?sid="+sid+"";
        response.sendRedirect("Parentindex.jsp?sid="+sid+"");
}
else
{
    JOptionPane.showMessageDialog(null,"Invalid Login Credentials!!Try Again");
    response.sendRedirect("ParentLogin.jsp");
}
}
%>
</body>
</html>
