<!-- Begin: AddressListOuter.jsp -->
<%@ page import="java.sql.*" %>

<html>
<head>
<style>
.defaultText{font-family:Helvetica,Arial;font-size:10pt;}
.tableOddRow{font-family:Helvetica,Arial;font-size:9pt;background-color:#E6E6E6}
.tableEvenRow{font-family:Helvetica,Arial;font-size:9pt;background-color:#FFFFFF}
</style>
<SCRIPT language="JavaScript">
    function handleViewOrders(u_id)
    {
	if (u_id  !=0)
	{
        
        document.getElementById("user_id").value = u_id;
<!--        alert (document.getElementById("user_id").value); -->
	var form = document.forms["ViewOrderForm"];
        form.submit();
	}
	else if (u_id == 0)
	{
            document.write("user id is null");
	}
    }
    </SCRIPT>
</head>

<body>
<table WIDTH=90%>
<tr class="defaultText">
<td>Customer ID</td>
<td>Customer Name</td>
<td>Username</td>
<td>View Orders(GETonHTTP)</td>
<td>View Orders(POSTonHTTP)</td>
<td/>
</tr>
<form name="ViewOrderForm" method="POST" action="ViewOrders.jsp">
    <input type="hidden" id="user_id" name="user_id" value="">
</form>
<%
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection connection = DriverManager.getConnection(
"jdbc:mysql://localhost:3306/orderdatabase?user=root&password=sesame");
Statement statement = connection.createStatement();

String sqlGetCustomerOrders = "select cs.customer_id, cs.first_name, cs.last_name, T1.username, T1.order_id, T1.user_id ";
sqlGetCustomerOrders += "from customer cs left outer join ";
sqlGetCustomerOrders += "(select us.customer_id, us.username, os.order_id, us.user_id ";
sqlGetCustomerOrders += "from user us left outer join ";
sqlGetCustomerOrders += "order_submitted os on us.user_id = os.user_id) as T1 ";
sqlGetCustomerOrders += "on T1.customer_id =cs.customer_id ";
sqlGetCustomerOrders += "GROUP BY cs.customer_id ";
ResultSet rs = statement.executeQuery(sqlGetCustomerOrders);

int customerId, orderId=0, user_id=0;
String firstName, lastName,usrname,  strClass = "tableEvenRow";
Boolean hasOrder = true;

while (rs.next())
{
customerId = rs.getInt("customer_id");
orderId = rs.getInt("order_id");
firstName = rs.getString("first_name");
lastName = rs.getString("last_name");
usrname = rs.getString("username");
user_id = rs.getInt("user_id");
//out.println ("<hr>" + user_id + "<a href=\" vieworders.jsp\"> hold </a>");

// toggle style class for next row:
if (strClass.equals("tableEvenRow")) strClass = "tableOddRow";
else strClass = "tableEvenRow";
%>
<tr class="<%= strClass %>">
<td><%= customerId %></td>
<td><%= firstName+" "+lastName %></td>
<td><%= usrname %></td>
<td><% if(orderId!=0) out.print( "<A HREF=\"ViewOrders.jsp?user_id="+ user_id + "\">View Orders</A>");else out.print( ""); %></td>
<td>


<% if(orderId!=0) out.print( "<A HREF=\"javascript:handleViewOrders(" + user_id +")\">View Orders</A>"); else out.print(""); %></td>

</td>
</tr>
<%
} // while ...
%>
</table>
</body>
</html>
<!-- End: CustomerUserList.jsp -->