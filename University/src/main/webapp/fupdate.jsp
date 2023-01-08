<% 
String type=request.getParameter("submit");
if(type.equals("name"))
{
	%>
	<jsp:forward page="fname.html" />
	<%
}
if(type.equals("dept"))
{
	%>
	<jsp:forward page="fdept.html" />
	<%
}
if(type.equals("deg"))
{
	%>
	<jsp:forward page="fdeg.html" />
	<%
}

if(type.equals("gender"))
{
	%>
	<jsp:forward page="fgender.html" />
	<%
}

if(type.equals("sal"))
{
	%>
	<jsp:forward page="fsal.html" />
	<%
}
%>