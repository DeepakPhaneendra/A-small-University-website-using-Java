<%@ page import="java.sql.*,java.util.*,java.io.*" %>
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
String lname=request.getParameter("lname");
String mname=request.getParameter("mname");
String roll=request.getParameter("roll");
String cno=request.getParameter("cno");
String dept=request.getParameter("dept");
String year=request.getParameter("year");
String gender=request.getParameter("gender");
String type=request.getParameter("quota");
String res=request.getParameter("residence");
try
{
	PreparedStatement st=con.prepareStatement("insert into student values(?,?,?,?,?,?,?,?)");
	PreparedStatement st1=con.prepareStatement("insert into sverify values(?,?)");
	st1.setString(1,roll);
	st1.setString(2,fname+"@123");
	st.setString(1,roll);
	st.setString(2,fname+" "+mname+" "+lname);
	st.setString(3,dept);
	st.setFloat(4,Float.parseFloat(cno));
	st.setInt(5,Integer.parseInt(year));
	st.setString(6,gender);
	st.setString(7,res);
	st.setString(8,type);
	st.executeUpdate();
	st1.executeUpdate();
	out.println("Registered Succesfully");%>
	<br><a href="astudent.html">Click here for Home page</a> 
	<%
}
catch(Exception e)
{
	out.println(e);
}
%>