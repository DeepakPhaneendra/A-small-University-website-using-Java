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
String roll=(String)session.getAttribute("roll");
try
{
	PreparedStatement st=con.prepareStatement("select * from faculty where id=?");
	st.setString(1,roll);
	ResultSet rs=st.executeQuery();
	if(!rs.next())
	{
		out.println("Invalid Registration Number");
	}
	else
	{
		
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
<h1>PROFILE</h1><br><br>

<table>
  <tr>
   <th>Name</th>
  <td><%=rs.getString("name") %></td>
  </tr>
  <tr>
  <th>Employee Id</th>
  <td><%=rs.getString("id")%></td>
  </tr>
  <tr>
  <th>Department</th>
  <td><%=rs.getString("dept") %></td>
  </tr>
  <tr>
  <th>Designation</th>
  <td><%=rs.getString("designation") %></td>
  </tr>
  <tr>
  <th>Salary</th>
  <td><%=rs.getString("salary") %></td>
  </tr>
  <tr>
  <th>Gender</th>
  <td><%=rs.getString("gender") %></td>
  </tr>
</table><br><br><br>

</body>
</html>


<a href="Facultypage.html">Click here for Home</a></center> <%
	}
	}

	catch(Exception e)
	{
	out.println(e);
	}
	%>