<% 
String type=request.getParameter("submit");
if(type.equals("Student"))
{
	%>
	<jsp:forward page="student.html" />
	<%
}
if(type.equals("Faculty"))
{
	%>
	<jsp:forward page="faculty.html" />
	<%
}
if(type.equals("Admin"))
{
	%>
	<jsp:forward page="admin.html" />
	<%
}
%>