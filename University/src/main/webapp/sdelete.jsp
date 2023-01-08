<%@ page import="java.sql.*"%>
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
String rollno=request.getParameter("roll");
try
{
	PreparedStatement st0=con.prepareStatement("select * from student where roll=?");
	st0.setString(1,rollno);
	ResultSet rs=st0.executeQuery();
	
	if(!rs.next())
	{
		out.println("Registration No. not found");
	}
	else
	{
	PreparedStatement st=con.prepareStatement("delete from student where roll=?");
	PreparedStatement st1=con.prepareStatement("delete from sverify where roll=?");
	st.setString(1,rollno);
	st1.setString(1,rollno);
	st.executeUpdate();
	st1.executeUpdate();
	out.println("Deleted");%>
	<br><a href="astudent.html">Click here for Student page</a> 
	
	<%}
}
catch(Exception e)
{
	out.println(e);
}
%>
	