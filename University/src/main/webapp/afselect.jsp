<% 
String type=request.getParameter("submit");
if(type.equals("registration"))
{
	%>
	<jsp:forward page="fregistration.html" />
	<%
}
if(type.equals("details"))
{
	%>
	<jsp:forward page="fdetails.html" />
	<%
}
if(type.equals("update"))
{
	%>
	<jsp:forward page="fupdate.html" />
	<%
}
if(type.equals("delete"))
{
	%>
	<jsp:forward page="fdelete.html" />
	<%
}
if(type.equals("course"))
{
	%>
	<jsp:forward page="fcourse.html" />
	<%
}
%>