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
out.println(roll);
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
		out.println("Name : "+rs.getString("name")+"<br>");
		out.println("Id : " +rs.getString("id")+"<br>");
		out.println("Department : "+rs.getString("dept")+"<br>");
		out.println("Designation : "+rs.getString("designation")+"<br>");
		out.println("Salary : "+rs.getString("salary")+"<br>");
		out.println("Gender : "+rs.getString("gender")+"<br>");
		%><a href="afaculty.html">Click here for Faculty page</a> <%
	}
	}

	catch(Exception e)
	{
	out.println(e);
	}
	%>