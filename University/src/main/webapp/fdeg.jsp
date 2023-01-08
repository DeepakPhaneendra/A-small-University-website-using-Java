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
String deg=request.getParameter("deg");
try
{
	PreparedStatement st=con.prepareStatement("select * from faculty where id=?");
	st.setString(1,roll);
	ResultSet rs=st.executeQuery();
	if(!rs.next())
	{
		out.println("Invalid Faculty Id");
	}
	else
	{
		PreparedStatement st1=con.prepareStatement("update faculty set designation=? where id=?");
		st1.setString(1,deg);
		st1.setString(2,roll);
		st1.executeUpdate();
		out.println("Designation updated");%>
		<br><a href="afaculty.html">Click here for Home page</a> 
		<%
	}
	}

	catch(Exception e)
	{
	out.println(e);
	}
	%>