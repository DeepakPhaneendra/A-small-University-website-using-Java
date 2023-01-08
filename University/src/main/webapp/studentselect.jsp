<% 
String type=request.getParameter("submit");
if(type.equals("Profile"))
{
	%>
	<jsp:forward page="sprofile.jsp" />
	<%
}
if(type.equals("Faculty"))
{
	%>
	<jsp:forward page="sfaculty.jsp" />
	<%
}
if(type.equals("Course"))
{
	%>
	<jsp:forward page="courses.jsp" />
	<%
}
if(type.equals("logout"))
{
	%>
	<jsp:forward page="Welcome.html" />
	<%
}
%>