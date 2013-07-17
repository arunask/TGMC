<%@page import="javax.swing.JOptionPane"%>
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
<link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600" rel="stylesheet" type="text/css" />
<style>
	input
	{width:100%;padding:10px;}
	</style>
<link href="default.css" rel="stylesheet" type="text/css" media="all" />
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
			<li class="current_page_item"><a href="facultylogin.jsp">Faculty</a></li>
			<li><a href="#">Parents</a></li>
			<li><a href="AdminLogin.jsp">Admin</a></li>
			<li><a href="Help.jsp">Help</a></li>
			<li class="last"><a href="AboutUs.jsp">About us</a></li>
		</ul>
	</div>
	<div id="one-column" >
	<h2>InEntry Session</h2>
			<div style="margin-left:auto;margin-right:auto; width:50%;">
				
				<table>
					<tr>
					<form action="StartInentryOutentry.jsp">
						<td class="buttoncell">	
                                                    <input type="hidden" name="cid" value="<%=request.getParameter("cid")%>"/>
                                            <input type="hidden" name="cname" value="<%=request.getParameter("cname")%>"/>
                                            <input type="hidden" name="sdate" value="<%=request.getParameter("sdate")%>"/>
                                            <input type="hidden" name="period" value="<%=request.getParameter("period")%>"/>
                                            <input type="hidden" name="batch" value="<%=request.getParameter("batch")%>"/>
							<input type="submit" class="button-style" style="width:100%;padding:15px;" id="startin" name="but1" value="Start InEntry" />
							<br/>
							<br/>
							<br/>
							<input id="stopin" class="button-style" style="width:100%;padding:15px;" type="submit" name="but1" value="Stop InEntry" />
						</td>
						<td class="timercell">
							Timer display
						</td>
						<td class="txtareacell">
							<textarea rows="10" width="80%"></textarea>
						</td>
					</tr>
				</table>
			</div>
			<hr>
			<h2>OutEntry Session</h2>
			<div style="margin-left:auto;margin-right:auto; width:50%;">
				
					<table>
						<tr>
							<td class="buttoncell">
								<input type="submit" class="button-style" style="width:100%;padding:15px;" id="startout" value="Start OutEntry" name="but1"/>
								<br>
								<br>
								<br>
								<input id="stopout" class="button-style" style="width:100%;padding:15px;" type="submit" value="Stop InEntry" />
							</td>
							<td class="timercell">
								Timer display
							</td>
							<td class="txtareacell">
								<textarea rows="10" width="80%"></textarea>
							</td>
						</tr>
				</table>
				</form>
			</div>
		</div>
<%
String s1=request.getParameter("but1");
String s2=request.getParameter("period");
Integer i1=Integer.parseInt(s2);
Faculty f=Faculty.retFaculty("fid");
if(s1!=null)
{
if(s1.compareTo("Stop InEntry")==0)
{
FileInputStream fstream = new FileInputStream("CAPTURE1.txt");
  // Get the object of DataInputStream
  DataInputStream in = new DataInputStream(fstream);
  BufferedReader br = new BufferedReader(new InputStreamReader(in));
  String strLine;
  //Read File Line By Line
  while ((strLine = br.readLine()) != null)   {
  // Print the content on the console
      Connection con;
    String userName = "db2admin";
String password = "admin";
String url = "jdbc:db2://127.0.0.1:50000/univdb";
Class.forName("com.ibm.db2.jcc.DB2Driver").newInstance();
JOptionPane.showMessageDialog(null, "Driver found!!");
con = DriverManager.getConnection(url, userName, password);
JOptionPane.showMessageDialog(null, "Conn established!!");
		  String sql="update univ.attendance set inentry=1 where RFID=?";
		PreparedStatement stmt=con.prepareStatement(sql);
		stmt.setString(1,strLine.substring(1));  
  System.out.println (strLine);
}
}

else if(s1.compareTo("Stop OutEntry")==0)
{
FileInputStream fstream = new FileInputStream("CAPTURE2.txt");
  // Get the object of DataInputStream
  DataInputStream in = new DataInputStream(fstream);
  BufferedReader br = new BufferedReader(new InputStreamReader(in));
  String strLine;
  //Read File Line By Line
  while ((strLine = br.readLine()) != null)   {
  // Print the content on the console
      Connection con;
    String userName = "db2admin";
String password = "admin";
String url = "jdbc:db2://127.0.0.1:50000/univdb";
Class.forName("com.ibm.db2.jcc.DB2Driver").newInstance();
JOptionPane.showMessageDialog(null, "Driver found!!");
con = DriverManager.getConnection(url, userName, password);
JOptionPane.showMessageDialog(null, "Conn established!!");
		  String sql="update univ.attendance set presentflag=1 where RFID=? and inentry=1";
		PreparedStatement stmt=con.prepareStatement(sql);
		stmt.setString(1,strLine.substring(1));  
  System.out.println (strLine);

}
}
}
%>
	<div id="footer">
		<p>Copyright (c) 2013 Universal Student Identification using RFID. All rights reserved. Design by Prolific Coderz.</a></p>
	</div>
	
</div>
</body>
</html>
