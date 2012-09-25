
<!-- Begin: ProcessLogin.jsp -->
<%
String fName = request.getParameter("firstName");
String lName = request.getParameter("lastName");
%>
<HTML>
<BODY>
Hello, <%= fName %> <%= lName %>, you have reached the second page!
</BODY>
</HTML>

<!-- End: ProcessLogin.jsp -->