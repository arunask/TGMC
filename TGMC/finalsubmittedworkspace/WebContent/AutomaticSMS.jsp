<!DOCTYPE HTML><%@page language="java"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<%@ page import="university.*"%> 
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>SSN College Of Engineering</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<style>
	input,select
	{width:100%;padding:10px;}
	textarea
	{width:100%;padding:2px;}
	</style>
<link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600" rel="stylesheet" type="text/css" />
<link href="default.css" rel="stylesheet" type="text/css" media="all" />
<script>function val()
{
    if(document.getElementById("rec").value.toString().equals("Add Recipient.."))
        {
            alert("hey");
        document.getElementById("divrecipt").innerHTML="<input type=\"text\" name=\"other\" style=\"width:100%\"/>";
        }
}</script>
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
			<li><a href="StudentLogin.jsp">Student</a></li>
			<li><a href="facultylogin.jsp">Faculty</a></li>
			<li><a href="ParentLogin.jsp">Parents</a></li>
			<li class="current_page_item"><a href="AdminLogin.jsp">Admin</a></li>
			<li><a href="Help.jsp">Help</a></li>
			<li class="last"><a href="AboutUs.jsp">About us</a></li>
		</ul>
	</div>
	<div id="one-column" >

	<form action="AutomaticSMS.jsp">
	<h2>Send Automatic SMS</h2>
	<div style="margin-left:auto;margin-right:auto; width:50%;">
	<center>
	<table>
	<tr>
	<td style="width:40%; padding: 20px;">ENTER MESSAGE TO SEND</td>
	<td><textarea	rows="3" name="message"></textarea></td>
	</tr>
	<tr>
	<td style="width:40%; padding: 20px;">ENTER MESSAGE RECIPIENTS</td>
	<td><select id="rec" name="recipients" size="0" onclick="val()"><option value="Student">student</option>
				<option value="Faculty">faculty</option>
				<option value="Add Recipient..">other</option>
		</select>
            <div id="divrecipt" style="width:100%"></div>
	</td>
	</tr>
		
	<tr><td style="width: 40%; padding:20px;text-align: center;" colspan="2"><center><input type="submit" style="width:40%;padding:15px;" class="button-style"  name="send" value="SEND SMS">	</td></tr>
	</table>
	</form>
</body>
</html>