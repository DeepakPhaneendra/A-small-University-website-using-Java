<% 
String type=request.getParameter("submit");
if(type.equals("Student"))
{
	%>
	<jsp:forward page="astudent.html" />
	<%
}
if(type.equals("Faculty"))
{
	%>
	<jsp:forward page="afaculty.html" />
	<%
}
if(type.equals("logout"))
{
	%>
	<jsp:forward page="Welcome.html" />
	<%
}
%>