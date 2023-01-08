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
String fname=request.getParameter("fname");
String mname=request.getParameter("mname");
String lname=request.getParameter("lname");
String roll=request.getParameter("id");
String salary=request.getParameter("sal");
String dept=request.getParameter("dept");
String deg=request.getParameter("deg");
String gender=request.getParameter("gender");
try
{
	PreparedStatement st=con.prepareStatement("insert into faculty values(?,?,?,?,?,?)");
	PreparedStatement st1=con.prepareStatement("insert into fverify values(?,?)");
	st1.setString(1,roll);
	st1.setString(2,fname+"@123");
	st.setString(1,roll);
	st.setString(2,fname+" "+mname+" "+lname+" ");
	st.setString(3,dept);
	st.setFloat(4,Float.parseFloat(salary));
	st.setString(5,deg);
	st.setString(6,gender);
	st.executeUpdate();
	st1.executeUpdate();
	out.println("Registered Succesfully");%>
	<br><a href="afaculty.html">Click here for Home page</a> 
	<%
}
catch(Exception e)
{
	out.println(e);
}
%>