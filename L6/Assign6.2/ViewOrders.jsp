<!-- Begin: ViewOrders.jsp -->
<%@ page import="java.sql.*" %>

<HTML>
<HEAD>
    <STYLE TYPE="text/css">
	.defaultText{font-family:Helvetica,Arial;font-size:10pt;}
	.tableEvenRow{font-family:Helvetica,Arial;font-size:9pt;background-color:#E6E6E6;}
	.tableOddRow{font-family:Helvetica,Arial;font-size:9pt;background-color:#FFFFFF;}
    </STYLE>
<SCRIPT language="JavaScript">
    function handleOrderDetail(o_id)
    {
	if (o_id  !=0)
	{
        
        document.getElementById("order_id").value = o_id;
<!--        alert (document.getElementById("order_id").value); -->
	var form = document.forms["OrderDetailForm"];
        form.submit();
	}
	else if (o_id == 0)
	{
            document.write("order id is null");
	}
    }
</SCRIPT>
</HEAD>
<BODY>
<TABLE>
<%
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection connection = DriverManager.getConnection(
"jdbc:mysql://localhost:3306/orderdatabase?user=root&password=sesame");
Statement statement = connection.createStatement();

String sqlGetCustomerAddress = "select cs.customer_id, cs.first_name, cs.last_name,us.username,us.user_id ";
sqlGetCustomerAddress += "from customer cs left outer join user us "; 
sqlGetCustomerAddress += "on  cs.customer_id=us.customer_id ";
ResultSet rs = statement.executeQuery(sqlGetCustomerAddress);

String firstName="", lastName="", usrname="";
int    customerId=0, userId=0;
String     u_id = request.getParameter("user_id");

//out.println(u_id);
//u_id="1";

while (rs.next()){
   userId = rs.getInt("user_id");
   if (userId == Integer.parseInt(u_id)){
     customerId = rs.getInt("customer_id");
     firstName = rs.getString("first_name");
     lastName = rs.getString("last_name");
     usrname = rs.getString("username");
   }
}

%>
<tr>
   <td align="left"> Customer Id: </td>
   <td> <%=customerId %></td>
</tr>
<tr>
   <td> User Id:</td>
   <td> <%=u_id %></td>
</tr>

<tr>
   <td> Username:</td>
   <td> <%=usrname%></td>
</tr>
<tr>
   <td> Name:</td>
   <td> <%=firstName+ " "+lastName %> </td>
</tr>

<tr class="defaultText"><td colspan=5><hr></td></tr>
<tr>
<td> Order ID </td>
<td> Order Value </td>
<td> Submit Date</td>
<td> Order Detail (GetonHTTP) </td>
<td> Order Detail (PostonHTTP) </td>
</tr>
<form name="OrderDetailForm" method="POST" action="ViewOrderDetails.jsp">
    <input id="order_id" type="hidden" name="order_id" value="">
</form>

<tr class="defaultText"><td colspan=5><hr></td></tr>
<%
String sqlGetOrderValue = "SELECT order_submitted.order_id, sum(T1.item_qty * T1.item_price) as OV, order_submitted.submit_date ";
sqlGetOrderValue += "FROM order_submitted LEFT OUTER JOIN  ";
sqlGetOrderValue += "(SELECT order_detail.order_id, item.item_price, order_detail.item_qty ";
sqlGetOrderValue += "FROM item INNER JOIN order_detail ON item.item_id = order_detail.item_id) AS T1 ";
sqlGetOrderValue += "ON T1.order_id = order_submitted.order_id ";
sqlGetOrderValue += "WHERE order_submitted.user_id="+u_id+" GROUP BY T1.order_id ORDER BY order_submitted.submit_date asc ";
ResultSet rs2 = statement.executeQuery(sqlGetOrderValue);
String subd= "";
int order_id=0;
double oval =0.0;
while (rs2.next()){
order_id = rs2.getInt("order_id");
oval = rs2.getDouble("OV");
subd = rs2.getString("submit_date");
%>
<tr class="defaultText">
<td> <%=order_id%></td>
<td> <%=oval%></td>
<td> <%=subd%></td>
<td> <A HREF="ViewOrderDetails.jsp?order_id=<%=order_id%>">View Order Details </td>
<td> <A HREF="javascript:handleOrderDetail(<%=order_id%>)">View Order Details </td>
</tr>
<%
}
%>
<tr class="defaultText"><td colspan=5><hr></td></tr>


</TABLE>
</BODY>
</HTML>
<!-- End: ViewOrders.jsp -->