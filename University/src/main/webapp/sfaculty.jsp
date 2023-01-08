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
	PreparedStatement st=con.prepareStatement("select * from sfaculty");
	ResultSet rs=st.executeQuery();
	
		
		%>
		<!DOCTYPE html>
<html>
<head>
<style>
table {
  border-collapse: collapse;
  width: 100%;
}

th, td {
  text-align: left;
  padding: 8px;
}

tr:nth-child(even) {
  background-color: #D6EEEE;
}
</style>
</head>
<center>
<body>
<h1>FACULTY DETAILS</h1><br><br>

<table>
<th>Name</th>
<th>Designation</th>
<th>Department</th>
	<% while(rs.next()){%>
  <tr>
  
   
  <td><%=rs.getString("name") %></td>
  
  <td><%=rs.getString("designation")%></td>
  
  
  <td><%=rs.getString("dept")%></td>
  </tr>
  <%} %>
 </table><br><br><br>

</body>
</html>


<a href="Studentpage.html">Click here for Student page</a></center> <%
	
	}

	catch(Exception e)
	{
	out.println(e);
	}
	%>