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
String name=request.getParameter("name");
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
		PreparedStatement st1=con.prepareStatement("update faculty set name=? where id=?");
		PreparedStatement st2=con.prepareStatement("update fverify set password=? where id=?");
		st2.setString(1,name+"@123");
		st2.setString(2,roll);
		st1.setString(1,name);
		st1.setString(2,roll);
		st1.executeUpdate();
		st2.executeUpdate();
		out.println("Name updated");%>
		<br><a href="afaculty.html">Click here for Home page</a> 
		<%
	}
	}

	catch(Exception e)
	{
	out.println(e);
	}
	%>