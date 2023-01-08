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
String cgpa=request.getParameter("cgpa");
try
{
	PreparedStatement st=con.prepareStatement("select * from student where roll=?");
	st.setString(1,roll);
	ResultSet rs=st.executeQuery();
	if(!rs.next())
	{
		out.println("Invalid Registration Number");
	}
	else
	{
		PreparedStatement st1=con.prepareStatement("update student set cgpa=? where roll=?");
		st1.setString(1,cgpa);
		st1.setString(2,roll);
		st1.executeUpdate();
		out.println("CGPA updated");%>
		<br><a href="astudent.html">Click here for Home page</a> 
		<%
	}
	}

	catch(Exception e)
	{
	out.println(e);
	}
	%>