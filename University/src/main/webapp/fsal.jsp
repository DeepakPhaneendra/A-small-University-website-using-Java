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
	try{
		con.close();
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
}
%>
<%
String roll=request.getParameter("roll");
String sal=request.getParameter("sal");
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
		PreparedStatement st1=con.prepareStatement("update faculty set salary=? where id=?");
		st1.setFloat(1,Float.parseFloat(sal));
		st1.setString(2,roll);
		st1.executeUpdate();
		out.println("Salary updated");%>
		<br><a href="afaculty.html">Click here for Home page</a> 
		<%
	}
	}

	catch(Exception e)
	{
	out.println(e);
	}
	%>