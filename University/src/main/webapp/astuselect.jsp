<% 
String type=request.getParameter("submit");
if(type.equals("registration"))
{
	%>
	<jsp:forward page="sregistration.html" />
	<%
}
if(type.equals("details"))
{
	%>
	<jsp:forward page="sdetails.html" />
	<%
}
if(type.equals("update"))
{
	%>
	<jsp:forward page="supdate.html" />
	<%
}
if(type.equals("delete"))
{
	%>
	<jsp:forward page="sdelete.html" />
	<%
}
%>