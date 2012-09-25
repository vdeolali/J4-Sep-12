<!-- Begin: ShowCustomer.jsp -->
<%@ page import="myPackage.*;" %>
<%
    Customer cst = new Customer("John", "Smith");
    String name = cst.getFirstName() + " " + cst.getLastName();
%>
<HTML>
<BODY>
    The customer name is: <%= name %>
</BODY>
</HTML>
<!-- End: ShowCustomer.jsp -->