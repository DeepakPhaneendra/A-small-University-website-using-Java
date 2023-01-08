<%@ page import="java.sql.*" %>
<%! Connection con;
public void jspInit()
{
	try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp","root","Deepak@2003");
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
}
public void jspDestroy()
{
	try
	{
		con.close();
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
}
%>
<%
try
{
	%><center><h1>COURSES DETAILS</h1></center><br><br><% 
	for(int i=1;i<=8;i++)
	{
	PreparedStatement st=con.prepareStatement("select * from courses where semester="+i);
	ResultSet rs=st.executeQuery();
	
		
		%>
		<!DOCTYPE html>
<html>
<head>
<style>
table, td, th {
  border: 1px solid black;
}

table {
  border-collapse: collapse;
  width: 80%;
  padding: 12px;
  font-size: 20px;
}

td {
  text-align: center;
}
tr:nth-child(even) {
  background-color: #D6EEEE;
}
</style>
</head>

<body>



<center>
<h3>Semester <%=i %></h3>
<table>
<th>Course Name</th>
<th>Course Code</th>
<th>Semester</th>
	<% while(rs.next()){%>
  <tr>
  
   
  <td><%=rs.getString("name") %></td>
  
  <td><%=rs.getString("cno")%></td>
  
  
  <td><%=rs.getString("semester")%></td>
  </tr>
  <%} %>
 </table><br><br><br>
</center>
</body>
</html>



	
	<% }%><center>
	<a href="Studentpage.html">Click here for Student page</a></center> </center><%
}

	catch(Exception e)
	{
	out.println(e);
	}
	%>