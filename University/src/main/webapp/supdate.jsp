<% 
String type=request.getParameter("submit");
if(type.equals("name"))
{
	%>
	<jsp:forward page="sname.html" />
	<%
}
if(type.equals("dept"))
{
	%>
	<jsp:forward page="sdept.html" />
	<%
}
if(type.equals("year"))
{
	%>
	<jsp:forward page="syear.html" />
	<%
}

if(type.equals("gender"))
{
	%>
	<jsp:forward page="sgender.html" />
	<%
}

if(type.equals("cgpa"))
{
	%>
	<jsp:forward page="scgpa.html" />
	<%
}
%>