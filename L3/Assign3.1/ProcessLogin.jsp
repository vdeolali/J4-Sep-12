
<!-- Begin: ProcessLogin.jsp -->
<%
String fName = request.getParameter("firstName");
String lName = request.getParameter("lastName");

if (fName != null && !fName.trim().equals("") && lName !=null && !lName.trim().equals("")){
    session.setAttribute("FIRST_NAME",fName);
    session.setAttribute("LAST_NAME",lName);
    response.sendRedirect("ShowAllItems.jsp");
    
}else {
    response.sendRedirect("Login.html");
}
%>


<!-- End: ProcessLogin.jsp -->