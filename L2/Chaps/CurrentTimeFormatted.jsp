<!-- Begin: CurrentTimeFormatted.jsp -->
<%@ page import="myPackage.Customer;" %>
<%
    java.text.SimpleDateFormat df
                = new java.text.SimpleDateFormat("MMM dd yyyy hh:mm:ss a");
    String strDate = df.format(new java.util.Date());
%>
<HTML>
<BODY>
    The current date/time is: <%= strDate %>
</BODY>
</HTML>
<!-- End: CurrentTimeFormatted.jsp -->