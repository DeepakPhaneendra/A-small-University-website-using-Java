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
String password=request.getParameter("password");
try
{
	PreparedStatement st=con.prepareStatement("select * from sverify where roll=?");
	st.setString(1,roll);
	ResultSet rs=st.executeQuery();
	if(!rs.next())
		out.println("Registration Number not Found!!");
	else
	{
		String pass=rs.getString("password");
		if(pass.equals(password))
		{
		session.setAttribute("roll",roll);%>
			
      		
			<jsp:forward page="Studentpage.html" />
		<%}
		else
			out.println("Invalid Password");
	}
}
catch(Exception e)
{
	out.println(e);
}
%>