<% 
String type=request.getParameter("submit");
if(type.equals("Profile"))
{
	%>
	<jsp:forward page="fprofile.jsp" />
	<%
}
if(type.equals("Student"))
{
	%>
	<jsp:forward page="sdetails.html" />
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