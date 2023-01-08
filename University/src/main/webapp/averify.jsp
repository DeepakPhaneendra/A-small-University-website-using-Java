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

%>
<%
String id=request.getParameter("id");
String password=request.getParameter("password");

try
{
	PreparedStatement st=con.prepareStatement("select * from averify where id=?");
	st.setString(1,id);
	ResultSet rs=st.executeQuery();
	if(!rs.next())
		out.println("Employee Number not Found!!");
	else
	{
		String pass=rs.getString("password");
		if(pass.equals(password))
		{
			session.setAttribute("roll",id); 
			
		session.setAttribute("page","admin");%> 
			<jsp:forward page="AdminPage.html" />
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