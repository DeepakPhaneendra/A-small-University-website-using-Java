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
String eid=request.getParameter("eid");
String cid=request.getParameter("cid");
try
{
	
	PreparedStatement st1=con.prepareStatement("insert into assign values(?,?)");
	st1.setString(1,eid);
	st1.setString(2,cid);
	st1.executeUpdate();
	out.println("Assigned Succesfully");%>
	<br><a href="afaculty.html">Click here for Home page</a> 
	<%
}
catch(Exception e)
{
	out.println(e);
}
%>