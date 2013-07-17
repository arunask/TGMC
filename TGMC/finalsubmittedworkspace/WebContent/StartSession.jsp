<%@page import="javax.swing.JOptionPane"%>
<!DOCTYPE HTML><%@page language="java"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<%@ page import="university.*"%> 
<html>
<head>
<title>StartSession</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body>
<header><h1>CSE Intranet</h1></header>
	<div id="page">
		<div id="topcontent">
			<h1>Welcome Faculty!!</h1><!--Nithya ji...Faculty name shud change everytime for a new Faculty..so this page shud b automatically generated..-->
		</div>
		<div id="middlecontent">
			<p>To start a session, enter the following information</p>
			<form action="StartSession.jsp?fid=<%=request.getParameter("fid")%>">
			<table border="0" cellspan="0" colspan="0" width="100%">
				<tr>
					<td class="label"><label for="cid"> Course ID </label></td>
					<td class="textfield"><input type="text" id="cid" class="text" name="cid"/></td>
				</tr>
				<tr>
					<td class="label"><label for="cname">Course Name</label></td>
					<td class="textfield"><input type="text" id="cname" class="text" name="cname"/></td>
				</tr>
				<tr>
					<td class="label"><label for="date"> Date</label></td>
					<td class="textfield"><input type="text" id="date" class="text" name="sdate"/></td>
				</tr>
				<tr>
					<td class="label"><label for="sno"> Session No.</label></td>
					<td class="textfield"><input type="text" id="sno" class="text" name="period"/></td>
		
		
				</tr>
				<tr>
					<td class="label"><label for="sno">Batch.</label></td>
					<td class="textfield"><input type="text" id="batch" class="text" name="batch"/></td>
				</tr>
				<tr>
					<td colspan="2" class="sub"><input type="submit" value="Start Session!"/></td>
				</tr>
			</table>
		</div>
	</div>
	<footer><p class="foot">&copy; CollegeName</p></footer>
<%
String s1=request.getParameter("fid");
String s2=request.getParameter("cid");
JOptionPane.showMessageDialog(null,s2);
if(s2!=null)
       {
String s3=request.getParameter("cname");
String s4=request.getParameter("sdate");
String s6=request.getParameter("period");
String s5=request.getParameter("batch");
try
               {
    Connection con;
String sql="select * from univ.enrol where courseid=?";
String userName = "db2admin";
String password = "admin";
String url = "jdbc:db2://127.0.0.1:50000/univdb";
Class.forName("com.ibm.db2.jcc.DB2Driver").newInstance();
JOptionPane.showMessageDialog(null, "Driver found!!");
con = DriverManager.getConnection(url, userName, password);
JOptionPane.showMessageDialog(null, "Conn established!!");
PreparedStatement stmt=con.prepareStatement(sql);
stmt.setString(1,s2);
ResultSet rs=stmt.executeQuery();
while(rs.next())
{
String sql2="insert into univ.attendance values(?,?,?,?,?,?,?,?)";
PreparedStatement stmt1=con.prepareStatement(sql2);
stmt1.setString(1,"101");
stmt1.setString(2,rs.getString("studentid"));
stmt1.setString(3,s4);
stmt1.setString(4,s2);
stmt1.setString(5,s6);
stmt1.setString(6,"0");
stmt1.setString(7,"0");
stmt1.setString(8,"0");
stmt1.executeUpdate();
}
 request.setAttribute("facid",s1);
 
        RequestDispatcher dispatcher = request.getRequestDispatcher("StartInentryOutentry.jsp");
        if (dispatcher != null){
                dispatcher.forward(request, response);
        }
}
catch(Exception E)
               {
                    JOptionPane.showMessageDialog(null,E);
                                       }
}

%>












</body>
</html>